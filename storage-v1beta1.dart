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

#library('storage-v1beta1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API StorageApi
/**
 * Lets you store and retrieve potentially-large, immutable data objects.
 */
class StorageApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  StorageApi get _$service() => this;
  ObjectAccessControlsResource _objectAccessControls;
  ObjectAccessControlsResource get objectAccessControls() => _objectAccessControls;
  BucketAccessControlsResource _bucketAccessControls;
  BucketAccessControlsResource get bucketAccessControls() => _bucketAccessControls;
  ObjectsResource _objects;
  ObjectsResource get objects() => _objects;
  BucketsResource _buckets;
  BucketsResource get buckets() => _buckets;
  
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
  StorageApiAlt alt;


  StorageApi([this.baseUrl = "https://www.googleapis.com/storage/v1beta1/", applicationName, this.authenticator]) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _objectAccessControls = new ObjectAccessControlsResource._internal(this);
    _bucketAccessControls = new BucketAccessControlsResource._internal(this);
    _objects = new ObjectsResource._internal(this);
    _buckets = new BucketsResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}storage/v1beta1/20120806 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your data and permissions in Google Cloud Storage */
  static final core.String DEVSTORAGE_FULL_CONTROL_SCOPE = "https://www.googleapis.com/auth/devstorage.full_control";

  /** OAuth2 scope: View your data in Google Cloud Storage */
  static final core.String DEVSTORAGE_READ_ONLY_SCOPE = "https://www.googleapis.com/auth/devstorage.read_only";

  /** OAuth2 scope: Manage your data in Google Cloud Storage */
  static final core.String DEVSTORAGE_READ_WRITE_SCOPE = "https://www.googleapis.com/auth/devstorage.read_write";
}

// Resource .ObjectAccessControlsResource
class ObjectAccessControlsResource extends core.Object {
  final StorageApi _$service;
  
  ObjectAccessControlsResource._internal(StorageApi $service) : _$service = $service;

  // Method ObjectAccessControlsResource.Insert
  /**
   * Creates a new ACL entry on the specified object.
   *
   *    * [content] the ObjectAccessControl
   *    * [bucket] Name of a bucket.
   *    * [object] Name of the object.
   */
  core.Future<ObjectAccessControl> insert(core.String bucket, core.String object, ObjectAccessControl content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(ObjectAccessControl.serialize(content));
    final $path = "b/{bucket}/o/{object}/acl";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => ObjectAccessControl.parse(JSON.parse($text)));
  }

  // Method ObjectAccessControlsResource.Get
  /**
   * Returns the ACL entry for the specified entity on the specified object.
   *
   *    * [bucket] Name of a bucket.
   *    * [object] Name of the object.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future<ObjectAccessControl> get(core.String bucket, core.String object, core.String entity) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/o/{object}/acl/{entity}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ObjectAccessControl.parse(JSON.parse($text)));
  }

  // Method ObjectAccessControlsResource.List
  /**
   * Retrieves ACL entries on the specified object.
   *
   *    * [bucket] Name of a bucket.
   *    * [object] Name of the object.
   */
  core.Future<ObjectAccessControls> list(core.String bucket, core.String object) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/o/{object}/acl";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ObjectAccessControls.parse(JSON.parse($text)));
  }

  // Method ObjectAccessControlsResource.Update
  /**
   * Updates an ACL entry on the specified object.
   *
   *    * [content] the ObjectAccessControl
   *    * [bucket] Name of a bucket.
   *    * [object] Name of the object.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future<ObjectAccessControl> update(core.String bucket, core.String object, core.String entity, ObjectAccessControl content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(ObjectAccessControl.serialize(content));
    final $path = "b/{bucket}/o/{object}/acl/{entity}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => ObjectAccessControl.parse(JSON.parse($text)));
  }

  // Method ObjectAccessControlsResource.Patch
  /**
   * Updates an ACL entry on the specified object. This method supports patch semantics.
   *
   *    * [content] the ObjectAccessControl
   *    * [bucket] Name of a bucket.
   *    * [object] Name of the object.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future<ObjectAccessControl> patch(core.String bucket, core.String object, core.String entity, ObjectAccessControl content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(ObjectAccessControl.serialize(content));
    final $path = "b/{bucket}/o/{object}/acl/{entity}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => ObjectAccessControl.parse(JSON.parse($text)));
  }

  // Method ObjectAccessControlsResource.Delete
  /**
   * Deletes the ACL entry for the specified entity on the specified object.
   *
   *    * [bucket] Name of a bucket.
   *    * [object] Name of the object.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future delete(core.String bucket, core.String object, core.String entity) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/o/{object}/acl/{entity}";
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

// Resource .BucketAccessControlsResource
class BucketAccessControlsResource extends core.Object {
  final StorageApi _$service;
  
  BucketAccessControlsResource._internal(StorageApi $service) : _$service = $service;

  // Method BucketAccessControlsResource.Insert
  /**
   * Creates a new ACL entry on the specified bucket.
   *
   *    * [content] the BucketAccessControl
   *    * [bucket] Name of a bucket.
   */
  core.Future<BucketAccessControl> insert(core.String bucket, BucketAccessControl content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(BucketAccessControl.serialize(content));
    final $path = "b/{bucket}/acl";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => BucketAccessControl.parse(JSON.parse($text)));
  }

  // Method BucketAccessControlsResource.Get
  /**
   * Returns the ACL entry for the specified entity on the specified bucket.
   *
   *    * [bucket] Name of a bucket.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future<BucketAccessControl> get(core.String bucket, core.String entity) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/acl/{entity}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => BucketAccessControl.parse(JSON.parse($text)));
  }

  // Method BucketAccessControlsResource.List
  /**
   * Retrieves ACL entries on the specified bucket.
   *
   *    * [bucket] Name of a bucket.
   */
  core.Future<BucketAccessControls> list(core.String bucket) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/acl";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => BucketAccessControls.parse(JSON.parse($text)));
  }

  // Method BucketAccessControlsResource.Update
  /**
   * Updates an ACL entry on the specified bucket.
   *
   *    * [content] the BucketAccessControl
   *    * [bucket] Name of a bucket.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future<BucketAccessControl> update(core.String bucket, core.String entity, BucketAccessControl content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(BucketAccessControl.serialize(content));
    final $path = "b/{bucket}/acl/{entity}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => BucketAccessControl.parse(JSON.parse($text)));
  }

  // Method BucketAccessControlsResource.Patch
  /**
   * Updates an ACL entry on the specified bucket. This method supports patch semantics.
   *
   *    * [content] the BucketAccessControl
   *    * [bucket] Name of a bucket.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future<BucketAccessControl> patch(core.String bucket, core.String entity, BucketAccessControl content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(BucketAccessControl.serialize(content));
    final $path = "b/{bucket}/acl/{entity}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => BucketAccessControl.parse(JSON.parse($text)));
  }

  // Method BucketAccessControlsResource.Delete
  /**
   * Deletes the ACL entry for the specified entity on the specified bucket.
   *
   *    * [bucket] Name of a bucket.
   *    * [entity] The entity holding the permission. Can be user-userId, group-groupId, allUsers, or
   *        allAuthenticatedUsers.
   */
  core.Future delete(core.String bucket, core.String entity) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["entity"] = entity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/acl/{entity}";
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

// Resource .ObjectsResource
class ObjectsResource extends core.Object {
  final StorageApi _$service;
  
  ObjectsResource._internal(StorageApi $service) : _$service = $service;

  // Method ObjectsResource.Insert
  /**
   * Stores new data blobs and associated metadata.
   *
   *    * [content] the Object
   *    * [bucket] Name of the bucket in which to store the new object. Overrides the provided object metadata's bucket
   *        value, if any.
   *    * [name] Name of the object. Required when the object metadata is not otherwise provided. Overrides the
   *        object metadata's name value, if any.
   *    * [projection] Set of properties to return. Defaults to no_acl, unless the object resource specifies the acl
   *        property, when it defaults to full.
   */
  core.Future<Object> insert(core.String bucket, Object content, [core.String name = UNSPECIFIED, ObjectsResourceInsertProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (UNSPECIFIED != name) $queryParams["name"] = name;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Object.serialize(content));
    final $path = "b/{bucket}/o";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Object.parse(JSON.parse($text)));
  }

  // Method ObjectsResource.Get
  /**
   * Retrieves objects or their associated metadata.
   *
   *    * [bucket] Name of the bucket in which the object resides.
   *    * [object] Name of the object.
   *    * [projection] Set of properties to return. Defaults to no_acl.
   */
  core.Future<Object> get(core.String bucket, core.String object, [ObjectsResourceGetProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/o/{object}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Object.parse(JSON.parse($text)));
  }

  // Method ObjectsResource.List
  /**
   * Retrieves a list of objects matching the criteria.
   *
   *    * [bucket] Name of the bucket in which to look for objects.
   *    * [maxResults] Maximum number of items plus prefixes to return. As duplicate prefixes are omitted, fewer total
   *        results may be returned than requested.

  Minimum: 0.
   *    * [projection] Set of properties to return. Defaults to no_acl.
   *    * [prefix] Filter results to objects whose names begin with this prefix.
   *    * [pageToken] A previously-returned page token representing part of the larger set of results to view.
   *    * [delimiter] Returns results in a directory-like mode. items will contain only objects whose names, aside from
   *        the prefix, do not contain delimiter. Objects whose names, aside from the prefix, contain
   *        delimiter will have their name, truncated after the delimiter, returned in prefixes.
   *        Duplicate prefixes are omitted.
   */
  core.Future<Objects> list(core.String bucket, [core.int maxResults = UNSPECIFIED, ObjectsResourceListProjection projection = UNSPECIFIED, core.String prefix = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.String delimiter = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (UNSPECIFIED != prefix) $queryParams["prefix"] = prefix;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != delimiter) $queryParams["delimiter"] = delimiter;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/o";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Objects.parse(JSON.parse($text)));
  }

  // Method ObjectsResource.Update
  /**
   * Updates a data blob's associated metadata.
   *
   *    * [content] the Object
   *    * [bucket] Name of the bucket in which the object resides.
   *    * [object] Name of the object.
   *    * [projection] Set of properties to return. Defaults to full.
   */
  core.Future<Object> update(core.String bucket, core.String object, Object content, [ObjectsResourceUpdateProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Object.serialize(content));
    final $path = "b/{bucket}/o/{object}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Object.parse(JSON.parse($text)));
  }

  // Method ObjectsResource.Patch
  /**
   * Updates a data blob's associated metadata. This method supports patch semantics.
   *
   *    * [content] the Object
   *    * [bucket] Name of the bucket in which the object resides.
   *    * [object] Name of the object.
   *    * [projection] Set of properties to return. Defaults to full.
   */
  core.Future<Object> patch(core.String bucket, core.String object, Object content, [ObjectsResourcePatchProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Object.serialize(content));
    final $path = "b/{bucket}/o/{object}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Object.parse(JSON.parse($text)));
  }

  // Method ObjectsResource.Delete
  /**
   * Deletes data blobs and associated metadata.
   *
   *    * [bucket] Name of the bucket in which the object resides.
   *    * [object] Name of the object.
   */
  core.Future delete(core.String bucket, core.String object) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    $pathParams["object"] = object;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}/o/{object}";
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

// Enum ObjectsResource.Insert.Projection
class ObjectsResourceInsertProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final ObjectsResourceInsertProjection FULL = const ObjectsResourceInsertProjection._internal("full", 0);
  /** Omit the acl property. */
  static final ObjectsResourceInsertProjection NO_ACL = const ObjectsResourceInsertProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<ObjectsResourceInsertProjection> values = const <ObjectsResourceInsertProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ObjectsResourceInsertProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ObjectsResourceInsertProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ObjectsResourceInsertProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum ObjectsResource.Get.Projection
class ObjectsResourceGetProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final ObjectsResourceGetProjection FULL = const ObjectsResourceGetProjection._internal("full", 0);
  /** Omit the acl property. */
  static final ObjectsResourceGetProjection NO_ACL = const ObjectsResourceGetProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<ObjectsResourceGetProjection> values = const <ObjectsResourceGetProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ObjectsResourceGetProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ObjectsResourceGetProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ObjectsResourceGetProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum ObjectsResource.List.Projection
class ObjectsResourceListProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final ObjectsResourceListProjection FULL = const ObjectsResourceListProjection._internal("full", 0);
  /** Omit the acl property. */
  static final ObjectsResourceListProjection NO_ACL = const ObjectsResourceListProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<ObjectsResourceListProjection> values = const <ObjectsResourceListProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ObjectsResourceListProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ObjectsResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ObjectsResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum ObjectsResource.Update.Projection
class ObjectsResourceUpdateProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final ObjectsResourceUpdateProjection FULL = const ObjectsResourceUpdateProjection._internal("full", 0);
  /** Omit the acl property. */
  static final ObjectsResourceUpdateProjection NO_ACL = const ObjectsResourceUpdateProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<ObjectsResourceUpdateProjection> values = const <ObjectsResourceUpdateProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ObjectsResourceUpdateProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ObjectsResourceUpdateProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ObjectsResourceUpdateProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum ObjectsResource.Patch.Projection
class ObjectsResourcePatchProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final ObjectsResourcePatchProjection FULL = const ObjectsResourcePatchProjection._internal("full", 0);
  /** Omit the acl property. */
  static final ObjectsResourcePatchProjection NO_ACL = const ObjectsResourcePatchProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<ObjectsResourcePatchProjection> values = const <ObjectsResourcePatchProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ObjectsResourcePatchProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ObjectsResourcePatchProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ObjectsResourcePatchProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Resource .BucketsResource
class BucketsResource extends core.Object {
  final StorageApi _$service;
  
  BucketsResource._internal(StorageApi $service) : _$service = $service;

  // Method BucketsResource.Insert
  /**
   * Creates a new bucket.
   *
   *    * [content] the Bucket
   *    * [projection] Set of properties to return. Defaults to no_acl, unless the bucket resource specifies acl or
   *        defaultObjectAcl properties, when it defaults to full.
   */
  core.Future<Bucket> insert(Bucket content, [BucketsResourceInsertProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Bucket.serialize(content));
    final $path = "b";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Bucket.parse(JSON.parse($text)));
  }

  // Method BucketsResource.Get
  /**
   * Returns metadata for the specified bucket.
   *
   *    * [bucket] Name of a bucket.
   *    * [projection] Set of properties to return. Defaults to no_acl.
   */
  core.Future<Bucket> get(core.String bucket, [BucketsResourceGetProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Bucket.parse(JSON.parse($text)));
  }

  // Method BucketsResource.List
  /**
   * Retrieves a list of buckets for a given project.
   *
   *    * [projectId] A valid API project identifier.
   *    * [maxResults] Maximum number of buckets to return.

  Minimum: 0.
   *    * [pageToken] A previously-returned page token representing part of the larger set of results to view.
   *    * [projection] Set of properties to return. Defaults to no_acl.
   */
  core.Future<Buckets> list(core.String projectId, [core.int maxResults = UNSPECIFIED, core.String pageToken = UNSPECIFIED, BucketsResourceListProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != projectId) $queryParams["projectId"] = projectId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Buckets.parse(JSON.parse($text)));
  }

  // Method BucketsResource.Update
  /**
   * Updates a bucket.
   *
   *    * [content] the Bucket
   *    * [bucket] Name of a bucket.
   *    * [projection] Set of properties to return. Defaults to full.
   */
  core.Future<Bucket> update(core.String bucket, Bucket content, [BucketsResourceUpdateProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Bucket.serialize(content));
    final $path = "b/{bucket}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Bucket.parse(JSON.parse($text)));
  }

  // Method BucketsResource.Patch
  /**
   * Updates a bucket. This method supports patch semantics.
   *
   *    * [content] the Bucket
   *    * [bucket] Name of a bucket.
   *    * [projection] Set of properties to return. Defaults to full.
   */
  core.Future<Bucket> patch(core.String bucket, Bucket content, [BucketsResourcePatchProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Bucket.serialize(content));
    final $path = "b/{bucket}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Bucket.parse(JSON.parse($text)));
  }

  // Method BucketsResource.Delete
  /**
   * Deletes an empty bucket.
   *
   *    * [bucket] Name of a bucket.
   */
  core.Future delete(core.String bucket) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["bucket"] = bucket;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "b/{bucket}";
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

// Enum BucketsResource.Insert.Projection
class BucketsResourceInsertProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final BucketsResourceInsertProjection FULL = const BucketsResourceInsertProjection._internal("full", 0);
  /** Omit acl and defaultObjectAcl properties. */
  static final BucketsResourceInsertProjection NO_ACL = const BucketsResourceInsertProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<BucketsResourceInsertProjection> values = const <BucketsResourceInsertProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BucketsResourceInsertProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BucketsResourceInsertProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BucketsResourceInsertProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum BucketsResource.Get.Projection
class BucketsResourceGetProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final BucketsResourceGetProjection FULL = const BucketsResourceGetProjection._internal("full", 0);
  /** Omit acl and defaultObjectAcl properties. */
  static final BucketsResourceGetProjection NO_ACL = const BucketsResourceGetProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<BucketsResourceGetProjection> values = const <BucketsResourceGetProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BucketsResourceGetProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BucketsResourceGetProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BucketsResourceGetProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum BucketsResource.List.Projection
class BucketsResourceListProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final BucketsResourceListProjection FULL = const BucketsResourceListProjection._internal("full", 0);
  /** Omit acl and defaultObjectAcl properties. */
  static final BucketsResourceListProjection NO_ACL = const BucketsResourceListProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<BucketsResourceListProjection> values = const <BucketsResourceListProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BucketsResourceListProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BucketsResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BucketsResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum BucketsResource.Update.Projection
class BucketsResourceUpdateProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final BucketsResourceUpdateProjection FULL = const BucketsResourceUpdateProjection._internal("full", 0);
  /** Omit acl and defaultObjectAcl properties. */
  static final BucketsResourceUpdateProjection NO_ACL = const BucketsResourceUpdateProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<BucketsResourceUpdateProjection> values = const <BucketsResourceUpdateProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BucketsResourceUpdateProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BucketsResourceUpdateProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BucketsResourceUpdateProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum BucketsResource.Patch.Projection
class BucketsResourcePatchProjection extends core.Object implements core.Hashable {
  /** Include all properties. */
  static final BucketsResourcePatchProjection FULL = const BucketsResourcePatchProjection._internal("full", 0);
  /** Omit acl and defaultObjectAcl properties. */
  static final BucketsResourcePatchProjection NO_ACL = const BucketsResourcePatchProjection._internal("no_acl", 1);

  /** All values of this enumeration */
  static final core.List<BucketsResourcePatchProjection> values = const <BucketsResourcePatchProjection>[
    FULL,
    NO_ACL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BucketsResourcePatchProjection>{ 
    "full": FULL,
    "no_acl": NO_ACL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BucketsResourcePatchProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BucketsResourcePatchProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Schema .Bucket
class Bucket extends IdentityHash {
  /** The bucket's website configuration. */
  BucketWebsite website;

  /** The kind of item this is. For buckets, this is always storage#bucket. */
  core.String kind;

  /** Creation time of the bucket in RFC 3339 format. */
  core.String timeCreated;

  /** The project the bucket belongs to. */
  core.String projectId;

  /** Access controls on the bucket. */
  core.List<BucketAccessControl> acl;

  /** Default access controls to apply to new objects when no ACL is provided. */
  core.List<ObjectAccessControl> defaultObjectAcl;

  /**
 * The location of the bucket. Object data for objects in the bucket resides in physical storage in
 * this location. Can be US or EU. Defaults to US.
 */
  core.String location;

  /** The owner of the bucket. This will always be the project team's owner group. */
  BucketOwner owner;

  /** The name of the bucket. */
  core.String id;

  /** The URI of this bucket. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Bucket parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Bucket();
    result.website = BucketWebsite.parse(json["website"]);
    result.kind = identity(json["kind"]);
    result.timeCreated = identity(json["timeCreated"]);
    result.projectId = identity(json["projectId"]);
    result.acl = map(BucketAccessControl.parse)(json["acl"]);
    result.defaultObjectAcl = map(ObjectAccessControl.parse)(json["defaultObjectAcl"]);
    result.location = identity(json["location"]);
    result.owner = BucketOwner.parse(json["owner"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Bucket value) {
    if (value == null) return null;
    final result = {};
    result["website"] = BucketWebsite.serialize(value.website);
    result["kind"] = identity(value.kind);
    result["timeCreated"] = identity(value.timeCreated);
    result["projectId"] = identity(value.projectId);
    result["acl"] = map(BucketAccessControl.serialize)(value.acl);
    result["defaultObjectAcl"] = map(ObjectAccessControl.serialize)(value.defaultObjectAcl);
    result["location"] = identity(value.location);
    result["owner"] = BucketOwner.serialize(value.owner);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .BucketAccessControl
class BucketAccessControl extends IdentityHash {
  /** The domain associated with the entity, if any. */
  core.String domain;

  /** The name of the bucket. */
  core.String bucket;

  /**
 * The kind of item this is. For bucket access control entries, this is always
 * storage#bucketAccessControl.
 */
  core.String kind;

  /** The ID of the access-control entry. */
  core.String id;

  /** The access permission for the entity. Can be READER, WRITER, or OWNER. */
  core.String role;

  /** The ID for the entity, if any. */
  core.String entityId;

  /**
 * The entity holding the permission, in one of the following forms: - user-userId - user-email -
 * group-groupId - group-email - allUsers - allAuthenticatedUsers
 */
  core.String entity;

  /** The email address associated with the entity, if any. */
  core.String email;

  /** The link to this access-control entry. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static BucketAccessControl parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BucketAccessControl();
    result.domain = identity(json["domain"]);
    result.bucket = identity(json["bucket"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.role = identity(json["role"]);
    result.entityId = identity(json["entityId"]);
    result.entity = identity(json["entity"]);
    result.email = identity(json["email"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BucketAccessControl value) {
    if (value == null) return null;
    final result = {};
    result["domain"] = identity(value.domain);
    result["bucket"] = identity(value.bucket);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["role"] = identity(value.role);
    result["entityId"] = identity(value.entityId);
    result["entity"] = identity(value.entity);
    result["email"] = identity(value.email);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .BucketAccessControls
class BucketAccessControls extends IdentityHash {
  /** The list of items. */
  core.List<BucketAccessControl> items;

  /**
 * The kind of item this is. For lists of bucket access control entries, this is always
 * storage#bucketAccessControls.
 */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static BucketAccessControls parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BucketAccessControls();
    result.items = map(BucketAccessControl.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BucketAccessControls value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(BucketAccessControl.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Bucket.BucketOwner
class BucketOwner extends IdentityHash {
  /** The ID for the entity. */
  core.String entityId;

  /** The entity, in the form group-groupId. */
  core.String entity;

  /** Parses an instance from its JSON representation. */
  static BucketOwner parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BucketOwner();
    result.entityId = identity(json["entityId"]);
    result.entity = identity(json["entity"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BucketOwner value) {
    if (value == null) return null;
    final result = {};
    result["entityId"] = identity(value.entityId);
    result["entity"] = identity(value.entity);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Bucket.BucketWebsite
class BucketWebsite extends IdentityHash {
  /** The custom object to return when a requested resource is not found. */
  core.String notFoundPage;

  /**
 * Behaves as the bucket's directory index where missing objects are treated as potential
 * directories.
 */
  core.String mainPageSuffix;

  /** Parses an instance from its JSON representation. */
  static BucketWebsite parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BucketWebsite();
    result.notFoundPage = identity(json["notFoundPage"]);
    result.mainPageSuffix = identity(json["mainPageSuffix"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BucketWebsite value) {
    if (value == null) return null;
    final result = {};
    result["notFoundPage"] = identity(value.notFoundPage);
    result["mainPageSuffix"] = identity(value.mainPageSuffix);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Buckets
class Buckets extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  core.String nextPageToken;

  /** The list of items. */
  core.List<Bucket> items;

  /** The kind of item this is. For lists of buckets, this is always storage#buckets. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Buckets parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Buckets();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Bucket.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Buckets value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Bucket.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Object
class Object extends IdentityHash {
  /** The kind of item this is. For objects, this is always storage#object. */
  core.String kind;

  /** The name of this object. Required if not specified by URL parameter. */
  core.String name;

  /** Content-Language of the object data. */
  core.String contentLanguage;

  /**
 * Object media data. Provided on your behalf when uploading raw media or multipart/related with an
 * auxiliary media part.
 */
  ObjectMedia media;

  /** The bucket containing this object. */
  core.String bucket;

  /** Content-Encoding of the object data. */
  core.String contentEncoding;

  /** The link to this object. */
  core.String selfLink;

  /** The owner of the object. This will always be the uploader of the object. */
  ObjectOwner owner;

  /** Cache-Control directive for the object data. */
  core.String cacheControl;

  /** Access controls on the object. */
  core.List<ObjectAccessControl> acl;

  /** The ID of the object. */
  core.String id;

  /** Content-Disposition of the object data. */
  core.String contentDisposition;

  /** User-provided metadata, in key/value pairs. */
  core.Map<core.String, core.String> metadata;

  /** Parses an instance from its JSON representation. */
  static Object parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Object();
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.contentLanguage = identity(json["contentLanguage"]);
    result.media = ObjectMedia.parse(json["media"]);
    result.bucket = identity(json["bucket"]);
    result.contentEncoding = identity(json["contentEncoding"]);
    result.selfLink = identity(json["selfLink"]);
    result.owner = ObjectOwner.parse(json["owner"]);
    result.cacheControl = identity(json["cacheControl"]);
    result.acl = map(ObjectAccessControl.parse)(json["acl"]);
    result.id = identity(json["id"]);
    result.contentDisposition = identity(json["contentDisposition"]);
    result.metadata = mapValues(identity)(json["metadata"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Object value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["contentLanguage"] = identity(value.contentLanguage);
    result["media"] = ObjectMedia.serialize(value.media);
    result["bucket"] = identity(value.bucket);
    result["contentEncoding"] = identity(value.contentEncoding);
    result["selfLink"] = identity(value.selfLink);
    result["owner"] = ObjectOwner.serialize(value.owner);
    result["cacheControl"] = identity(value.cacheControl);
    result["acl"] = map(ObjectAccessControl.serialize)(value.acl);
    result["id"] = identity(value.id);
    result["contentDisposition"] = identity(value.contentDisposition);
    result["metadata"] = mapValues(identity)(value.metadata);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ObjectAccessControl
class ObjectAccessControl extends IdentityHash {
  /** The domain associated with the entity, if any. */
  core.String domain;

  /** The name of the object. */
  core.String object;

  /** The name of the bucket. */
  core.String bucket;

  /**
 * The kind of item this is. For object access control entries, this is always
 * storage#objectAccessControl.
 */
  core.String kind;

  /** The ID of the access-control entry. */
  core.String id;

  /** The access permission for the entity. Can be READER or OWNER. */
  core.String role;

  /** The ID for the entity, if any. */
  core.String entityId;

  /**
 * The entity holding the permission, in one of the following forms: - user-userId - user-email -
 * group-groupId - group-email - allUsers - allAuthenticatedUsers
 */
  core.String entity;

  /** The email address associated with the entity, if any. */
  core.String email;

  /** The link to this access-control entry. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ObjectAccessControl parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ObjectAccessControl();
    result.domain = identity(json["domain"]);
    result.object = identity(json["object"]);
    result.bucket = identity(json["bucket"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.role = identity(json["role"]);
    result.entityId = identity(json["entityId"]);
    result.entity = identity(json["entity"]);
    result.email = identity(json["email"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ObjectAccessControl value) {
    if (value == null) return null;
    final result = {};
    result["domain"] = identity(value.domain);
    result["object"] = identity(value.object);
    result["bucket"] = identity(value.bucket);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["role"] = identity(value.role);
    result["entityId"] = identity(value.entityId);
    result["entity"] = identity(value.entity);
    result["email"] = identity(value.email);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ObjectAccessControls
class ObjectAccessControls extends IdentityHash {
  /** The list of items. */
  core.List<ObjectAccessControl> items;

  /**
 * The kind of item this is. For lists of object access control entries, this is always
 * storage#objectAccessControls.
 */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static ObjectAccessControls parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ObjectAccessControls();
    result.items = map(ObjectAccessControl.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ObjectAccessControls value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(ObjectAccessControl.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Object.ObjectMedia
class ObjectMedia extends IdentityHash {
  /** Content-Type of the object data. */
  core.String contentType;

  /** Creation time of the data in RFC 3339 format. */
  core.String timeCreated;

  /** Hash algorithm used. Currently only MD5 is supported. Required if a hash is provided. */
  core.String algorithm;

  /** Content-Length of the data in bytes. */
  core.String length;

  /** Media download link. */
  core.String link;

  /** Hash of the data. Required if a hash algorithm is provided. */
  core.String hash;

  /**
 * URL-safe Base64-encoded data. This property can be used to insert objects under 64KB in size, and
 * will only be returned in response to the get method for objects so created. When this resource is
 * returned in response to the list method, this property is omitted.
 */
  core.String data;

  /** Parses an instance from its JSON representation. */
  static ObjectMedia parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ObjectMedia();
    result.contentType = identity(json["contentType"]);
    result.timeCreated = identity(json["timeCreated"]);
    result.algorithm = identity(json["algorithm"]);
    result.length = identity(json["length"]);
    result.link = identity(json["link"]);
    result.hash = identity(json["hash"]);
    result.data = identity(json["data"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ObjectMedia value) {
    if (value == null) return null;
    final result = {};
    result["contentType"] = identity(value.contentType);
    result["timeCreated"] = identity(value.timeCreated);
    result["algorithm"] = identity(value.algorithm);
    result["length"] = identity(value.length);
    result["link"] = identity(value.link);
    result["hash"] = identity(value.hash);
    result["data"] = identity(value.data);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Object.ObjectOwner
class ObjectOwner extends IdentityHash {
  /** The ID for the entity. */
  core.String entityId;

  /** The entity, in the form user-userId. */
  core.String entity;

  /** Parses an instance from its JSON representation. */
  static ObjectOwner parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ObjectOwner();
    result.entityId = identity(json["entityId"]);
    result.entity = identity(json["entity"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ObjectOwner value) {
    if (value == null) return null;
    final result = {};
    result["entityId"] = identity(value.entityId);
    result["entity"] = identity(value.entity);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Objects
class Objects extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  core.String nextPageToken;

  /** The list of items. */
  core.List<Object> items;

  /** The kind of item this is. For lists of objects, this is always storage#objects. */
  core.String kind;

  /**
 * The list of prefixes of objects matching-but-not-listed up to and including the requested
 * delimiter.
 */
  core.List<core.String> prefixes;

  /** Parses an instance from its JSON representation. */
  static Objects parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Objects();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Object.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.prefixes = map(identity)(json["prefixes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Objects value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Object.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["prefixes"] = map(identity)(value.prefixes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum StorageApi.Alt
class StorageApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final StorageApiAlt JSON = const StorageApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<StorageApiAlt> values = const <StorageApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <StorageApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static StorageApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const StorageApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

