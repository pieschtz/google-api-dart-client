#library("analytics");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AnalyticsApi
/**
 * View and manage your Google Analytics data
 */
class AnalyticsApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  AnalyticsApi get _$service() => this;
  ManagementResource _management;
  ManagementResource get management() => _management;
  DataResource _data;
  DataResource get data() => _data;
  
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
  AnalyticsApiAlt alt;


  AnalyticsApi([this.baseUrl = "https://www.googleapis.com/analytics/v3/", this.applicationName]) { 
    _management = new ManagementResource._internal(this);
    _data = new DataResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}analytics/v3/20120602 google-api-dart-client/${clientVersion}";
  }
}

// Resource .ManagementResource
class ManagementResource {
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
class ManagementWebpropertiesResourceResource {
  final AnalyticsApi _$service;
  
  ManagementWebpropertiesResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementWebpropertiesResourceResource.List
  /**
   * Lists web properties to which the user has access.
   * [accountId] Account ID to retrieve web properties for. Can either be a specific account ID or '~all', which
   *        refers to all the accounts that user has access to.
   */
  Future<Webproperties> list(String accountId, [int maxResults = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "management/accounts/{accountId}/webproperties").generate($pathParams, $queryParams);
    final $completer = new Completer<Webproperties>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Webproperties.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource ManagementResource.ManagementSegmentsResourceResource
class ManagementSegmentsResourceResource {
  final AnalyticsApi _$service;
  
  ManagementSegmentsResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementSegmentsResourceResource.List
  /**
   * Lists advanced segments to which the user has access.
   */
  Future<Segments> list([int maxResults = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "management/segments").generate($pathParams, $queryParams);
    final $completer = new Completer<Segments>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Segments.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource ManagementResource.ManagementAccountsResourceResource
class ManagementAccountsResourceResource {
  final AnalyticsApi _$service;
  
  ManagementAccountsResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementAccountsResourceResource.List
  /**
   * Lists all accounts to which the user has access.
   */
  Future<Accounts> list([int maxResults = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "management/accounts").generate($pathParams, $queryParams);
    final $completer = new Completer<Accounts>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Accounts.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource ManagementResource.ManagementGoalsResourceResource
class ManagementGoalsResourceResource {
  final AnalyticsApi _$service;
  
  ManagementGoalsResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementGoalsResourceResource.List
  /**
   * Lists goals to which the user has access.
   * [accountId] Account ID to retrieve goals for. Can either be a specific account ID or '~all', which refers to all
   *        the accounts that user has access to.
   * [webPropertyId] Web property ID to retrieve goals for. Can either be a specific web property ID or '~all', which
   *        refers to all the web properties that user has access to.
   * [profileId] Profile ID to retrieve goals for. Can either be a specific profile ID or '~all', which refers to all
   *        the profiles that user has access to.
   */
  Future<Goals> list(String accountId, String webPropertyId, String profileId, [int maxResults = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals").generate($pathParams, $queryParams);
    final $completer = new Completer<Goals>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Goals.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource ManagementResource.ManagementProfilesResourceResource
class ManagementProfilesResourceResource {
  final AnalyticsApi _$service;
  
  ManagementProfilesResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method ManagementResource.ManagementProfilesResourceResource.List
  /**
   * Lists profiles to which the user has access.
   * [accountId] Account ID for the profiles to retrieve. Can either be a specific account ID or '~all', which refers
   *        to all the accounts to which the user has access.
   * [webPropertyId] Web property ID for the profiles to retrieve. Can either be a specific web property ID or '~all',
   *        which refers to all the web properties to which the user has access.
   */
  Future<Profiles> list(String accountId, String webPropertyId, [int maxResults = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles").generate($pathParams, $queryParams);
    final $completer = new Completer<Profiles>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Profiles.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .DataResource
class DataResource {
  final AnalyticsApi _$service;
  final DataGaResourceResource ga;
  
  DataResource._internal(AnalyticsApi $service) : _$service = $service,
    ga = new DataGaResourceResource._internal($service);
}


// Resource DataResource.DataGaResourceResource
class DataGaResourceResource {
  final AnalyticsApi _$service;
  
  DataGaResourceResource._internal(AnalyticsApi $service) : _$service = $service;

  // Method DataResource.DataGaResourceResource.Get
  /**
   * Returns Analytics data for a profile.
   * [ids] Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX, where XXXX is the
   *        Analytics profile ID.
   * [startDate] Start date for fetching Analytics data. All requests should specify a start date formatted as YYYY-
   *        MM-DD.
   * [endDate] End date for fetching Analytics data. All requests should specify an end date formatted as YYYY-MM-
   *        DD.
   * [metrics] A comma-separated list of Analytics metrics. E.g., 'ga:visits,ga:pageviews'. At least one metric
   *        must be specified.
   */
  Future<GaData> get(String ids, String startDate, String endDate, String metrics, [int maxResults = UNSPECIFIED, String sort = UNSPECIFIED, String dimensions = UNSPECIFIED, int startIndex = UNSPECIFIED, String segment = UNSPECIFIED, String filters = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "data/ga").generate($pathParams, $queryParams);
    final $completer = new Completer<GaData>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = GaData.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .Account
class Account extends IdentityHash {
  /** Resource type for Analytics account. */
  String kind;

  /** Account name. */
  String name;

  /** Time the account was created. */
  String created;

  /** Time the account was last modified. */
  String updated;

  /** Child link for an account entry. Points to the list of web properties for this account. */
  AccountChildLink childLink;

  /** Account ID. */
  String id;

  /** Link for this account. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Account parse(Map<String, Object> json) {
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
  static Object serialize(Account value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String href;

  /** Type of the child link. Its value is "analytics#webproperties". */
  String type;

  /** Parses an instance from its JSON representation. */
  static AccountChildLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AccountChildLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AccountChildLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Accounts
class Accounts extends IdentityHash {
  /** Email ID of the authenticated user */
  String username;

  /** Collection type. */
  String kind;

  /** A list of accounts. */
  List<Account> items;

  /**
 * The maximum number of entries the response can contain, regardless of the actual number of
 * entries returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or otherwise
 * specified by the max-results query parameter.
 */
  int itemsPerPage;

  /** Previous link for this account collection. */
  String previousLink;

  /**
 * The starting index of the entries, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  int startIndex;

  /** Next link for this account collection. */
  String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  int totalResults;

  /** Parses an instance from its JSON representation. */
  static Accounts parse(Map<String, Object> json) {
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
  static Object serialize(Accounts value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /**
 * Analytics data rows, where each row contains a list of dimension values followed by the metric
 * values. The order of dimensions and metrics is same as specified in the request.
 */
  List<List<String>> rows;

  /** Determines if Analytics data contains samples. */
  bool containsSampledData;

  /** The total number of rows for the query, regardless of the number of rows in the response. */
  int totalResults;

  /**
 * The maximum number of rows the response can contain, regardless of the actual number of rows
 * returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or otherwise
 * specified by the max-results query parameter.
 */
  int itemsPerPage;

  /**
 * Total values for the requested metrics over all the results, not just the results returned in
 * this response. The order of the metric totals is same as the metric order specified in the
 * request.
 */
  Map<String, String> totalsForAllResults;

  /** Link to next page for this Analytics data query. */
  String nextLink;

  /** Unique ID for this data response. */
  String id;

  /** Analytics data request query parameters. */
  GaDataQuery query;

  /** Link to previous page for this Analytics data query. */
  String previousLink;

  /** Information for the profile, for which the Analytics data was requested. */
  GaDataProfileInfo profileInfo;

  /**
 * Column headers that list dimension names followed by the metric names. The order of dimensions
 * and metrics is same as specified in the request.
 */
  List<GaDataColumnHeaders> columnHeaders;

  /** Link to this page. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static GaData parse(Map<String, Object> json) {
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
  static Object serialize(GaData value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String dataType;

  /** Column Type. Either DIMENSION or METRIC. */
  String columnType;

  /** Column name. */
  String name;

  /** Parses an instance from its JSON representation. */
  static GaDataColumnHeaders parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GaDataColumnHeaders();
    result.dataType = identity(json["dataType"]);
    result.columnType = identity(json["columnType"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GaDataColumnHeaders value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String webPropertyId;

  /** Internal ID for the web property to which this profile belongs. */
  String internalWebPropertyId;

  /** Table ID for profile. */
  String tableId;

  /** Profile ID. */
  String profileId;

  /** Profile name. */
  String profileName;

  /** Account ID to which this profile belongs. */
  String accountId;

  /** Parses an instance from its JSON representation. */
  static GaDataProfileInfo parse(Map<String, Object> json) {
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
  static Object serialize(GaDataProfileInfo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  int maxResults;

  /** List of dimensions or metrics based on which Analytics data is sorted. */
  List<String> sort;

  /** List of analytics dimensions. */
  String dimensions;

  /** Start date. */
  String startDate;

  /** Start index. */
  int startIndex;

  /** Analytics advanced segment. */
  String segment;

  /** Unique table ID. */
  String ids;

  /** List of analytics metrics. */
  List<String> metrics;

  /** Comma-separated list of dimension or metric filters. */
  String filters;

  /** End date. */
  String endDate;

  /** Parses an instance from its JSON representation. */
  static GaDataQuery parse(Map<String, Object> json) {
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
  static Object serialize(GaDataQuery value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** Details for the goal of the type VISIT_TIME_ON_SITE. */
  GoalVisitTimeOnSiteDetails visitTimeOnSiteDetails;

  /** Goal name. */
  String name;

  /** Time this goal was created. */
  String created;

  /** Details for the goal of the type URL_DESTINATION. */
  GoalUrlDestinationDetails urlDestinationDetails;

  /** Time this goal was last modified. */
  String updated;

  /** Goal value. */
  double value;

  /** Details for the goal of the type VISIT_NUM_PAGES. */
  GoalVisitNumPagesDetails visitNumPagesDetails;

  /** Internal ID for the web property to which this goal belongs. */
  String internalWebPropertyId;

  /** Details for the goal of the type EVENT. */
  GoalEventDetails eventDetails;

  /** Web property ID to which this goal belongs. The web property ID is of the form UA-XXXXX-YY. */
  String webPropertyId;

  /** Determines whether this goal is active. */
  bool active;

  /** Profile ID to which this goal belongs. */
  String profileId;

  /** Parent link for a goal. Points to the profile to which this goal belongs. */
  GoalParentLink parentLink;

  /**
 * Goal type. Possible values are URL_DESTINATION, VISIT_TIME_ON_SITE, VISIT_NUM_PAGES, AND EVENT.
 */
  String type;

  /** Goal ID. */
  String id;

  /** Link for this goal. */
  String selfLink;

  /** Account ID to which this goal belongs. */
  String accountId;

  /** Parses an instance from its JSON representation. */
  static Goal parse(Map<String, Object> json) {
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
  static Object serialize(Goal value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<GoalEventDetailsEventConditions> eventConditions;

  /** Determines if the event value should be used as the value for this goal. */
  bool useEventValue;

  /** Parses an instance from its JSON representation. */
  static GoalEventDetails parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GoalEventDetails();
    result.eventConditions = map(GoalEventDetailsEventConditions.parse)(json["eventConditions"]);
    result.useEventValue = identity(json["useEventValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GoalEventDetails value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["eventConditions"] = map(GoalEventDetailsEventConditions.serialize)(value.eventConditions);
    result["useEventValue"] = identity(value.useEventValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalEventDetails.GoalEventDetailsEventConditions
class GoalEventDetailsEventConditions extends IdentityHash {
  /** Type of this event condition. Possible values are CATEGORY, ACTION, LABEL, or VALUE. */
  String type;

  /** Type of the match to be performed. Possible values are REGEXP, BEGINS_WITH, or EXACT. */
  String matchType;

  /** Expression used for this match. */
  String expression;

  /** Type of comparison. Possible values are LESS_THAN, GREATER_THAN or EQUAL. */
  String comparisonType;

  /** Value used for this comparison. */
  String comparisonValue;

  /** Parses an instance from its JSON representation. */
  static GoalEventDetailsEventConditions parse(Map<String, Object> json) {
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
  static Object serialize(GoalEventDetailsEventConditions value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String href;

  /** Value is "analytics#profile". */
  String type;

  /** Parses an instance from its JSON representation. */
  static GoalParentLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GoalParentLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GoalParentLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalUrlDestinationDetails
class GoalUrlDestinationDetails extends IdentityHash {
  /** URL for this goal. */
  String url;

  /** Determines if the goal URL must exactly match the capitalization of visited URLs. */
  bool caseSensitive;

  /** Match type for the goal URL. Possible values are HEAD, EXACT, or REGEX. */
  String matchType;

  /** List of steps configured for this goal funnel. */
  List<GoalUrlDestinationDetailsSteps> steps;

  /** Determines if the first step in this goal is required. */
  bool firstStepRequired;

  /** Parses an instance from its JSON representation. */
  static GoalUrlDestinationDetails parse(Map<String, Object> json) {
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
  static Object serialize(GoalUrlDestinationDetails value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String url;

  /** Step name. */
  String name;

  /** Step number. */
  int number;

  /** Parses an instance from its JSON representation. */
  static GoalUrlDestinationDetailsSteps parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GoalUrlDestinationDetailsSteps();
    result.url = identity(json["url"]);
    result.name = identity(json["name"]);
    result.number = identity(json["number"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GoalUrlDestinationDetailsSteps value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String comparisonType;

  /** Value used for this comparison. */
  String comparisonValue;

  /** Parses an instance from its JSON representation. */
  static GoalVisitNumPagesDetails parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GoalVisitNumPagesDetails();
    result.comparisonType = identity(json["comparisonType"]);
    result.comparisonValue = identity(json["comparisonValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GoalVisitNumPagesDetails value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["comparisonType"] = identity(value.comparisonType);
    result["comparisonValue"] = identity(value.comparisonValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Goal.GoalVisitTimeOnSiteDetails
class GoalVisitTimeOnSiteDetails extends IdentityHash {
  /** Type of comparison. Possible values are LESS_THAN or GREATER_THAN. */
  String comparisonType;

  /** Value used for this comparison. */
  String comparisonValue;

  /** Parses an instance from its JSON representation. */
  static GoalVisitTimeOnSiteDetails parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GoalVisitTimeOnSiteDetails();
    result.comparisonType = identity(json["comparisonType"]);
    result.comparisonValue = identity(json["comparisonValue"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GoalVisitTimeOnSiteDetails value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["comparisonType"] = identity(value.comparisonType);
    result["comparisonValue"] = identity(value.comparisonValue);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Goals
class Goals extends IdentityHash {
  /** Email ID of the authenticated user */
  String username;

  /** Collection type. */
  String kind;

  /** A list of goals. */
  List<Goal> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  int itemsPerPage;

  /** Link to previous page for this goal collection. */
  String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  int startIndex;

  /** Link to next page for this goal collection. */
  String nextLink;

  /**
 * The total number of results for the query, regardless of the number of resources in the result.
 */
  int totalResults;

  /** Parses an instance from its JSON representation. */
  static Goals parse(Map<String, Object> json) {
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
  static Object serialize(Goals value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String defaultPage;

  /** Resource type for Analytics profile. */
  String kind;

  /** The query parameters that are excluded from this profile. */
  String excludeQueryParameters;

  /** Name of this profile. */
  String name;

  /** Time this profile was created. */
  String created;

  /** Web property ID of the form UA-XXXXX-YY to which this profile belongs. */
  String webPropertyId;

  /** Time this profile was last modified. */
  String updated;

  /** The site search query parameters for this profile. */
  String siteSearchQueryParameters;

  /** The currency type associated with this profile. */
  String currency;

  /** Internal ID for the web property to which this profile belongs. */
  String internalWebPropertyId;

  /** Child link for this profile. Points to the list of goals for this profile. */
  ProfileChildLink childLink;

  /** Time zone for which this profile has been configured. */
  String timezone;

  /** Site search category parameters for this profile. */
  String siteSearchCategoryParameters;

  /** Parent link for this profile. Points to the web property to which this profile belongs. */
  ProfileParentLink parentLink;

  /** Profile ID. */
  String id;

  /** Link for this profile. */
  String selfLink;

  /** Account ID to which this profile belongs. */
  String accountId;

  /** Parses an instance from its JSON representation. */
  static Profile parse(Map<String, Object> json) {
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
  static Object serialize(Profile value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String href;

  /** Value is "analytics#goals". */
  String type;

  /** Parses an instance from its JSON representation. */
  static ProfileChildLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProfileChildLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProfileChildLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileParentLink
class ProfileParentLink extends IdentityHash {
  /** Link to the web property to which this profile belongs. */
  String href;

  /** Value is "analytics#webproperty". */
  String type;

  /** Parses an instance from its JSON representation. */
  static ProfileParentLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProfileParentLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProfileParentLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Profiles
class Profiles extends IdentityHash {
  /** Email ID of the authenticated user */
  String username;

  /** Collection type. */
  String kind;

  /** A list of profiles. */
  List<Profile> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  int itemsPerPage;

  /** Link to previous page for this profile collection. */
  String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  int startIndex;

  /** Link to next page for this profile collection. */
  String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  int totalResults;

  /** Parses an instance from its JSON representation. */
  static Profiles parse(Map<String, Object> json) {
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
  static Object serialize(Profiles value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String definition;

  /** Resource type for Analytics advanced segment. */
  String kind;

  /** Segment ID. Can be used with the 'segment' parameter in Data Feed. */
  String segmentId;

  /** Time the advanced segment was created. */
  String created;

  /** Time the advanced segment was last modified. */
  String updated;

  /** Advanced segment ID. */
  String id;

  /** Link for this advanced segment. */
  String selfLink;

  /** Advanced segment name. */
  String name;

  /** Parses an instance from its JSON representation. */
  static Segment parse(Map<String, Object> json) {
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
  static Object serialize(Segment value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String username;

  /** Collection type for advanced segments. */
  String kind;

  /** A list of advanced segments. */
  List<Segment> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  int itemsPerPage;

  /** Link to previous page for this advanced segment collection. */
  String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  int startIndex;

  /** Link to next page for this advanced segment collection. */
  String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  int totalResults;

  /** Parses an instance from its JSON representation. */
  static Segments parse(Map<String, Object> json) {
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
  static Object serialize(Segments value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String username;

  /** Collection type. */
  String kind;

  /** A list of web properties. */
  List<Webproperty> items;

  /**
 * The maximum number of resources the response can contain, regardless of the actual number of
 * resources returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or
 * otherwise specified by the max-results query parameter.
 */
  int itemsPerPage;

  /** Link to previous page for this web property collection. */
  String previousLink;

  /**
 * The starting index of the resources, which is 1 by default or otherwise specified by the start-
 * index query parameter.
 */
  int startIndex;

  /** Link to next page for this web property collection. */
  String nextLink;

  /**
 * The total number of results for the query, regardless of the number of results in the response.
 */
  int totalResults;

  /** Parses an instance from its JSON representation. */
  static Webproperties parse(Map<String, Object> json) {
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
  static Object serialize(Webproperties value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** Name of this web property. */
  String name;

  /** Time this web property was created. */
  String created;

  /** Time this web property was last modified. */
  String updated;

  /** Website url for this web property. */
  String websiteUrl;

  /** Internal ID for this web property. */
  String internalWebPropertyId;

  /** Child link for this web property. Points to the list of profiles for this web property. */
  WebpropertyChildLink childLink;

  /** Parent link for this web property. Points to the account to which this web property belongs. */
  WebpropertyParentLink parentLink;

  /** Web property ID of the form UA-XXXXX-YY. */
  String id;

  /** Link for this web property. */
  String selfLink;

  /** Account ID to which this web property belongs. */
  String accountId;

  /** Parses an instance from its JSON representation. */
  static Webproperty parse(Map<String, Object> json) {
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
  static Object serialize(Webproperty value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String href;

  /** Type of the parent link. Its value is "analytics#profiles". */
  String type;

  /** Parses an instance from its JSON representation. */
  static WebpropertyChildLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new WebpropertyChildLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(WebpropertyChildLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Webproperty.WebpropertyParentLink
class WebpropertyParentLink extends IdentityHash {
  /** Link to the account for this web property. */
  String href;

  /** Type of the parent link. Its value is "analytics#account". */
  String type;

  /** Parses an instance from its JSON representation. */
  static WebpropertyParentLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new WebpropertyParentLink();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(WebpropertyParentLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AnalyticsApi.Alt
class AnalyticsApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final AnalyticsApiAlt JSON = const AnalyticsApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<AnalyticsApiAlt> values = const <AnalyticsApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AnalyticsApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AnalyticsApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const AnalyticsApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

