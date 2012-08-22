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

#library('licensing-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API LicensingApi
/**
 * Licensing API to view and manage license for your domain.
 */
class LicensingApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  LicensingApi get _$service() => this;
  LicenseAssignmentsResource _licenseAssignments;
  LicenseAssignmentsResource get licenseAssignments() => _licenseAssignments;
  
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
  LicensingApiAlt alt;


  LicensingApi([this.baseUrl = "https://www.googleapis.com/apps/licensing/v1/product/", applicationName, this.authenticator]) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _licenseAssignments = new LicenseAssignmentsResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}licensing/v1/20120724 google-api-dart-client/${clientVersion}";
  }

}

// Resource .LicenseAssignmentsResource
class LicenseAssignmentsResource extends core.Object {
  final LicensingApi _$service;
  
  LicenseAssignmentsResource._internal(LicensingApi $service) : _$service = $service;

  // Method LicenseAssignmentsResource.Insert
  /**
   * Assign License.
   *
   *    * [content] the LicenseAssignmentInsert
   *    * [productId] Name for product
   *    * [skuId] Name for sku
   */
  core.Future<LicenseAssignment> insert(core.String productId, core.String skuId, LicenseAssignmentInsert content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    $pathParams["skuId"] = skuId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(LicenseAssignmentInsert.serialize(content));
    final $path = "{productId}/sku/{skuId}/user";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => LicenseAssignment.parse(JSON.parse($text)));
  }

  // Method LicenseAssignmentsResource.Get
  /**
   * Get license assignment of a particular product and sku for a user
   *
   *    * [productId] Name for product
   *    * [skuId] Name for sku
   *    * [userId] email id or unique Id of the user
   */
  core.Future<LicenseAssignment> get(core.String productId, core.String skuId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    $pathParams["skuId"] = skuId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{productId}/sku/{skuId}/user/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => LicenseAssignment.parse(JSON.parse($text)));
  }

  // Method LicenseAssignmentsResource.ListForProductAndSku
  /**
   * List license assignments for given product and sku of the customer.
   *
   *    * [productId] Name for product
   *    * [skuId] Name for sku
   *    * [customerId] CustomerId represents the customer for whom licenseassignments are queried
   *    * [pageToken] Token to fetch the next page.Optional. By default server will return first page
   *    * [maxResults] Maximum number of campaigns to return at one time. Must be positive. Optional. Default value is 100.
   *        Default: 100.
  Minimum: 1.
  Maximum: 1000.
   */
  core.Future<LicenseAssignmentList> listForProductAndSku(core.String productId, core.String skuId, core.String customerId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    $pathParams["skuId"] = skuId;
    if (UNSPECIFIED != customerId) $queryParams["customerId"] = customerId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{productId}/sku/{skuId}/users";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => LicenseAssignmentList.parse(JSON.parse($text)));
  }

  // Method LicenseAssignmentsResource.ListForProduct
  /**
   * List license assignments for given product of the customer.
   *
   *    * [productId] Name for product
   *    * [customerId] CustomerId represents the customer for whom licenseassignments are queried
   *    * [pageToken] Token to fetch the next page.Optional. By default server will return first page
   *    * [maxResults] Maximum number of campaigns to return at one time. Must be positive. Optional. Default value is 100.
   *        Default: 100.
  Minimum: 1.
  Maximum: 1000.
   */
  core.Future<LicenseAssignmentList> listForProduct(core.String productId, core.String customerId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    if (UNSPECIFIED != customerId) $queryParams["customerId"] = customerId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{productId}/users";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => LicenseAssignmentList.parse(JSON.parse($text)));
  }

  // Method LicenseAssignmentsResource.Update
  /**
   * Assign License.
   *
   *    * [content] the LicenseAssignment
   *    * [productId] Name for product
   *    * [skuId] Name for sku for which license would be revoked
   *    * [userId] email id or unique Id of the user
   */
  core.Future<LicenseAssignment> update(core.String productId, core.String skuId, core.String userId, LicenseAssignment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    $pathParams["skuId"] = skuId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(LicenseAssignment.serialize(content));
    final $path = "{productId}/sku/{skuId}/user/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => LicenseAssignment.parse(JSON.parse($text)));
  }

  // Method LicenseAssignmentsResource.Patch
  /**
   * Assign License. This method supports patch semantics.
   *
   *    * [content] the LicenseAssignment
   *    * [productId] Name for product
   *    * [skuId] Name for sku for which license would be revoked
   *    * [userId] email id or unique Id of the user
   */
  core.Future<LicenseAssignment> patch(core.String productId, core.String skuId, core.String userId, LicenseAssignment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    $pathParams["skuId"] = skuId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(LicenseAssignment.serialize(content));
    final $path = "{productId}/sku/{skuId}/user/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => LicenseAssignment.parse(JSON.parse($text)));
  }

  // Method LicenseAssignmentsResource.Delete
  /**
   * Revoke License.
   *
   *    * [productId] Name for product
   *    * [skuId] Name for sku
   *    * [userId] email id or unique Id of the user
   */
  core.Future delete(core.String productId, core.String skuId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["productId"] = productId;
    $pathParams["skuId"] = skuId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{productId}/sku/{skuId}/user/{userId}";
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

// Schema .LicenseAssignment
class LicenseAssignment extends IdentityHash {
  /** Name of the sku of the product. */
  core.String skuId;

  /** Identifies the resource as a LicenseAssignment. */
  core.String kind;

  /** Email id of the user. */
  core.String userId;

  /** ETag of the resource. */
  core.String etags;

  /** Link to this page. */
  core.String selfLink;

  /** Name of the product. */
  core.String productId;

  /** Parses an instance from its JSON representation. */
  static LicenseAssignment parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new LicenseAssignment();
    result.skuId = identity(json["skuId"]);
    result.kind = identity(json["kind"]);
    result.userId = identity(json["userId"]);
    result.etags = identity(json["etags"]);
    result.selfLink = identity(json["selfLink"]);
    result.productId = identity(json["productId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(LicenseAssignment value) {
    if (value == null) return null;
    final result = {};
    result["skuId"] = identity(value.skuId);
    result["kind"] = identity(value.kind);
    result["userId"] = identity(value.userId);
    result["etags"] = identity(value.etags);
    result["selfLink"] = identity(value.selfLink);
    result["productId"] = identity(value.productId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .LicenseAssignmentInsert
class LicenseAssignmentInsert extends IdentityHash {
  /** Email id of the user */
  core.String userId;

  /** Parses an instance from its JSON representation. */
  static LicenseAssignmentInsert parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new LicenseAssignmentInsert();
    result.userId = identity(json["userId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(LicenseAssignmentInsert value) {
    if (value == null) return null;
    final result = {};
    result["userId"] = identity(value.userId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .LicenseAssignmentList
class LicenseAssignmentList extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  core.String nextPageToken;

  /** The LicenseAssignments in this page of results. */
  core.List<LicenseAssignment> items;

  /** Identifies the resource as a collection of LicenseAssignments. */
  core.String kind;

  /** ETag of the resource. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static LicenseAssignmentList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new LicenseAssignmentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(LicenseAssignment.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(LicenseAssignmentList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(LicenseAssignment.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum LicensingApi.Alt
class LicensingApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final LicensingApiAlt JSON = const LicensingApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<LicensingApiAlt> values = const <LicensingApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LicensingApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LicensingApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LicensingApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

