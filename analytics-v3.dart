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

#library('analytics-v3');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AnalyticsApi
/**
 * View and manage your Google Analytics data
 */
class AnalyticsApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  AnalyticsApi get _$service() => this;
  ManagementResource _management;
  ManagementResource get management() => _management;
  DataResource _data;
  DataResource get data() => _data;
  
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
  AnalyticsApiAlt alt;


  AnalyticsApi([this.baseUrl = "https://www.googleapis.com/analytics/v3/", this.applicationName, this.authenticator]) { 
    _management = new ManagementResource._internal(this);
    _data = new DataResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}analytics/v3/20120607 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View your Google Analytics data */
  static final core.String ANALYTICS_READONLY_SCOPE = "https://www.googleapis.com/auth/analytics.readonly";
}

// Resource .ManagementResource
class ManagementResource extends core.Object {
  final AnalyticsApi _$service;
  final ManagementWebpropertiesResourceResource webproperties;
  final ManagementSegmentsResourceResource segments;
  final ManagementAccountsResourceResource accounts;
  final ManagementGoalsResourceResource goals;
  final ManagementProfilesResourceResource profiles;
  
  ManagementResource._internal(AnalyticsApi $service) : _$service = $service,
    webproperties = new ManagementWebpropertiesResourceResource._internal($service),
    segments = new ManagementSegmentsResourceResource._internal($service),
    accounts = new ManagementAccountsResourceResource._internal($service),
    goals = new ManagementGoalsResourceResource._internal($service),
    profiles = new ManagementProfilesResourceResource._internal($service);
}


// Resource ManagementResource.ManagementWebpropertiesResourceResource
class ManagementWebpropertiesResourceResource extends core.Object {
  final AnalyticsApi _$service;
  
  ManagementWebpropertiesResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementWebpropertiesResourceResource.List
  /**
   * Lists web properties to which the user has access.
   *
   *    * [accountId] Account ID to retrieve web properties for. Can either be a specific account ID or '~all', which
   *        refers to all the accounts that user has access to.
   *    * [maxResults] The maximum number of web properties to include in this response.
   *    * [startIndex] An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with
   *        the max-results parameter.

  Minimum: 1.
   */
  core.Future<Webproperties> list(core.String accountId, [core.int maxResults = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "management/accounts/{accountId}/webproperties";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Webproperties.parse(JSON.parse($text)));
  }
}

// Resource ManagementResource.ManagementSegmentsResourceResource
class ManagementSegmentsResourceResource extends core.Object {
  final AnalyticsApi _$service;
  
  ManagementSegmentsResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementSegmentsResourceResource.List
  /**
   * Lists advanced segments to which the user has access.
   *
   *    * [maxResults] The maximum number of advanced segments to include in this response.
   *    * [startIndex] An index of the first advanced segment to retrieve. Use this parameter as a pagination mechanism
   *        along with the max-results parameter.

  Minimum: 1.
   */
  core.Future<Segments> list([core.int maxResults = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "management/segments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Segments.parse(JSON.parse($text)));
  }
}

// Resource ManagementResource.ManagementAccountsResourceResource
class ManagementAccountsResourceResource extends core.Object {
  final AnalyticsApi _$service;
  
  ManagementAccountsResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementAccountsResourceResource.List
  /**
   * Lists all accounts to which the user has access.
   *
   *    * [maxResults] The maximum number of accounts to include in this response.
   *    * [startIndex] An index of the first account to retrieve. Use this parameter as a pagination mechanism along with
   *        the max-results parameter.

  Minimum: 1.
   */
  core.Future<Accounts> list([core.int maxResults = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "management/accounts";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Accounts.parse(JSON.parse($text)));
  }
}

// Resource ManagementResource.ManagementGoalsResourceResource
class ManagementGoalsResourceResource extends core.Object {
  final AnalyticsApi _$service;
  
  ManagementGoalsResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementGoalsResourceResource.List
  /**
   * Lists goals to which the user has access.
   *
   *    * [accountId] Account ID to retrieve goals for. Can either be a specific account ID or '~all', which refers to all
   *        the accounts that user has access to.
   *    * [webPropertyId] Web property ID to retrieve goals for. Can either be a specific web property ID or '~all', which
   *        refers to all the web properties that user has access to.
   *    * [profileId] Profile ID to retrieve goals for. Can either be a specific profile ID or '~all', which refers to all
   *        the profiles that user has access to.
   *    * [maxResults] The maximum number of goals to include in this response.
   *    * [startIndex] An index of the first goal to retrieve. Use this parameter as a pagination mechanism along with the
   *        max-results parameter.

  Minimum: 1.
   */
  core.Future<Goals> list(core.String accountId, core.String webPropertyId, core.String profileId, [core.int maxResults = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["webPropertyId"] = webPropertyId;
    $pathParams["profileId"] = profileId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Goals.parse(JSON.parse($text)));
  }
}

// Resource ManagementResource.ManagementProfilesResourceResource
class ManagementProfilesResourceResource extends core.Object {
  final AnalyticsApi _$service;
  
  ManagementProfilesResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementProfilesResourceResource.List
  /**
   * Lists profiles to which the user has access.
   *
   *    * [accountId] Account ID for the profiles to retrieve. Can either be a specific account ID or '~all', which refers
   *        to all the accounts to which the user has access.
   *    * [webPropertyId] Web property ID for the profiles to retrieve. Can either be a specific web property ID or '~all',
   *        which refers to all the web properties to which the user has access.
   *    * [maxResults] The maximum number of profiles to include in this response.
   *    * [startIndex] An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with
   *        the max-results parameter.

  Minimum: 1.
   */
  core.Future<Profiles> list(core.String accountId, core.String webPropertyId, [core.int maxResults = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["webPropertyId"] = webPropertyId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Profiles.parse(JSON.parse($text)));
  }
}

// Resource .DataResource
class DataResource extends core.Object {
  final AnalyticsApi _$service;
  final DataGaResourceResource ga;
  
  DataResource._internal(AnalyticsApi $service) : _$service = $service,
    ga = new DataGaResourceResource._internal($service);
}


// Resource DataResource.DataGaResourceResource
class DataGaResourceResource extends core.Object {
  final AnalyticsApi _$service;
  
  DataGaResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method DataResource.DataGaResourceResource.Get
  /**
   * Returns Analytics data for a profile.
   *
   *    * [ids] Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX, where XXXX is the
   *        Analytics profile ID.
   *    * [startDate] Start date for fetching Analytics data. All requests should specify a start date formatted as YYYY-
   *        MM-DD.
   *    * [endDate] End date for fetching Analytics data. All requests should specify an end date formatted as YYYY-MM-
   *        DD.
   *    * [metrics] A comma-separated list of Analytics metrics. E.g., 'ga:visits,ga:pageviews'. At least one metric
   *        must be specified.
   *    * [maxResults] The maximum number of entries to include in this feed.
   *    * [sort] A comma-separated list of dimensions or metrics that determine the sort order for Analytics data.
   *    * [dimensions] A comma-separated list of Analytics dimensions. E.g., 'ga:browser,ga:city'.
   *    * [startIndex] An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with
   *        the max-results parameter.

  Minimum: 1.
   *    * [segment] An Analytics advanced segment to be applied to data.
   *    * [filters] A comma-separated list of dimension or metric filters to be applied to Analytics data.
   */
  core.Future<GaData> get(core.String ids, core.String startDate, core.String endDate, core.String metrics, [core.int maxResults = UNSPECIFIED, core.String sort = UNSPECIFIED, core.String dimensions = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String segment = UNSPECIFIED, core.String filters = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["ids"] = ids;
    $pathParams["start-date"] = startDate;
    $pathParams["end-date"] = endDate;
    $pathParams["metrics"] = metrics;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != dimensions) $queryParams["dimensions"] = dimensions;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (UNSPECIFIED != segment) $queryParams["segment"] = segment;
    if (UNSPECIFIED != filters) $queryParams["filters"] = filters;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "data/ga";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => GaData.parse(JSON.parse($text)));
  }
}

// Schema .Account
class Account extends IdentityHash {
  /** Resource type for Analytics account. */
  core.String kind;

  /** Account name. */
  core.String name;

  /** Time the account was created. */
  core.String created;

  /** Time the account was last modified. */
  core.String updated;

  /** Child link for an account entry. Points to the list of web properties for this account. */
  AccountChildLink childLink;

  /** Account ID. */
  core.String id;

  /** Link for this account. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Account parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Account();
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.created = identity(json["created"]);
    result.updated = identity(json["updated"]);
    result.childLink = AccountChildLink.parse(json["childLink"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Account value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["created"] = identity(value.created);
    result["updated"] = identity(value.updated);
    result["childLink"] = AccountChildLink.serialize(value.childLink);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Account.AccountChildLink
class AccountChildLink extends IdentityHash {
  /** Link to the list of web properties for this account. */
  core.String href;

  /** Type of the child link. Its value is "analytics#webproperties". */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static AccountChildLink parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AccountChildLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AccountChildLink value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Accounts
class Accounts extends IdentityHash {
  /** Email ID of the authenticated user */
  core.String username;

  /** Collection type. */
  core.String kind;

  /** A list of accounts. */
  core.List<Account> items;

  /**
 * The maximum number of entries the response can contain, regardless of the actual number of
 * entries returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or otherwise
 * specified by the max-results query parameter.
 */
  core.int itemsPerPage;

  /** Previous link for this account collection. */
  core.String previousLink;

  /**
 * The starting index of the entries, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  core.int startIndex;

  /** Next link for this account collection. */
  core.String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  core.int totalResults;

  /** Parses an instance from its JSON representation. */
  static Accounts parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Accounts();
    result.username = identity(json["username"]);
    result.kind = identity(json["kind"]);
    result.items = map(Account.parse)(json["items"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.previousLink = identity(json["previousLink"]);
    result.startIndex = identity(json["startIndex"]);
    result.nextLink = identity(json["nextLink"]);
    result.totalResults = identity(json["totalResults"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Accounts value) {
    if (value == null) return null;
    final result = {};
    result["username"] = identity(value.username);
    result["kind"] = identity(value.kind);
    result["items"] = map(Account.serialize)(value.items);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["previousLink"] = identity(value.previousLink);
    result["startIndex"] = identity(value.startIndex);
    result["nextLink"] = identity(value.nextLink);
    result["totalResults"] = identity(value.totalResults);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .GaData
class GaData extends IdentityHash {
  /** Resource type. */
  core.String kind;

  /**
 * Analytics data rows, where each row contains a list of dimension values followed by the metric
 * values. The order of dimensions and metrics is same as specified in the request.
 */
  core.List<core.List<core.String>> rows;

  /** Determines if Analytics data contains samples. */
  core.bool containsSampledData;

  /** The total number of rows for the query, regardless of the number of rows in the response. */
  core.int totalResults;

  /**
 * The maximum number of rows the response can contain, regardless of the actual number of rows
 * returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or otherwise
 * specified by the max-results query parameter.
 */
  core.int itemsPerPage;

  /**
 * Total values for the requested metrics over all the results, not just the results returned in
 * this response. The order of the metric totals is same as the metric order specified in the
 * request.
 */
  core.Map<core.String, core.String> totalsForAllResults;

  /** Link to next page for this Analytics data query. */
  core.String nextLink;

  /** Unique ID for this data response. */
  core.String id;

  /** Analytics data request query parameters. */
  GaDataQuery query;

  /** Link to previous page for this Analytics data query. */
  core.String previousLink;

  /** Information for the profile, for which the Analytics data was requested. */
  GaDataProfileInfo profileInfo;

  /**
 * Column headers that list dimension names followed by the metric names. The order of dimensions
 * and metrics is same as specified in the request.
 */
  core.List<GaDataColumnHeaders> columnHeaders;

  /** Link to this page. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static GaData parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GaData();
    result.kind = identity(json["kind"]);
    result.rows = map(map(identity))(json["rows"]);
    result.containsSampledData = identity(json["containsSampledData"]);
    result.totalResults = identity(json["totalResults"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.totalsForAllResults = mapValues(identity)(json["totalsForAllResults"]);
    result.nextLink = identity(json["nextLink"]);
    result.id = identity(json["id"]);
    result.query = GaDataQuery.parse(json["query"]);
    result.previousLink = identity(json["previousLink"]);
    result.profileInfo = GaDataProfileInfo.parse(json["profileInfo"]);
    result.columnHeaders = map(GaDataColumnHeaders.parse)(json["columnHeaders"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GaData value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(map(identity))(value.rows);
    result["containsSampledData"] = identity(value.containsSampledData);
    result["totalResults"] = identity(value.totalResults);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["totalsForAllResults"] = mapValues(identity)(value.totalsForAllResults);
    result["nextLink"] = identity(value.nextLink);
    result["id"] = identity(value.id);
    result["query"] = GaDataQuery.serialize(value.query);
    result["previousLink"] = identity(value.previousLink);
    result["profileInfo"] = GaDataProfileInfo.serialize(value.profileInfo);
    result["columnHeaders"] = map(GaDataColumnHeaders.serialize)(value.columnHeaders);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema GaData.GaDataColumnHeaders
class GaDataColumnHeaders extends IdentityHash {
  /**
 * Data type. Dimension column headers have only STRING as the data type. Metric column headers have
 * data types for metric values such as INTEGER, DOUBLE, CURRENCY etc.
 */
  core.String dataType;

  /** Column Type. Either DIMENSION or METRIC. */
  core.String columnType;

  /** Column name. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static GaDataColumnHeaders parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GaDataColumnHeaders();
    result.dataType = identity(json["dataType"]);
    result.columnType = identity(json["columnType"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GaDataColumnHeaders value) {
    if (value == null) return null;
    final result = {};
    result["dataType"] = identity(value.dataType);
    result["columnType"] = identity(value.columnType);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema GaData.GaDataProfileInfo
class GaDataProfileInfo extends IdentityHash {
  /** Web Property ID to which this profile belongs. */
  core.String webPropertyId;

  /** Internal ID for the web property to which this profile belongs. */
  core.String internalWebPropertyId;

  /** Table ID for profile. */
  core.String tableId;

  /** Profile ID. */
  core.String profileId;

  /** Profile name. */
  core.String profileName;

  /** Account ID to which this profile belongs. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static GaDataProfileInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GaDataProfileInfo();
    result.webPropertyId = identity(json["webPropertyId"]);
    result.internalWebPropertyId = identity(json["internalWebPropertyId"]);
    result.tableId = identity(json["tableId"]);
    result.profileId = identity(json["profileId"]);
    result.profileName = identity(json["profileName"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GaDataProfileInfo value) {
    if (value == null) return null;
    final result = {};
    result["webPropertyId"] = identity(value.webPropertyId);
    result["internalWebPropertyId"] = identity(value.internalWebPropertyId);
    result["tableId"] = identity(value.tableId);
    result["profileId"] = identity(value.profileId);
    result["profileName"] = identity(value.profileName);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema GaData.GaDataQuery
class GaDataQuery extends IdentityHash {
  /** Maximum results per page. */
  core.int maxResults;

  /** List of dimensions or metrics based on which Analytics data is sorted. */
  core.List<core.String> sort;

  /** List of analytics dimensions. */
  core.String dimensions;

  /** Start date. */
  core.String startDate;

  /** Start index. */
  core.int startIndex;

  /** Analytics advanced segment. */
  core.String segment;

  /** Unique table ID. */
  core.String ids;

  /** List of analytics metrics. */
  core.List<core.String> metrics;

  /** Comma-separated list of dimension or metric filters. */
  core.String filters;

  /** End date. */
  core.String endDate;

  /** Parses an instance from its JSON representation. */
  static GaDataQuery parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GaDataQuery();
    result.maxResults = identity(json["max-results"]);
    result.sort = map(identity)(json["sort"]);
    result.dimensions = identity(json["dimensions"]);
    result.startDate = identity(json["start-date"]);
    result.startIndex = identity(json["start-index"]);
    result.segment = identity(json["segment"]);
    result.ids = identity(json["ids"]);
    result.metrics = map(identity)(json["metrics"]);
    result.filters = identity(json["filters"]);
    result.endDate = identity(json["end-date"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GaDataQuery value) {
    if (value == null) return null;
    final result = {};
    result["max-results"] = identity(value.maxResults);
    result["sort"] = map(identity)(value.sort);
    result["dimensions"] = identity(value.dimensions);
    result["start-date"] = identity(value.startDate);
    result["start-index"] = identity(value.startIndex);
    result["segment"] = identity(value.segment);
    result["ids"] = identity(value.ids);
    result["metrics"] = map(identity)(value.metrics);
    result["filters"] = identity(value.filters);
    result["end-date"] = identity(value.endDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Goal
class Goal extends IdentityHash {
  /** Resource type for an Analytics goal. */
  core.String kind;

  /** Details for the goal of the type VISIT_TIME_ON_SITE. */
  GoalVisitTimeOnSiteDetails visitTimeOnSiteDetails;

  /** Goal name. */
  core.String name;

  /** Time this goal was created. */
  core.String created;

  /** Details for the goal of the type URL_DESTINATION. */
  GoalUrlDestinationDetails urlDestinationDetails;

  /** Time this goal was last modified. */
  core.String updated;

  /** Goal value. */
  core.double value;

  /** Details for the goal of the type VISIT_NUM_PAGES. */
  GoalVisitNumPagesDetails visitNumPagesDetails;

  /** Internal ID for the web property to which this goal belongs. */
  core.String internalWebPropertyId;

  /** Details for the goal of the type EVENT. */
  GoalEventDetails eventDetails;

  /** Web property ID to which this goal belongs. The web property ID is of the form UA-XXXXX-YY. */
  core.String webPropertyId;

  /** Determines whether this goal is active. */
  core.bool active;

  /** Profile ID to which this goal belongs. */
  core.String profileId;

  /** Parent link for a goal. Points to the profile to which this goal belongs. */
  GoalParentLink parentLink;

  /**
 * Goal type. Possible values are URL_DESTINATION, VISIT_TIME_ON_SITE, VISIT_NUM_PAGES, AND EVENT.
 */
  core.String type;

  /** Goal ID. */
  core.String id;

  /** Link for this goal. */
  core.String selfLink;

  /** Account ID to which this goal belongs. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static Goal parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Goal();
    result.kind = identity(json["kind"]);
    result.visitTimeOnSiteDetails = GoalVisitTimeOnSiteDetails.parse(json["visitTimeOnSiteDetails"]);
    result.name = identity(json["name"]);
    result.created = identity(json["created"]);
    result.urlDestinationDetails = GoalUrlDestinationDetails.parse(json["urlDestinationDetails"]);
    result.updated = identity(json["updated"]);
    result.value = identity(json["value"]);
    result.visitNumPagesDetails = GoalVisitNumPagesDetails.parse(json["visitNumPagesDetails"]);
    result.internalWebPropertyId = identity(json["internalWebPropertyId"]);
    result.eventDetails = GoalEventDetails.parse(json["eventDetails"]);
    result.webPropertyId = identity(json["webPropertyId"]);
    result.active = identity(json["active"]);
    result.profileId = identity(json["profileId"]);
    result.parentLink = GoalParentLink.parse(json["parentLink"]);
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Goal value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["visitTimeOnSiteDetails"] = GoalVisitTimeOnSiteDetails.serialize(value.visitTimeOnSiteDetails);
    result["name"] = identity(value.name);
    result["created"] = identity(value.created);
    result["urlDestinationDetails"] = GoalUrlDestinationDetails.serialize(value.urlDestinationDetails);
    result["updated"] = identity(value.updated);
    result["value"] = identity(value.value);
    result["visitNumPagesDetails"] = GoalVisitNumPagesDetails.serialize(value.visitNumPagesDetails);
    result["internalWebPropertyId"] = identity(value.internalWebPropertyId);
    result["eventDetails"] = GoalEventDetails.serialize(value.eventDetails);
    result["webPropertyId"] = identity(value.webPropertyId);
    result["active"] = identity(value.active);
    result["profileId"] = identity(value.profileId);
    result["parentLink"] = GoalParentLink.serialize(value.parentLink);
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalEventDetails
class GoalEventDetails extends IdentityHash {
  /** List of event conditions. */
  core.List<GoalEventDetailsEventConditions> eventConditions;

  /** Determines if the event value should be used as the value for this goal. */
  core.bool useEventValue;

  /** Parses an instance from its JSON representation. */
  static GoalEventDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalEventDetails();
    result.eventConditions = map(GoalEventDetailsEventConditions.parse)(json["eventConditions"]);
    result.useEventValue = identity(json["useEventValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalEventDetails value) {
    if (value == null) return null;
    final result = {};
    result["eventConditions"] = map(GoalEventDetailsEventConditions.serialize)(value.eventConditions);
    result["useEventValue"] = identity(value.useEventValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalEventDetails.GoalEventDetailsEventConditions
class GoalEventDetailsEventConditions extends IdentityHash {
  /** Type of this event condition. Possible values are CATEGORY, ACTION, LABEL, or VALUE. */
  core.String type;

  /** Type of the match to be performed. Possible values are REGEXP, BEGINS_WITH, or EXACT. */
  core.String matchType;

  /** Expression used for this match. */
  core.String expression;

  /** Type of comparison. Possible values are LESS_THAN, GREATER_THAN or EQUAL. */
  core.String comparisonType;

  /** Value used for this comparison. */
  core.String comparisonValue;

  /** Parses an instance from its JSON representation. */
  static GoalEventDetailsEventConditions parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalEventDetailsEventConditions();
    result.type = identity(json["type"]);
    result.matchType = identity(json["matchType"]);
    result.expression = identity(json["expression"]);
    result.comparisonType = identity(json["comparisonType"]);
    result.comparisonValue = identity(json["comparisonValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalEventDetailsEventConditions value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["matchType"] = identity(value.matchType);
    result["expression"] = identity(value.expression);
    result["comparisonType"] = identity(value.comparisonType);
    result["comparisonValue"] = identity(value.comparisonValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalParentLink
class GoalParentLink extends IdentityHash {
  /** Link to the profile to which this goal belongs. */
  core.String href;

  /** Value is "analytics#profile". */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static GoalParentLink parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalParentLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalParentLink value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalUrlDestinationDetails
class GoalUrlDestinationDetails extends IdentityHash {
  /** URL for this goal. */
  core.String url;

  /** Determines if the goal URL must exactly match the capitalization of visited URLs. */
  core.bool caseSensitive;

  /** Match type for the goal URL. Possible values are HEAD, EXACT, or REGEX. */
  core.String matchType;

  /** List of steps configured for this goal funnel. */
  core.List<GoalUrlDestinationDetailsSteps> steps;

  /** Determines if the first step in this goal is required. */
  core.bool firstStepRequired;

  /** Parses an instance from its JSON representation. */
  static GoalUrlDestinationDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalUrlDestinationDetails();
    result.url = identity(json["url"]);
    result.caseSensitive = identity(json["caseSensitive"]);
    result.matchType = identity(json["matchType"]);
    result.steps = map(GoalUrlDestinationDetailsSteps.parse)(json["steps"]);
    result.firstStepRequired = identity(json["firstStepRequired"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalUrlDestinationDetails value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    result["caseSensitive"] = identity(value.caseSensitive);
    result["matchType"] = identity(value.matchType);
    result["steps"] = map(GoalUrlDestinationDetailsSteps.serialize)(value.steps);
    result["firstStepRequired"] = identity(value.firstStepRequired);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalUrlDestinationDetails.GoalUrlDestinationDetailsSteps
class GoalUrlDestinationDetailsSteps extends IdentityHash {
  /** URL for this step. */
  core.String url;

  /** Step name. */
  core.String name;

  /** Step number. */
  core.int number;

  /** Parses an instance from its JSON representation. */
  static GoalUrlDestinationDetailsSteps parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalUrlDestinationDetailsSteps();
    result.url = identity(json["url"]);
    result.name = identity(json["name"]);
    result.number = identity(json["number"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalUrlDestinationDetailsSteps value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    result["name"] = identity(value.name);
    result["number"] = identity(value.number);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalVisitNumPagesDetails
class GoalVisitNumPagesDetails extends IdentityHash {
  /** Type of comparison. Possible values are LESS_THAN, GREATER_THAN, or EQUAL. */
  core.String comparisonType;

  /** Value used for this comparison. */
  core.String comparisonValue;

  /** Parses an instance from its JSON representation. */
  static GoalVisitNumPagesDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalVisitNumPagesDetails();
    result.comparisonType = identity(json["comparisonType"]);
    result.comparisonValue = identity(json["comparisonValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalVisitNumPagesDetails value) {
    if (value == null) return null;
    final result = {};
    result["comparisonType"] = identity(value.comparisonType);
    result["comparisonValue"] = identity(value.comparisonValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalVisitTimeOnSiteDetails
class GoalVisitTimeOnSiteDetails extends IdentityHash {
  /** Type of comparison. Possible values are LESS_THAN or GREATER_THAN. */
  core.String comparisonType;

  /** Value used for this comparison. */
  core.String comparisonValue;

  /** Parses an instance from its JSON representation. */
  static GoalVisitTimeOnSiteDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GoalVisitTimeOnSiteDetails();
    result.comparisonType = identity(json["comparisonType"]);
    result.comparisonValue = identity(json["comparisonValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GoalVisitTimeOnSiteDetails value) {
    if (value == null) return null;
    final result = {};
    result["comparisonType"] = identity(value.comparisonType);
    result["comparisonValue"] = identity(value.comparisonValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Goals
class Goals extends IdentityHash {
  /** Email ID of the authenticated user */
  core.String username;

  /** Collection type. */
  core.String kind;

  /** A list of goals. */
  core.List<Goal> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  core.int itemsPerPage;

  /** Link to previous page for this goal collection. */
  core.String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  core.int startIndex;

  /** Link to next page for this goal collection. */
  core.String nextLink;

  /**
 * The total number of results for the query, regardless of the number of resources in the result.
 */
  core.int totalResults;

  /** Parses an instance from its JSON representation. */
  static Goals parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Goals();
    result.username = identity(json["username"]);
    result.kind = identity(json["kind"]);
    result.items = map(Goal.parse)(json["items"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.previousLink = identity(json["previousLink"]);
    result.startIndex = identity(json["startIndex"]);
    result.nextLink = identity(json["nextLink"]);
    result.totalResults = identity(json["totalResults"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Goals value) {
    if (value == null) return null;
    final result = {};
    result["username"] = identity(value.username);
    result["kind"] = identity(value.kind);
    result["items"] = map(Goal.serialize)(value.items);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["previousLink"] = identity(value.previousLink);
    result["startIndex"] = identity(value.startIndex);
    result["nextLink"] = identity(value.nextLink);
    result["totalResults"] = identity(value.totalResults);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Profile
class Profile extends IdentityHash {
  /** Default page for this profile. */
  core.String defaultPage;

  /** Resource type for Analytics profile. */
  core.String kind;

  /** The query parameters that are excluded from this profile. */
  core.String excludeQueryParameters;

  /** Name of this profile. */
  core.String name;

  /** Time this profile was created. */
  core.String created;

  /** Web property ID of the form UA-XXXXX-YY to which this profile belongs. */
  core.String webPropertyId;

  /** Time this profile was last modified. */
  core.String updated;

  /** The site search query parameters for this profile. */
  core.String siteSearchQueryParameters;

  /** The currency type associated with this profile. */
  core.String currency;

  /** Internal ID for the web property to which this profile belongs. */
  core.String internalWebPropertyId;

  /** Child link for this profile. Points to the list of goals for this profile. */
  ProfileChildLink childLink;

  /** Time zone for which this profile has been configured. */
  core.String timezone;

  /** Site search category parameters for this profile. */
  core.String siteSearchCategoryParameters;

  /** Parent link for this profile. Points to the web property to which this profile belongs. */
  ProfileParentLink parentLink;

  /** Profile ID. */
  core.String id;

  /** Link for this profile. */
  core.String selfLink;

  /** Account ID to which this profile belongs. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static Profile parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Profile();
    result.defaultPage = identity(json["defaultPage"]);
    result.kind = identity(json["kind"]);
    result.excludeQueryParameters = identity(json["excludeQueryParameters"]);
    result.name = identity(json["name"]);
    result.created = identity(json["created"]);
    result.webPropertyId = identity(json["webPropertyId"]);
    result.updated = identity(json["updated"]);
    result.siteSearchQueryParameters = identity(json["siteSearchQueryParameters"]);
    result.currency = identity(json["currency"]);
    result.internalWebPropertyId = identity(json["internalWebPropertyId"]);
    result.childLink = ProfileChildLink.parse(json["childLink"]);
    result.timezone = identity(json["timezone"]);
    result.siteSearchCategoryParameters = identity(json["siteSearchCategoryParameters"]);
    result.parentLink = ProfileParentLink.parse(json["parentLink"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Profile value) {
    if (value == null) return null;
    final result = {};
    result["defaultPage"] = identity(value.defaultPage);
    result["kind"] = identity(value.kind);
    result["excludeQueryParameters"] = identity(value.excludeQueryParameters);
    result["name"] = identity(value.name);
    result["created"] = identity(value.created);
    result["webPropertyId"] = identity(value.webPropertyId);
    result["updated"] = identity(value.updated);
    result["siteSearchQueryParameters"] = identity(value.siteSearchQueryParameters);
    result["currency"] = identity(value.currency);
    result["internalWebPropertyId"] = identity(value.internalWebPropertyId);
    result["childLink"] = ProfileChildLink.serialize(value.childLink);
    result["timezone"] = identity(value.timezone);
    result["siteSearchCategoryParameters"] = identity(value.siteSearchCategoryParameters);
    result["parentLink"] = ProfileParentLink.serialize(value.parentLink);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileChildLink
class ProfileChildLink extends IdentityHash {
  /** Link to the list of goals for this profile. */
  core.String href;

  /** Value is "analytics#goals". */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static ProfileChildLink parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ProfileChildLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ProfileChildLink value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileParentLink
class ProfileParentLink extends IdentityHash {
  /** Link to the web property to which this profile belongs. */
  core.String href;

  /** Value is "analytics#webproperty". */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static ProfileParentLink parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ProfileParentLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ProfileParentLink value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Profiles
class Profiles extends IdentityHash {
  /** Email ID of the authenticated user */
  core.String username;

  /** Collection type. */
  core.String kind;

  /** A list of profiles. */
  core.List<Profile> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  core.int itemsPerPage;

  /** Link to previous page for this profile collection. */
  core.String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  core.int startIndex;

  /** Link to next page for this profile collection. */
  core.String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  core.int totalResults;

  /** Parses an instance from its JSON representation. */
  static Profiles parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Profiles();
    result.username = identity(json["username"]);
    result.kind = identity(json["kind"]);
    result.items = map(Profile.parse)(json["items"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.previousLink = identity(json["previousLink"]);
    result.startIndex = identity(json["startIndex"]);
    result.nextLink = identity(json["nextLink"]);
    result.totalResults = identity(json["totalResults"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Profiles value) {
    if (value == null) return null;
    final result = {};
    result["username"] = identity(value.username);
    result["kind"] = identity(value.kind);
    result["items"] = map(Profile.serialize)(value.items);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["previousLink"] = identity(value.previousLink);
    result["startIndex"] = identity(value.startIndex);
    result["nextLink"] = identity(value.nextLink);
    result["totalResults"] = identity(value.totalResults);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Segment
class Segment extends IdentityHash {
  /** Advanced segment definition. */
  core.String definition;

  /** Resource type for Analytics advanced segment. */
  core.String kind;

  /** Segment ID. Can be used with the 'segment' parameter in Data Feed. */
  core.String segmentId;

  /** Time the advanced segment was created. */
  core.String created;

  /** Time the advanced segment was last modified. */
  core.String updated;

  /** Advanced segment ID. */
  core.String id;

  /** Link for this advanced segment. */
  core.String selfLink;

  /** Advanced segment name. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Segment parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Segment();
    result.definition = identity(json["definition"]);
    result.kind = identity(json["kind"]);
    result.segmentId = identity(json["segmentId"]);
    result.created = identity(json["created"]);
    result.updated = identity(json["updated"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Segment value) {
    if (value == null) return null;
    final result = {};
    result["definition"] = identity(value.definition);
    result["kind"] = identity(value.kind);
    result["segmentId"] = identity(value.segmentId);
    result["created"] = identity(value.created);
    result["updated"] = identity(value.updated);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Segments
class Segments extends IdentityHash {
  /** Email ID of the authenticated user */
  core.String username;

  /** Collection type for advanced segments. */
  core.String kind;

  /** A list of advanced segments. */
  core.List<Segment> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  core.int itemsPerPage;

  /** Link to previous page for this advanced segment collection. */
  core.String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  core.int startIndex;

  /** Link to next page for this advanced segment collection. */
  core.String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  core.int totalResults;

  /** Parses an instance from its JSON representation. */
  static Segments parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Segments();
    result.username = identity(json["username"]);
    result.kind = identity(json["kind"]);
    result.items = map(Segment.parse)(json["items"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.previousLink = identity(json["previousLink"]);
    result.startIndex = identity(json["startIndex"]);
    result.nextLink = identity(json["nextLink"]);
    result.totalResults = identity(json["totalResults"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Segments value) {
    if (value == null) return null;
    final result = {};
    result["username"] = identity(value.username);
    result["kind"] = identity(value.kind);
    result["items"] = map(Segment.serialize)(value.items);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["previousLink"] = identity(value.previousLink);
    result["startIndex"] = identity(value.startIndex);
    result["nextLink"] = identity(value.nextLink);
    result["totalResults"] = identity(value.totalResults);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Webproperties
class Webproperties extends IdentityHash {
  /** Email ID of the authenticated user */
  core.String username;

  /** Collection type. */
  core.String kind;

  /** A list of web properties. */
  core.List<Webproperty> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  core.int itemsPerPage;

  /** Link to previous page for this web property collection. */
  core.String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  core.int startIndex;

  /** Link to next page for this web property collection. */
  core.String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  core.int totalResults;

  /** Parses an instance from its JSON representation. */
  static Webproperties parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Webproperties();
    result.username = identity(json["username"]);
    result.kind = identity(json["kind"]);
    result.items = map(Webproperty.parse)(json["items"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.previousLink = identity(json["previousLink"]);
    result.startIndex = identity(json["startIndex"]);
    result.nextLink = identity(json["nextLink"]);
    result.totalResults = identity(json["totalResults"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Webproperties value) {
    if (value == null) return null;
    final result = {};
    result["username"] = identity(value.username);
    result["kind"] = identity(value.kind);
    result["items"] = map(Webproperty.serialize)(value.items);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["previousLink"] = identity(value.previousLink);
    result["startIndex"] = identity(value.startIndex);
    result["nextLink"] = identity(value.nextLink);
    result["totalResults"] = identity(value.totalResults);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Webproperty
class Webproperty extends IdentityHash {
  /** Resource type for Analytics WebProperty. */
  core.String kind;

  /** Name of this web property. */
  core.String name;

  /** Time this web property was created. */
  core.String created;

  /** Time this web property was last modified. */
  core.String updated;

  /** Website url for this web property. */
  core.String websiteUrl;

  /** Internal ID for this web property. */
  core.String internalWebPropertyId;

  /** Child link for this web property. Points to the list of profiles for this web property. */
  WebpropertyChildLink childLink;

  /** Parent link for this web property. Points to the account to which this web property belongs. */
  WebpropertyParentLink parentLink;

  /** Web property ID of the form UA-XXXXX-YY. */
  core.String id;

  /** Link for this web property. */
  core.String selfLink;

  /** Account ID to which this web property belongs. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static Webproperty parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Webproperty();
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.created = identity(json["created"]);
    result.updated = identity(json["updated"]);
    result.websiteUrl = identity(json["websiteUrl"]);
    result.internalWebPropertyId = identity(json["internalWebPropertyId"]);
    result.childLink = WebpropertyChildLink.parse(json["childLink"]);
    result.parentLink = WebpropertyParentLink.parse(json["parentLink"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Webproperty value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["created"] = identity(value.created);
    result["updated"] = identity(value.updated);
    result["websiteUrl"] = identity(value.websiteUrl);
    result["internalWebPropertyId"] = identity(value.internalWebPropertyId);
    result["childLink"] = WebpropertyChildLink.serialize(value.childLink);
    result["parentLink"] = WebpropertyParentLink.serialize(value.parentLink);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Webproperty.WebpropertyChildLink
class WebpropertyChildLink extends IdentityHash {
  /** Link to the list of profiles for this web property. */
  core.String href;

  /** Type of the parent link. Its value is "analytics#profiles". */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static WebpropertyChildLink parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new WebpropertyChildLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(WebpropertyChildLink value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Webproperty.WebpropertyParentLink
class WebpropertyParentLink extends IdentityHash {
  /** Link to the account for this web property. */
  core.String href;

  /** Type of the parent link. Its value is "analytics#account". */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static WebpropertyParentLink parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new WebpropertyParentLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(WebpropertyParentLink value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AnalyticsApi.Alt
class AnalyticsApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final AnalyticsApiAlt JSON = const AnalyticsApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<AnalyticsApiAlt> values = const <AnalyticsApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AnalyticsApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AnalyticsApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AnalyticsApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

