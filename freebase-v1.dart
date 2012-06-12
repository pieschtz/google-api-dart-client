#library("freebase");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API FreebaseApi
/**
 * Lets you access the Freebase repository of open data.
 */
class FreebaseApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  FreebaseApi get _$service() => this;
  TextResource _text;
  TextResource get text() => _text;
  
  /** Returns response with indentations and line breaks. */
  bool prettyPrint;

  /** Selector specifying which fields to include in a partial response. */
  String fields;

  /**
   * Available to use for quota purposes for server-side applications. Can be any arbitrary string
   * assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
   */
  String quotaUser;

  /** OAuth 2.0 token for the current user. */
  String oauthToken;

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  String key;

  /**
   * IP address of the site where the request originates. Use this if you want to enforce per-user
   * limits.
   */
  String userIp;

  /** Data format for the response. */
  FreebaseApiAlt alt;


  FreebaseApi([this.baseUrl = "https://www.googleapis.com/freebase/v1/", this.applicationName]) { 
    _text = new TextResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}freebase/v1/20120421 google-api-dart-client/${clientVersion}";
  }
  // Method .Mqlread
  /**
   * Performs MQL Queries.
   * [query] An envelope containing a single MQL query.
   */
  Future mqlread(String query, [String lang = UNSPECIFIED, bool htmlEscape = UNSPECIFIED, int indent = UNSPECIFIED, MqlreadUniquenessFailure uniquenessFailure = UNSPECIFIED, String dateline = UNSPECIFIED, String cursor = UNSPECIFIED, String callback = UNSPECIFIED, bool cost = UNSPECIFIED, String asOfTime = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["query"] = query;
    if (UNSPECIFIED != lang) $queryParams["lang"] = lang;
    if (UNSPECIFIED != htmlEscape) $queryParams["html_escape"] = htmlEscape;
    if (UNSPECIFIED != indent) $queryParams["indent"] = indent;
    if (UNSPECIFIED != uniquenessFailure) $queryParams["uniqueness_failure"] = uniquenessFailure;
    if (UNSPECIFIED != dateline) $queryParams["dateline"] = dateline;
    if (UNSPECIFIED != cursor) $queryParams["cursor"] = cursor;
    if (UNSPECIFIED != callback) $queryParams["callback"] = callback;
    if (UNSPECIFIED != cost) $queryParams["cost"] = cost;
    if (UNSPECIFIED != asOfTime) $queryParams["as_of_time"] = asOfTime;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "mqlread").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = identity(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }  // Method .Image
  /**
   * Returns the scaled/cropped image attached to a freebase node.
   * [id] Freebase entity or content id, mid, or guid.
   */
  Future image(List<String> id, [int maxwidth = UNSPECIFIED, int maxheight = UNSPECIFIED, String fallbackid = UNSPECIFIED, bool pad = UNSPECIFIED, ImageMode mode = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != maxwidth) $queryParams["maxwidth"] = maxwidth;
    if (UNSPECIFIED != maxheight) $queryParams["maxheight"] = maxheight;
    if (UNSPECIFIED != fallbackid) $queryParams["fallbackid"] = fallbackid;
    if (UNSPECIFIED != pad) $queryParams["pad"] = pad;
    if (UNSPECIFIED != mode) $queryParams["mode"] = mode;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "image{/id*}").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = identity(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }}

// Resource .TextResource
class TextResource {
  final FreebaseApi _$service;
  
  TextResource._internal(FreebaseApi $service) : _$service = $service;

  // Method TextResource.Get
  /**
   * Returns blob attached to node at specified id as HTML
   * [id] The id of the item that you want data about
   */
  Future<ContentserviceGet> get(List<String> id, [int maxlength = UNSPECIFIED, TextResourceGetFormat format = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != maxlength) $queryParams["maxlength"] = maxlength;
    if (UNSPECIFIED != format) $queryParams["format"] = format;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "text{/id*}").generate($pathParams, $queryParams);
    final $completer = new Completer<ContentserviceGet>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = ContentserviceGet.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum TextResource.Get.Format
class TextResourceGetFormat implements Hashable {
  /** Return valid, sanitized html. */
  static final TextResourceGetFormat HTML = const TextResourceGetFormat._internal("html", 0);
  /** Return plain text - strip html tags. */
  static final TextResourceGetFormat PLAIN = const TextResourceGetFormat._internal("plain", 1);
  /** Return the entire content as-is. */
  static final TextResourceGetFormat RAW = const TextResourceGetFormat._internal("raw", 2);

  /** All values of this enumeration */
  static final List<TextResourceGetFormat> values = const <TextResourceGetFormat>[
    HTML,
    PLAIN,
    RAW,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <TextResourceGetFormat>{ 
    "html": HTML,
    "plain": PLAIN,
    "raw": RAW,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static TextResourceGetFormat valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const TextResourceGetFormat._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Format".hashCode();
}

// Schema .ContentserviceGet
class ContentserviceGet extends IdentityHash {
  /** The text requested. */
  String result;

  /** Parses an instance from its JSON representation. */
  static ContentserviceGet parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ContentserviceGet();
    result.result = identity(json["result"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ContentserviceGet value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["result"] = identity(value.result);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum FreebaseApi.Alt
class FreebaseApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final FreebaseApiAlt JSON = const FreebaseApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<FreebaseApiAlt> values = const <FreebaseApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <FreebaseApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FreebaseApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const FreebaseApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

// Enum Mqlread.UniquenessFailure
class MqlreadUniquenessFailure implements Hashable {
  /** Be strict - throw an error. */
  static final MqlreadUniquenessFailure HARD = const MqlreadUniquenessFailure._internal("hard", 0);
  /** Just return the first encountered object. */
  static final MqlreadUniquenessFailure SOFT = const MqlreadUniquenessFailure._internal("soft", 1);

  /** All values of this enumeration */
  static final List<MqlreadUniquenessFailure> values = const <MqlreadUniquenessFailure>[
    HARD,
    SOFT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <MqlreadUniquenessFailure>{ 
    "hard": HARD,
    "soft": SOFT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static MqlreadUniquenessFailure valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const MqlreadUniquenessFailure._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "UniquenessFailure".hashCode();
}

// Enum Image.Mode
class ImageMode implements Hashable {
  /** TODO(bendrees) */
  static final ImageMode FILL = const ImageMode._internal("fill", 0);
  /** TODO(bendrees) */
  static final ImageMode FILLCROP = const ImageMode._internal("fillcrop", 1);
  /** TODO(bendrees) */
  static final ImageMode FILLCROPMID = const ImageMode._internal("fillcropmid", 2);
  /** TODO(bendrees) */
  static final ImageMode FIT = const ImageMode._internal("fit", 3);

  /** All values of this enumeration */
  static final List<ImageMode> values = const <ImageMode>[
    FILL,
    FILLCROP,
    FILLCROPMID,
    FIT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ImageMode>{ 
    "fill": FILL,
    "fillcrop": FILLCROP,
    "fillcropmid": FILLCROPMID,
    "fit": FIT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ImageMode valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const ImageMode._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Mode".hashCode();
}

