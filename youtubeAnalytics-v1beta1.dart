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

#library('youtubeAnalytics-v1beta1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API YoutubeAnalyticsApi
/**
 * Retrieve your YouTube Analytics reports.
 */
class YoutubeAnalyticsApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  YoutubeAnalyticsApi get _$service() => this;
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
  YoutubeAnalyticsApiAlt alt;


  YoutubeAnalyticsApi([this.baseUrl = "https://www.googleapis.com/youtube/analytics/v1beta1/", applicationName, this.authenticator]) { 
    _reports = new ReportsResource._internal(this);
    this.applicationName = applicationName
      .replaceAll(const RegExp(@'\s+'), '_')
      .replaceAll(const RegExp(@'[^-_.,0-9a-zA-Z]'), '');
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}youtubeAnalytics/v1beta1/20120710 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View YouTube Analytics reports for your YouTube content */
  static final core.String YT_ANALYTICS_READONLY_SCOPE = "https://www.googleapis.com/auth/yt-analytics.readonly";
}

// Resource .ReportsResource
class ReportsResource extends core.Object {
  final YoutubeAnalyticsApi _$service;
  
  ReportsResource._internal(YoutubeAnalyticsApi $service) : _$service = $service;

  // Method ReportsResource.Query
  /**
   * Retrieve your YouTube Analytics reports.
   *
   *    * [ids] Unique channel or content owner ID for retrieving YouTube Analytics data. Either channel==C or
   *        contentOwner==O where 'C' is the encrypted channel ID and 'O' is the content owner name.
   *    * [startDate] Start date for fetching YouTube Analytics data. All requests should specify a start date formatted
   *        as YYYY-MM-DD.
   *    * [endDate] End date for fetching YouTube Analytics data. All requests should specify an end date formatted as
   *        YYYY-MM-DD.
   *    * [metrics] A comma-separated list of YouTube Analytics metrics. E.g., 'views' or 'likes,dislikes'
   *    * [maxResults] The maximum number of rows to include in the response.

  Minimum: 1.
   *    * [sort] A comma-separated list of dimensions or metrics that determine the sort order for YouTube Analytics
   *        data. By default the sort order is ascending, '-' prefix causes descending sort order.
   *    * [dimensions] A comma-separated list of YouTube Analytics dimensions. E.g., 'video', or 'ageGroup,gender'.
   *    * [startIndex] An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with
   *        the max-results parameter (one-based, inclusive).

  Minimum: 1.
   *    * [filters] A list of dimension filters to be applied to YouTube Analytics data. Multiple filters can be joined
   *        together with the ';' character. The returned result table will satisfy both filters.
   *        E.g., video==dMH0bHeiRNg;country==IT will restrict the returned stats to the given video
   *        and the country Italy.
   */
  core.Future<ResultTable> query(core.String ids, core.String startDate, core.String endDate, core.String metrics, [core.int maxResults = UNSPECIFIED, core.String sort = UNSPECIFIED, core.String dimensions = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String filters = UNSPECIFIED]) {
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
    if (UNSPECIFIED != filters) $queryParams["filters"] = filters;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ResultTable.parse(JSON.parse($text)));
  }
}

// Schema .ResultTable
class ResultTable extends IdentityHash {
  /** Identifier used to mark the structure as a result table. */
  core.String kind;

  /**
 * Contains all rows of the result table. Each row contains an array with the values for the
 * columns. The order matches the order of the column information provided in the "columnHeaders"
 * field. If no data is available for the given query, the "rows" element will be omitted from the
 * response. The response for a query with the day dimension will not contain rows for the most
 * recent days.
 */
  core.List<core.List<core.Object>> rows;

  /**
 * Contains information about the columns returned in the "rows" fields. The order of the elements
 * matches the order of the corresponding columns in "rows" field.
 */
  core.List<ResultTableColumnHeaders> columnHeaders;

  /** Parses an instance from its JSON representation. */
  static ResultTable parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultTable();
    result.kind = identity(json["kind"]);
    result.rows = map(map(identity))(json["rows"]);
    result.columnHeaders = map(ResultTableColumnHeaders.parse)(json["columnHeaders"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultTable value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(map(identity))(value.rows);
    result["columnHeaders"] = map(ResultTableColumnHeaders.serialize)(value.columnHeaders);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ResultTable.ResultTableColumnHeaders
class ResultTableColumnHeaders extends IdentityHash {
  /** Type of the data in the column (STRING, INTEGER, FLOAT). */
  core.String dataType;

  /** The type of the column (DIMENSION, METRIC). */
  core.String columnType;

  /** The name of the dimension or metric. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static ResultTableColumnHeaders parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultTableColumnHeaders();
    result.dataType = identity(json["dataType"]);
    result.columnType = identity(json["columnType"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultTableColumnHeaders value) {
    if (value == null) return null;
    final result = {};
    result["dataType"] = identity(value.dataType);
    result["columnType"] = identity(value.columnType);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum YoutubeAnalyticsApi.Alt
class YoutubeAnalyticsApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of text/csv */
  static final YoutubeAnalyticsApiAlt CSV = const YoutubeAnalyticsApiAlt._internal("csv", 0);
  /** Responses with Content-Type of application/json */
  static final YoutubeAnalyticsApiAlt JSON = const YoutubeAnalyticsApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final core.List<YoutubeAnalyticsApiAlt> values = const <YoutubeAnalyticsApiAlt>[
    CSV,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <YoutubeAnalyticsApiAlt>{ 
    "csv": CSV,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static YoutubeAnalyticsApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const YoutubeAnalyticsApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

