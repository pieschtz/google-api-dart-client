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

#library('compute-v1beta12');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API ComputeApi
/**
 * API for the Google Compute Engine service.
 */
class ComputeApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  ComputeApi get _$service => this;
  OperationsResource _operations;
  OperationsResource get operations => _operations;
  KernelsResource _kernels;
  KernelsResource get kernels => _kernels;
  DisksResource _disks;
  DisksResource get disks => _disks;
  SnapshotsResource _snapshots;
  SnapshotsResource get snapshots => _snapshots;
  ZonesResource _zones;
  ZonesResource get zones => _zones;
  InstancesResource _instances;
  InstancesResource get instances => _instances;
  MachineTypesResource _machineTypes;
  MachineTypesResource get machineTypes => _machineTypes;
  ImagesResource _images;
  ImagesResource get images => _images;
  FirewallsResource _firewalls;
  FirewallsResource get firewalls => _firewalls;
  NetworksResource _networks;
  NetworksResource get networks => _networks;
  ProjectsResource _projects;
  ProjectsResource get projects => _projects;
  
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
  ComputeApiAlt alt;


  ComputeApi({this.baseUrl:"https://www.googleapis.com/compute/v1beta12/projects/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _operations = new OperationsResource._internal(this);
    _kernels = new KernelsResource._internal(this);
    _disks = new DisksResource._internal(this);
    _snapshots = new SnapshotsResource._internal(this);
    _zones = new ZonesResource._internal(this);
    _instances = new InstancesResource._internal(this);
    _machineTypes = new MachineTypesResource._internal(this);
    _images = new ImagesResource._internal(this);
    _firewalls = new FirewallsResource._internal(this);
    _networks = new NetworksResource._internal(this);
    _projects = new ProjectsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}compute/v1beta12/20120712 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage your Google Compute Engine resources */
  static final core.String COMPUTE_SCOPE = "https://www.googleapis.com/auth/compute";

  /** OAuth2 scope: View your Google Compute Engine resources */
  static final core.String COMPUTE_READONLY_SCOPE = "https://www.googleapis.com/auth/compute.readonly";

  /** OAuth2 scope: View your data in Google Cloud Storage */
  static final core.String DEVSTORAGE_READ_ONLY_SCOPE = "https://www.googleapis.com/auth/devstorage.read_only";
}

// Resource .OperationsResource
class OperationsResource extends core.Object {
  final ComputeApi _$service;
  
  OperationsResource._internal(ComputeApi $service) : _$service = $service;

  // Method OperationsResource.Get
  /**
   * Retrieves the specified operation resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [operation] Name of the operation resource to return.
   */
  core.Future<Operation> get(core.String project, core.String operation) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["operation"] = operation;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/operations/{operation}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method OperationsResource.List
  /**
   * Retrieves the list of operation resources contained within the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<OperationList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/operations";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => OperationList.parse(JSON.parse($text)));
  }

  // Method OperationsResource.Delete
  /**
   * Deletes the specified operation resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [operation] Name of the operation resource to delete.
   */
  core.Future delete(core.String project, core.String operation) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["operation"] = operation;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/operations/{operation}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Resource .KernelsResource
class KernelsResource extends core.Object {
  final ComputeApi _$service;
  
  KernelsResource._internal(ComputeApi $service) : _$service = $service;

  // Method KernelsResource.List
  /**
   * Retrieves the list of kernel resources available to the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<KernelList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/kernels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => KernelList.parse(JSON.parse($text)));
  }

  // Method KernelsResource.Get
  /**
   * Returns the specified kernel resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [kernel] Name of the kernel resource to return.
   */
  core.Future<Kernel> get(core.String project, core.String kernel) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["kernel"] = kernel;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/kernels/{kernel}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Kernel.parse(JSON.parse($text)));
  }
}

// Resource .DisksResource
class DisksResource extends core.Object {
  final ComputeApi _$service;
  
  DisksResource._internal(ComputeApi $service) : _$service = $service;

  // Method DisksResource.Insert
  /**
   * Creates a persistent disk resource in the specified project using the data included in the
   * request.
   *
   *    * [content] the Disk
   *    * [project] Name of the project scoping this request.
   */
  core.Future<Operation> insert(core.String project, Disk content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Disk.serialize(content));
    final $path = "{project}/disks";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method DisksResource.Get
  /**
   * Returns the specified persistent disk resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [disk] Name of the persistent disk resource to return.
   */
  core.Future<Disk> get(core.String project, core.String disk) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["disk"] = disk;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/disks/{disk}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Disk.parse(JSON.parse($text)));
  }

  // Method DisksResource.List
  /**
   * Retrieves the list of persistent disk resources contained within the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<DiskList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/disks";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => DiskList.parse(JSON.parse($text)));
  }

  // Method DisksResource.Delete
  /**
   * Deletes the specified persistent disk resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [disk] Name of the persistent disk resource to delete.
   */
  core.Future<Operation> delete(core.String project, core.String disk) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["disk"] = disk;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/disks/{disk}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }
}

// Resource .SnapshotsResource
class SnapshotsResource extends core.Object {
  final ComputeApi _$service;
  
  SnapshotsResource._internal(ComputeApi $service) : _$service = $service;

  // Method SnapshotsResource.Insert
  /**
   * Creates a persistent disk snapshot resource in the specified project using the data included in
   * the request.
   *
   *    * [content] the Snapshot
   *    * [project] Name of the project scoping this request.
   */
  core.Future<Operation> insert(core.String project, Snapshot content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Snapshot.serialize(content));
    final $path = "{project}/snapshots";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method SnapshotsResource.Get
  /**
   * Returns the specified persistent disk snapshot resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [snapshot] Name of the persistent disk snapshot resource to return.
   */
  core.Future<Snapshot> get(core.String project, core.String snapshot) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["snapshot"] = snapshot;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/snapshots/{snapshot}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Snapshot.parse(JSON.parse($text)));
  }

  // Method SnapshotsResource.List
  /**
   * Retrieves the list of persistent disk snapshot resources contained within the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<SnapshotList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/snapshots";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SnapshotList.parse(JSON.parse($text)));
  }

  // Method SnapshotsResource.Delete
  /**
   * Deletes the specified persistent disk snapshot resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [snapshot] Name of the persistent disk snapshot resource to delete.
   */
  core.Future<Operation> delete(core.String project, core.String snapshot) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["snapshot"] = snapshot;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/snapshots/{snapshot}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }
}

// Resource .ZonesResource
class ZonesResource extends core.Object {
  final ComputeApi _$service;
  
  ZonesResource._internal(ComputeApi $service) : _$service = $service;

  // Method ZonesResource.List
  /**
   * Retrieves the list of zone resources available to the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<ZoneList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/zones";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ZoneList.parse(JSON.parse($text)));
  }

  // Method ZonesResource.Get
  /**
   * Returns the specified zone resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [zone] Name of the zone resource to return.
   */
  core.Future<Zone> get(core.String project, core.String zone) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["zone"] = zone;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/zones/{zone}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Zone.parse(JSON.parse($text)));
  }
}

// Resource .InstancesResource
class InstancesResource extends core.Object {
  final ComputeApi _$service;
  
  InstancesResource._internal(ComputeApi $service) : _$service = $service;

  // Method InstancesResource.Insert
  /**
   * Creates an instance resource in the specified project using the data included in the request.
   *
   *    * [content] the Instance
   *    * [project] Name of the project scoping this request.
   */
  core.Future<Operation> insert(core.String project, Instance content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Instance.serialize(content));
    final $path = "{project}/instances";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method InstancesResource.DeleteAccessConfig
  /**
   * Deletes an access config from an instance's network interface.
   *
   *    * [project] Project name.
   *    * [instance] Instance name.
   *    * [accessConfig] Access config name.
   *    * [networkInterface] Network interface name.
   */
  core.Future<Operation> deleteAccessConfig(core.String project, core.String instance, core.String accessConfig, core.String networkInterface) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["instance"] = instance;
    if (?accessConfig) $queryParams["access_config"] = accessConfig;
    if (?networkInterface) $queryParams["network_interface"] = networkInterface;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/instances/{instance}/delete-access-config";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method InstancesResource.Get
  /**
   * Returns the specified instance resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [instance] Name of the instance resource to return.
   */
  core.Future<Instance> get(core.String project, core.String instance) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["instance"] = instance;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/instances/{instance}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Instance.parse(JSON.parse($text)));
  }

  // Method InstancesResource.List
  /**
   * Retrieves the list of instance resources contained within the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<InstanceList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/instances";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => InstanceList.parse(JSON.parse($text)));
  }

  // Method InstancesResource.AddAccessConfig
  /**
   * Adds an access config to an instance's network interface.
   *
   *    * [content] the AccessConfig
   *    * [project] Project name.
   *    * [instance] Instance name.
   *    * [networkInterface] Network interface name.
   */
  core.Future<Operation> addAccessConfig(core.String project, core.String instance, core.String networkInterface, AccessConfig content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["instance"] = instance;
    if (?networkInterface) $queryParams["network_interface"] = networkInterface;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AccessConfig.serialize(content));
    final $path = "{project}/instances/{instance}/add-access-config";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method InstancesResource.Delete
  /**
   * Deletes the specified instance resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [instance] Name of the instance resource to delete.
   */
  core.Future<Operation> delete(core.String project, core.String instance) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["instance"] = instance;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/instances/{instance}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }
}

// Resource .MachineTypesResource
class MachineTypesResource extends core.Object {
  final ComputeApi _$service;
  
  MachineTypesResource._internal(ComputeApi $service) : _$service = $service;

  // Method MachineTypesResource.List
  /**
   * Retrieves the list of machine type resources available to the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<MachineTypeList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/machine-types";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => MachineTypeList.parse(JSON.parse($text)));
  }

  // Method MachineTypesResource.Get
  /**
   * Returns the specified machine type resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [machineType] Name of the machine type resource to return.
   */
  core.Future<MachineType> get(core.String project, core.String machineType) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["machineType"] = machineType;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/machine-types/{machineType}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => MachineType.parse(JSON.parse($text)));
  }
}

// Resource .ImagesResource
class ImagesResource extends core.Object {
  final ComputeApi _$service;
  
  ImagesResource._internal(ComputeApi $service) : _$service = $service;

  // Method ImagesResource.Insert
  /**
   * Creates an image resource in the specified project using the data included in the request.
   *
   *    * [content] the Image
   *    * [project] Name of the project scoping this request.
   */
  core.Future<Operation> insert(core.String project, Image content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Image.serialize(content));
    final $path = "{project}/images";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method ImagesResource.Get
  /**
   * Returns the specified image resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [image] Name of the image resource to return.
   */
  core.Future<Image> get(core.String project, core.String image) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["image"] = image;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/images/{image}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Image.parse(JSON.parse($text)));
  }

  // Method ImagesResource.List
  /**
   * Retrieves the list of image resources available to the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<ImageList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/images";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ImageList.parse(JSON.parse($text)));
  }

  // Method ImagesResource.Delete
  /**
   * Deletes the specified image resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [image] Name of the image resource to delete.
   */
  core.Future<Operation> delete(core.String project, core.String image) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["image"] = image;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/images/{image}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }
}

// Resource .FirewallsResource
class FirewallsResource extends core.Object {
  final ComputeApi _$service;
  
  FirewallsResource._internal(ComputeApi $service) : _$service = $service;

  // Method FirewallsResource.Insert
  /**
   * Creates a firewall resource in the specified project using the data included in the request.
   *
   *    * [content] the Firewall
   *    * [project] Name of the project scoping this request.
   */
  core.Future<Operation> insert(core.String project, Firewall content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Firewall.serialize(content));
    final $path = "{project}/firewalls";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method FirewallsResource.Get
  /**
   * Returns the specified firewall resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [firewall] Name of the firewall resource to return.
   */
  core.Future<Firewall> get(core.String project, core.String firewall) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["firewall"] = firewall;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/firewalls/{firewall}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Firewall.parse(JSON.parse($text)));
  }

  // Method FirewallsResource.List
  /**
   * Retrieves the list of firewall resources available to the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<FirewallList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/firewalls";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => FirewallList.parse(JSON.parse($text)));
  }

  // Method FirewallsResource.Update
  /**
   * Updates the specified firewall resource with the data included in the request.
   *
   *    * [content] the Firewall
   *    * [project] Name of the project scoping this request.
   *    * [firewall] Name of the firewall resource to update.
   */
  core.Future<Operation> update(core.String project, core.String firewall, Firewall content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["firewall"] = firewall;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Firewall.serialize(content));
    final $path = "{project}/firewalls/{firewall}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method FirewallsResource.Patch
  /**
   * Updates the specified firewall resource with the data included in the request. This method
   * supports patch semantics.
   *
   *    * [content] the Firewall
   *    * [project] Name of the project scoping this request.
   *    * [firewall] Name of the firewall resource to update.
   */
  core.Future<Operation> patch(core.String project, core.String firewall, Firewall content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["firewall"] = firewall;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Firewall.serialize(content));
    final $path = "{project}/firewalls/{firewall}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method FirewallsResource.Delete
  /**
   * Deletes the specified firewall resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [firewall] Name of the firewall resource to delete.
   */
  core.Future<Operation> delete(core.String project, core.String firewall) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["firewall"] = firewall;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/firewalls/{firewall}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }
}

// Resource .NetworksResource
class NetworksResource extends core.Object {
  final ComputeApi _$service;
  
  NetworksResource._internal(ComputeApi $service) : _$service = $service;

  // Method NetworksResource.Insert
  /**
   * Creates a network resource in the specified project using the data included in the request.
   *
   *    * [content] the Network
   *    * [project] Name of the project scoping this request.
   */
  core.Future<Operation> insert(core.String project, Network content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Network.serialize(content));
    final $path = "{project}/networks";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }

  // Method NetworksResource.Get
  /**
   * Returns the specified network resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [network] Name of the network resource to return.
   */
  core.Future<Network> get(core.String project, core.String network) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["network"] = network;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/networks/{network}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Network.parse(JSON.parse($text)));
  }

  // Method NetworksResource.List
  /**
   * Retrieves the list of network resources available to the specified project.
   *
   *    * [project] Name of the project scoping this request.
   *    * [filter] Optional. Filter expression for filtering listed resources.
   *    * [pageToken] Optional. Tag returned by a previous list request truncated by maxResults. Used to continue a
   *        previous list request.
   *    * [maxResults] Optional. Maximum count of results to be returned. Maximum and default value is 100.
  Default: 100.
   *        Minimum: 0.
  Maximum: 100.
   */
  core.Future<NetworkList> list(core.String project, {core.String filter, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (?filter) $queryParams["filter"] = filter;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/networks";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => NetworkList.parse(JSON.parse($text)));
  }

  // Method NetworksResource.Delete
  /**
   * Deletes the specified network resource.
   *
   *    * [project] Name of the project scoping this request.
   *    * [network] Name of the network resource to delete.
   */
  core.Future<Operation> delete(core.String project, core.String network) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["network"] = network;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/networks/{network}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Operation.parse(JSON.parse($text)));
  }
}

// Resource .ProjectsResource
class ProjectsResource extends core.Object {
  final ComputeApi _$service;
  
  ProjectsResource._internal(ComputeApi $service) : _$service = $service;

  // Method ProjectsResource.SetCommonInstanceMetadata
  /**
   * Sets metadata common to all instances within the specified project using the data included in the
   * request.
   *
   *    * [content] the Metadata
   *    * [project] Name of the project scoping this request.
   */
  core.Future setCommonInstanceMetadata(core.String project, Metadata content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Metadata.serialize(content));
    final $path = "{project}/set-common-instance-metadata";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method ProjectsResource.Get
  /**
   * Returns the specified project resource.
   *
   *    * [project] Name of the project resource to retrieve.
   */
  core.Future<Project> get(core.String project) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Project.parse(JSON.parse($text)));
  }
}

// Schema .AccessConfig
class AccessConfig extends IdentityHash {
  /** Type of the resource. */
  core.String kind;

  /**
 * Type of configuration. Must be set to "ONE_TO_ONE_NAT". This configures port-for-port NAT to the
 * internet.
 */
  core.String type;

  /** Name of this access configuration. */
  core.String name;

  /**
 * An external IP address associated with this instance. Specify an unused static IP address
 * available to the project. If left blank, the external IP will be drawn from a shared ephemeral
 * pool.
 */
  core.String natIP;

  /** Parses an instance from its JSON representation. */
  static AccessConfig parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AccessConfig();
    result.kind = identity(json["kind"]);
    result.type = identity(json["type"]);
    result.name = identity(json["name"]);
    result.natIP = identity(json["natIP"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AccessConfig value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["type"] = identity(value.type);
    result["name"] = identity(value.name);
    result["natIP"] = identity(value.natIP);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AttachedDisk
class AttachedDisk extends IdentityHash {
  /**
 * Persistent disk only; must be unique within the instance when specified. This represents a unique
 * device name that is reflected into the /dev/ tree of a Linux operating system running within the
 * instance. If not specified, a default will be chosen by the system.
 */
  core.String deviceName;

  /** Type of the resource. */
  core.String kind;

  /**
 * A zero-based index to assign to this disk, where 0 is reserved for the boot disk. If not
 * specified, the server will choose an appropriate value.
 */
  core.int index;

  /** Persistent disk only; the URL of the persistent disk resource. */
  core.String source;

  /** The mode in which to attach this disk, either "READ_WRITE" or "READ_ONLY". */
  core.String mode;

  /**
 * Persistent disk only; If true, delete the disk and all its data when the associated instance is
 * deleted. This property defaults to false if not specified.
 */
  core.bool deleteOnTerminate;

  /**
 * Type of the disk, either "EPHEMERAL" or "PERSISTENT". Note that persistent disks must be created
 * before you can specify them here.
 */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static AttachedDisk parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AttachedDisk();
    result.deviceName = identity(json["deviceName"]);
    result.kind = identity(json["kind"]);
    result.index = identity(json["index"]);
    result.source = identity(json["source"]);
    result.mode = identity(json["mode"]);
    result.deleteOnTerminate = identity(json["deleteOnTerminate"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AttachedDisk value) {
    if (value == null) return null;
    final result = {};
    result["deviceName"] = identity(value.deviceName);
    result["kind"] = identity(value.kind);
    result["index"] = identity(value.index);
    result["source"] = identity(value.source);
    result["mode"] = identity(value.mode);
    result["deleteOnTerminate"] = identity(value.deleteOnTerminate);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Disk
class Disk extends IdentityHash {
  /** The status of disk creation (output only). */
  core.String status;

  /**
 * The source snapshot used to create this disk. Once the source snapshot has been deleted from the
 * system, this field will be cleared, and will not be set even if a snapshot with the same name has
 * been re-created.
 */
  core.String sourceSnapshot;

  /** Type of the resource. */
  core.String kind;

  /**
 * An optional textual description of the resource; provided by the client when the resource is
 * created.
 */
  core.String description;

  /** Size of the persistent disk, specified in GB. */
  core.String sizeGb;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /**
 * The 'id' value of the snapshot used to create this disk. This value may be used to determine
 * whether the disk was created from the current or a previous instance of a given disk snapshot.
 */
  core.String sourceSnapshotId;

  /**
 * URL for the zone where the persistent disk resides; provided by the client when the disk is
 * created. A persistent disk must reside in the same zone as the instance to which it is attached.
 */
  core.String zone;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Internal use only. */
  core.String options;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /**
 * Name of the resource; provided by the client when the resource is created. The name must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Disk parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Disk();
    result.status = identity(json["status"]);
    result.sourceSnapshot = identity(json["sourceSnapshot"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.sizeGb = identity(json["sizeGb"]);
    result.id = identity(json["id"]);
    result.sourceSnapshotId = identity(json["sourceSnapshotId"]);
    result.zone = identity(json["zone"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.options = identity(json["options"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Disk value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["sourceSnapshot"] = identity(value.sourceSnapshot);
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["sizeGb"] = identity(value.sizeGb);
    result["id"] = identity(value.id);
    result["sourceSnapshotId"] = identity(value.sourceSnapshotId);
    result["zone"] = identity(value.zone);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["options"] = identity(value.options);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DiskList
class DiskList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The persistent disk resources. */
  core.List<Disk> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static DiskList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DiskList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Disk.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DiskList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Disk.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Firewall
class Firewall extends IdentityHash {
  /** Type of the resource. */
  core.String kind;

  /**
 * An optional textual description of the resource; provided by the client when the resource is
 * created.
 */
  core.String description;

  /**
 * A list of instance tags which this rule applies to. One or both of sourceRanges and sourceTags
 * may be set; an inbound connection is allowed if either the range or the tag of the source
 * matches.
 */
  core.List<core.String> sourceTags;

  /**
 * A list of IP address blocks expressed in CIDR format which this rule applies to. One or both of
 * sourceRanges and sourceTags may be set; an inbound connection is allowed if either the range or
 * the tag of the source matches.
 */
  core.List<core.String> sourceRanges;

  /**
 * URL of the network to which this firewall is applied; provided by the client when the firewall is
 * created.
 */
  core.String network;

  /**
 * A list of instance tags indicating sets of instances located on network which may make network
 * connections as specified in allowed. If no targetTags are specified, the firewall rule applies to
 * all instances on the specified network.
 */
  core.List<core.String> targetTags;

  /**
 * The list of rules specified by this firewall. Each rule specifies a protocol and port-range tuple
 * that describes a permitted connection.
 */
  core.List<FirewallAllowed> allowed;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /**
 * Name of the resource; provided by the client when the resource is created. The name must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Firewall parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Firewall();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.sourceTags = map(identity)(json["sourceTags"]);
    result.sourceRanges = map(identity)(json["sourceRanges"]);
    result.network = identity(json["network"]);
    result.targetTags = map(identity)(json["targetTags"]);
    result.allowed = map(FirewallAllowed.parse)(json["allowed"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Firewall value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["sourceTags"] = map(identity)(value.sourceTags);
    result["sourceRanges"] = map(identity)(value.sourceRanges);
    result["network"] = identity(value.network);
    result["targetTags"] = map(identity)(value.targetTags);
    result["allowed"] = map(FirewallAllowed.serialize)(value.allowed);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Firewall.FirewallAllowed
class FirewallAllowed extends IdentityHash {
  /**
 * Required; this is the IP protocol that is allowed for this rule. This can either be a well known
 * protocol string (tcp, udp or icmp) or the IP protocol number.
 */
  core.String iPProtocol;

  /**
 * An optional list of ports which are allowed. It is an error to specify this for any protocol that
 * isn't UDP or TCP. Each entry must be either an integer or a range. If not specified, connections
 * through any port are allowed. Example inputs include: ["22"], ["80,"443"] and ["12345-12349"].
 */
  core.List<core.String> ports;

  /** Parses an instance from its JSON representation. */
  static FirewallAllowed parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FirewallAllowed();
    result.iPProtocol = identity(json["IPProtocol"]);
    result.ports = map(identity)(json["ports"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FirewallAllowed value) {
    if (value == null) return null;
    final result = {};
    result["IPProtocol"] = identity(value.iPProtocol);
    result["ports"] = map(identity)(value.ports);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FirewallList
class FirewallList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The firewall resources. */
  core.List<Firewall> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static FirewallList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FirewallList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Firewall.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FirewallList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Firewall.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Image
class Image extends IdentityHash {
  /** Type of the resource. */
  core.String kind;

  /** Textual description of the resource; provided by the client when the resource is created. */
  core.String description;

  /** The raw disk image parameters. */
  ImageRawDisk rawDisk;

  /**
 * An optional URL of the preferred kernel for use with this disk image. If not specified, a server
 * defined default kernel will be used.
 */
  core.String preferredKernel;

  /** Not yet implemented. */
  ImageDiskSnapshot diskSnapshot;

  /** Must be "RAW"; provided by the client when the disk image is created. */
  core.String sourceType;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /**
 * Name of the resource; provided by the client when the resource is created. The name must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Image parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Image();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.rawDisk = ImageRawDisk.parse(json["rawDisk"]);
    result.preferredKernel = identity(json["preferredKernel"]);
    result.diskSnapshot = ImageDiskSnapshot.parse(json["diskSnapshot"]);
    result.sourceType = identity(json["sourceType"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Image value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["rawDisk"] = ImageRawDisk.serialize(value.rawDisk);
    result["preferredKernel"] = identity(value.preferredKernel);
    result["diskSnapshot"] = ImageDiskSnapshot.serialize(value.diskSnapshot);
    result["sourceType"] = identity(value.sourceType);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Image.ImageDiskSnapshot
class ImageDiskSnapshot extends IdentityHash {
  /** URL of the disk snapshot. */
  core.String source;

  /** Parses an instance from its JSON representation. */
  static ImageDiskSnapshot parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ImageDiskSnapshot();
    result.source = identity(json["source"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ImageDiskSnapshot value) {
    if (value == null) return null;
    final result = {};
    result["source"] = identity(value.source);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ImageList
class ImageList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The disk image resources. */
  core.List<Image> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ImageList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ImageList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Image.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ImageList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Image.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Image.ImageRawDisk
class ImageRawDisk extends IdentityHash {
  /**
 * The format used to encode and transmit the block device. Should be TAR. This is just a container
 * and transmission format and not a runtime format. Provided by the client when the disk image is
 * created.
 */
  core.String containerType;

  /**
 * The full Google Cloud Storage URL where the disk image is stored; provided by the client when the
 * disk image is created.
 */
  core.String source;

  /**
 * An optional SHA1 checksum of the disk image before unpackaging; provided by the client when the
 * disk image is created.
 */
  core.String sha1Checksum;

  /** Parses an instance from its JSON representation. */
  static ImageRawDisk parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ImageRawDisk();
    result.containerType = identity(json["containerType"]);
    result.source = identity(json["source"]);
    result.sha1Checksum = identity(json["sha1Checksum"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ImageRawDisk value) {
    if (value == null) return null;
    final result = {};
    result["containerType"] = identity(value.containerType);
    result["source"] = identity(value.source);
    result["sha1Checksum"] = identity(value.sha1Checksum);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Instance
class Instance extends IdentityHash {
  /**
 * Instance status. One of the following values: "PROVISIONING", "STAGING", "RUNNING" (output only).
 */
  core.String status;

  /** Type of the resource. */
  core.String kind;

  /**
 * URL of the machine type resource describing which machine type to use to host the instance;
 * provided by the client when the instance is created.
 */
  core.String machineType;

  /**
 * An optional textual description of the resource; provided by the client when the resource is
 * created.
 */
  core.String description;

  /**
 * URL of the zone resource describing where this instance should be hosted; provided by the client
 * when the instance is created.
 */
  core.String zone;

  /**
 * An optional set of tags applied to this instance. Used to identify valid sources or targets for
 * network firewalls. Provided by the client when the instance is created. Each tag must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.List<core.String> tags;

  /**
 * An optional URL of the disk image resource to be to be installed on this instance; provided by
 * the client when the instance is created. If not specified, the server will choose a default
 * image.
 */
  core.String image;

  /**
 * Array of disks associated with this instance. Persistent disks must be created before you can
 * assign them.
 */
  core.List<AttachedDisk> disks;

  /**
 * Name of the resource; provided by the client when the resource is created. The name must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.String name;

  /** An optional, human-readable explanation of the status (output only). */
  core.String statusMessage;

  /**
 * A list of service accounts each with specified scopes, for which access tokens are to be made
 * available to the instance through metadata queries.
 */
  core.List<ServiceAccount> serviceAccounts;

  /**
 * Array of configurations for this interface. This specifies how this interface is configured to
 * interact with other network services, such as connecting to the internet. Currently,
 * ONE_TO_ONE_NAT is the only access config supported. If there are no accessConfigs specified, then
 * this instance will have no external internet access.
 */
  core.List<NetworkInterface> networkInterfaces;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /**
 * Metadata key/value pairs assigned to this instance. Consists of custom metadata or predefined
 * keys; see Instance documentation for more information.
 */
  Metadata metadata;

  /** Parses an instance from its JSON representation. */
  static Instance parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Instance();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.machineType = identity(json["machineType"]);
    result.description = identity(json["description"]);
    result.zone = identity(json["zone"]);
    result.tags = map(identity)(json["tags"]);
    result.image = identity(json["image"]);
    result.disks = map(AttachedDisk.parse)(json["disks"]);
    result.name = identity(json["name"]);
    result.statusMessage = identity(json["statusMessage"]);
    result.serviceAccounts = map(ServiceAccount.parse)(json["serviceAccounts"]);
    result.networkInterfaces = map(NetworkInterface.parse)(json["networkInterfaces"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.metadata = Metadata.parse(json["metadata"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Instance value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["machineType"] = identity(value.machineType);
    result["description"] = identity(value.description);
    result["zone"] = identity(value.zone);
    result["tags"] = map(identity)(value.tags);
    result["image"] = identity(value.image);
    result["disks"] = map(AttachedDisk.serialize)(value.disks);
    result["name"] = identity(value.name);
    result["statusMessage"] = identity(value.statusMessage);
    result["serviceAccounts"] = map(ServiceAccount.serialize)(value.serviceAccounts);
    result["networkInterfaces"] = map(NetworkInterface.serialize)(value.networkInterfaces);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["metadata"] = Metadata.serialize(value.metadata);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .InstanceList
class InstanceList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** A list of instance resources. */
  core.List<Instance> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static InstanceList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new InstanceList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Instance.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(InstanceList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Instance.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Kernel
class Kernel extends IdentityHash {
  /** Type of the resource. */
  core.String kind;

  /** An optional textual description of the resource. */
  core.String description;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /** Name of the resource. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Kernel parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Kernel();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Kernel value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .KernelList
class KernelList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The kernel resources. */
  core.List<Kernel> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static KernelList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new KernelList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Kernel.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(KernelList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Kernel.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .MachineType
class MachineType extends IdentityHash {
  /** Count of CPUs exposed to the instance. */
  core.int guestCpus;

  /** Space allotted for the image, defined in GB. */
  core.int imageSpaceGb;

  /** Type of the resource. */
  core.String kind;

  /** List of extended ephemeral disks assigned to the instance. */
  core.List<MachineTypeEphemeralDisks> ephemeralDisks;

  /** Maximum total persistent disks size (GB) allowed. */
  core.String maximumPersistentDisksSizeGb;

  /** An optional textual description of the resource. */
  core.String description;

  /** Maximum persistent disks allowed. */
  core.int maximumPersistentDisks;

  /** Name of the resource. */
  core.String name;

  /** Physical memory assigned to the instance, defined in MB. */
  core.int memoryMb;

  /** The zones that this machine type can run in. */
  core.List<core.Object> availableZone;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /** Count of physical CPUs reserved on the virtual machine host. Deprecated. */
  core.int hostCpus;

  /** Parses an instance from its JSON representation. */
  static MachineType parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new MachineType();
    result.guestCpus = identity(json["guestCpus"]);
    result.imageSpaceGb = identity(json["imageSpaceGb"]);
    result.kind = identity(json["kind"]);
    result.ephemeralDisks = map(MachineTypeEphemeralDisks.parse)(json["ephemeralDisks"]);
    result.maximumPersistentDisksSizeGb = identity(json["maximumPersistentDisksSizeGb"]);
    result.description = identity(json["description"]);
    result.maximumPersistentDisks = identity(json["maximumPersistentDisks"]);
    result.name = identity(json["name"]);
    result.memoryMb = identity(json["memoryMb"]);
    result.availableZone = map(identity)(json["availableZone"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.hostCpus = identity(json["hostCpus"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(MachineType value) {
    if (value == null) return null;
    final result = {};
    result["guestCpus"] = identity(value.guestCpus);
    result["imageSpaceGb"] = identity(value.imageSpaceGb);
    result["kind"] = identity(value.kind);
    result["ephemeralDisks"] = map(MachineTypeEphemeralDisks.serialize)(value.ephemeralDisks);
    result["maximumPersistentDisksSizeGb"] = identity(value.maximumPersistentDisksSizeGb);
    result["description"] = identity(value.description);
    result["maximumPersistentDisks"] = identity(value.maximumPersistentDisks);
    result["name"] = identity(value.name);
    result["memoryMb"] = identity(value.memoryMb);
    result["availableZone"] = map(identity)(value.availableZone);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["hostCpus"] = identity(value.hostCpus);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema MachineType.MachineTypeEphemeralDisks
class MachineTypeEphemeralDisks extends IdentityHash {
  /** Size of the ephemeral disk, defined in GB. */
  core.int diskGb;

  /** Parses an instance from its JSON representation. */
  static MachineTypeEphemeralDisks parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new MachineTypeEphemeralDisks();
    result.diskGb = identity(json["diskGb"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(MachineTypeEphemeralDisks value) {
    if (value == null) return null;
    final result = {};
    result["diskGb"] = identity(value.diskGb);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .MachineTypeList
class MachineTypeList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The machine type resources. */
  core.List<MachineType> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static MachineTypeList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new MachineTypeList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(MachineType.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(MachineTypeList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(MachineType.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Metadata
class Metadata extends IdentityHash {
  /** Array of key/value pairs. The total size of all keys and values must be less than 512 KB. */
  core.List<MetadataItems> items;

  /** Type of the resource. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Metadata parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Metadata();
    result.items = map(MetadataItems.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Metadata value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(MetadataItems.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Metadata.MetadataItems
class MetadataItems extends IdentityHash {
  /**
 * Value for the metadata entry. These are free-form strings, and only have meaning as interpreted
 * by the image running in the instance. The only restriction placed on values is that their size
 * must be less than or equal to 15000 bytes.
 */
  core.String value;

  /**
 * Key for the metadata entry. Keys must conform to the following regexp: [a-zA-Z0-9-_]+, and be
 * less than 128 bytes in length. This is reflected as part of a URL in the metadata server.
 * Additionally, to avoid ambiguity, keys must be unique.
 */
  core.String key;

  /** Parses an instance from its JSON representation. */
  static MetadataItems parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new MetadataItems();
    result.value = identity(json["value"]);
    result.key = identity(json["key"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(MetadataItems value) {
    if (value == null) return null;
    final result = {};
    result["value"] = identity(value.value);
    result["key"] = identity(value.key);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Network
class Network extends IdentityHash {
  /** Type of the resource. */
  core.String kind;

  /**
 * An optional textual description of the resource; provided by the client when the resource is
 * created.
 */
  core.String description;

  /**
 * Required; The range of internal addresses that are legal on this network. This range is a CIDR
 * specification, for example: 192.168.0.0/16. Provided by the client when the network is created.
 */
  core.String iPv4Range;

  /**
 * An optional address that is used for default routing to other networks. This must be within the
 * range specified by IPv4Range, and is typically the first usable address in that range. If not
 * specified, the default value is the first usable address in IPv4Range.
 */
  core.String gatewayIPv4;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /**
 * Name of the resource; provided by the client when the resource is created. The name must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Network parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Network();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.iPv4Range = identity(json["IPv4Range"]);
    result.gatewayIPv4 = identity(json["gatewayIPv4"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Network value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["IPv4Range"] = identity(value.iPv4Range);
    result["gatewayIPv4"] = identity(value.gatewayIPv4);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .NetworkInterface
class NetworkInterface extends IdentityHash {
  /** URL of the network resource attached to this interface. */
  core.String network;

  /**
 * Array of configurations for this interface. This specifies how this interface is configured to
 * interact with other network services, such as connecting to the internet. Currently,
 * ONE_TO_ONE_NAT is the only access config supported. If there are no accessConfigs specified, then
 * this instance will have no external internet access.
 */
  core.List<AccessConfig> accessConfigs;

  /**
 * An optional IPV4 internal network address to assign to this instance. If not specified, one will
 * be assigned from the available range.
 */
  core.String networkIP;

  /** Type of the resource. */
  core.String kind;

  /**
 * Name of the resource, determined by the server; for network devices, these are e.g. eth0, eth1,
 * etc. (output only).
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static NetworkInterface parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new NetworkInterface();
    result.network = identity(json["network"]);
    result.accessConfigs = map(AccessConfig.parse)(json["accessConfigs"]);
    result.networkIP = identity(json["networkIP"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(NetworkInterface value) {
    if (value == null) return null;
    final result = {};
    result["network"] = identity(value.network);
    result["accessConfigs"] = map(AccessConfig.serialize)(value.accessConfigs);
    result["networkIP"] = identity(value.networkIP);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .NetworkList
class NetworkList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The network resources. */
  core.List<Network> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static NetworkList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new NetworkList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Network.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(NetworkList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Network.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Operation
class Operation extends IdentityHash {
  /**
 * Status of the operation. Can be one of the following: "PENDING", "RUNNING", or "DONE" (output
 * only).
 */
  core.String status;

  /** Type of the resource. */
  core.String kind;

  /** Name of the resource. */
  core.String name;

  /**
 * The time that this operation was started by the server. This is in RFC 3339 format (output only).
 */
  core.String startTime;

  /** If operation fails, the HTTP error status code returned, e.g. 404. (output only). */
  core.int httpErrorStatusCode;

  /** User who requested the operation, for example "user@example.com" (output only). */
  core.String user;

  /**
 * If errors occurred during processing of this operation, this field will be populated (output
 * only).
 */
  OperationError error;

  /** Unique target id which identifies a particular incarnation of the target (output only). */
  core.String targetId;

  /** Type of the operation. Examples include "insert", "update", and "delete" (output only). */
  core.String operationType;

  /** An optional textual description of the current status of the operation (output only). */
  core.String statusMessage;

  /** The time that this operation was requested. This is in RFC 3339 format (output only). */
  core.String insertTime;

  /** If operation fails, the HTTP error message returned, e.g. NOT FOUND. (output only). */
  core.String httpErrorMessage;

  /**
 * An optional progress indicator that ranges from 0 to 100. There is no requirement that this be
 * linear or support any granularity of operations. This should not be used to guess at when the
 * operation will be complete. This number should be monotonically increasing as the operation
 * progresses (output only).
 */
  core.int progress;

  /**
 * An optional identifier specified by the client when the mutation was initiated. Must be unique
 * for all operation resources in the project (output only).
 */
  core.String clientOperationId;

  /** The time that this operation was completed. This is in RFC 3339 format (output only). */
  core.String endTime;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /** URL of the resource the operation is mutating (output only). */
  core.String targetLink;

  /** Parses an instance from its JSON representation. */
  static Operation parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Operation();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.startTime = identity(json["startTime"]);
    result.httpErrorStatusCode = identity(json["httpErrorStatusCode"]);
    result.user = identity(json["user"]);
    result.error = OperationError.parse(json["error"]);
    result.targetId = identity(json["targetId"]);
    result.operationType = identity(json["operationType"]);
    result.statusMessage = identity(json["statusMessage"]);
    result.insertTime = identity(json["insertTime"]);
    result.httpErrorMessage = identity(json["httpErrorMessage"]);
    result.progress = identity(json["progress"]);
    result.clientOperationId = identity(json["clientOperationId"]);
    result.endTime = identity(json["endTime"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.targetLink = identity(json["targetLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Operation value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["startTime"] = identity(value.startTime);
    result["httpErrorStatusCode"] = identity(value.httpErrorStatusCode);
    result["user"] = identity(value.user);
    result["error"] = OperationError.serialize(value.error);
    result["targetId"] = identity(value.targetId);
    result["operationType"] = identity(value.operationType);
    result["statusMessage"] = identity(value.statusMessage);
    result["insertTime"] = identity(value.insertTime);
    result["httpErrorMessage"] = identity(value.httpErrorMessage);
    result["progress"] = identity(value.progress);
    result["clientOperationId"] = identity(value.clientOperationId);
    result["endTime"] = identity(value.endTime);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["targetLink"] = identity(value.targetLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Operation.OperationError
class OperationError extends IdentityHash {
  /** The array of errors encountered while processing this operation. */
  core.List<OperationErrorErrors> errors;

  /** Parses an instance from its JSON representation. */
  static OperationError parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OperationError();
    result.errors = map(OperationErrorErrors.parse)(json["errors"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OperationError value) {
    if (value == null) return null;
    final result = {};
    result["errors"] = map(OperationErrorErrors.serialize)(value.errors);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Operation.OperationError.OperationErrorErrors
class OperationErrorErrors extends IdentityHash {
  /** An optional, human-readable error message. */
  core.String message;

  /** The error type identifier for this error. */
  core.String code;

  /** Indicates the field in the request which caused the error. This property is optional. */
  core.String location;

  /** Parses an instance from its JSON representation. */
  static OperationErrorErrors parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OperationErrorErrors();
    result.message = identity(json["message"]);
    result.code = identity(json["code"]);
    result.location = identity(json["location"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OperationErrorErrors value) {
    if (value == null) return null;
    final result = {};
    result["message"] = identity(value.message);
    result["code"] = identity(value.code);
    result["location"] = identity(value.location);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OperationList
class OperationList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The operation resources. */
  core.List<Operation> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static OperationList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OperationList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Operation.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OperationList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Operation.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Project
class Project extends IdentityHash {
  /** Type of the resource. */
  core.String kind;

  /** An optional textual description of the resource. */
  core.String description;

  /** Metadata key/value pairs available to all instances contained in this project. */
  Metadata commonInstanceMetadata;

  /** Internet available IP addresses available for use in this project. */
  core.List<core.String> externalIpAddresses;

  /** Quotas assigned to this project. */
  core.List<ProjectQuotas> quotas;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /** Name of the resource. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Project parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Project();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.commonInstanceMetadata = Metadata.parse(json["commonInstanceMetadata"]);
    result.externalIpAddresses = map(identity)(json["externalIpAddresses"]);
    result.quotas = map(ProjectQuotas.parse)(json["quotas"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Project value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["commonInstanceMetadata"] = Metadata.serialize(value.commonInstanceMetadata);
    result["externalIpAddresses"] = map(identity)(value.externalIpAddresses);
    result["quotas"] = map(ProjectQuotas.serialize)(value.quotas);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Project.ProjectQuotas
class ProjectQuotas extends IdentityHash {
  /** Current usage of this metric. */
  core.double usage;

  /** Name of the quota metric. */
  core.String metric;

  /** Quota limit for this metric. */
  core.double limit;

  /** Parses an instance from its JSON representation. */
  static ProjectQuotas parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ProjectQuotas();
    result.usage = identity(json["usage"]);
    result.metric = identity(json["metric"]);
    result.limit = identity(json["limit"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ProjectQuotas value) {
    if (value == null) return null;
    final result = {};
    result["usage"] = identity(value.usage);
    result["metric"] = identity(value.metric);
    result["limit"] = identity(value.limit);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ServiceAccount
class ServiceAccount extends IdentityHash {
  /** The list of scopes to be made available for this service account. */
  core.List<core.String> scopes;

  /** Type of the resource. */
  core.String kind;

  /** Email address of the service account. */
  core.String email;

  /** Parses an instance from its JSON representation. */
  static ServiceAccount parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ServiceAccount();
    result.scopes = map(identity)(json["scopes"]);
    result.kind = identity(json["kind"]);
    result.email = identity(json["email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ServiceAccount value) {
    if (value == null) return null;
    final result = {};
    result["scopes"] = map(identity)(value.scopes);
    result["kind"] = identity(value.kind);
    result["email"] = identity(value.email);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Snapshot
class Snapshot extends IdentityHash {
  /** The status of the persistent disk snapshot (output only). */
  core.String status;

  /** Type of the resource. */
  core.String kind;

  /**
 * An optional textual description of the resource; provided by the client when the resource is
 * created.
 */
  core.String description;

  /**
 * The source disk used to create this snapshot. Once the source disk has been deleted from the
 * system, this field will be cleared, and will not be set even if a disk with the same name has
 * been re-created.
 */
  core.String sourceDisk;

  /**
 * The 'id' value of the disk used to create this snapshot. This value may be used to determine
 * whether the snapshot was taken from the current or a previous instance of a given disk name.
 */
  core.String sourceDiskId;

  /** Size of the persistent disk snapshot, specified in GB (output only). */
  core.String diskSizeGb;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /**
 * Name of the resource; provided by the client when the resource is created. The name must be 1-63
 * characters long, and comply with RFC1035.
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Snapshot parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Snapshot();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.sourceDisk = identity(json["sourceDisk"]);
    result.sourceDiskId = identity(json["sourceDiskId"]);
    result.diskSizeGb = identity(json["diskSizeGb"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Snapshot value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["sourceDisk"] = identity(value.sourceDisk);
    result["sourceDiskId"] = identity(value.sourceDiskId);
    result["diskSizeGb"] = identity(value.diskSizeGb);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SnapshotList
class SnapshotList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The persistent snapshot resources. */
  core.List<Snapshot> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static SnapshotList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SnapshotList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Snapshot.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SnapshotList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Snapshot.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Zone
class Zone extends IdentityHash {
  /** Status of the zone. "UP" or "DOWN". */
  core.String status;

  /** Type of the resource. */
  core.String kind;

  /** The machine types that can be used in this zone (output only). */
  core.List<core.Object> availableMachineType;

  /** Textual description of the resource. */
  core.String description;

  /**
 * Scheduled maintenance windows for the zone. When the zone is in a maintenance window, all
 * resources which reside in the zone will be unavailable.
 */
  core.List<ZoneMaintenanceWindows> maintenanceWindows;

  /** Creation timestamp in RFC3339 text format (output only). */
  core.String creationTimestamp;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for the resource (output only). */
  core.String selfLink;

  /** Name of the resource. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Zone parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Zone();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.availableMachineType = map(identity)(json["availableMachineType"]);
    result.description = identity(json["description"]);
    result.maintenanceWindows = map(ZoneMaintenanceWindows.parse)(json["maintenanceWindows"]);
    result.creationTimestamp = identity(json["creationTimestamp"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Zone value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["availableMachineType"] = map(identity)(value.availableMachineType);
    result["description"] = identity(value.description);
    result["maintenanceWindows"] = map(ZoneMaintenanceWindows.serialize)(value.maintenanceWindows);
    result["creationTimestamp"] = identity(value.creationTimestamp);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ZoneList
class ZoneList extends IdentityHash {
  /** A token used to continue a truncated list request (output only). */
  core.String nextPageToken;

  /** The zone resources. */
  core.List<Zone> items;

  /** Type of resource. */
  core.String kind;

  /** Unique identifier for the resource; defined by the server (output only). */
  core.String id;

  /** Server defined URL for this resource (output only). */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ZoneList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ZoneList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Zone.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ZoneList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Zone.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Zone.ZoneMaintenanceWindows
class ZoneMaintenanceWindows extends IdentityHash {
  /** End time of the maintenance window, in RFC 3339 format. */
  core.String endTime;

  /** Begin time of the maintenance window, in RFC 3339 format. */
  core.String beginTime;

  /** Name of the maintenance window. */
  core.String name;

  /** Textual description of the maintenance window. */
  core.String description;

  /** Parses an instance from its JSON representation. */
  static ZoneMaintenanceWindows parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ZoneMaintenanceWindows();
    result.endTime = identity(json["endTime"]);
    result.beginTime = identity(json["beginTime"]);
    result.name = identity(json["name"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ZoneMaintenanceWindows value) {
    if (value == null) return null;
    final result = {};
    result["endTime"] = identity(value.endTime);
    result["beginTime"] = identity(value.beginTime);
    result["name"] = identity(value.name);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum ComputeApi.Alt
class ComputeApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const ComputeApiAlt JSON = const ComputeApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<ComputeApiAlt> values = const <ComputeApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <ComputeApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ComputeApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ComputeApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

