#library('oauth2');

#import('dart:json');
#import('dart:html');
#import('dart:uri');
#import('utils.dart');
#import('http.dart');

/// An OAuth2 authentication context.
class OAuth2 implements Authenticator {
  String _clientId;
  List<String> _scopes;
  String _provider;

  Future<_ProxyChannel> _channel;

  /// Future of the token we're waiting for.
  /// Note that errors are signaled by an exception *value*, because exception
  /// handling is clumsy.
  /// See http://code.google.com/p/dart/issues/detail?id=3047
  Future<Token> _tokenFuture;
  /// Destination for not-yet-validated tokens we're waiting to receive over
  /// the proxy channel.
  Completer<Token> _tokenCompleter;
  /// The last fetched token.
  Token __token; // Double-underscore because it has a private setter _token.

  OAuth2(String this._clientId, List<String> this._scopes,
      [String provider = "https://accounts.google.com/o/oauth2/"])
      : _provider = provider {
    _channel = _createFutureChannel();
    try {
      __token = _storedToken;  // Pull cached token from localStorage
    } catch (final e) {}
    // Attempt an immediate login, we may already be authorized.
    login(immediate:true);
  }

  /// Set up the proxy iframe in the provider's origin that will receive
  /// postMessages and relay them to us.
  /// This completes asynchronously as the proxy iframe is not ready to use
  /// until we've received an 'oauth2relayReady' message from it.
  Future<_ProxyChannel> _createFutureChannel() {
    final completer = new Completer<_ProxyChannel>();
    var channel;
    channel = new _ProxyChannel(_provider, (subject, args) {
      switch (subject) {
        case "oauth2relayReady":
          completer.complete(channel);
          break;
        case "oauth2callback":
          try {
            Token token = Token._parse(args[0]);
            _tokenCompleter.complete(token);
          } catch (Exception exception) {
            _tokenCompleter.completeException(exception);
          }
          break;
      }
    });
    return completer.future;
  }

  /// Get the URI that prompts the user for pemission (if required).
  String _getAuthorizeUri(bool immediate) {
    Map<String, String> queryParams = {
     "response_type": "token",
     "client_id": _clientId,
     "origin": window.location.origin,
     "redirect_uri": "postmessage", // Response will post to the proxy iframe
     "scope": Strings.join(_scopes, " "),
     "immediate": immediate,
    };
    return new UrlPattern("${_provider}auth").generate({}, queryParams);
  }

  /// Attempt to authenticate.
  /// If you have an existing valid token, it will be immediately returned.
  /// If you have an expired token, it will be silently renewed (override
  ///   with immediate:false)
  /// If you have no token, a popup prompt will be displayed.
  /// If the user declines, closes the popup, or the service returns a token
  /// that cannot be validated, an exception will be delivered.
  Future<Token> login([immediate=null]) {
    if (token != null) {
      if (token.expired) {
        if (immediate == null) {
          immediate = true; // We should be able to simply renew
        }
      } else { // We already have a good token
        return new Future<Token>.immediate(token);
      }
    }
    if (immediate == null) {
      immediate = false;
    }

    // Login may already be in progress
    if (_tokenFuture != null) {
      // An in-progress request will satisfy an immediate request
      // (even if it's not immediate).
      if (!immediate) {
        return _tokenFuture.chain((v) {
          if (v is Token) return new Future.immediate(v);
          return login(immediate:immediate);
        });
      }
    } else {
      Completer<Token> tokenCompleter = new Completer();
      _tokenFuture = _mergeErrors(tokenCompleter.future);
      _tokenFuture.then((v) {
        _token = (v is Token) ? v : null;
        _tokenFuture = null;
      });
      
      _tokenCompleter = _wrapValidation(tokenCompleter);

      // Synchronous if the channel is already open -> avoids popup blocker
      _channel.then((proxyChannel) {
        String uri = _getAuthorizeUri(immediate);
        if (immediate) {
          IFrameElement iframe = _iframe(uri);
          _tokenCompleter.future.then((v) => iframe.remove());
          _tokenCompleter.future.handleException((e) { iframe.remove(); });
        } else {
          Window popup = _popup(uri);
          new _WindowPoller(_tokenCompleter, popup).poll();
        }
      });
    }
    // Convert back to standard exception-handling mechanism before returning.
    return _tokenFuture.transform((v) {
      if (v is! Token) throw v;
      return v;
    });
  }

  HttpRequest authenticate(HttpRequest request) => login().transform((token) {
    request.headers["Authorization"] = "Bearer ${token.data}";
    return request;
  });

  Token get token() => __token;
  set _token(Token value) {
    _storedToken = value;
    __token = value;
  }

  Token get _storedToken() => window.localStorage.containsKey(_storageKey)
      ? new Token.fromJson(window.localStorage[_storageKey])
      : null;

  void set _storedToken(Token value) => (value == null)
      ? window.localStorage.remove(_storageKey)
      : window.localStorage[_storageKey] = value.toJson();

  /// Returns a unique identifier for this context for use in localStorage.
  String get _storageKey() => JSON.stringify({
    "clientId": _clientId,
    "scopes": _scopes,
    "provider": _provider,
  });
  
  /// Takes a completer that accepts validated tokens, and returns a completer
  /// that accepts unvalidated tokens.
  Completer<Token> _wrapValidation(Completer<Token> validatedTokenCompleter) {
    Completer<Token> result = new Completer();
    _chainExceptions(result.future, validatedTokenCompleter);
    result.future.then((token) {
      Future<bool> validation = token.validate(_clientId);
      _chainExceptions(validation, validatedTokenCompleter);
      validation.then((v) {
        if (v) {
          validatedTokenCompleter.complete(token);
        } else {
          validatedTokenCompleter.completeException(
              new Exception("Server returned token is invalid"));
        }
      });
    });
    return result;
  }
}

/// Polls until either the future is completed or the window is closed.
/// If the window was closed without the future being completed, completes
/// the future with an exception.
class _WindowPoller {
  Completer<Token> _completer;
  Window _window;
  _WindowPoller(Completer<Token> this._completer, Window this._window);

  void poll() {
    if (_completer.future.isComplete) {
      return;
    }
    if (_window.closed) {
      _completer.completeException(new Exception("User closed the window"));
    } else {
      window.setTimeout(poll, 500);
    }
  }
}

typedef void _ProxyCallback(String subject, List<String> args);

/// Sets up a channel for listening to the token information posted by the
/// authorization url using the postMessage flow.
///
/// We create a hidden iframe hosting the provider's 'postmessageRelay' page,
/// which receives token information from the authorization popup and posts
/// it to this document. We also add a message listener to this document. 
/// It detects such messages and invokes the provided callback.
class _ProxyChannel {
  String _nonce;
  String _provider;
  IFrameElement _element;
  _ProxyCallback _callback;

  _ProxyChannel(String this._provider, _ProxyCallback this._callback) {
    _nonce = (Math.random() * 100000).toInt().toString();
    _element = _iframe(_getProxyUrl());
    window.on.message.add(_onMessage);
  }

  void close() {
    _element.remove();
    window.on.message.remove(_onMessage);
  }

  void _onMessage(MessageEvent event) {
    var data = JSON.parse(event.data);
    if (!(data is Map) || (data['t'] != _nonce)) {
      return;
    }
    String subject = data['s'];
    if (subject.endsWith(':$_nonce')) {
      subject = subject.substring(0, subject.length - _nonce.length - 1);
    }
    _callback(subject, data['a']);
  }

  String _getProxyUrl() {
    Map<String, String> proxyParams = {"parent": window.location.origin};
    String proxyUrl = new UrlPattern("${_provider}postmessageRelay")
        .generate({}, proxyParams);
    return new Uri.fromString(proxyUrl)
        .resolve("#rpctoken=$_nonce&forcesecure=1").toString();
  }
}

/// An OAuth2 authentication token. 
class Token {
  final String type;
  final String data;
  final Date expiry;

  Token(String this.type, String this.data, Date this.expiry);

  factory Token.fromJson(String json) {
    var map = JSON.parse(json);
    return new Token(map['type'], map['data'],
        new Date.fromEpoch(map['expiry']));
  }

  bool get expired() => new Date.now().compareTo(expiry) > 0;

  String toString() =>
      "[Token type=$type, data=$data, expired=$expired, expiry=$expiry]";

  /// Query whether this token is still valid.
  Future<bool> validate(String clientId,
      [String service="https://www.googleapis.com/oauth2/v1/tokeninfo"]) {
    Completer<bool> completer = new Completer();
    Map<String, String> params = {"access_token": data};
    String url = new UrlPattern(service).generate({}, params);
    Future<String> info = new HttpRequest(url, 'GET').request();
    _chainExceptions(info, completer);
    info.then((json) {
      try {
        Map<String, String> infoMap = JSON.parse(json);
        completer.complete(clientId == infoMap['audience']);
      } catch (Exception e) {
        completer.completeException(e);
      }
    });
    return completer.future;
  }

  String toJson() {
    return JSON.stringify({
      "type": type,
      "data": data,
      "expiry": expiry.value,
    });
  }

  static Token _parse(String data) {
    if (data == null) {
      throw new Exception("No auth token data");
    }

    Map<String, String> params = {};
    for (String kv in _tokenizeRelativeUrl(data)) {
      if (kv.isEmpty()) {
        continue;
      }
      int eqIndex = kv.indexOf('=');
      if (eqIndex < 0) {
        params[kv] = "";
      } else {
        params[kv.substring(0, eqIndex)] = kv.substring(eqIndex + 1);
      }
    }

    if (params.containsKey('error')) {
      throw new AuthException(params['error'], params);
    }
    for (String param in ['access_token', 'token_type', 'expires_in']) {
      if (!params.containsKey(param)) {
        throw new Exception("Missing parameter $param");
      }
    }

    // Mark tokens as 'expired' 20 seconds early so it's still valid when used.
    Duration duration =
        new Duration(seconds: Math.parseInt(params['expires_in']) - 20);
    return new Token(params['token_type'], params['access_token'],
        new Date.now().add(duration));
  }
  
  /// Extracts &-separated tokens from the path, query, and fragment of [uri].
  static List<String> _tokenizeRelativeUrl(String uri) {
    final u = new Uri.fromString(uri);
    final result = [];
    [u.path, u.query, u.fragment].forEach((x) {
      if (x != null) result.addAll(_tokenize(x));
    });
    return result;
  }
  
  static List<String> _tokenize(String data) {
    return data.isEmpty() ? [] : data.split('&');
  }
}

class AuthException implements Exception {
  final String message;
  final Map<String, String> data;
  AuthException(this.message, this.data);
  toString() => "AuthException: $message";
}

/// Handles all exceptions on [:future:] by passing them to [:completer:].
void _chainExceptions(Future<Object> future, Completer<Object> completer) {
  future.handleException((e) {
    completer.completeException(e);
    return true;
  });
}

/// Returns a [Future] that always succeeds, delivering the value of [f] or 
/// the exception if [f] failed.
Future _mergeErrors(Future f) {
  Completer completer = new Completer();
  f.then(completer.complete);
  f.handleException((e) {
    completer.complete(e);
    return true;
  });
  return completer.future;
}

/// Opens a popup centered on the screen displaying the provided URL.
Window _popup(String url) {
  // Popup is desigend for 650x600, but don't make one bigger than the screen!
  int width = Math.min(650, window.screen.width - 20);
  int height = Math.min(600, window.screen.height - 30);
  int left = (window.screen.width - width) ~/ 2;
  int top = (window.screen.height - height) ~/ 2;
  return window.open(url, "_blank", "toolbar=no,location=no,directories=no,"
    "status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,"
    "width=$width,height=$height,top=$top,left=$left");
}

/// Creates a hidden iframe displaying the provided URL.
IFrameElement _iframe(String url) {
  IFrameElement iframe = new Element.tag("iframe");
  iframe.src = url;
  iframe.style.position = "absolute";
  iframe.width = iframe.height = "1";
  iframe.style.top = iframe.style.left = "-100px";
  document.body.elements.add(iframe);
  return iframe;
}