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

#library('dfareporting-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API DfareportingApi
/**
 * Lets you create, run and download reports.
 */
class DfareportingApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  DfareportingApi get _$service() => this;
  FilesResource _files;
  FilesResource get files() => _files;
  DimensionValuesResource _dimensionValues;
  DimensionValuesResource get dimensionValues() => _dimensionValues;
  UserProfilesResource _userProfiles;
  UserProfilesResource get userProfiles() => _userProfiles;
  ReportsResource _reports;
  ReportsResource get reports() => _reports;
  
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
  DfareportingApiAlt alt;


  DfareportingApi([this.baseUrl = "https://www.googleapis.com/dfareporting/v1/", this.applicationName, this.authenticator]) { 
    _files = new FilesResource._internal(this);
    _dimensionValues = new DimensionValuesResource._internal(this);
    _userProfiles = new UserProfilesResource._internal(this);
    _reports = new ReportsResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}dfareporting/v1/20120519 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage DoubleClick for Advertisers reports */
  static final core.String DFAREPORTING_SCOPE = "https://www.googleapis.com/auth/dfareporting";
}

// Resource .FilesResource
class FilesResource extends core.Object {
  final DfareportingApi _$service;
  
  FilesResource._internal(DfareportingApi $service) : _$service = $service;

  // Method FilesResource.List
  /**
   * Lists files for a user profile.
   *
   *    * [profileId] The DFA profile id.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [sortField] The field to sort the list by.
  Default: LAST_MODIFIED_TIME.
   *    * [sortOrder] Order of sorted results, default is 'DESCENDING'.
  Default: DESCENDING.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 10.
   */
  core.Future<FileList> list(core.String profileId, [core.String pageToken = UNSPECIFIED, FilesResourceListSortField sortField = UNSPECIFIED, FilesResourceListSortOrder sortOrder = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != sortField) $queryParams["sortField"] = sortField;
    if (UNSPECIFIED != sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => FileList.parse(JSON.parse($text)));
  }
}

// Enum FilesResource.List.SortField
class FilesResourceListSortField extends core.Object implements core.Hashable {
  /** Sort by file id. */
  static final FilesResourceListSortField ID = const FilesResourceListSortField._internal("ID", 0);
  /** Sort by 'lastmodifiedAt' field. */
  static final FilesResourceListSortField LAST_MODIFIED_TIME = const FilesResourceListSortField._internal("LAST_MODIFIED_TIME", 1);

  /** All values of this enumeration */
  static final core.List<FilesResourceListSortField> values = const <FilesResourceListSortField>[
    ID,
    LAST_MODIFIED_TIME,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <FilesResourceListSortField>{ 
    "ID": ID,
    "LAST_MODIFIED_TIME": LAST_MODIFIED_TIME,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FilesResourceListSortField valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FilesResourceListSortField._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortField".hashCode();
}

// Enum FilesResource.List.SortOrder
class FilesResourceListSortOrder extends core.Object implements core.Hashable {
  /** Ascending order. */
  static final FilesResourceListSortOrder ASCENDING = const FilesResourceListSortOrder._internal("ASCENDING", 0);
  /** Descending order. */
  static final FilesResourceListSortOrder DESCENDING = const FilesResourceListSortOrder._internal("DESCENDING", 1);

  /** All values of this enumeration */
  static final core.List<FilesResourceListSortOrder> values = const <FilesResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <FilesResourceListSortOrder>{ 
    "ASCENDING": ASCENDING,
    "DESCENDING": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FilesResourceListSortOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FilesResourceListSortOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortOrder".hashCode();
}

// Resource .DimensionValuesResource
class DimensionValuesResource extends core.Object {
  final DfareportingApi _$service;
  
  DimensionValuesResource._internal(DfareportingApi $service) : _$service = $service;

  // Method DimensionValuesResource.Query
  /**
   * Retrieves list of report dimension values for a list of filters.
   *
   *    * [content] the DimensionValueRequest
   *    * [profileId] The DFA user profile id.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 100.
   */
  core.Future<DimensionValueList> query(core.String profileId, DimensionValueRequest content, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
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
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(DimensionValueRequest.serialize(content));
    final $path = "userprofiles/{profileId}/dimensionvalues/query";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => DimensionValueList.parse(JSON.parse($text)));
  }
}

// Resource .UserProfilesResource
class UserProfilesResource extends core.Object {
  final DfareportingApi _$service;
  
  UserProfilesResource._internal(DfareportingApi $service) : _$service = $service;

  // Method UserProfilesResource.List
  /**
   * Retrieves list of user profiles for a user.
   *
   */
  core.Future<UserProfileList> list() {
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
    final $path = "userprofiles";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UserProfileList.parse(JSON.parse($text)));
  }

  // Method UserProfilesResource.Get
  /**
   * Gets one user profile by id.
   *
   *    * [profileId] The user profile id.
   */
  core.Future<UserProfile> get(core.String profileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UserProfile.parse(JSON.parse($text)));
  }
}

// Resource .ReportsResource
class ReportsResource extends core.Object {
  final DfareportingApi _$service;
  final ReportsFilesResourceResource files;
  
  ReportsResource._internal(DfareportingApi $service) : _$service = $service,
    files = new ReportsFilesResourceResource._internal($service);

  // Method ReportsResource.Insert
  /**
   * Creates a report.
   *
   *    * [content] the Report
   *    * [profileId] The DFA user profile id.
   */
  core.Future<Report> insert(core.String profileId, Report content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Report.serialize(content));
    final $path = "userprofiles/{profileId}/reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Run
  /**
   * Runs a report.
   *
   *    * [profileId] The DFA profile id.
   *    * [reportId] The id of the report.
   *    * [synchronous] If set and true, tries to run the report synchronously.
   */
  core.Future<File> run(core.String profileId, core.String reportId, [core.bool synchronous = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (UNSPECIFIED != synchronous) $queryParams["synchronous"] = synchronous;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}/run";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Get
  /**
   * Retrieves a report by its id.
   *
   *    * [profileId] The DFA user profile id.
   *    * [reportId] The id of the report.
   */
  core.Future<Report> get(core.String profileId, core.String reportId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.List
  /**
   * Retrieves list of reports.
   *
   *    * [profileId] The DFA user profile id.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [sortField] The field to sort the list by.
  Default: LAST_MODIFIED_TIME.
   *    * [sortOrder] Order of sorted results, default is 'DESCENDING'.
  Default: DESCENDING.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 10.
   */
  core.Future<ReportList> list(core.String profileId, [core.String pageToken = UNSPECIFIED, ReportsResourceListSortField sortField = UNSPECIFIED, ReportsResourceListSortOrder sortOrder = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != sortField) $queryParams["sortField"] = sortField;
    if (UNSPECIFIED != sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ReportList.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Update
  /**
   * Updates a report.
   *
   *    * [content] the Report
   *    * [profileId] The DFA user profile id.
   *    * [reportId] The id of the report.
   */
  core.Future<Report> update(core.String profileId, core.String reportId, Report content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Report.serialize(content));
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Patch
  /**
   * Updates a report. This method supports patch semantics.
   *
   *    * [content] the Report
   *    * [profileId] The DFA user profile id.
   *    * [reportId] The id of the report.
   */
  core.Future<Report> patch(core.String profileId, core.String reportId, Report content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Report.serialize(content));
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Delete
  /**
   * Deletes a report by its id.
   *
   *    * [profileId] The DFA user profile id.
   *    * [reportId] The id of the report.
   */
  core.Future delete(core.String profileId, core.String reportId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}";
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

// Enum ReportsResource.List.SortField
class ReportsResourceListSortField extends core.Object implements core.Hashable {
  /** Sort by report id. */
  static final ReportsResourceListSortField ID = const ReportsResourceListSortField._internal("ID", 0);
  /** Sort by 'lastModifiedTime' field. */
  static final ReportsResourceListSortField LAST_MODIFIED_TIME = const ReportsResourceListSortField._internal("LAST_MODIFIED_TIME", 1);
  /** Sort by display name of reports. */
  static final ReportsResourceListSortField NAME = const ReportsResourceListSortField._internal("NAME", 2);

  /** All values of this enumeration */
  static final core.List<ReportsResourceListSortField> values = const <ReportsResourceListSortField>[
    ID,
    LAST_MODIFIED_TIME,
    NAME,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ReportsResourceListSortField>{ 
    "ID": ID,
    "LAST_MODIFIED_TIME": LAST_MODIFIED_TIME,
    "NAME": NAME,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceListSortField valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceListSortField._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortField".hashCode();
}

// Enum ReportsResource.List.SortOrder
class ReportsResourceListSortOrder extends core.Object implements core.Hashable {
  /** Ascending order. */
  static final ReportsResourceListSortOrder ASCENDING = const ReportsResourceListSortOrder._internal("ASCENDING", 0);
  /** Descending order. */
  static final ReportsResourceListSortOrder DESCENDING = const ReportsResourceListSortOrder._internal("DESCENDING", 1);

  /** All values of this enumeration */
  static final core.List<ReportsResourceListSortOrder> values = const <ReportsResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ReportsResourceListSortOrder>{ 
    "ASCENDING": ASCENDING,
    "DESCENDING": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceListSortOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceListSortOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortOrder".hashCode();
}


// Resource ReportsResource.ReportsFilesResourceResource
class ReportsFilesResourceResource extends core.Object {
  final DfareportingApi _$service;
  
  ReportsFilesResourceResource._internal(DfareportingApi $service) : _$service = $service;

  // Method ReportsResource.ReportsFilesResourceResource.List
  /**
   * Lists files for a report.
   *
   *    * [profileId] The DFA profile id.
   *    * [reportId] The id of the parent report.
   *    * [sortField] The field to sort the list by.
  Default: LAST_MODIFIED_TIME.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 10.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [sortOrder] Order of sorted results, default is 'DESCENDING'.
  Default: DESCENDING.
   */
  core.Future<FileList> list(core.String profileId, core.String reportId, [ReportsResourceReportsFilesResourceResourceListSortField sortField = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String pageToken = UNSPECIFIED, ReportsResourceReportsFilesResourceResourceListSortOrder sortOrder = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (UNSPECIFIED != sortField) $queryParams["sortField"] = sortField;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}/files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => FileList.parse(JSON.parse($text)));
  }

  // Method ReportsResource.ReportsFilesResourceResource.Get
  /**
   * Retrieves a report file.
   *
   *    * [profileId] The DFA profile id.
   *    * [reportId] The id of the report.
   *    * [fileId] The id of the report file.
   */
  core.Future<File> get(core.String profileId, core.String reportId, core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}/files/{fileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }
}

// Enum ReportsResource.ReportsFilesResourceResource.List.SortField
class ReportsResourceReportsFilesResourceResourceListSortField extends core.Object implements core.Hashable {
  /** Sort by file id. */
  static final ReportsResourceReportsFilesResourceResourceListSortField ID = const ReportsResourceReportsFilesResourceResourceListSortField._internal("ID", 0);
  /** Sort by 'lastmodifiedAt' field. */
  static final ReportsResourceReportsFilesResourceResourceListSortField LAST_MODIFIED_TIME = const ReportsResourceReportsFilesResourceResourceListSortField._internal("LAST_MODIFIED_TIME", 1);

  /** All values of this enumeration */
  static final core.List<ReportsResourceReportsFilesResourceResourceListSortField> values = const <ReportsResourceReportsFilesResourceResourceListSortField>[
    ID,
    LAST_MODIFIED_TIME,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ReportsResourceReportsFilesResourceResourceListSortField>{ 
    "ID": ID,
    "LAST_MODIFIED_TIME": LAST_MODIFIED_TIME,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceReportsFilesResourceResourceListSortField valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceReportsFilesResourceResourceListSortField._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortField".hashCode();
}

// Enum ReportsResource.ReportsFilesResourceResource.List.SortOrder
class ReportsResourceReportsFilesResourceResourceListSortOrder extends core.Object implements core.Hashable {
  /** Ascending order. */
  static final ReportsResourceReportsFilesResourceResourceListSortOrder ASCENDING = const ReportsResourceReportsFilesResourceResourceListSortOrder._internal("ASCENDING", 0);
  /** Descending order. */
  static final ReportsResourceReportsFilesResourceResourceListSortOrder DESCENDING = const ReportsResourceReportsFilesResourceResourceListSortOrder._internal("DESCENDING", 1);

  /** All values of this enumeration */
  static final core.List<ReportsResourceReportsFilesResourceResourceListSortOrder> values = const <ReportsResourceReportsFilesResourceResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ReportsResourceReportsFilesResourceResourceListSortOrder>{ 
    "ASCENDING": ASCENDING,
    "DESCENDING": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceReportsFilesResourceResourceListSortOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceReportsFilesResourceResourceListSortOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortOrder".hashCode();
}

// Schema .DimensionFilter
class DimensionFilter extends IdentityHash {
  /** The name of the dimension to filter. */
  core.String dimensionName;

  /** Kind of resource this is, in this case dfareporting#dimensionFilter. */
  core.String kind;

  /** The value of the dimension to filter for. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static DimensionFilter parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionFilter();
    result.dimensionName = identity(json["dimensionName"]);
    result.kind = identity(json["kind"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionFilter value) {
    if (value == null) return null;
    final result = {};
    result["dimensionName"] = identity(value.dimensionName);
    result["kind"] = identity(value.kind);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionValue
class DimensionValue extends IdentityHash {
  /** Name of the dimension. */
  core.String dimensionName;

  /** Kind of resource this is, in this case dfareporting#dimensionValue. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** The ID associated with the value if available. */
  core.String id;

  /** The value of the dimension. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static DimensionValue parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionValue();
    result.dimensionName = identity(json["dimensionName"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionValue value) {
    if (value == null) return null;
    final result = {};
    result["dimensionName"] = identity(value.dimensionName);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionValueList
class DimensionValueList extends IdentityHash {
  /**
 * Continuation token used to page through dimension values. To retrieve the next page of results,
 * set the next request's "pageToken" to the value of this field. The page token is only valid for a
 * limited amount of time and should not be persisted.
 */
  core.String nextPageToken;

  /** The dimension values returned in this response. */
  core.List<DimensionValue> items;

  /** Kind of list this is, in this case dfareporting#dimensionValueList. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static DimensionValueList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionValueList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(DimensionValue.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionValueList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(DimensionValue.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionValueRequest
class DimensionValueRequest extends IdentityHash {
  /** The name of the dimension values should be requested for. */
  core.String dimensionName;

  /**
 * The start date of the date range for which to retrieve dimension values. A string of the format:
 * "yyyy-MM-dd".
 */
  core.String startDate;

  /** Kind of request this is, in this case dfareporting#dimensionValueRequest. */
  core.String kind;

  /**
 * The end date of the date range for which to retrieve dimension values. A string of the format:
 * "yyyy-MM-dd".
 */
  core.String endDate;

  /** List of filters to filter values by. The filters are ANDed. */
  core.List<DimensionFilter> filters;

  /** Parses an instance from its JSON representation. */
  static DimensionValueRequest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionValueRequest();
    result.dimensionName = identity(json["dimensionName"]);
    result.startDate = identity(json["startDate"]);
    result.kind = identity(json["kind"]);
    result.endDate = identity(json["endDate"]);
    result.filters = map(DimensionFilter.parse)(json["filters"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionValueRequest value) {
    if (value == null) return null;
    final result = {};
    result["dimensionName"] = identity(value.dimensionName);
    result["startDate"] = identity(value.startDate);
    result["kind"] = identity(value.kind);
    result["endDate"] = identity(value.endDate);
    result["filters"] = map(DimensionFilter.serialize)(value.filters);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .File
class File extends IdentityHash {
  /**
 * The status of the report file, one of: - "PROCESSING" - "REPORT_AVAILABLE" - "FAILED" -
 * "CANCELLED"
 */
  core.String status;

  /** Kind of resource this is, in this case dfareporting#file. */
  core.String kind;

  /** The date range for which the file has report data. */
  FileDateRange dateRange;

  /** The file name of the file. */
  core.String fileName;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** The ID of the report this file was generated from. */
  core.String reportId;

  /** The urls where the completed report file can be downloaded. */
  FileUrls urls;

  /** The timestamp in milliseconds since epoch when this file was last modified. */
  core.String lastModifiedTime;

  /** The unique ID of this report file. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static File parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new File();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.dateRange = FileDateRange.parse(json["dateRange"]);
    result.fileName = identity(json["fileName"]);
    result.etag = identity(json["etag"]);
    result.reportId = identity(json["reportId"]);
    result.urls = FileUrls.parse(json["urls"]);
    result.lastModifiedTime = identity(json["lastModifiedTime"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(File value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["dateRange"] = FileDateRange.serialize(value.dateRange);
    result["fileName"] = identity(value.fileName);
    result["etag"] = identity(value.etag);
    result["reportId"] = identity(value.reportId);
    result["urls"] = FileUrls.serialize(value.urls);
    result["lastModifiedTime"] = identity(value.lastModifiedTime);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileDateRange
class FileDateRange extends IdentityHash {
  /** The start date of the date range, inclusive. A string of the format: "yyyy-MM-dd". */
  core.String startDate;

  /** The end date of the date range, inclusive. A string of the format: "yyyy-MM-dd". */
  core.String endDate;

  /** Parses an instance from its JSON representation. */
  static FileDateRange parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileDateRange();
    result.startDate = identity(json["startDate"]);
    result.endDate = identity(json["endDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileDateRange value) {
    if (value == null) return null;
    final result = {};
    result["startDate"] = identity(value.startDate);
    result["endDate"] = identity(value.endDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FileList
class FileList extends IdentityHash {
  /**
 * Continuation token used to page through files. To retrieve the next page of results, set the next
 * request's "pageToken" to the value of this field. The page token is only valid for a limited
 * amount of time and should not be persisted.
 */
  core.String nextPageToken;

  /** The files returned in this response. */
  core.List<File> items;

  /** Kind of list this is, in this case dfareporting#fileList. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static FileList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(File.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(File.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileUrls
class FileUrls extends IdentityHash {
  /** Urls for generated CSV data. */
  FileUrlsCsv csv;

  /** Parses an instance from its JSON representation. */
  static FileUrls parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileUrls();
    result.csv = FileUrlsCsv.parse(json["csv"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileUrls value) {
    if (value == null) return null;
    final result = {};
    result["csv"] = FileUrlsCsv.serialize(value.csv);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileUrls.FileUrlsCsv
class FileUrlsCsv extends IdentityHash {
  /** The url for downloading the report data through a browser. */
  core.String browserUrl;

  /** The url for downloading the report data through the API. */
  core.String apiUrl;

  /** Parses an instance from its JSON representation. */
  static FileUrlsCsv parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileUrlsCsv();
    result.browserUrl = identity(json["browserUrl"]);
    result.apiUrl = identity(json["apiUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileUrlsCsv value) {
    if (value == null) return null;
    final result = {};
    result["browserUrl"] = identity(value.browserUrl);
    result["apiUrl"] = identity(value.apiUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Report
class Report extends IdentityHash {
  /** Kind of resource this is, in this case dfareporting#report. */
  core.String kind;

  /** The subbaccount id this report belongs to if applicable. */
  core.String subAccountId;

  /** The name of the report. */
  core.String name;

  /**
 * The report's schedule. Can only be set if the report's 'dateRange' is a relative date range and
 * the relative date range is not "TODAY".
 */
  ReportSchedule schedule;

  /** The user profile id of the owner of this report. */
  core.String ownerProfileId;

  /** The file name used when generating report files for this report. */
  core.String fileName;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** The report criteria. */
  ReportCriteria criteria;

  /** The timestamp (in milliseconds since epoch) of when this report was last modified. */
  core.String lastModifiedTime;

  /** The type of the report, currently only "STANDARD" is supported. */
  core.String type;

  /** The unique ID identifying this report resource. */
  core.String id;

  /** The account id this report belongs to. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static Report parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Report();
    result.kind = identity(json["kind"]);
    result.subAccountId = identity(json["subAccountId"]);
    result.name = identity(json["name"]);
    result.schedule = ReportSchedule.parse(json["schedule"]);
    result.ownerProfileId = identity(json["ownerProfileId"]);
    result.fileName = identity(json["fileName"]);
    result.etag = identity(json["etag"]);
    result.criteria = ReportCriteria.parse(json["criteria"]);
    result.lastModifiedTime = identity(json["lastModifiedTime"]);
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Report value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["subAccountId"] = identity(value.subAccountId);
    result["name"] = identity(value.name);
    result["schedule"] = ReportSchedule.serialize(value.schedule);
    result["ownerProfileId"] = identity(value.ownerProfileId);
    result["fileName"] = identity(value.fileName);
    result["etag"] = identity(value.etag);
    result["criteria"] = ReportCriteria.serialize(value.criteria);
    result["lastModifiedTime"] = identity(value.lastModifiedTime);
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportCriteria
class ReportCriteria extends IdentityHash {
  /** Activity group. */
  ReportCriteriaActivities activities;

  /** The list of dimensions the report should include. */
  core.List<SortedDimension> dimensions;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /** The date range this report should be run for. */
  ReportCriteriaDateRange dateRange;

  /**
 * The list of filters dimensions are filtered on. Filters for different dimensions are ANDed,
 * filters for the same dimension are grouped together and ORed.
 */
  core.List<DimensionValue> dimensionFilters;

  /** Custom Rich Media Events group. */
  ReportCriteriaCustomRichMediaEvents customRichMediaEvents;

  /** Parses an instance from its JSON representation. */
  static ReportCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportCriteria();
    result.activities = ReportCriteriaActivities.parse(json["activities"]);
    result.dimensions = map(SortedDimension.parse)(json["dimensions"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dateRange = ReportCriteriaDateRange.parse(json["dateRange"]);
    result.dimensionFilters = map(DimensionValue.parse)(json["dimensionFilters"]);
    result.customRichMediaEvents = ReportCriteriaCustomRichMediaEvents.parse(json["customRichMediaEvents"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportCriteria value) {
    if (value == null) return null;
    final result = {};
    result["activities"] = ReportCriteriaActivities.serialize(value.activities);
    result["dimensions"] = map(SortedDimension.serialize)(value.dimensions);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dateRange"] = ReportCriteriaDateRange.serialize(value.dateRange);
    result["dimensionFilters"] = map(DimensionValue.serialize)(value.dimensionFilters);
    result["customRichMediaEvents"] = ReportCriteriaCustomRichMediaEvents.serialize(value.customRichMediaEvents);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportCriteria.ReportCriteriaActivities
class ReportCriteriaActivities extends IdentityHash {
  /**
 * List of activity filters. The dimension values need to be all either of type "dfa:activity" or
 * "dfa:activityGroup".
 */
  core.List<DimensionValue> filters;

  /** List of names of floodlight activity metrics. */
  core.List<core.String> metricNames;

  /** Parses an instance from its JSON representation. */
  static ReportCriteriaActivities parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportCriteriaActivities();
    result.filters = map(DimensionValue.parse)(json["filters"]);
    result.metricNames = map(identity)(json["metricNames"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportCriteriaActivities value) {
    if (value == null) return null;
    final result = {};
    result["filters"] = map(DimensionValue.serialize)(value.filters);
    result["metricNames"] = map(identity)(value.metricNames);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportCriteria.ReportCriteriaCustomRichMediaEvents
class ReportCriteriaCustomRichMediaEvents extends IdentityHash {
  /**
 * List of custom rich media event IDs. Dimension values must be all of type
 * dfa:richMediaEventTypeIdAndName.
 */
  core.List<DimensionValue> filteredEventIds;

  /** Parses an instance from its JSON representation. */
  static ReportCriteriaCustomRichMediaEvents parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportCriteriaCustomRichMediaEvents();
    result.filteredEventIds = map(DimensionValue.parse)(json["filteredEventIds"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportCriteriaCustomRichMediaEvents value) {
    if (value == null) return null;
    final result = {};
    result["filteredEventIds"] = map(DimensionValue.serialize)(value.filteredEventIds);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportCriteria.ReportCriteriaDateRange
class ReportCriteriaDateRange extends IdentityHash {
  /** The start date of the date range, inclusive. A string of the format: "yyyy-MM-dd". */
  core.String startDate;

  /**
 * The date range relative to the date of when the report is run, one of: - "TODAY" - "YESTERDAY" -
 * "WEEK_TO_DATE" - "MONTH_TO_DATE" - "QUARTER_TO_DATE" - "YEAR_TO_DATE" - "PREVIOUS_WEEK" -
 * "PREVIOUS_MONTH" - "PREVIOUS_QUARTER" - "PREVIOUS_YEAR" - "LAST_7_DAYS" - "LAST_30_DAYS" -
 * "LAST_90_DAYS" - "LAST_365_DAYS" - "LAST_24_MONTHS"
 */
  core.String relativeDateRange;

  /** The end date of the date range, inclusive. A string of the format: "yyyy-MM-dd". */
  core.String endDate;

  /** Parses an instance from its JSON representation. */
  static ReportCriteriaDateRange parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportCriteriaDateRange();
    result.startDate = identity(json["startDate"]);
    result.relativeDateRange = identity(json["relativeDateRange"]);
    result.endDate = identity(json["endDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportCriteriaDateRange value) {
    if (value == null) return null;
    final result = {};
    result["startDate"] = identity(value.startDate);
    result["relativeDateRange"] = identity(value.relativeDateRange);
    result["endDate"] = identity(value.endDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ReportList
class ReportList extends IdentityHash {
  /**
 * Continuation token used to page through reports. To retrieve the next page of results, set the
 * next request's "pageToken" to the value of this field. The page token is only valid for a limited
 * amount of time and should not be persisted.
 */
  core.String nextPageToken;

  /** The reports returned in this response. */
  core.List<Report> items;

  /** Kind of list this is, in this case dfareporting#reportList. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static ReportList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Report.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Report.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportSchedule
class ReportSchedule extends IdentityHash {
  /** Start date of date range for which scheduled reports should be run. */
  core.String startDate;

  /**
 * Enum to define for "MONTHLY" scheduled reports whether reports should be repeated on the same day
 * of the month as "startDate" or the same day of the week of the month. Possible values are: -
 * DAY_OF_MONTH - WEEK_OF_MONTH Example: If 'startDate' is Monday, April 2nd 2012 (2012-04-02),
 * "DAY_OF_MONTH" would run subsequent reports on the 2nd of every Month, and "WEEK_OF_MONTH" would
 * run subsequent reports on the first Monday of the month.
 */
  core.String runsOnDayOfMonth;

  /**
 * Defines every how many days, weeks or months the report should be run. Needs to be set when
 * "repeats" is either "DAILY", "WEEKLY" or "MONTHLY".
 */
  core.int every;

  /** The expiration date when the scheduled report stops running. */
  core.String expirationDate;

  /** Whether the schedule is active or not. Must be set to either true or false. */
  core.bool active;

  /**
 * The interval the report is repeated for, one of: - "DAILY", also requires field "every" to be
 * set. - "WEEKLY", also requires fields "every" and "repeatsOnWeekDays" to be set. -
 * "TWICE_A_MONTH" - "MONTHLY", also requires fields "every" and "runsOnDayOfMonth" to be set. -
 * "QUARTERLY" - "YEARLY"
 */
  core.String repeats;

  /** List of week days "WEEKLY" scheduled reports should run on. */
  core.List<core.String> repeatsOnWeekDays;

  /** Parses an instance from its JSON representation. */
  static ReportSchedule parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportSchedule();
    result.startDate = identity(json["startDate"]);
    result.runsOnDayOfMonth = identity(json["runsOnDayOfMonth"]);
    result.every = identity(json["every"]);
    result.expirationDate = identity(json["expirationDate"]);
    result.active = identity(json["active"]);
    result.repeats = identity(json["repeats"]);
    result.repeatsOnWeekDays = map(identity)(json["repeatsOnWeekDays"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportSchedule value) {
    if (value == null) return null;
    final result = {};
    result["startDate"] = identity(value.startDate);
    result["runsOnDayOfMonth"] = identity(value.runsOnDayOfMonth);
    result["every"] = identity(value.every);
    result["expirationDate"] = identity(value.expirationDate);
    result["active"] = identity(value.active);
    result["repeats"] = identity(value.repeats);
    result["repeatsOnWeekDays"] = map(identity)(value.repeatsOnWeekDays);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SortedDimension
class SortedDimension extends IdentityHash {
  /** Kind of resource this is, in this case dfareporting#sortedDimension. */
  core.String kind;

  /** The name of the dimension. */
  core.String name;

  /** An optional sort order for the dimension column, one of:  
- "ASCENDING" 
- "DESCENDING" */
  core.String sortOrder;

  /** Parses an instance from its JSON representation. */
  static SortedDimension parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SortedDimension();
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.sortOrder = identity(json["sortOrder"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SortedDimension value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["sortOrder"] = identity(value.sortOrder);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UserProfile
class UserProfile extends IdentityHash {
  /** The user name. */
  core.String userName;

  /** Kind of resource this is, in this case dfareporting#userProfile. */
  core.String kind;

  /** The sub account ID this profile belongs to if applicable. */
  core.String subAccountId;

  /** The account name this profile belongs to. */
  core.String accountName;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** The sub account name this profile belongs to if applicable. */
  core.String subAccountName;

  /** The unique ID of the user profile. */
  core.String profileId;

  /** The account ID this profile belongs to. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static UserProfile parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserProfile();
    result.userName = identity(json["userName"]);
    result.kind = identity(json["kind"]);
    result.subAccountId = identity(json["subAccountId"]);
    result.accountName = identity(json["accountName"]);
    result.etag = identity(json["etag"]);
    result.subAccountName = identity(json["subAccountName"]);
    result.profileId = identity(json["profileId"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserProfile value) {
    if (value == null) return null;
    final result = {};
    result["userName"] = identity(value.userName);
    result["kind"] = identity(value.kind);
    result["subAccountId"] = identity(value.subAccountId);
    result["accountName"] = identity(value.accountName);
    result["etag"] = identity(value.etag);
    result["subAccountName"] = identity(value.subAccountName);
    result["profileId"] = identity(value.profileId);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UserProfileList
class UserProfileList extends IdentityHash {
  /** The user profiles returned in this response. */
  core.List<UserProfile> items;

  /** Kind of list this is, in this case dfareporting#userProfileList. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static UserProfileList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserProfileList();
    result.items = map(UserProfile.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserProfileList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(UserProfile.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum DfareportingApi.Alt
class DfareportingApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final DfareportingApiAlt JSON = const DfareportingApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<DfareportingApiAlt> values = const <DfareportingApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <DfareportingApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static DfareportingApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const DfareportingApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

