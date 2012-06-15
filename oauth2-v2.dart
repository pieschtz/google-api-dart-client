#library('oauth2-v2');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API Oauth2Api
/**
 * OAuth2 API
 */
class Oauth2Api extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  Oauth2Api get _$service() => this;
  UserinfoResource _userinfo;
  UserinfoResource get userinfo() => _userinfo;
  
  /** Returns response with indentations and line breaks. */
  core.bool prettyPrint;

  /** Selector specifying which fields to include in a partial response. */
  core.String fields;

  /**
   * Available to use for quota purposes for server-side applications. Can be any arbitrary string
   * assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
   */
  core.String quotaUser;

  /** OAuth 2.0 token for the current user. */
  core.String oauthToken;

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  core.String key;

  /**
   * IP address of the site where the request originates. Use this if you want to enforce per-user
   * limits.
   */
  core.String userIp;

  /** Data format for the response. */
  Oauth2ApiAlt alt;


  Oauth2Api([this.baseUrl = "https://www.googleapis.com//", this.applicationName, this.authenticator]) { 
    _userinfo = new UserinfoResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}oauth2/v2/20120523 google-api-dart-client/${clientVersion}";
  }
  // Method .Tokeninfo
  /**

   */
  core.Future<Tokeninfo> tokeninfo([core.String accessToken = UNSPECIFIED, core.String idToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != accessToken) $queryParams["access_token"] = accessToken;
    if (UNSPECIFIED != idToken) $queryParams["id_token"] = idToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "oauth2/v2/tokeninfo";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Tokeninfo.parse(JSON.parse($text)));
  }}

// Resource .UserinfoResource
class UserinfoResource extends core.Object {
  final Oauth2Api _$service;
  final UserinfoV2ResourceResource v2;
  
  UserinfoResource._internal(Oauth2Api $service) : _$service = $service,
    v2 = new UserinfoV2ResourceResource._internal($service);

  // Method UserinfoResource.Get
  /**

   */
  core.Future<Userinfo> get() {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "oauth2/v2/userinfo";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Userinfo.parse(JSON.parse($text)));
  }
}


// Resource UserinfoResource.UserinfoV2ResourceResource
class UserinfoV2ResourceResource extends core.Object {
  final Oauth2Api _$service;
  final UserinfoV2ResourceUserinfoV2MeResourceResourceResourceResource me;
  
  UserinfoV2ResourceResource._internal(Oauth2Api $service) : _$service = $service,
    me = new UserinfoV2ResourceUserinfoV2MeResourceResourceResourceResource._internal($service);
}


// Resource UserinfoResource.UserinfoV2ResourceResource.UserinfoV2ResourceUserinfoV2MeResourceResourceResourceResource
class UserinfoV2ResourceUserinfoV2MeResourceResourceResourceResource extends core.Object {
  final Oauth2Api _$service;
  
  UserinfoV2ResourceUserinfoV2MeResourceResourceResourceResource._internal(Oauth2Api $service) : _$service = $service;

  // Method UserinfoResource.UserinfoV2ResourceResource.UserinfoV2ResourceUserinfoV2MeResourceResourceResourceResource.Get
  /**

   */
  core.Future<Userinfo> get() {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userinfo/v2/me";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Userinfo.parse(JSON.parse($text)));
  }
}

// Schema .Tokeninfo
class Tokeninfo extends IdentityHash {
  /** To whom was the token issued to. In general the same as audience. */
  core.String issuedTo;

  /** The Gaia obfuscated user id. */
  core.String userId;

  /** The expiry time of the token, as number of seconds left until expiry. */
  core.int expiresIn;

  /** The access type granted with this token. It can be offline or online. */
  core.String accessType;

  /** Who is the intended audience for this token. In general the same as issued_to. */
  core.String audience;

  /** The space separated list of scopes granted to this token. */
  core.String scope;

  /** The email address of the user. Present only if the email scope is present in the request. */
  core.String email;

  /**
 * Boolean flag which is true if the email address is verified. Present only if the email scope is
 * present in the request.
 */
  core.bool verifiedEmail;

  /** Parses an instance from its JSON representation. */
  static Tokeninfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Tokeninfo();
    result.issuedTo = identity(json["issued_to"]);
    result.userId = identity(json["user_id"]);
    result.expiresIn = identity(json["expires_in"]);
    result.accessType = identity(json["access_type"]);
    result.audience = identity(json["audience"]);
    result.scope = identity(json["scope"]);
    result.email = identity(json["email"]);
    result.verifiedEmail = identity(json["verified_email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Tokeninfo value) {
    if (value == null) return null;
    final result = {};
    result["issued_to"] = identity(value.issuedTo);
    result["user_id"] = identity(value.userId);
    result["expires_in"] = identity(value.expiresIn);
    result["access_type"] = identity(value.accessType);
    result["audience"] = identity(value.audience);
    result["scope"] = identity(value.scope);
    result["email"] = identity(value.email);
    result["verified_email"] = identity(value.verifiedEmail);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Userinfo
class Userinfo extends IdentityHash {
  /** The user's last name. */
  core.String familyName;

  /** The user's full name. */
  core.String name;

  /** URL of the user's picture image. */
  core.String picture;

  /** The user's default locale. */
  core.String locale;

  /** The user's gender. */
  core.String gender;

  /** The user's email address. */
  core.String email;

  /** The user's birthday. The year is not present. */
  core.String birthday;

  /** URL of the profile page. */
  core.String link;

  /** The user's first name. */
  core.String givenName;

  /** The user's default timezone. */
  core.String timezone;

  /** The focus obfuscated gaia id of the user. */
  core.String id;

  /** Boolean flag which is true if the email address is verified. */
  core.bool verifiedEmail;

  /** Parses an instance from its JSON representation. */
  static Userinfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Userinfo();
    result.familyName = identity(json["family_name"]);
    result.name = identity(json["name"]);
    result.picture = identity(json["picture"]);
    result.locale = identity(json["locale"]);
    result.gender = identity(json["gender"]);
    result.email = identity(json["email"]);
    result.birthday = identity(json["birthday"]);
    result.link = identity(json["link"]);
    result.givenName = identity(json["given_name"]);
    result.timezone = identity(json["timezone"]);
    result.id = identity(json["id"]);
    result.verifiedEmail = identity(json["verified_email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Userinfo value) {
    if (value == null) return null;
    final result = {};
    result["family_name"] = identity(value.familyName);
    result["name"] = identity(value.name);
    result["picture"] = identity(value.picture);
    result["locale"] = identity(value.locale);
    result["gender"] = identity(value.gender);
    result["email"] = identity(value.email);
    result["birthday"] = identity(value.birthday);
    result["link"] = identity(value.link);
    result["given_name"] = identity(value.givenName);
    result["timezone"] = identity(value.timezone);
    result["id"] = identity(value.id);
    result["verified_email"] = identity(value.verifiedEmail);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum Oauth2Api.Alt
class Oauth2ApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final Oauth2ApiAlt JSON = const Oauth2ApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<Oauth2ApiAlt> values = const <Oauth2ApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <Oauth2ApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static Oauth2ApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const Oauth2ApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

