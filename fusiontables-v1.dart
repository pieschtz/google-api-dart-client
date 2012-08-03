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

#library('fusiontables-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API FusiontablesApi
/**
 * API for working with Fusion Tables data.
 */
class FusiontablesApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  FusiontablesApi get _$service() => this;
  ColumnResource _column;
  ColumnResource get column() => _column;
  QueryResource _query;
  QueryResource get query() => _query;
  StyleResource _style;
  StyleResource get style() => _style;
  TemplateResource _template;
  TemplateResource get template() => _template;
  TableResource _table;
  TableResource get table() => _table;
  
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
  FusiontablesApiAlt alt;


  FusiontablesApi([this.baseUrl = "https://www.googleapis.com/fusiontables/v1/", applicationName, this.authenticator]) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _column = new ColumnResource._internal(this);
    _query = new QueryResource._internal(this);
    _style = new StyleResource._internal(this);
    _template = new TemplateResource._internal(this);
    _table = new TableResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}fusiontables/v1/20120726 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your Fusion Tables */
  static final core.String FUSIONTABLES_SCOPE = "https://www.googleapis.com/auth/fusiontables";

  /** OAuth2 scope: View your Fusion Tables */
  static final core.String FUSIONTABLES_READONLY_SCOPE = "https://www.googleapis.com/auth/fusiontables.readonly";
}

// Resource .ColumnResource
class ColumnResource extends core.Object {
  final FusiontablesApi _$service;
  
  ColumnResource._internal(FusiontablesApi $service) : _$service = $service;

  // Method ColumnResource.Insert
  /**
   * Adds a new column to the table.
   *
   *    * [content] the Column
   *    * [tableId] Table for which a new column is being added.
   */
  core.Future<Column> insert(core.String tableId, Column content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Column.serialize(content));
    final $path = "tables/{tableId}/columns";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Column.parse(JSON.parse($text)));
  }

  // Method ColumnResource.Get
  /**
   * Retrieves a specific column by its id.
   *
   *    * [tableId] Table to which the column belongs.
   *    * [columnId] Name or identifier for the column that is being requested.
   */
  core.Future<Column> get(core.String tableId, core.String columnId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["columnId"] = columnId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}/columns/{columnId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Column.parse(JSON.parse($text)));
  }

  // Method ColumnResource.List
  /**
   * Retrieves a list of columns.
   *
   *    * [tableId] Table whose columns are being listed.
   *    * [pageToken] Continuation token specifying which result page to return. Optional.
   *    * [maxResults] Maximum number of columns to return. Optional. Default is 5.

  Minimum: 0.
   */
  core.Future<ColumnList> list(core.String tableId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
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
    final $path = "tables/{tableId}/columns";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ColumnList.parse(JSON.parse($text)));
  }

  // Method ColumnResource.Update
  /**
   * Updates the name or type of an existing column.
   *
   *    * [content] the Column
   *    * [tableId] Table for which the column is being updated.
   *    * [columnId] Name or identifier for the column that is being updated.
   */
  core.Future<Column> update(core.String tableId, core.String columnId, Column content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["columnId"] = columnId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Column.serialize(content));
    final $path = "tables/{tableId}/columns/{columnId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Column.parse(JSON.parse($text)));
  }

  // Method ColumnResource.Patch
  /**
   * Updates the name or type of an existing column. This method supports patch semantics.
   *
   *    * [content] the Column
   *    * [tableId] Table for which the column is being updated.
   *    * [columnId] Name or identifier for the column that is being updated.
   */
  core.Future<Column> patch(core.String tableId, core.String columnId, Column content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["columnId"] = columnId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Column.serialize(content));
    final $path = "tables/{tableId}/columns/{columnId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Column.parse(JSON.parse($text)));
  }

  // Method ColumnResource.Delete
  /**
   * Deletes the column.
   *
   *    * [tableId] Table from which the column is being deleted.
   *    * [columnId] Name or identifier for the column being deleted.
   */
  core.Future delete(core.String tableId, core.String columnId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["columnId"] = columnId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}/columns/{columnId}";
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

// Resource .QueryResource
class QueryResource extends core.Object {
  final FusiontablesApi _$service;
  
  QueryResource._internal(FusiontablesApi $service) : _$service = $service;

  // Method QueryResource.SqlGet
  /**
   * Executes an SQL SELECT/SHOW/DESCRIBE statement.
   *
   *    * [sql] An SQL SELECT/SHOW/DESCRIBE statement.
   *    * [typed] Should typed values be returned in the (JSON) response -- numbers for numeric values and parsed
   *        geometries for KML values? Default is true.
   *    * [hdrs] Should column names be included (in the first row)?. Default is true.
   */
  core.Future<Sqlresponse> sqlGet(core.String sql, [core.bool typed = UNSPECIFIED, core.bool hdrs = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["sql"] = sql;
    if (UNSPECIFIED != typed) $queryParams["typed"] = typed;
    if (UNSPECIFIED != hdrs) $queryParams["hdrs"] = hdrs;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "query";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Sqlresponse.parse(JSON.parse($text)));
  }

  // Method QueryResource.Sql
  /**
   * Executes an SQL SELECT/INSERT/UPDATE/DELETE/SHOW/DESCRIBE statement.
   *
   *    * [sql] An SQL SELECT/SHOW/DESCRIBE/INSERT/UPDATE/DELETE statement.
   *    * [typed] Should typed values be returned in the (JSON) response -- numbers for numeric values and parsed
   *        geometries for KML values? Default is true.
   *    * [hdrs] Should column names be included (in the first row)?. Default is true.
   */
  core.Future<Sqlresponse> sql(core.String sql, [core.bool typed = UNSPECIFIED, core.bool hdrs = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["sql"] = sql;
    if (UNSPECIFIED != typed) $queryParams["typed"] = typed;
    if (UNSPECIFIED != hdrs) $queryParams["hdrs"] = hdrs;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "query";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Sqlresponse.parse(JSON.parse($text)));
  }
}

// Resource .StyleResource
class StyleResource extends core.Object {
  final FusiontablesApi _$service;
  
  StyleResource._internal(FusiontablesApi $service) : _$service = $service;

  // Method StyleResource.Insert
  /**
   * Adds a new style for the table.
   *
   *    * [content] the StyleSetting
   *    * [tableId] Table for which a new style is being added
   */
  core.Future<StyleSetting> insert(core.String tableId, StyleSetting content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(StyleSetting.serialize(content));
    final $path = "tables/{tableId}/styles";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => StyleSetting.parse(JSON.parse($text)));
  }

  // Method StyleResource.Get
  /**
   * Gets a specific style.
   *
   *    * [tableId] Table to which the requested style belongs
   *    * [styleId] Identifier (integer) for a specific style in a table
   */
  core.Future<StyleSetting> get(core.String tableId, core.int styleId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["styleId"] = styleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}/styles/{styleId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => StyleSetting.parse(JSON.parse($text)));
  }

  // Method StyleResource.List
  /**
   * Retrieves a list of styles.
   *
   *    * [tableId] Table whose styles are being listed
   *    * [pageToken] Continuation token specifying which result page to return. Optional.
   *    * [maxResults] Maximum number of styles to return. Optional. Default is 5.

  Minimum: 0.
   */
  core.Future<StyleSettingList> list(core.String tableId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
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
    final $path = "tables/{tableId}/styles";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => StyleSettingList.parse(JSON.parse($text)));
  }

  // Method StyleResource.Update
  /**
   * Updates an existing style.
   *
   *    * [content] the StyleSetting
   *    * [tableId] Table whose style is being updated.
   *    * [styleId] Identifier (within a table) for the style being updated.
   */
  core.Future<StyleSetting> update(core.String tableId, core.int styleId, StyleSetting content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["styleId"] = styleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(StyleSetting.serialize(content));
    final $path = "tables/{tableId}/styles/{styleId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => StyleSetting.parse(JSON.parse($text)));
  }

  // Method StyleResource.Patch
  /**
   * Updates an existing style. This method supports patch semantics.
   *
   *    * [content] the StyleSetting
   *    * [tableId] Table whose style is being updated.
   *    * [styleId] Identifier (within a table) for the style being updated.
   */
  core.Future<StyleSetting> patch(core.String tableId, core.int styleId, StyleSetting content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["styleId"] = styleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(StyleSetting.serialize(content));
    final $path = "tables/{tableId}/styles/{styleId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => StyleSetting.parse(JSON.parse($text)));
  }

  // Method StyleResource.Delete
  /**
   * Deletes a style.
   *
   *    * [tableId] Table from which the style is being deleted
   *    * [styleId] Identifier (within a table) for the style being deleted
   */
  core.Future delete(core.String tableId, core.int styleId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["styleId"] = styleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}/styles/{styleId}";
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

// Resource .TemplateResource
class TemplateResource extends core.Object {
  final FusiontablesApi _$service;
  
  TemplateResource._internal(FusiontablesApi $service) : _$service = $service;

  // Method TemplateResource.Insert
  /**
   * Creates a new template for the table.
   *
   *    * [content] the Template
   *    * [tableId] Table for which a new template is being created
   */
  core.Future<Template> insert(core.String tableId, Template content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Template.serialize(content));
    final $path = "tables/{tableId}/templates";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Template.parse(JSON.parse($text)));
  }

  // Method TemplateResource.Get
  /**
   * Retrieves a specific template by its id
   *
   *    * [tableId] Table to which the template belongs
   *    * [templateId] Identifier for the template that is being requested
   */
  core.Future<Template> get(core.String tableId, core.int templateId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["templateId"] = templateId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}/templates/{templateId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Template.parse(JSON.parse($text)));
  }

  // Method TemplateResource.List
  /**
   * Retrieves a list of templates.
   *
   *    * [tableId] Identifier for the table whose templates are being requested
   *    * [pageToken] Continuation token specifying which results page to return. Optional.
   *    * [maxResults] Maximum number of templates to return. Optional. Default is 5.

  Minimum: 0.
   */
  core.Future<TemplateList> list(core.String tableId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
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
    final $path = "tables/{tableId}/templates";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => TemplateList.parse(JSON.parse($text)));
  }

  // Method TemplateResource.Update
  /**
   * Updates an existing template
   *
   *    * [content] the Template
   *    * [tableId] Table to which the updated template belongs
   *    * [templateId] Identifier for the template that is being updated
   */
  core.Future<Template> update(core.String tableId, core.int templateId, Template content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["templateId"] = templateId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Template.serialize(content));
    final $path = "tables/{tableId}/templates/{templateId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Template.parse(JSON.parse($text)));
  }

  // Method TemplateResource.Patch
  /**
   * Updates an existing template. This method supports patch semantics.
   *
   *    * [content] the Template
   *    * [tableId] Table to which the updated template belongs
   *    * [templateId] Identifier for the template that is being updated
   */
  core.Future<Template> patch(core.String tableId, core.int templateId, Template content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["templateId"] = templateId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Template.serialize(content));
    final $path = "tables/{tableId}/templates/{templateId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Template.parse(JSON.parse($text)));
  }

  // Method TemplateResource.Delete
  /**
   * Deletes a template
   *
   *    * [tableId] Table from which the template is being deleted
   *    * [templateId] Identifier for the template which is being deleted
   */
  core.Future delete(core.String tableId, core.int templateId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    $pathParams["templateId"] = templateId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}/templates/{templateId}";
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

// Resource .TableResource
class TableResource extends core.Object {
  final FusiontablesApi _$service;
  
  TableResource._internal(FusiontablesApi $service) : _$service = $service;

  // Method TableResource.Insert
  /**
   * Creates a new table.
   *
   *    * [content] the Table
   */
  core.Future<Table> insert(Table content) {
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
    final $body = JSON.stringify(Table.serialize(content));
    final $path = "tables";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Table.parse(JSON.parse($text)));
  }

  // Method TableResource.Get
  /**
   * Retrieves a specific table by its id.
   *
   *    * [tableId] Identifier(ID) for the table being requested.
   */
  core.Future<Table> get(core.String tableId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Table.parse(JSON.parse($text)));
  }

  // Method TableResource.List
  /**
   * Retrieves a list of tables a user owns.
   *
   *    * [pageToken] Continuation token specifying which result page to return. Optional.
   *    * [maxResults] Maximum number of styles to return. Optional. Default is 5.

  Minimum: 0.
   */
  core.Future<TableList> list([core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
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
    final $path = "tables";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => TableList.parse(JSON.parse($text)));
  }

  // Method TableResource.Update
  /**
   * Updates an existing table. Unless explicitly requested, only the name, description, and
   * attribution will be updated.
   *
   *    * [content] the Table
   *    * [tableId] Id of the table that is being updated.
   *    * [replaceViewDefinition] Should the view definition also be updated? The specified view definition replaces the existing one.
   *        Only a view can be updated with a new definition.
   */
  core.Future<Table> update(core.String tableId, Table content, [core.bool replaceViewDefinition = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (UNSPECIFIED != replaceViewDefinition) $queryParams["replaceViewDefinition"] = replaceViewDefinition;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Table.serialize(content));
    final $path = "tables/{tableId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Table.parse(JSON.parse($text)));
  }

  // Method TableResource.Patch
  /**
   * Updates an existing table. Unless explicitly requested, only the name, description, and
   * attribution will be updated. This method supports patch semantics.
   *
   *    * [content] the Table
   *    * [tableId] Id of the table that is being updated.
   *    * [replaceViewDefinition] Should the view definition also be updated? The specified view definition replaces the existing one.
   *        Only a view can be updated with a new definition.
   */
  core.Future<Table> patch(core.String tableId, Table content, [core.bool replaceViewDefinition = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (UNSPECIFIED != replaceViewDefinition) $queryParams["replaceViewDefinition"] = replaceViewDefinition;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Table.serialize(content));
    final $path = "tables/{tableId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Table.parse(JSON.parse($text)));
  }

  // Method TableResource.Delete
  /**
   * Deletes a table.
   *
   *    * [tableId] Id of the table that is being deleted.
   */
  core.Future delete(core.String tableId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "tables/{tableId}";
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

// Schema .Bucket
class Bucket extends IdentityHash {
  /** Opacity of the color: 0.0 (transparent) to 1.0 (opaque). */
  core.double opacity;

  /** Width of a line (in pixels). */
  core.int weight;

  /**
 * Minimum value in the selected column for a row to be styled according to the bucket color,
 * opacity, icon, or weight.
 */
  core.double min;

  /** Color of line or the interior of a polygon in #RRGGBB format. */
  core.String color;

  /**
 * Maximum value in the selected column for a row to be styled according to the bucket color,
 * opacity, icon, or weight.
 */
  core.double max;

  /** Icon name used for a point. */
  core.String icon;

  /** Parses an instance from its JSON representation. */
  static Bucket parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Bucket();
    result.opacity = identity(json["opacity"]);
    result.weight = identity(json["weight"]);
    result.min = identity(json["min"]);
    result.color = identity(json["color"]);
    result.max = identity(json["max"]);
    result.icon = identity(json["icon"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Bucket value) {
    if (value == null) return null;
    final result = {};
    result["opacity"] = identity(value.opacity);
    result["weight"] = identity(value.weight);
    result["min"] = identity(value.min);
    result["color"] = identity(value.color);
    result["max"] = identity(value.max);
    result["icon"] = identity(value.icon);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Column
class Column extends IdentityHash {
  /** Type name: a template for an individual column. */
  core.String kind;

  /** Required type of the column. */
  core.String type;

  /** Identifier for the column. */
  core.int columnId;

  /** Required name of the column. */
  core.String name;

  /**
 * Optional identifier of the base column. If present, this column is derived from the specified
 * base column.
 */
  ColumnBaseColumn baseColumn;

  /** Parses an instance from its JSON representation. */
  static Column parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Column();
    result.kind = identity(json["kind"]);
    result.type = identity(json["type"]);
    result.columnId = identity(json["columnId"]);
    result.name = identity(json["name"]);
    result.baseColumn = ColumnBaseColumn.parse(json["baseColumn"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Column value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["type"] = identity(value.type);
    result["columnId"] = identity(value.columnId);
    result["name"] = identity(value.name);
    result["baseColumn"] = ColumnBaseColumn.serialize(value.baseColumn);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Column.ColumnBaseColumn
class ColumnBaseColumn extends IdentityHash {
  /** Offset to the entry in the list of base tables in the table definition. */
  core.int tableIndex;

  /** The id of the column in the base table from which this column is derived. */
  core.int columnId;

  /** Parses an instance from its JSON representation. */
  static ColumnBaseColumn parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ColumnBaseColumn();
    result.tableIndex = identity(json["tableIndex"]);
    result.columnId = identity(json["columnId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ColumnBaseColumn value) {
    if (value == null) return null;
    final result = {};
    result["tableIndex"] = identity(value.tableIndex);
    result["columnId"] = identity(value.columnId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ColumnList
class ColumnList extends IdentityHash {
  /**
 * Token used to access the next page of this result. No token is displayed if there are no more
 * tokens left.
 */
  core.String nextPageToken;

  /** List of all requested columns. */
  core.List<Column> items;

  /** Type name: a list of all tables. */
  core.String kind;

  /** Total number of columns for the table. */
  core.int totalItems;

  /** Parses an instance from its JSON representation. */
  static ColumnList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ColumnList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Column.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ColumnList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Column.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Geometry
class Geometry extends IdentityHash {
  
  core.Object geometry;

  /** Type: A collection of geometries. */
  core.String type;

  /** The list of geometries in this geometry collection. */
  core.List<core.Object> geometries;

  /** Parses an instance from its JSON representation. */
  static Geometry parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Geometry();
    result.geometry = identity(json["geometry"]);
    result.type = identity(json["type"]);
    result.geometries = map(identity)(json["geometries"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Geometry value) {
    if (value == null) return null;
    final result = {};
    result["geometry"] = identity(value.geometry);
    result["type"] = identity(value.type);
    result["geometries"] = map(identity)(value.geometries);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Line
class Line extends IdentityHash {
  /** Type: A line geometry. */
  core.String type;

  /** The coordinates that define the line. */
  core.List<core.List<core.double>> coordinates;

  /** Parses an instance from its JSON representation. */
  static Line parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Line();
    result.type = identity(json["type"]);
    result.coordinates = map(map(identity))(json["coordinates"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Line value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["coordinates"] = map(map(identity))(value.coordinates);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .LineStyle
class LineStyle extends IdentityHash {
  /** Width of the line in pixels. */
  core.int strokeWeight;

  /** Column-value or bucket styler that is used to determine the width of the line. */
  StyleFunction strokeWeightStyler;

  /** Color of the line in #RRGGBB format. */
  core.String strokeColor;

  /** Opacity of the line : 0.0 (transparent) to 1.0 (opaque). */
  core.double strokeOpacity;

  /**
 * Column-value, gradient or buckets styler that is used to determine the line color and opacity.
 */
  StyleFunction strokeColorStyler;

  /** Parses an instance from its JSON representation. */
  static LineStyle parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new LineStyle();
    result.strokeWeight = identity(json["strokeWeight"]);
    result.strokeWeightStyler = StyleFunction.parse(json["strokeWeightStyler"]);
    result.strokeColor = identity(json["strokeColor"]);
    result.strokeOpacity = identity(json["strokeOpacity"]);
    result.strokeColorStyler = StyleFunction.parse(json["strokeColorStyler"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(LineStyle value) {
    if (value == null) return null;
    final result = {};
    result["strokeWeight"] = identity(value.strokeWeight);
    result["strokeWeightStyler"] = StyleFunction.serialize(value.strokeWeightStyler);
    result["strokeColor"] = identity(value.strokeColor);
    result["strokeOpacity"] = identity(value.strokeOpacity);
    result["strokeColorStyler"] = StyleFunction.serialize(value.strokeColorStyler);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Point
class Point extends IdentityHash {
  /** Point: A point geometry. */
  core.String type;

  /** The coordinates that define the point. */
  core.List<core.double> coordinates;

  /** Parses an instance from its JSON representation. */
  static Point parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Point();
    result.type = identity(json["type"]);
    result.coordinates = map(identity)(json["coordinates"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Point value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["coordinates"] = map(identity)(value.coordinates);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PointStyle
class PointStyle extends IdentityHash {
  /** Column or a bucket value from which the icon name is to be determined. */
  StyleFunction iconStyler;

  /**
 * Name of the icon. Use values defined in
 * http://www.google.com/fusiontables/DataSource?dsrcid=308519
 */
  core.String iconName;

  /** Parses an instance from its JSON representation. */
  static PointStyle parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PointStyle();
    result.iconStyler = StyleFunction.parse(json["iconStyler"]);
    result.iconName = identity(json["iconName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PointStyle value) {
    if (value == null) return null;
    final result = {};
    result["iconStyler"] = StyleFunction.serialize(value.iconStyler);
    result["iconName"] = identity(value.iconName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Polygon
class Polygon extends IdentityHash {
  /** Type: A polygon geometry. */
  core.String type;

  /** The coordinates that define the polygon. */
  core.List<core.List<core.List<core.double>>> coordinates;

  /** Parses an instance from its JSON representation. */
  static Polygon parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Polygon();
    result.type = identity(json["type"]);
    result.coordinates = map(map(map(identity)))(json["coordinates"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Polygon value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["coordinates"] = map(map(map(identity)))(value.coordinates);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PolygonStyle
class PolygonStyle extends IdentityHash {
  /**
 * Column-value, gradient or buckets styler that is used to determine the border color and opacity.
 */
  StyleFunction strokeColorStyler;

  /** Width of the polyon border in pixels. */
  core.int strokeWeight;

  /** Opacity of the polygon border: 0.0 (transparent) to 1.0 (opaque). */
  core.double strokeOpacity;

  /** Column-value or bucket styler that is used to determine the width of the polygon border. */
  StyleFunction strokeWeightStyler;

  /**
 * Column-value, gradient, or bucket styler that is used to determine the interior color and opacity
 * of the polygon.
 */
  StyleFunction fillColorStyler;

  /** Color of the interior of the polygon in #RRGGBB format. */
  core.String fillColor;

  /** Color of the polygon border in #RRGGBB format. */
  core.String strokeColor;

  /** Opacity of the interior of the polygon: 0.0 (transparent) to 1.0 (opaque). */
  core.double fillOpacity;

  /** Parses an instance from its JSON representation. */
  static PolygonStyle parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PolygonStyle();
    result.strokeColorStyler = StyleFunction.parse(json["strokeColorStyler"]);
    result.strokeWeight = identity(json["strokeWeight"]);
    result.strokeOpacity = identity(json["strokeOpacity"]);
    result.strokeWeightStyler = StyleFunction.parse(json["strokeWeightStyler"]);
    result.fillColorStyler = StyleFunction.parse(json["fillColorStyler"]);
    result.fillColor = identity(json["fillColor"]);
    result.strokeColor = identity(json["strokeColor"]);
    result.fillOpacity = identity(json["fillOpacity"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PolygonStyle value) {
    if (value == null) return null;
    final result = {};
    result["strokeColorStyler"] = StyleFunction.serialize(value.strokeColorStyler);
    result["strokeWeight"] = identity(value.strokeWeight);
    result["strokeOpacity"] = identity(value.strokeOpacity);
    result["strokeWeightStyler"] = StyleFunction.serialize(value.strokeWeightStyler);
    result["fillColorStyler"] = StyleFunction.serialize(value.fillColorStyler);
    result["fillColor"] = identity(value.fillColor);
    result["strokeColor"] = identity(value.strokeColor);
    result["fillOpacity"] = identity(value.fillOpacity);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Sqlresponse
class Sqlresponse extends IdentityHash {
  /** Type name: a template for an individual table. */
  core.String kind;

  /**
 * The rows in the table. For each cell we print out whatever cell value (e.g., numeric, string)
 * exists. Thus it is important that each cell contains only one value.
 */
  core.List<core.List<core.List<core.Object>>> rows;

  /** Columns in the table. */
  core.List<core.String> columns;

  /** Parses an instance from its JSON representation. */
  static Sqlresponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Sqlresponse();
    result.kind = identity(json["kind"]);
    result.rows = map(map(map(identity)))(json["rows"]);
    result.columns = map(identity)(json["columns"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Sqlresponse value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(map(map(identity)))(value.rows);
    result["columns"] = map(identity)(value.columns);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .StyleFunction
class StyleFunction extends IdentityHash {
  /** Gradient function that interpolates a range of colors based on column value. */
  StyleFunctionGradient gradient;

  /** Name of the column whose value is used in the style. */
  core.String columnName;

  /** Bucket function that assigns a style based on the range a column value falls into. */
  core.List<Bucket> buckets;

  /**
 * Stylers can be one of three kinds: "fusiontables#fromColumn" if the column value is to be used as
 * is, i.e., the column values can have colors in #RRGGBBAA format or integer line widths or icon
 * names; "fusiontables#gradient" if the styling of the row is to be based on applying the gradient
 * function on the column value; or "fusiontables#buckets" if the styling is to based on the bucket
 * into which the the column value falls.
 */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static StyleFunction parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new StyleFunction();
    result.gradient = StyleFunctionGradient.parse(json["gradient"]);
    result.columnName = identity(json["columnName"]);
    result.buckets = map(Bucket.parse)(json["buckets"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(StyleFunction value) {
    if (value == null) return null;
    final result = {};
    result["gradient"] = StyleFunctionGradient.serialize(value.gradient);
    result["columnName"] = identity(value.columnName);
    result["buckets"] = map(Bucket.serialize)(value.buckets);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema StyleFunction.StyleFunctionGradient
class StyleFunctionGradient extends IdentityHash {
  /** Higher-end of the interpolation range: rows with this value will be assigned to colors[n-1]. */
  core.double max;

  /** Array with two or more colors. */
  core.List<StyleFunctionGradientColors> colors;

  /** Lower-end of the interpolation range: rows with this value will be assigned to colors[0]. */
  core.double min;

  /** Parses an instance from its JSON representation. */
  static StyleFunctionGradient parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new StyleFunctionGradient();
    result.max = identity(json["max"]);
    result.colors = map(StyleFunctionGradientColors.parse)(json["colors"]);
    result.min = identity(json["min"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(StyleFunctionGradient value) {
    if (value == null) return null;
    final result = {};
    result["max"] = identity(value.max);
    result["colors"] = map(StyleFunctionGradientColors.serialize)(value.colors);
    result["min"] = identity(value.min);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema StyleFunction.StyleFunctionGradient.StyleFunctionGradientColors
class StyleFunctionGradientColors extends IdentityHash {
  /** Color in #RRGGBB format. */
  core.String color;

  /** Opacity of the color: 0.0 (transparent) to 1.0 (opaque). */
  core.double opacity;

  /** Parses an instance from its JSON representation. */
  static StyleFunctionGradientColors parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new StyleFunctionGradientColors();
    result.color = identity(json["color"]);
    result.opacity = identity(json["opacity"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(StyleFunctionGradientColors value) {
    if (value == null) return null;
    final result = {};
    result["color"] = identity(value.color);
    result["opacity"] = identity(value.opacity);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .StyleSetting
class StyleSetting extends IdentityHash {
  /** Style definition for points in the table. */
  PointStyle markerOptions;

  /**
 * Type name: an individual style setting. A StyleSetting contains the style defintions for points,
 * lines, and polygons in a table. Since a table can have any one or all of them, a style definition
 * can have point, line and polygon style definitions.
 */
  core.String kind;

  /** Optional name for the style setting. */
  core.String name;

  /** Style definition for polygons in the table. */
  PolygonStyle polygonOptions;

  /** Is this the default style for the table. */
  core.bool isDefaultForTable;

  /** Style definition for lines in the table. */
  LineStyle polylineOptions;

  /** Identifier for the table. */
  core.String tableId;

  /** Identifier for the style setting (unique only within tables). */
  core.int styleId;

  /** Parses an instance from its JSON representation. */
  static StyleSetting parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new StyleSetting();
    result.markerOptions = PointStyle.parse(json["markerOptions"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.polygonOptions = PolygonStyle.parse(json["polygonOptions"]);
    result.isDefaultForTable = identity(json["isDefaultForTable"]);
    result.polylineOptions = LineStyle.parse(json["polylineOptions"]);
    result.tableId = identity(json["tableId"]);
    result.styleId = identity(json["styleId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(StyleSetting value) {
    if (value == null) return null;
    final result = {};
    result["markerOptions"] = PointStyle.serialize(value.markerOptions);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["polygonOptions"] = PolygonStyle.serialize(value.polygonOptions);
    result["isDefaultForTable"] = identity(value.isDefaultForTable);
    result["polylineOptions"] = LineStyle.serialize(value.polylineOptions);
    result["tableId"] = identity(value.tableId);
    result["styleId"] = identity(value.styleId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .StyleSettingList
class StyleSettingList extends IdentityHash {
  /**
 * Token used to access the next page of this result. No token is displayed if there are no more
 * styles left.
 */
  core.String nextPageToken;

  /** All requested style settings. */
  core.List<StyleSetting> items;

  /** Type name: in this case, a list of style settings. */
  core.String kind;

  /** Total number of styles for the table. */
  core.int totalItems;

  /** Parses an instance from its JSON representation. */
  static StyleSettingList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new StyleSettingList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(StyleSetting.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(StyleSettingList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(StyleSetting.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Table
class Table extends IdentityHash {
  /** Type name: a template for an individual table. */
  core.String kind;

  /** Optional attribution assigned to the table. */
  core.String attribution;

  /** Optional description assigned to the table. */
  core.String description;

  /** Variable for whether table is exportable. */
  core.bool isExportable;

  /** Optional base table identifier if this table is a view or merged table. */
  core.List<core.String> baseTableIds;

  /** Optional link for attribution. */
  core.String attributionLink;

  /** Optional sql that encodes the table definition for derived tables. */
  core.String sql;

  /** Encrypted unique alphanumeric identifier for the table. */
  core.String tableId;

  /** Columns in the table. */
  core.List<Column> columns;

  /** Name assigned to a table. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Table parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Table();
    result.kind = identity(json["kind"]);
    result.attribution = identity(json["attribution"]);
    result.description = identity(json["description"]);
    result.isExportable = identity(json["isExportable"]);
    result.baseTableIds = map(identity)(json["baseTableIds"]);
    result.attributionLink = identity(json["attributionLink"]);
    result.sql = identity(json["sql"]);
    result.tableId = identity(json["tableId"]);
    result.columns = map(Column.parse)(json["columns"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Table value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["attribution"] = identity(value.attribution);
    result["description"] = identity(value.description);
    result["isExportable"] = identity(value.isExportable);
    result["baseTableIds"] = map(identity)(value.baseTableIds);
    result["attributionLink"] = identity(value.attributionLink);
    result["sql"] = identity(value.sql);
    result["tableId"] = identity(value.tableId);
    result["columns"] = map(Column.serialize)(value.columns);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableList
class TableList extends IdentityHash {
  /**
 * Token used to access the next page of this result. No token is displayed if there are no more
 * tokens left.
 */
  core.String nextPageToken;

  /** List of all requested tables. */
  core.List<Table> items;

  /** Type name: a list of all tables. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static TableList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TableList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Table.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TableList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Table.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Template
class Template extends IdentityHash {
  /**
 * Body of the template. It contains HTML with {column_name} to insert values from a particular
 * column. The body is sanitized to remove certain tags, e.g., script. Only one of body or
 * automaticColumns can be specified.
 */
  core.String body;

  /**
 * Type name: a template for the info window contents. The template can either include an HTML body
 * or a list of columns from which the template is computed automatically.
 */
  core.String kind;

  /** Optional name assigned to a template. */
  core.String name;

  /**
 * List of columns from which the template is to be automatically constructed. Only one of body or
 * automaticColumns can be specified.
 */
  core.List<core.String> automaticColumnNames;

  /** Is this the default template for the table. */
  core.bool isDefaultForTable;

  /** Identifier for the table for which the template is defined. */
  core.String tableId;

  /** Identifier for the template, unique within the context of a particular table. */
  core.int templateId;

  /** Parses an instance from its JSON representation. */
  static Template parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Template();
    result.body = identity(json["body"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.automaticColumnNames = map(identity)(json["automaticColumnNames"]);
    result.isDefaultForTable = identity(json["isDefaultForTable"]);
    result.tableId = identity(json["tableId"]);
    result.templateId = identity(json["templateId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Template value) {
    if (value == null) return null;
    final result = {};
    result["body"] = identity(value.body);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["automaticColumnNames"] = map(identity)(value.automaticColumnNames);
    result["isDefaultForTable"] = identity(value.isDefaultForTable);
    result["tableId"] = identity(value.tableId);
    result["templateId"] = identity(value.templateId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TemplateList
class TemplateList extends IdentityHash {
  /**
 * Token used to access the next page of this result. No token is displayed if there are no more
 * tokens left.
 */
  core.String nextPageToken;

  /** List of all requested templates. */
  core.List<Template> items;

  /** Type name: a list of all templates. */
  core.String kind;

  /** Total number of templates for the table. */
  core.int totalItems;

  /** Parses an instance from its JSON representation. */
  static TemplateList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TemplateList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Template.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TemplateList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Template.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum FusiontablesApi.Alt
class FusiontablesApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of text/csv */
  static final FusiontablesApiAlt CSV = const FusiontablesApiAlt._internal("csv", 0);
  /** Responses with Content-Type of application/json */
  static final FusiontablesApiAlt JSON = const FusiontablesApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final core.List<FusiontablesApiAlt> values = const <FusiontablesApiAlt>[
    CSV,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <FusiontablesApiAlt>{ 
    "csv": CSV,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FusiontablesApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FusiontablesApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

