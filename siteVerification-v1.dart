// Copyright 2012 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#library('siteVerification-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API SiteVerificationApi
/**
 * Lets you programatically verify ownership of websites or domains with Google.
 */
class SiteVerificationApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  SiteVerificationApi get _$service() => this;
  WebResourceResource _webResource;
  WebResourceResource get webResource() => _webResource;
  
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
  SiteVerificationApiAlt alt;


  SiteVerificationApi([this.baseUrl = "https://www.googleapis.com/siteVerification/v1/", applicationName, this.authenticator]) { 
    _webResource = new WebResourceResource._internal(this);
    this.applicationName = applicationName
      .replaceAll(const RegExp(@'\s+'), '_')
      .replaceAll(const RegExp(@'[^-_.,0-9a-zA-Z]'), '');
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}siteVerification/v1/20111216 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage the list of sites and domains you control */
  static final core.String SITEVERIFICATION_SCOPE = "https://www.googleapis.com/auth/siteverification";

  /** OAuth2 scope: Manage your new site verifications with Google */
  static final core.String SITEVERIFICATION_VERIFY_ONLY_SCOPE = "https://www.googleapis.com/auth/siteverification.verify_only";
}

// Resource .WebResourceResource
class WebResourceResource extends core.Object {
  final SiteVerificationApi _$service;
  
  WebResourceResource._internal(SiteVerificationApi $service) : _$service = $service;

  // Method WebResourceResource.Insert
  /**
   * Attempt verification of a website or domain.
   *
   *    * [content] the SiteVerificationWebResourceResource
   *    * [verificationMethod] The method to use for verifying a site or domain.
   */
  core.Future<SiteVerificationWebResourceResource> insert(core.String verificationMethod, SiteVerificationWebResourceResource content) {
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
    final $path = "webResource";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => SiteVerificationWebResourceResource.parse(JSON.parse($text)));
  }

  // Method WebResourceResource.Get
  /**
   * Get the most current data for a website or domain.
   *
   *    * [id] The id of a verified site or domain.
   */
  core.Future<SiteVerificationWebResourceResource> get(core.String id) {
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
    final $path = "webResource/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SiteVerificationWebResourceResource.parse(JSON.parse($text)));
  }

  // Method WebResourceResource.List
  /**
   * Get the list of your verified websites and domains.
   *
   */
  core.Future<SiteVerificationWebResourceListResponse> list() {
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
    final $path = "webResource";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SiteVerificationWebResourceListResponse.parse(JSON.parse($text)));
  }

  // Method WebResourceResource.Update
  /**
   * Modify the list of owners for your website or domain.
   *
   *    * [content] the SiteVerificationWebResourceResource
   *    * [id] The id of a verified site or domain.
   */
  core.Future<SiteVerificationWebResourceResource> update(core.String id, SiteVerificationWebResourceResource content) {
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
    final $path = "webResource/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => SiteVerificationWebResourceResource.parse(JSON.parse($text)));
  }

  // Method WebResourceResource.Patch
  /**
   * Modify the list of owners for your website or domain. This method supports patch semantics.
   *
   *    * [content] the SiteVerificationWebResourceResource
   *    * [id] The id of a verified site or domain.
   */
  core.Future<SiteVerificationWebResourceResource> patch(core.String id, SiteVerificationWebResourceResource content) {
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
    final $path = "webResource/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => SiteVerificationWebResourceResource.parse(JSON.parse($text)));
  }

  // Method WebResourceResource.GetToken
  /**
   * Get a verification token for placing on a website or domain.
   *
   *    * [content] the SiteVerificationWebResourceGettokenRequest
   */
  core.Future<SiteVerificationWebResourceGettokenResponse> getToken(SiteVerificationWebResourceGettokenRequest content) {
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
    final $path = "token";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => SiteVerificationWebResourceGettokenResponse.parse(JSON.parse($text)));
  }

  // Method WebResourceResource.Delete
  /**
   * Relinquish ownership of a website or domain.
   *
   *    * [id] The id of a verified site or domain.
   */
  core.Future delete(core.String id) {
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
    final $path = "webResource/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Schema .SiteVerificationWebResourceGettokenRequest
class SiteVerificationWebResourceGettokenRequest extends IdentityHash {
  /**
 * The verification method that will be used to verify this site. For sites, 'FILE' or 'META'
 * methods may be used. For domains, only 'DNS' may be used.
 */
  core.String verificationMethod;

  /** The site for which a verification token will be generated. */
  SiteVerificationWebResourceGettokenRequestSite site;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceGettokenRequest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceGettokenRequest();
    result.verificationMethod = identity(json["verificationMethod"]);
    result.site = SiteVerificationWebResourceGettokenRequestSite.parse(json["site"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SiteVerificationWebResourceGettokenRequest value) {
    if (value == null) return null;
    final result = {};
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
  core.String identifier;

  /** The type of resource to be verified. Can be SITE or INET_DOMAIN (domain name). */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceGettokenRequestSite parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceGettokenRequestSite();
    result.identifier = identity(json["identifier"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SiteVerificationWebResourceGettokenRequestSite value) {
    if (value == null) return null;
    final result = {};
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
  core.String token;

  /**
 * The verification method to use in conjunction with this token. For FILE, the token should be
 * placed in the top-level directory of the site, stored inside a file of the same name. For META,
 * the token should be placed in the HEAD tag of the default page that is loaded for the site. For
 * DNS, the token should be placed in a TXT record of the domain.
 */
  core.String method;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceGettokenResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceGettokenResponse();
    result.token = identity(json["token"]);
    result.method = identity(json["method"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SiteVerificationWebResourceGettokenResponse value) {
    if (value == null) return null;
    final result = {};
    result["token"] = identity(value.token);
    result["method"] = identity(value.method);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SiteVerificationWebResourceListResponse
class SiteVerificationWebResourceListResponse extends IdentityHash {
  /** The list of sites that are owned by the authenticated user. */
  core.List<SiteVerificationWebResourceResource> items;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceListResponse();
    result.items = map(SiteVerificationWebResourceResource.parse)(json["items"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SiteVerificationWebResourceListResponse value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(SiteVerificationWebResourceResource.serialize)(value.items);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SiteVerificationWebResourceResource
class SiteVerificationWebResourceResource extends IdentityHash {
  /** The email addresses of all verified owners. */
  core.List<core.String> owners;

  /**
 * The string used to identify this site. This value should be used in the "id" portion of the REST
 * URL for the Get, Update, and Delete operations.
 */
  core.String id;

  /** The address and type of a site that is verified or will be verified. */
  SiteVerificationWebResourceResourceSite site;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceResource();
    result.owners = map(identity)(json["owners"]);
    result.id = identity(json["id"]);
    result.site = SiteVerificationWebResourceResourceSite.parse(json["site"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SiteVerificationWebResourceResource value) {
    if (value == null) return null;
    final result = {};
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
  core.String identifier;

  /** The site type. Can be SITE or INET_DOMAIN (domain name). */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static SiteVerificationWebResourceResourceSite parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SiteVerificationWebResourceResourceSite();
    result.identifier = identity(json["identifier"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SiteVerificationWebResourceResourceSite value) {
    if (value == null) return null;
    final result = {};
    result["identifier"] = identity(value.identifier);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum SiteVerificationApi.Alt
class SiteVerificationApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final SiteVerificationApiAlt JSON = const SiteVerificationApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<SiteVerificationApiAlt> values = const <SiteVerificationApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <SiteVerificationApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SiteVerificationApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SiteVerificationApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

