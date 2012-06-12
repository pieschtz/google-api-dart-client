#library("siteVerification");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API SiteVerificationApi
/**
 * Lets you programatically verify ownership of websites or domains with Google.
 */
class SiteVerificationApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  SiteVerificationApi get _$service() => this;
  WebResourceResource _webResource;
  WebResourceResource get webResource() => _webResource;
  
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
  SiteVerificationApiAlt alt;


  SiteVerificationApi([this.baseUrl = "https://www.googleapis.com/siteVerification/v1/", this.applicationName]) { 
    _webResource = new WebResourceResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}siteVerification/v1/20111216 google-api-dart-client/${clientVersion}";
  }
}

// Resource .WebResourceResource
class WebResourceResource {
  final SiteVerificationApi _$service;
  
  WebResourceResource._internal(SiteVerificationApi $service) : _$service = $service;

  // Method WebResourceResource.Insert
  /**
   * Attempt verification of a website or domain.
   * [verificationMethod] The method to use for verifying a site or domain.
   * [content] the SiteVerificationWebResourceResource
   */
  Future<SiteVerificationWebResourceResource> insert(String verificationMethod, SiteVerificationWebResourceResource content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["verificationMethod"] = verificationMethod;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(SiteVerificationWebResourceResource.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "webResource").generate($pathParams, $queryParams);
    final $completer = new Completer<SiteVerificationWebResourceResource>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SiteVerificationWebResourceResource.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method WebResourceResource.Get
  /**
   * Get the most current data for a website or domain.
   * [id] The id of a verified site or domain.
   */
  Future<SiteVerificationWebResourceResource> get(String id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "webResource/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<SiteVerificationWebResourceResource>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SiteVerificationWebResourceResource.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method WebResourceResource.List
  /**
   * Get the list of your verified websites and domains.
   */
  Future<SiteVerificationWebResourceListResponse> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "webResource").generate($pathParams, $queryParams);
    final $completer = new Completer<SiteVerificationWebResourceListResponse>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SiteVerificationWebResourceListResponse.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method WebResourceResource.Update
  /**
   * Modify the list of owners for your website or domain.
   * [id] The id of a verified site or domain.
   * [content] the SiteVerificationWebResourceResource
   */
  Future<SiteVerificationWebResourceResource> update(String id, SiteVerificationWebResourceResource content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(SiteVerificationWebResourceResource.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "webResource/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<SiteVerificationWebResourceResource>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SiteVerificationWebResourceResource.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method WebResourceResource.Patch
  /**
   * Modify the list of owners for your website or domain. This method supports patch semantics.
   * [id] The id of a verified site or domain.
   * [content] the SiteVerificationWebResourceResource
   */
  Future<SiteVerificationWebResourceResource> patch(String id, SiteVerificationWebResourceResource content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(SiteVerificationWebResourceResource.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "webResource/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<SiteVerificationWebResourceResource>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SiteVerificationWebResourceResource.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method WebResourceResource.GetToken
  /**
   * Get a verification token for placing on a website or domain.
   * [content] the SiteVerificationWebResourceGettokenRequest
   */
  Future<SiteVerificationWebResourceGettokenResponse> getToken(SiteVerificationWebResourceGettokenRequest content) {
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
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(SiteVerificationWebResourceGettokenRequest.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "token").generate($pathParams, $queryParams);
    final $completer = new Completer<SiteVerificationWebResourceGettokenResponse>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SiteVerificationWebResourceGettokenResponse.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method WebResourceResource.Delete
  /**
   * Relinquish ownership of a website or domain.
   * [id] The id of a verified site or domain.
   */
  Future delete(String id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "webResource/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "DELETE", $headers);
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
  }
}

// Schema .SiteVerificationWebResourceGettokenRequest
class SiteVerificationWebResourceGettokenRequest extends IdentityHash {
  /**
 * The verification method that will be used to verify this site. For sites, 'FILE' or 'META'
 * methods may be used. For domains, only 'DNS' may be used.
 */
  String verificationMethod;

  /** The site for which a verification token will be generated. */
  SiteVerificationWebResourceGettokenRequestSite site;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceGettokenRequest parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceGettokenRequest();
    result.verificationMethod = identity(json["verificationMethod"]);
    result.site = SiteVerificationWebResourceGettokenRequestSite.parse(json["site"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SiteVerificationWebResourceGettokenRequest value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["verificationMethod"] = identity(value.verificationMethod);
    result["site"] = SiteVerificationWebResourceGettokenRequestSite.serialize(value.site);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema SiteVerificationWebResourceGettokenRequest.SiteVerificationWebResourceGettokenRequestSite
class SiteVerificationWebResourceGettokenRequestSite extends IdentityHash {
  /**
 * The site identifier. If the type is set to SITE, the identifier is a URL. If the type is set to
 * INET_DOMAIN, the site identifier is a domain name.
 */
  String identifier;

  /** The type of resource to be verified. Can be SITE or INET_DOMAIN (domain name). */
  String type;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceGettokenRequestSite parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceGettokenRequestSite();
    result.identifier = identity(json["identifier"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SiteVerificationWebResourceGettokenRequestSite value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["identifier"] = identity(value.identifier);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SiteVerificationWebResourceGettokenResponse
class SiteVerificationWebResourceGettokenResponse extends IdentityHash {
  /**
 * The verification token. The token must be placed appropriately in order for verification to
 * succeed.
 */
  String token;

  /**
 * The verification method to use in conjunction with this token. For FILE, the token should be
 * placed in the top-level directory of the site, stored inside a file of the same name. For META,
 * the token should be placed in the HEAD tag of the default page that is loaded for the site. For
 * DNS, the token should be placed in a TXT record of the domain.
 */
  String method;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceGettokenResponse parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceGettokenResponse();
    result.token = identity(json["token"]);
    result.method = identity(json["method"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SiteVerificationWebResourceGettokenResponse value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["token"] = identity(value.token);
    result["method"] = identity(value.method);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SiteVerificationWebResourceListResponse
class SiteVerificationWebResourceListResponse extends IdentityHash {
  /** The list of sites that are owned by the authenticated user. */
  List<SiteVerificationWebResourceResource> items;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceListResponse parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceListResponse();
    result.items = map(SiteVerificationWebResourceResource.parse)(json["items"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SiteVerificationWebResourceListResponse value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(SiteVerificationWebResourceResource.serialize)(value.items);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SiteVerificationWebResourceResource
class SiteVerificationWebResourceResource extends IdentityHash {
  /** The email addresses of all verified owners. */
  List<String> owners;

  /**
 * The string used to identify this site. This value should be used in the "id" portion of the REST
 * URL for the Get, Update, and Delete operations.
 */
  String id;

  /** The address and type of a site that is verified or will be verified. */
  SiteVerificationWebResourceResourceSite site;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceResource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceResource();
    result.owners = map(identity)(json["owners"]);
    result.id = identity(json["id"]);
    result.site = SiteVerificationWebResourceResourceSite.parse(json["site"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SiteVerificationWebResourceResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["owners"] = map(identity)(value.owners);
    result["id"] = identity(value.id);
    result["site"] = SiteVerificationWebResourceResourceSite.serialize(value.site);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema SiteVerificationWebResourceResource.SiteVerificationWebResourceResourceSite
class SiteVerificationWebResourceResourceSite extends IdentityHash {
  /**
 * The site identifier. If the type is set to SITE, the identifier is a URL. If the type is set to
 * INET_DOMAIN, the site identifier is a domain name.
 */
  String identifier;

  /** The site type. Can be SITE or INET_DOMAIN (domain name). */
  String type;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceResourceSite parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceResourceSite();
    result.identifier = identity(json["identifier"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SiteVerificationWebResourceResourceSite value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["identifier"] = identity(value.identifier);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum SiteVerificationApi.Alt
class SiteVerificationApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final SiteVerificationApiAlt JSON = const SiteVerificationApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<SiteVerificationApiAlt> values = const <SiteVerificationApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <SiteVerificationApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SiteVerificationApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const SiteVerificationApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

