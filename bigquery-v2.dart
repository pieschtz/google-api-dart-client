#library("bigquery");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API BigqueryApi
/**
 * A data platform for customers to create, manage, share and query data.
 */
class BigqueryApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  BigqueryApi get _$service() => this;
  TablesResource _tables;
  TablesResource get tables() => _tables;
  DatasetsResource _datasets;
  DatasetsResource get datasets() => _datasets;
  JobsResource _jobs;
  JobsResource get jobs() => _jobs;
  TabledataResource _tabledata;
  TabledataResource get tabledata() => _tabledata;
  ProjectsResource _projects;
  ProjectsResource get projects() => _projects;
  
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
  BigqueryApiAlt alt;


  BigqueryApi([this.baseUrl = "https://www.googleapis.com/bigquery/v2/", this.applicationName]) { 
    _tables = new TablesResource._internal(this);
    _datasets = new DatasetsResource._internal(this);
    _jobs = new JobsResource._internal(this);
    _tabledata = new TabledataResource._internal(this);
    _projects = new ProjectsResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}bigquery/v2/20120602 google-api-dart-client/${clientVersion}";
  }
}

// Resource .TablesResource
class TablesResource {
  final BigqueryApi _$service;
  
  TablesResource._internal(BigqueryApi $service) : _$service = $service;

  // Method TablesResource.Insert
  /**
   * Creates a new, empty table in the dataset.
   * [projectId] Project ID of the new table
   * [datasetId] Dataset ID of the new table
   * [content] the Table
   */
  Future<Table> insert(String projectId, String datasetId, Table content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
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
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables").generate($pathParams, $queryParams);
    final $completer = new Completer<Table>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Table.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TablesResource.Get
  /**
   * Gets the specified table resource by table ID. This method does not return the data in the table,
   * it only returns the table resource, which describes the structure of this table.
   * [projectId] Project ID of the requested table
   * [datasetId] Dataset ID of the requested table
   * [tableId] Table ID of the requested table
   */
  Future<Table> get(String projectId, String datasetId, String tableId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables/{tableId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Table>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Table.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TablesResource.List
  /**
   * Lists all tables in the specified dataset.
   * [projectId] Project ID of the tables to list
   * [datasetId] Dataset ID of the tables to list
   */
  Future<TableList> list(String projectId, String datasetId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
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
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables").generate($pathParams, $queryParams);
    final $completer = new Completer<TableList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TableList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TablesResource.Update
  /**
   * Updates information in an existing table, specified by tableId.
   * [projectId] Project ID of the table to update
   * [datasetId] Dataset ID of the table to update
   * [tableId] Table ID of the table to update
   * [content] the Table
   */
  Future<Table> update(String projectId, String datasetId, String tableId, Table content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
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
    final $body = JSON.stringify(Table.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables/{tableId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Table>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Table.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TablesResource.Patch
  /**
   * Updates information in an existing table, specified by tableId. This method supports patch
   * semantics.
   * [projectId] Project ID of the table to update
   * [datasetId] Dataset ID of the table to update
   * [tableId] Table ID of the table to update
   * [content] the Table
   */
  Future<Table> patch(String projectId, String datasetId, String tableId, Table content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
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
    final $body = JSON.stringify(Table.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables/{tableId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Table>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Table.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TablesResource.Delete
  /**
   * Deletes the table specified by tableId from the dataset. If the table contains data, all the data
   * will be deleted.
   * [projectId] Project ID of the table to delete
   * [datasetId] Dataset ID of the table to delete
   * [tableId] Table ID of the table to delete
   */
  Future delete(String projectId, String datasetId, String tableId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    $pathParams["tableId"] = tableId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables/{tableId}").generate($pathParams, $queryParams);
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

// Resource .DatasetsResource
class DatasetsResource {
  final BigqueryApi _$service;
  
  DatasetsResource._internal(BigqueryApi $service) : _$service = $service;

  // Method DatasetsResource.Insert
  /**
   * Creates a new empty dataset.
   * [projectId] Project ID of the new dataset
   * [content] the Dataset
   */
  Future<Dataset> insert(String projectId, Dataset content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Dataset.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets").generate($pathParams, $queryParams);
    final $completer = new Completer<Dataset>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Dataset.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method DatasetsResource.Get
  /**
   * Returns the dataset specified by datasetID.
   * [projectId] Project ID of the requested dataset
   * [datasetId] Dataset ID of the requested dataset
   */
  Future<Dataset> get(String projectId, String datasetId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Dataset>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Dataset.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method DatasetsResource.List
  /**
   * Lists all the datasets in the specified project to which the caller has read access; however, a
   * project owner can list (but not necessarily get) all datasets in his project.
   * [projectId] Project ID of the datasets to be listed
   */
  Future<DatasetList> list(String projectId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
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
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets").generate($pathParams, $queryParams);
    final $completer = new Completer<DatasetList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = DatasetList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method DatasetsResource.Update
  /**
   * Updates information in an existing dataset, specified by datasetId. Properties not included in
   * the submitted resource will not be changed. If you include the access property without any values
   * assigned, the request will fail as you must specify at least one owner for a dataset.
   * [projectId] Project ID of the dataset being updated
   * [datasetId] Dataset ID of the dataset being updated
   * [content] the Dataset
   */
  Future<Dataset> update(String projectId, String datasetId, Dataset content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Dataset.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Dataset>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Dataset.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method DatasetsResource.Patch
  /**
   * Updates information in an existing dataset, specified by datasetId. Properties not included in
   * the submitted resource will not be changed. If you include the access property without any values
   * assigned, the request will fail as you must specify at least one owner for a dataset. This method
   * supports patch semantics.
   * [projectId] Project ID of the dataset being updated
   * [datasetId] Dataset ID of the dataset being updated
   * [content] the Dataset
   */
  Future<Dataset> patch(String projectId, String datasetId, Dataset content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Dataset.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Dataset>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Dataset.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method DatasetsResource.Delete
  /**
   * Deletes the dataset specified by datasetId value. Before you can delete a dataset, you must
   * delete all its tables, either manually or by specifying deleteContents. Immediately after
   * deletion, you can create another dataset with the same name.
   * [projectId] Project ID of the dataset being deleted
   * [datasetId] Dataset ID of dataset being deleted
   */
  Future delete(String projectId, String datasetId, [bool deleteContents = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    if (UNSPECIFIED != deleteContents) $queryParams["deleteContents"] = deleteContents;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}").generate($pathParams, $queryParams);
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

// Resource .JobsResource
class JobsResource {
  final BigqueryApi _$service;
  
  JobsResource._internal(BigqueryApi $service) : _$service = $service;

  // Method JobsResource.Insert
  /**
   * Starts a new asynchronous job.
   * [projectId] Project ID of the project that will be billed for the job
   * [content] the Job
   */
  Future<Job> insert(String projectId, Job content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Job.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/jobs").generate($pathParams, $queryParams);
    final $completer = new Completer<Job>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Job.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method JobsResource.Query
  /**
   * Runs a BigQuery SQL query synchronously and returns query results if the query completes within a
   * specified timeout.
   * [projectId] Project ID of the project billed for the query
   * [content] the QueryRequest
   */
  Future<QueryResponse> query(String projectId, QueryRequest content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(QueryRequest.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/queries").generate($pathParams, $queryParams);
    final $completer = new Completer<QueryResponse>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = QueryResponse.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method JobsResource.List
  /**
   * Lists all the Jobs in the specified project that were started by the user.
   * [projectId] Project ID of the jobs to list
   */
  Future<JobList> list(String projectId, [JobsResourceListProjection projection = UNSPECIFIED, JobsResourceListStateFilter stateFilter = UNSPECIFIED, bool allUsers = UNSPECIFIED, int maxResults = UNSPECIFIED, String pageToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (UNSPECIFIED != stateFilter) $queryParams["stateFilter"] = stateFilter;
    if (UNSPECIFIED != allUsers) $queryParams["allUsers"] = allUsers;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/jobs").generate($pathParams, $queryParams);
    final $completer = new Completer<JobList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = JobList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method JobsResource.GetQueryResults
  /**
   * Retrieves the results of a query job.
   * [projectId] Project ID of the query job
   * [jobId] Job ID of the query job
   */
  Future<GetQueryResultsResponse> getQueryResults(String projectId, String jobId, [int timeoutMs = UNSPECIFIED, String startIndex = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["jobId"] = jobId;
    if (UNSPECIFIED != timeoutMs) $queryParams["timeoutMs"] = timeoutMs;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/queries/{jobId}").generate($pathParams, $queryParams);
    final $completer = new Completer<GetQueryResultsResponse>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = GetQueryResultsResponse.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method JobsResource.Get
  /**
   * Retrieves the specified job by ID.
   * [projectId] Project ID of the requested job
   * [jobId] Job ID of the requested job
   */
  Future<Job> get(String projectId, String jobId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["jobId"] = jobId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/jobs/{jobId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Job>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Job.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum JobsResource.List.Projection
class JobsResourceListProjection implements Hashable {
  /** Includes all job data */
  static final JobsResourceListProjection FULL = const JobsResourceListProjection._internal("full", 0);
  /** Does not include the job configuration */
  static final JobsResourceListProjection MINIMAL = const JobsResourceListProjection._internal("minimal", 1);

  /** All values of this enumeration */
  static final List<JobsResourceListProjection> values = const <JobsResourceListProjection>[
    FULL,
    MINIMAL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <JobsResourceListProjection>{ 
    "full": FULL,
    "minimal": MINIMAL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static JobsResourceListProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const JobsResourceListProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum JobsResource.List.StateFilter
class JobsResourceListStateFilter implements Hashable {
  /** Finished jobs */
  static final JobsResourceListStateFilter DONE = const JobsResourceListStateFilter._internal("done", 0);
  /** Pending jobs */
  static final JobsResourceListStateFilter PENDING = const JobsResourceListStateFilter._internal("pending", 1);
  /** Running jobs */
  static final JobsResourceListStateFilter RUNNING = const JobsResourceListStateFilter._internal("running", 2);

  /** All values of this enumeration */
  static final List<JobsResourceListStateFilter> values = const <JobsResourceListStateFilter>[
    DONE,
    PENDING,
    RUNNING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <JobsResourceListStateFilter>{ 
    "done": DONE,
    "pending": PENDING,
    "running": RUNNING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static JobsResourceListStateFilter valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const JobsResourceListStateFilter._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "StateFilter".hashCode();
}

// Resource .TabledataResource
class TabledataResource {
  final BigqueryApi _$service;
  
  TabledataResource._internal(BigqueryApi $service) : _$service = $service;

  // Method TabledataResource.List
  /**
   * Retrieves table data from a specified set of rows.
   * [projectId] Project ID of the table to read
   * [datasetId] Dataset ID of the table to read
   * [tableId] Table ID of the table to read
   */
  Future<TableDataList> list(String projectId, String datasetId, String tableId, [String startIndex = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["projectId"] = projectId;
    $pathParams["datasetId"] = datasetId;
    $pathParams["tableId"] = tableId;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "projects/{projectId}/datasets/{datasetId}/tables/{tableId}/data").generate($pathParams, $queryParams);
    final $completer = new Completer<TableDataList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TableDataList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .ProjectsResource
class ProjectsResource {
  final BigqueryApi _$service;
  
  ProjectsResource._internal(BigqueryApi $service) : _$service = $service;

  // Method ProjectsResource.List
  /**
   * Lists the projects to which you have at least read access.
   */
  Future<ProjectList> list([String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "projects").generate($pathParams, $queryParams);
    final $completer = new Completer<ProjectList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = ProjectList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .Dataset
class Dataset extends IdentityHash {
  /** [Output-only] The resource type. */
  String kind;

  /**
 * [Optional] A user-friendly string description for the dataset. This might be shown in BigQuery UI
 * for browsing the dataset.
 */
  String description;

  /** [Required] Reference identifying dataset. */
  DatasetReference datasetReference;

  /** [Output-only] The time when this dataset was created, in milliseconds since the epoch. */
  String creationTime;

  /**
 * [Optional] Describes users' rights on the dataset. You can assign the same role to multiple
 * users, and assign multiple roles to the same user. Default values assigned to a new dataset are
 * as follows: OWNER - Project owners, dataset creator READ - Project readers WRITE - Project
 * writers See ACLs and Rights for a description of these rights. If you specify any of these roles
 * when creating a dataset, the assigned roles will overwrite the defaults listed above. To revoke
 * rights to a dataset, call datasets.update() and omit the names of anyone whose rights you wish to
 * revoke. However, every dataset must have at least one entity granted OWNER role. Each access
 * object can have only one of the following members: userByEmail, groupByEmail, domain, or
 * allAuthenticatedUsers.
 */
  List<DatasetAccess> access;

  /** [Output-only] A hash of this resource. */
  String etag;

  /**
 * [Optional] A descriptive name for this dataset, which might be shown in any BigQuery user
 * interfaces for browsing the dataset. Use datasetId for making API calls.
 */
  String friendlyName;

  /**
 * [Output-only] The date when this dataset or any of its tables was last modified, in milliseconds
 * since the epoch.
 */
  String lastModifiedTime;

  /**
 * [Output-only] The fully-qualified unique name of this dataset in the format projectId:datasetId.
 * The dataset name without the project name is given in the datasetId field. When creating a new
 * dataset, leave this field blank, and instead specify the datasetId field.
 */
  String id;

  /**
 * [Output-only] An URL that can be used to access this resource again. You can use this URL in Get
 * or Update requests to this resource.
 */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Dataset parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Dataset();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.datasetReference = DatasetReference.parse(json["datasetReference"]);
    result.creationTime = identity(json["creationTime"]);
    result.access = map(DatasetAccess.parse)(json["access"]);
    result.etag = identity(json["etag"]);
    result.friendlyName = identity(json["friendlyName"]);
    result.lastModifiedTime = identity(json["lastModifiedTime"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Dataset value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["datasetReference"] = DatasetReference.serialize(value.datasetReference);
    result["creationTime"] = identity(value.creationTime);
    result["access"] = map(DatasetAccess.serialize)(value.access);
    result["etag"] = identity(value.etag);
    result["friendlyName"] = identity(value.friendlyName);
    result["lastModifiedTime"] = identity(value.lastModifiedTime);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Dataset.DatasetAccess
class DatasetAccess extends IdentityHash {
  /**
 * [Pick one] A special group to grant access to. The valid values are: projectOwners: Owners of the
 * enclosing project. projectReaders: Readers of the enclosing project. projectWriters: Writers of
 * the enclosing project. allAuthenticatedUsers: All authenticated BigQuery users.
 */
  String specialGroup;

  /**
 * [Pick one] A domain to grant access to. Any users signed in with the domain specified will be
 * granted the specified access. Example: "example.com".
 */
  String domain;

  /**
 * [Required] Describes the rights granted to the user specified by the other member of the access
 * object. The following string values are supported: READ - User can call any list() or get()
 * method on any collection or resource. WRITE - User can call any method on any collection except
 * for datasets, on which they can call list() and get(). OWNER - User can call any method. The
 * dataset creator is granted this role by default.
 */
  String role;

  /**
 * [Pick one] A fully-qualified email address of a mailing list to grant access to. This must be
 * either a Google Groups mailing list (ends in @googlegroups.com) or a group managed by an
 * enterprise version of Google Groups.
 */
  String groupByEmail;

  /**
 * [Pick one] A fully qualified email address of a user to grant access to. For example:
 * fred@example.com.
 */
  String userByEmail;

  /** Parses an instance from its JSON representation. */
  static DatasetAccess parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DatasetAccess();
    result.specialGroup = identity(json["specialGroup"]);
    result.domain = identity(json["domain"]);
    result.role = identity(json["role"]);
    result.groupByEmail = identity(json["groupByEmail"]);
    result.userByEmail = identity(json["userByEmail"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DatasetAccess value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["specialGroup"] = identity(value.specialGroup);
    result["domain"] = identity(value.domain);
    result["role"] = identity(value.role);
    result["groupByEmail"] = identity(value.groupByEmail);
    result["userByEmail"] = identity(value.userByEmail);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DatasetList
class DatasetList extends IdentityHash {
  /**
 * A token to request the next page of results. Present only when there is more than one page of
 * results.* See Paging Through Results in the developer's guide.
 */
  String nextPageToken;

  /** The type of list. */
  String kind;

  /**
 * An array of one or more summarized dataset resources. Absent when there are no datasets in the
 * specified project.
 */
  List<DatasetListDatasets> datasets;

  /** A hash of this page of results. See Paging Through Results in the developer's guide. */
  String etag;

  /** Parses an instance from its JSON representation. */
  static DatasetList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DatasetList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.datasets = map(DatasetListDatasets.parse)(json["datasets"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DatasetList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["datasets"] = map(DatasetListDatasets.serialize)(value.datasets);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema DatasetList.DatasetListDatasets
class DatasetListDatasets extends IdentityHash {
  /** A descriptive name for this dataset, if one exists. */
  String friendlyName;

  /** The resource type. */
  String kind;

  /** The fully-qualified unique name of this dataset in the format projectId:datasetId. */
  String id;

  /** Reference identifying dataset. */
  DatasetReference datasetReference;

  /** Parses an instance from its JSON representation. */
  static DatasetListDatasets parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DatasetListDatasets();
    result.friendlyName = identity(json["friendlyName"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.datasetReference = DatasetReference.parse(json["datasetReference"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DatasetListDatasets value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["friendlyName"] = identity(value.friendlyName);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["datasetReference"] = DatasetReference.serialize(value.datasetReference);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DatasetReference
class DatasetReference extends IdentityHash {
  /** [Optional] The ID of the container project. */
  String projectId;

  /** [Required] A unique ID for this dataset, without the project name. */
  String datasetId;

  /** Parses an instance from its JSON representation. */
  static DatasetReference parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DatasetReference();
    result.projectId = identity(json["projectId"]);
    result.datasetId = identity(json["datasetId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DatasetReference value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["projectId"] = identity(value.projectId);
    result["datasetId"] = identity(value.datasetId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ErrorProto
class ErrorProto extends IdentityHash {
  /** Debugging information for the service, if present. Should be ignored. */
  String debugInfo;

  /** A human readable explanation of the error. */
  String message;

  /**
 * Specifies the error reason. For example, reason will be "required" or "invalid" if some field was
 * missing or malformed.
 */
  String reason;

  /** Specifies where the error occurred, if present. */
  String location;

  /** Parses an instance from its JSON representation. */
  static ErrorProto parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ErrorProto();
    result.debugInfo = identity(json["debugInfo"]);
    result.message = identity(json["message"]);
    result.reason = identity(json["reason"]);
    result.location = identity(json["location"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ErrorProto value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["debugInfo"] = identity(value.debugInfo);
    result["message"] = identity(value.message);
    result["reason"] = identity(value.reason);
    result["location"] = identity(value.location);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .GetQueryResultsResponse
class GetQueryResultsResponse extends IdentityHash {
  /** The resource type of the response. */
  String kind;

  /**
 * An object with as many results as can be contained within the maximum permitted reply size. To
 * get any additional rows, you can call GetQueryResults and specify the jobReference returned
 * above. Present only when the query completes successfully.
 */
  List<TableRow> rows;

  /**
 * Reference to the Helix Job that was created to run the query. This field will be present even if
 * the original request timed out, in which case GetQueryResults can be used to read the results
 * once the query has completed. Since this API only returns the first page of results, subsequent
 * pages can be fetched via the same mechanism (GetQueryResults).
 */
  JobReference jobReference;

  /**
 * Whether the query has completed or not. If rows or totalRows are present, this will always be
 * true. If this is false, totalRows will not be available.
 */
  bool jobComplete;

  /**
 * The total number of rows in the complete query result set, which can be more than the number of
 * rows in this single page of results. Present only when the query completes successfully.
 */
  String totalRows;

  /** A hash of this response. */
  String etag;

  /** The schema of the results. Present only when the query completes successfully. */
  TableSchema schema;

  /** Parses an instance from its JSON representation. */
  static GetQueryResultsResponse parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new GetQueryResultsResponse();
    result.kind = identity(json["kind"]);
    result.rows = map(TableRow.parse)(json["rows"]);
    result.jobReference = JobReference.parse(json["jobReference"]);
    result.jobComplete = identity(json["jobComplete"]);
    result.totalRows = identity(json["totalRows"]);
    result.etag = identity(json["etag"]);
    result.schema = TableSchema.parse(json["schema"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(GetQueryResultsResponse value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(TableRow.serialize)(value.rows);
    result["jobReference"] = JobReference.serialize(value.jobReference);
    result["jobComplete"] = identity(value.jobComplete);
    result["totalRows"] = identity(value.totalRows);
    result["etag"] = identity(value.etag);
    result["schema"] = TableSchema.serialize(value.schema);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Job
class Job extends IdentityHash {
  /**
 * [Output-only] The status of this job. Examine this value when polling an asynchronous job to see
 * if the job is complete.
 */
  JobStatus status;

  /** [Output-only] The type of the resource. */
  String kind;

  /** [Output-only] Information about the job, including starting time and ending time of the job. */
  JobStatistics statistics;

  /** [Optional] Reference describing the unique-per-user name of the job. */
  JobReference jobReference;

  /** [Output-only] A hash of this resource. */
  String etag;

  /** [Required] Describes the job configuration. */
  JobConfiguration configuration;

  /** [Output-only] Opaque ID field of the job */
  String id;

  /** [Output-only] A URL that can be used to access this resource again. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Job parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Job();
    result.status = JobStatus.parse(json["status"]);
    result.kind = identity(json["kind"]);
    result.statistics = JobStatistics.parse(json["statistics"]);
    result.jobReference = JobReference.parse(json["jobReference"]);
    result.etag = identity(json["etag"]);
    result.configuration = JobConfiguration.parse(json["configuration"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Job value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["status"] = JobStatus.serialize(value.status);
    result["kind"] = identity(value.kind);
    result["statistics"] = JobStatistics.serialize(value.statistics);
    result["jobReference"] = JobReference.serialize(value.jobReference);
    result["etag"] = identity(value.etag);
    result["configuration"] = JobConfiguration.serialize(value.configuration);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobConfiguration
class JobConfiguration extends IdentityHash {
  /** [Pick one] Configures a load job. */
  JobConfigurationLoad load;

  /** [Pick one] Configures a link job. */
  JobConfigurationLink link;

  /** [Pick one] Configures a query job. */
  JobConfigurationQuery query;

  /** [Pick one] Copies a table. */
  JobConfigurationTableCopy copy;

  /** [Pick one] Configures an extract job. */
  JobConfigurationExtract extract;

  /**
 * [Optional] Properties providing extra details about how the job should be run. Not used for most
 * jobs.
 */
  Map<String, String> properties;

  /** Parses an instance from its JSON representation. */
  static JobConfiguration parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobConfiguration();
    result.load = JobConfigurationLoad.parse(json["load"]);
    result.link = JobConfigurationLink.parse(json["link"]);
    result.query = JobConfigurationQuery.parse(json["query"]);
    result.copy = JobConfigurationTableCopy.parse(json["copy"]);
    result.extract = JobConfigurationExtract.parse(json["extract"]);
    result.properties = mapValues(identity)(json["properties"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobConfiguration value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["load"] = JobConfigurationLoad.serialize(value.load);
    result["link"] = JobConfigurationLink.serialize(value.link);
    result["query"] = JobConfigurationQuery.serialize(value.query);
    result["copy"] = JobConfigurationTableCopy.serialize(value.copy);
    result["extract"] = JobConfigurationExtract.serialize(value.extract);
    result["properties"] = mapValues(identity)(value.properties);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobConfigurationExtract
class JobConfigurationExtract extends IdentityHash {
  /**
 * [Required] The fully-qualified Google Cloud Storage URI where the extracted table should be
 * written.
 */
  String destinationUri;

  /** [Optional] Delimiter to use between fields in the exported data. Default is ',' */
  String fieldDelimiter;

  /** [Required] A reference to the table being exported. */
  TableReference sourceTable;

  /** [Optional] Whether to print out a heder row in the results. Default is true. */
  bool printHeader;

  /** Parses an instance from its JSON representation. */
  static JobConfigurationExtract parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobConfigurationExtract();
    result.destinationUri = identity(json["destinationUri"]);
    result.fieldDelimiter = identity(json["fieldDelimiter"]);
    result.sourceTable = TableReference.parse(json["sourceTable"]);
    result.printHeader = identity(json["printHeader"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobConfigurationExtract value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["destinationUri"] = identity(value.destinationUri);
    result["fieldDelimiter"] = identity(value.fieldDelimiter);
    result["sourceTable"] = TableReference.serialize(value.sourceTable);
    result["printHeader"] = identity(value.printHeader);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobConfigurationLink
class JobConfigurationLink extends IdentityHash {
  /** [Optional] Whether or not to create a new table, if none exists. */
  String createDisposition;

  /**
 * [Optional] Whether to overwrite an existing table (WRITE_TRUNCATE), append to an existing table
 * (WRITE_APPEND), or require that the the table is empty (WRITE_EMPTY). Default is WRITE_APPEND.
 */
  String writeDisposition;

  /** [Required] The destination table of the link job. */
  TableReference destinationTable;

  /** [Required] URI of source table to link. */
  List<String> sourceUri;

  /** Parses an instance from its JSON representation. */
  static JobConfigurationLink parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobConfigurationLink();
    result.createDisposition = identity(json["createDisposition"]);
    result.writeDisposition = identity(json["writeDisposition"]);
    result.destinationTable = TableReference.parse(json["destinationTable"]);
    result.sourceUri = map(identity)(json["sourceUri"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobConfigurationLink value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["createDisposition"] = identity(value.createDisposition);
    result["writeDisposition"] = identity(value.writeDisposition);
    result["destinationTable"] = TableReference.serialize(value.destinationTable);
    result["sourceUri"] = map(identity)(value.sourceUri);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobConfigurationLoad
class JobConfigurationLoad extends IdentityHash {
  /**
 * [Optional] Character encoding of the input data. May be UTF-8 or ISO-8859-1. Default is UTF-8.
 */
  String encoding;

  /** [Optional] Delimiter to use between fields in the import data. Default is ',' */
  String fieldDelimiter;

  /** [Required] Table being written to. */
  TableReference destinationTable;

  /**
 * [Optional] Maximum number of bad records that should be ignored before the entire job is aborted
 * and no updates are performed.
 */
  int maxBadRecords;

  /**
 * [Optional] Whether to overwrite an existing table (WRITE_TRUNCATE), append to an existing table
 * (WRITE_APPEND), or require that the the table is empty (WRITE_EMPTY). Default is WRITE_APPEND.
 */
  String writeDisposition;

  /** [Required] Source URIs describing Google Cloud Storage locations of data to load. */
  List<String> sourceUris;

  /** [Optional] Number of rows of initial data to skip in the data being imported. */
  int skipLeadingRows;

  /**
 * [Optional] Whether to create the table if it doesn't already exist (CREATE_IF_NEEDED) or to
 * require the table already exist (CREATE_NEVER). Default is CREATE_IF_NEEDED.
 */
  String createDisposition;

  /** [Optional] Schema of the table being written to. */
  TableSchema schema;

  /** Parses an instance from its JSON representation. */
  static JobConfigurationLoad parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobConfigurationLoad();
    result.encoding = identity(json["encoding"]);
    result.fieldDelimiter = identity(json["fieldDelimiter"]);
    result.destinationTable = TableReference.parse(json["destinationTable"]);
    result.maxBadRecords = identity(json["maxBadRecords"]);
    result.writeDisposition = identity(json["writeDisposition"]);
    result.sourceUris = map(identity)(json["sourceUris"]);
    result.skipLeadingRows = identity(json["skipLeadingRows"]);
    result.createDisposition = identity(json["createDisposition"]);
    result.schema = TableSchema.parse(json["schema"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobConfigurationLoad value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["encoding"] = identity(value.encoding);
    result["fieldDelimiter"] = identity(value.fieldDelimiter);
    result["destinationTable"] = TableReference.serialize(value.destinationTable);
    result["maxBadRecords"] = identity(value.maxBadRecords);
    result["writeDisposition"] = identity(value.writeDisposition);
    result["sourceUris"] = map(identity)(value.sourceUris);
    result["skipLeadingRows"] = identity(value.skipLeadingRows);
    result["createDisposition"] = identity(value.createDisposition);
    result["schema"] = TableSchema.serialize(value.schema);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobConfigurationQuery
class JobConfigurationQuery extends IdentityHash {
  /** [Optional] Specifies the default dataset to assume for unqualified table names in the query. */
  DatasetReference defaultDataset;

  /**
 * [Optional] Describes the table where the query results should be stored. If not present, a new
 * table will be created to store the results.
 */
  TableReference destinationTable;

  /**
 * [Experimental] Specifies a priority for the query. Default is INTERACTIVE. Alternative is BATCH,
 * which may be subject to looser quota restrictions.
 */
  String priority;

  /**
 * [Optional] Whether to overwrite an existing table (WRITE_TRUNCATE), append to an existing table
 * (WRITE_APPEND), or require that the the table is empty (WRITE_EMPTY). Default is WRITE_EMPTY.
 */
  String writeDisposition;

  /**
 * [Optional] Whether to create the table if it doesn't already exist (CREATE_IF_NEEDED) or to
 * require the table already exist (CREATE_NEVER). Default is CREATE_IF_NEEDED.
 */
  String createDisposition;

  /** [Required] BigQuery SQL query to execute. */
  String query;

  /** Parses an instance from its JSON representation. */
  static JobConfigurationQuery parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobConfigurationQuery();
    result.defaultDataset = DatasetReference.parse(json["defaultDataset"]);
    result.destinationTable = TableReference.parse(json["destinationTable"]);
    result.priority = identity(json["priority"]);
    result.writeDisposition = identity(json["writeDisposition"]);
    result.createDisposition = identity(json["createDisposition"]);
    result.query = identity(json["query"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobConfigurationQuery value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["defaultDataset"] = DatasetReference.serialize(value.defaultDataset);
    result["destinationTable"] = TableReference.serialize(value.destinationTable);
    result["priority"] = identity(value.priority);
    result["writeDisposition"] = identity(value.writeDisposition);
    result["createDisposition"] = identity(value.createDisposition);
    result["query"] = identity(value.query);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobConfigurationTableCopy
class JobConfigurationTableCopy extends IdentityHash {
  /** [Optional] Whether or not to create a new table, if none exists. */
  String createDisposition;

  /** [Optional] Whether or not to append or require the table to be empty. */
  String writeDisposition;

  /** [Required] The destination table */
  TableReference destinationTable;

  /** [Required] Source table to copy. */
  TableReference sourceTable;

  /** Parses an instance from its JSON representation. */
  static JobConfigurationTableCopy parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobConfigurationTableCopy();
    result.createDisposition = identity(json["createDisposition"]);
    result.writeDisposition = identity(json["writeDisposition"]);
    result.destinationTable = TableReference.parse(json["destinationTable"]);
    result.sourceTable = TableReference.parse(json["sourceTable"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobConfigurationTableCopy value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["createDisposition"] = identity(value.createDisposition);
    result["writeDisposition"] = identity(value.writeDisposition);
    result["destinationTable"] = TableReference.serialize(value.destinationTable);
    result["sourceTable"] = TableReference.serialize(value.sourceTable);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobList
class JobList extends IdentityHash {
  /** A token to request the next page of results. */
  String nextPageToken;

  /** Total number of jobs in this collection. */
  int totalItems;

  /** The resource type of the response. */
  String kind;

  /** A hash of this page of results. */
  String etag;

  /** List of jobs that were requested. */
  List<JobListJobs> jobs;

  /** Parses an instance from its JSON representation. */
  static JobList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.totalItems = identity(json["totalItems"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.jobs = map(JobListJobs.parse)(json["jobs"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["totalItems"] = identity(value.totalItems);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["jobs"] = map(JobListJobs.serialize)(value.jobs);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema JobList.JobListJobs
class JobListJobs extends IdentityHash {
  /** [Full-projection-only] Describes the state of the job. */
  JobStatus status;

  /** The resource type. */
  String kind;

  /** [Output-only] Information about the job, including starting time and ending time of the job. */
  JobStatistics statistics;

  /** Job reference uniquely identifying the job. */
  JobReference jobReference;

  /**
 * Running state of the job. When the state is DONE, errorResult can be checked to determine whether
 * the job succeeded or failed.
 */
  String state;

  /** [Full-projection-only] Specifies the job configuration. */
  JobConfiguration configuration;

  /** Unique opaque ID of the job. */
  String id;

  /** A result object that will be present only if the job has failed. */
  ErrorProto errorResult;

  /** Parses an instance from its JSON representation. */
  static JobListJobs parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobListJobs();
    result.status = JobStatus.parse(json["status"]);
    result.kind = identity(json["kind"]);
    result.statistics = JobStatistics.parse(json["statistics"]);
    result.jobReference = JobReference.parse(json["jobReference"]);
    result.state = identity(json["state"]);
    result.configuration = JobConfiguration.parse(json["configuration"]);
    result.id = identity(json["id"]);
    result.errorResult = ErrorProto.parse(json["errorResult"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobListJobs value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["status"] = JobStatus.serialize(value.status);
    result["kind"] = identity(value.kind);
    result["statistics"] = JobStatistics.serialize(value.statistics);
    result["jobReference"] = JobReference.serialize(value.jobReference);
    result["state"] = identity(value.state);
    result["configuration"] = JobConfiguration.serialize(value.configuration);
    result["id"] = identity(value.id);
    result["errorResult"] = ErrorProto.serialize(value.errorResult);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobReference
class JobReference extends IdentityHash {
  /** [Required] Project ID being billed for the job. */
  String projectId;

  /** [Required] ID of the job. */
  String jobId;

  /** Parses an instance from its JSON representation. */
  static JobReference parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobReference();
    result.projectId = identity(json["projectId"]);
    result.jobId = identity(json["jobId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobReference value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["projectId"] = identity(value.projectId);
    result["jobId"] = identity(value.jobId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobStatistics
class JobStatistics extends IdentityHash {
  /** [Output-only] End time of this job, in milliseconds since the epoch. */
  String endTime;

  /** [Output-only] Total bytes processed for this job. */
  String totalBytesProcessed;

  /** [Output-only] Start time of this job, in milliseconds since the epoch. */
  String startTime;

  /** Parses an instance from its JSON representation. */
  static JobStatistics parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobStatistics();
    result.endTime = identity(json["endTime"]);
    result.totalBytesProcessed = identity(json["totalBytesProcessed"]);
    result.startTime = identity(json["startTime"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobStatistics value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["endTime"] = identity(value.endTime);
    result["totalBytesProcessed"] = identity(value.totalBytesProcessed);
    result["startTime"] = identity(value.startTime);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobStatus
class JobStatus extends IdentityHash {
  /** [Output-only] Running state of the job. */
  String state;

  /**
 * [Output-only] All errors encountered during the running of the job. Errors here do not
 * necessarily mean that the job has completed or was unsuccessful.
 */
  List<ErrorProto> errors;

  /**
 * [Output-only] Final error result of the job. If present, indicates that the job has completed and
 * was unsuccessful.
 */
  ErrorProto errorResult;

  /** Parses an instance from its JSON representation. */
  static JobStatus parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new JobStatus();
    result.state = identity(json["state"]);
    result.errors = map(ErrorProto.parse)(json["errors"]);
    result.errorResult = ErrorProto.parse(json["errorResult"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(JobStatus value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["state"] = identity(value.state);
    result["errors"] = map(ErrorProto.serialize)(value.errors);
    result["errorResult"] = ErrorProto.serialize(value.errorResult);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ProjectList
class ProjectList extends IdentityHash {
  /** A token to request the next page of results. */
  String nextPageToken;

  /** The total number of projects in the list. */
  int totalItems;

  /** The type of list. */
  String kind;

  /** A hash of the page of results */
  String etag;

  /** Projects to which you have at least READ access. */
  List<ProjectListProjects> projects;

  /** Parses an instance from its JSON representation. */
  static ProjectList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProjectList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.totalItems = identity(json["totalItems"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.projects = map(ProjectListProjects.parse)(json["projects"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProjectList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["totalItems"] = identity(value.totalItems);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["projects"] = map(ProjectListProjects.serialize)(value.projects);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ProjectList.ProjectListProjects
class ProjectListProjects extends IdentityHash {
  /** A descriptive name for this project. */
  String friendlyName;

  /** The resource type. */
  String kind;

  /** An opaque ID of this project. */
  String id;

  /** A unique reference to this project. */
  ProjectReference projectReference;

  /** Parses an instance from its JSON representation. */
  static ProjectListProjects parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProjectListProjects();
    result.friendlyName = identity(json["friendlyName"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.projectReference = ProjectReference.parse(json["projectReference"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProjectListProjects value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["friendlyName"] = identity(value.friendlyName);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["projectReference"] = ProjectReference.serialize(value.projectReference);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ProjectReference
class ProjectReference extends IdentityHash {
  /**
 * [Required] ID of the project. Can be either the numeric ID or the assigned ID of the project.
 */
  String projectId;

  /** Parses an instance from its JSON representation. */
  static ProjectReference parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProjectReference();
    result.projectId = identity(json["projectId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProjectReference value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["projectId"] = identity(value.projectId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .QueryRequest
class QueryRequest extends IdentityHash {
  /**
 * [Optional] How long to wait for the query to complete, in milliseconds, before returning. Default
 * is to return immediately. If the timeout passes before the job completes, the request will fail
 * with a TIMEOUT error.
 */
  int timeoutMs;

  /**
 * [Required] A query string, following the BigQuery query syntax of the query to execute. Table
 * names should be qualified by dataset name in the format projectId:datasetId.tableId unless you
 * specify the defaultDataset value. If the table is in the same project as the job, you can omit
 * the project ID. Example: SELECT f1 FROM myProjectId:myDatasetId.myTableId.
 */
  String query;

  /** The resource type of the request. */
  String kind;

  /**
 * [Optional] The maximum number of results to return per page of results. If the response list
 * exceeds the maximum response size for a single response, you will have to page through the
 * results. Default is to return the maximum response size.
 */
  int maxResults;

  /**
 * [Optional] Specifies the default datasetId and projectId to assume for any unqualified table
 * names in the query. If not set, all table names in the query string must be fully-qualified in
 * the format projectId:datasetId.tableid.
 */
  DatasetReference defaultDataset;

  /** Parses an instance from its JSON representation. */
  static QueryRequest parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new QueryRequest();
    result.timeoutMs = identity(json["timeoutMs"]);
    result.query = identity(json["query"]);
    result.kind = identity(json["kind"]);
    result.maxResults = identity(json["maxResults"]);
    result.defaultDataset = DatasetReference.parse(json["defaultDataset"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(QueryRequest value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["timeoutMs"] = identity(value.timeoutMs);
    result["query"] = identity(value.query);
    result["kind"] = identity(value.kind);
    result["maxResults"] = identity(value.maxResults);
    result["defaultDataset"] = DatasetReference.serialize(value.defaultDataset);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .QueryResponse
class QueryResponse extends IdentityHash {
  /** The resource type. */
  String kind;

  /**
 * An object with as many results as can be contained within the maximum permitted reply size. To
 * get any additional rows, you can call GetQueryResults and specify the jobReference returned
 * above.
 */
  List<TableRow> rows;

  /**
 * Reference to the Job that was created to run the query. This field will be present even if the
 * original request timed out, in which case GetQueryResults can be used to read the results once
 * the query has completed. Since this API only returns the first page of results, subsequent pages
 * can be fetched via the same mechanism (GetQueryResults).
 */
  JobReference jobReference;

  /**
 * Whether the query has completed or not. If rows or totalRows are present, this will always be
 * true. If this is false, totalRows will not be available.
 */
  bool jobComplete;

  /**
 * The total number of rows in the complete query result set, which can be more than the number of
 * rows in this single page of results.
 */
  String totalRows;

  /** The schema of the results. Present only when the query completes successfully. */
  TableSchema schema;

  /** Parses an instance from its JSON representation. */
  static QueryResponse parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new QueryResponse();
    result.kind = identity(json["kind"]);
    result.rows = map(TableRow.parse)(json["rows"]);
    result.jobReference = JobReference.parse(json["jobReference"]);
    result.jobComplete = identity(json["jobComplete"]);
    result.totalRows = identity(json["totalRows"]);
    result.schema = TableSchema.parse(json["schema"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(QueryResponse value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(TableRow.serialize)(value.rows);
    result["jobReference"] = JobReference.serialize(value.jobReference);
    result["jobComplete"] = identity(value.jobComplete);
    result["totalRows"] = identity(value.totalRows);
    result["schema"] = TableSchema.serialize(value.schema);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Table
class Table extends IdentityHash {
  /** [Output-only] The type of the resource. */
  String kind;

  /** [Output-only] The time when this table was last modified, in milliseconds since the epoch. */
  String lastModifiedTime;

  /** [Optional] A user-friendly description of this table. */
  String description;

  /** [Output-only] The time when this table was created, in milliseconds since the epoch. */
  String creationTime;

  /** [Required] Reference describing the ID of this table. */
  TableReference tableReference;

  /** [Output-only] The number of rows of data in this table. */
  String numRows;

  /** [Output-only] The size of the table in bytes. */
  String numBytes;

  /** [Output-only] A hash of this resource. */
  String etag;

  /** [Optional] A descriptive name for this table. */
  String friendlyName;

  /**
 * [Optional] The time when this table expires, in milliseconds since the epoch. If not present, the
 * table will persist indefinitely. Expired tables will be deleted and their storage reclaimed.
 */
  String expirationTime;

  /** [Output-only] An opaque ID uniquely identifying the table. */
  String id;

  /** [Output-only] A URL that can be used to access this resource again. */
  String selfLink;

  /** [Optional] Describes the schema of this table. */
  TableSchema schema;

  /** Parses an instance from its JSON representation. */
  static Table parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Table();
    result.kind = identity(json["kind"]);
    result.lastModifiedTime = identity(json["lastModifiedTime"]);
    result.description = identity(json["description"]);
    result.creationTime = identity(json["creationTime"]);
    result.tableReference = TableReference.parse(json["tableReference"]);
    result.numRows = identity(json["numRows"]);
    result.numBytes = identity(json["numBytes"]);
    result.etag = identity(json["etag"]);
    result.friendlyName = identity(json["friendlyName"]);
    result.expirationTime = identity(json["expirationTime"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.schema = TableSchema.parse(json["schema"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Table value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["lastModifiedTime"] = identity(value.lastModifiedTime);
    result["description"] = identity(value.description);
    result["creationTime"] = identity(value.creationTime);
    result["tableReference"] = TableReference.serialize(value.tableReference);
    result["numRows"] = identity(value.numRows);
    result["numBytes"] = identity(value.numBytes);
    result["etag"] = identity(value.etag);
    result["friendlyName"] = identity(value.friendlyName);
    result["expirationTime"] = identity(value.expirationTime);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["schema"] = TableSchema.serialize(value.schema);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableDataList
class TableDataList extends IdentityHash {
  /** Rows of results. */
  List<TableRow> rows;

  /** The resource type of the response. */
  String kind;

  /** A hash of this page of results. */
  String etag;

  /** The total number of rows in the complete table. */
  String totalRows;

  /** Parses an instance from its JSON representation. */
  static TableDataList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableDataList();
    result.rows = map(TableRow.parse)(json["rows"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.totalRows = identity(json["totalRows"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableDataList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["rows"] = map(TableRow.serialize)(value.rows);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["totalRows"] = identity(value.totalRows);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableFieldSchema
class TableFieldSchema extends IdentityHash {
  /** [Optional] Describes nested fields when type is RECORD. */
  List<TableFieldSchema> fields;

  /** [Required] Data type of the field. */
  String type;

  /** [Optional] Mode of the field (whether or not it can be null. Default is NULLABLE. */
  String mode;

  /** [Required] Name of the field. */
  String name;

  /** Parses an instance from its JSON representation. */
  static TableFieldSchema parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableFieldSchema();
    result.fields = map(TableFieldSchema.parse)(json["fields"]);
    result.type = identity(json["type"]);
    result.mode = identity(json["mode"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableFieldSchema value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["fields"] = map(TableFieldSchema.serialize)(value.fields);
    result["type"] = identity(value.type);
    result["mode"] = identity(value.mode);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableList
class TableList extends IdentityHash {
  /** A token to request the next page of results. */
  String nextPageToken;

  /** Tables in the requested dataset. */
  List<TableListTables> tables;

  /** The type of list. */
  String kind;

  /** A hash of this page of results. */
  String etag;

  /** The total number of tables in the dataset. */
  int totalItems;

  /** Parses an instance from its JSON representation. */
  static TableList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.tables = map(TableListTables.parse)(json["tables"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["tables"] = map(TableListTables.serialize)(value.tables);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema TableList.TableListTables
class TableListTables extends IdentityHash {
  /** The user-friendly name for this table. */
  String friendlyName;

  /** The resource type. */
  String kind;

  /** An opaque ID of the table */
  String id;

  /** A reference uniquely identifying the table. */
  TableReference tableReference;

  /** Parses an instance from its JSON representation. */
  static TableListTables parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableListTables();
    result.friendlyName = identity(json["friendlyName"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.tableReference = TableReference.parse(json["tableReference"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableListTables value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["friendlyName"] = identity(value.friendlyName);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["tableReference"] = TableReference.serialize(value.tableReference);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableReference
class TableReference extends IdentityHash {
  /** [Required] ID of the project billed for storage of the table. */
  String projectId;

  /** [Required] ID of the table. */
  String tableId;

  /** [Required] ID of the dataset containing the table. */
  String datasetId;

  /** Parses an instance from its JSON representation. */
  static TableReference parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableReference();
    result.projectId = identity(json["projectId"]);
    result.tableId = identity(json["tableId"]);
    result.datasetId = identity(json["datasetId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableReference value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["projectId"] = identity(value.projectId);
    result["tableId"] = identity(value.tableId);
    result["datasetId"] = identity(value.datasetId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableRow
class TableRow extends IdentityHash {
  /** Represents a single row in the result set, consisting of one or more fields. */
  List<TableRowF> f;

  /** Parses an instance from its JSON representation. */
  static TableRow parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableRow();
    result.f = map(TableRowF.parse)(json["f"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableRow value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["f"] = map(TableRowF.serialize)(value.f);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema TableRow.TableRowF
class TableRowF extends IdentityHash {
  /** Contains the field value in this row, as a string. */
  String v;

  /** Parses an instance from its JSON representation. */
  static TableRowF parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableRowF();
    result.v = identity(json["v"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableRowF value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["v"] = identity(value.v);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TableSchema
class TableSchema extends IdentityHash {
  /** Describes the fields in a table. */
  List<TableFieldSchema> fields;

  /** Parses an instance from its JSON representation. */
  static TableSchema parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TableSchema();
    result.fields = map(TableFieldSchema.parse)(json["fields"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TableSchema value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["fields"] = map(TableFieldSchema.serialize)(value.fields);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum BigqueryApi.Alt
class BigqueryApiAlt implements Hashable {
  /** Responses with Content-Type of text/csv */
  static final BigqueryApiAlt CSV = const BigqueryApiAlt._internal("csv", 0);
  /** Responses with Content-Type of application/json */
  static final BigqueryApiAlt JSON = const BigqueryApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final List<BigqueryApiAlt> values = const <BigqueryApiAlt>[
    CSV,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BigqueryApiAlt>{ 
    "csv": CSV,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BigqueryApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const BigqueryApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

