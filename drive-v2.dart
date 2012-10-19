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

#library('drive-v2');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API DriveApi
/**
 * The API to interact with Drive.
 */
class DriveApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  DriveApi get _$service => this;
  FilesResource _files;
  FilesResource get files => _files;
  AboutResource _about;
  AboutResource get about => _about;
  AppsResource _apps;
  AppsResource get apps => _apps;
  CommentsResource _comments;
  CommentsResource get comments => _comments;
  ParentsResource _parents;
  ParentsResource get parents => _parents;
  RepliesResource _replies;
  RepliesResource get replies => _replies;
  RevisionsResource _revisions;
  RevisionsResource get revisions => _revisions;
  ChangesResource _changes;
  ChangesResource get changes => _changes;
  ChildrenResource _children;
  ChildrenResource get children => _children;
  PermissionsResource _permissions;
  PermissionsResource get permissions => _permissions;
  
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
  DriveApiAlt alt;


  DriveApi({this.baseUrl:"https://www.googleapis.com/drive/v2/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _files = new FilesResource._internal(this);
    _about = new AboutResource._internal(this);
    _apps = new AppsResource._internal(this);
    _comments = new CommentsResource._internal(this);
    _parents = new ParentsResource._internal(this);
    _replies = new RepliesResource._internal(this);
    _revisions = new RevisionsResource._internal(this);
    _changes = new ChangesResource._internal(this);
    _children = new ChildrenResource._internal(this);
    _permissions = new PermissionsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}drive/v2/20121016 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage the files and documents in your Google Drive */
  static final core.String DRIVE_SCOPE = "https://www.googleapis.com/auth/drive";

  /** OAuth2 scope: View your Google Drive apps */
  static final core.String DRIVE_APPS_READONLY_SCOPE = "https://www.googleapis.com/auth/drive.apps.readonly";

  /** OAuth2 scope: View and manage Google Drive files that you have opened or created with this app */
  static final core.String DRIVE_FILE_SCOPE = "https://www.googleapis.com/auth/drive.file";

  /** OAuth2 scope: View metadata for files and documents in your Google Drive */
  static final core.String DRIVE_METADATA_READONLY_SCOPE = "https://www.googleapis.com/auth/drive.metadata.readonly";

  /** OAuth2 scope: View the files and documents in your Google Drive */
  static final core.String DRIVE_READONLY_SCOPE = "https://www.googleapis.com/auth/drive.readonly";
}

// Resource .FilesResource
class FilesResource extends core.Object {
  final DriveApi _$service;
  
  FilesResource._internal(DriveApi $service) : _$service = $service;

  // Method FilesResource.Insert
  /**
   * Insert a new file.
   *
   *    * [content] the File
   *    * [convert] Whether to convert this file to the corresponding Google Docs format.
  Default: false.
   *    * [targetLanguage] Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to
   *        detect the language.
   *    * [sourceLanguage] The language of the original file to be translated.
   *    * [ocrLanguage] If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
   *    * [pinned] Whether to pin the head revision of the uploaded file.
  Default: false.
   *    * [ocr] Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
  Default: false.
   *    * [timedTextTrackName] The timed text track name.
   *    * [timedTextLanguage] The language of the timed text.
   */
  core.Future<File> insert(File content, {core.bool convert, core.String targetLanguage, core.String sourceLanguage, core.String ocrLanguage, core.bool pinned, core.bool ocr, core.String timedTextTrackName, core.String timedTextLanguage}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?convert) $queryParams["convert"] = convert;
    if (?targetLanguage) $queryParams["targetLanguage"] = targetLanguage;
    if (?sourceLanguage) $queryParams["sourceLanguage"] = sourceLanguage;
    if (?ocrLanguage) $queryParams["ocrLanguage"] = ocrLanguage;
    if (?pinned) $queryParams["pinned"] = pinned;
    if (?ocr) $queryParams["ocr"] = ocr;
    if (?timedTextTrackName) $queryParams["timedTextTrackName"] = timedTextTrackName;
    if (?timedTextLanguage) $queryParams["timedTextLanguage"] = timedTextLanguage;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(File.serialize(content));
    final $path = "files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Untrash
  /**
   * Restores a file from the trash.
   *
   *    * [fileId] The ID of the file to untrash.
   */
  core.Future<File> untrash(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/untrash";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Trash
  /**
   * Moves a file to the trash.
   *
   *    * [fileId] The ID of the file to trash.
   */
  core.Future<File> trash(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/trash";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Get
  /**
   * Gets a file's metadata by ID.
   *
   *    * [fileId] The ID for the file in question.
   *    * [updateViewedDate] Whether to update the view date after successfully retrieving the file.
  Default: false.
   *    * [projection] This parameter is deprecated and has no function.
   */
  core.Future<File> get(core.String fileId, {core.bool updateViewedDate, FilesResourceGetProjection projection}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (?updateViewedDate) $queryParams["updateViewedDate"] = updateViewedDate;
    if (?projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.List
  /**
   * Lists the user's files.
   *
   *    * [q] Query string for searching files.
   *    * [pageToken] Page token for files.
   *    * [projection] This parameter is deprecated and has no function.
   *    * [maxResults] Maximum number of files to return.
  Default: 100.
  Minimum: 0.
   */
  core.Future<FileList> list({core.String q, core.String pageToken, FilesResourceListProjection projection, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?q) $queryParams["q"] = q;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?projection) $queryParams["projection"] = projection;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => FileList.parse(JSON.parse($text)));
  }

  // Method FilesResource.Update
  /**
   * Updates file metadata and/or content
   *
   *    * [content] the File
   *    * [fileId] The ID of the file to update.
   *    * [convert] Whether to convert this file to the corresponding Google Docs format.
  Default: false.
   *    * [targetLanguage] Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to
   *        detect the language.
   *    * [setModifiedDate] Whether to set the modified date with the supplied modified date.
  Default: false.
   *    * [updateViewedDate] Whether to update the view date after successfully updating the file.
  Default: true.
   *    * [sourceLanguage] The language of the original file to be translated.
   *    * [ocrLanguage] If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
   *    * [pinned] Whether to pin the new revision.
  Default: false.
   *    * [newRevision] Whether a blob upload should create a new revision. If false, the blob data in the current head
   *        revision will be replaced.
  Default: true.
   *    * [ocr] Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
  Default: false.
   *    * [timedTextLanguage] The language of the timed text.
   *    * [timedTextTrackName] The timed text track name.
   */
  core.Future<File> update(core.String fileId, File content, {core.bool convert, core.String targetLanguage, core.bool setModifiedDate, core.bool updateViewedDate, core.String sourceLanguage, core.String ocrLanguage, core.bool pinned, core.bool newRevision, core.bool ocr, core.String timedTextLanguage, core.String timedTextTrackName}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (?convert) $queryParams["convert"] = convert;
    if (?targetLanguage) $queryParams["targetLanguage"] = targetLanguage;
    if (?setModifiedDate) $queryParams["setModifiedDate"] = setModifiedDate;
    if (?updateViewedDate) $queryParams["updateViewedDate"] = updateViewedDate;
    if (?sourceLanguage) $queryParams["sourceLanguage"] = sourceLanguage;
    if (?ocrLanguage) $queryParams["ocrLanguage"] = ocrLanguage;
    if (?pinned) $queryParams["pinned"] = pinned;
    if (?newRevision) $queryParams["newRevision"] = newRevision;
    if (?ocr) $queryParams["ocr"] = ocr;
    if (?timedTextLanguage) $queryParams["timedTextLanguage"] = timedTextLanguage;
    if (?timedTextTrackName) $queryParams["timedTextTrackName"] = timedTextTrackName;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(File.serialize(content));
    final $path = "files/{fileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Patch
  /**
   * Updates file metadata and/or content. This method supports patch semantics.
   *
   *    * [content] the File
   *    * [fileId] The ID of the file to update.
   *    * [convert] Whether to convert this file to the corresponding Google Docs format.
  Default: false.
   *    * [targetLanguage] Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to
   *        detect the language.
   *    * [setModifiedDate] Whether to set the modified date with the supplied modified date.
  Default: false.
   *    * [updateViewedDate] Whether to update the view date after successfully updating the file.
  Default: true.
   *    * [sourceLanguage] The language of the original file to be translated.
   *    * [ocrLanguage] If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
   *    * [pinned] Whether to pin the new revision.
  Default: false.
   *    * [newRevision] Whether a blob upload should create a new revision. If false, the blob data in the current head
   *        revision will be replaced.
  Default: true.
   *    * [ocr] Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
  Default: false.
   *    * [timedTextLanguage] The language of the timed text.
   *    * [timedTextTrackName] The timed text track name.
   */
  core.Future<File> patch(core.String fileId, File content, {core.bool convert, core.String targetLanguage, core.bool setModifiedDate, core.bool updateViewedDate, core.String sourceLanguage, core.String ocrLanguage, core.bool pinned, core.bool newRevision, core.bool ocr, core.String timedTextLanguage, core.String timedTextTrackName}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (?convert) $queryParams["convert"] = convert;
    if (?targetLanguage) $queryParams["targetLanguage"] = targetLanguage;
    if (?setModifiedDate) $queryParams["setModifiedDate"] = setModifiedDate;
    if (?updateViewedDate) $queryParams["updateViewedDate"] = updateViewedDate;
    if (?sourceLanguage) $queryParams["sourceLanguage"] = sourceLanguage;
    if (?ocrLanguage) $queryParams["ocrLanguage"] = ocrLanguage;
    if (?pinned) $queryParams["pinned"] = pinned;
    if (?newRevision) $queryParams["newRevision"] = newRevision;
    if (?ocr) $queryParams["ocr"] = ocr;
    if (?timedTextLanguage) $queryParams["timedTextLanguage"] = timedTextLanguage;
    if (?timedTextTrackName) $queryParams["timedTextTrackName"] = timedTextTrackName;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(File.serialize(content));
    final $path = "files/{fileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Touch
  /**
   * Set the file's updated time to the current server time.
   *
   *    * [fileId] The ID of the file to update.
   */
  core.Future<File> touch(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/touch";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Copy
  /**
   * Creates a copy of the specified file.
   *
   *    * [content] the File
   *    * [fileId] The ID of the file to copy.
   *    * [convert] Whether to convert this file to the corresponding Google Docs format.
  Default: false.
   *    * [targetLanguage] Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to
   *        detect the language.
   *    * [sourceLanguage] The language of the original file to be translated.
   *    * [ocrLanguage] If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
   *    * [pinned] Whether to pin the head revision of the new copy.
  Default: false.
   *    * [ocr] Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
  Default: false.
   *    * [timedTextLanguage] The language of the timed text.
   *    * [timedTextTrackName] The timed text track name.
   */
  core.Future<File> copy(core.String fileId, File content, {core.bool convert, core.String targetLanguage, core.String sourceLanguage, core.String ocrLanguage, core.bool pinned, core.bool ocr, core.String timedTextLanguage, core.String timedTextTrackName}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (?convert) $queryParams["convert"] = convert;
    if (?targetLanguage) $queryParams["targetLanguage"] = targetLanguage;
    if (?sourceLanguage) $queryParams["sourceLanguage"] = sourceLanguage;
    if (?ocrLanguage) $queryParams["ocrLanguage"] = ocrLanguage;
    if (?pinned) $queryParams["pinned"] = pinned;
    if (?ocr) $queryParams["ocr"] = ocr;
    if (?timedTextLanguage) $queryParams["timedTextLanguage"] = timedTextLanguage;
    if (?timedTextTrackName) $queryParams["timedTextTrackName"] = timedTextTrackName;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(File.serialize(content));
    final $path = "files/{fileId}/copy";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Delete
  /**
   * Permanently deletes a file by ID. Skips the trash.
   *
   *    * [fileId] The ID of the file to delete.
   */
  core.Future delete(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}";
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

// Enum FilesResource.Get.Projection
class FilesResourceGetProjection extends core.Object implements core.Hashable {
  /** Deprecated */
  const FilesResourceGetProjection BASIC = const FilesResourceGetProjection._internal("BASIC", 0);
  /** Deprecated */
  const FilesResourceGetProjection FULL = const FilesResourceGetProjection._internal("FULL", 1);

  /** All values of this enumeration */
  const core.List<FilesResourceGetProjection> values = const <FilesResourceGetProjection>[
    BASIC,
    FULL,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <FilesResourceGetProjection>{ 
    "BASIC": BASIC,
    "FULL": FULL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FilesResourceGetProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FilesResourceGetProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum FilesResource.List.Projection
class FilesResourceListProjection extends core.Object implements core.Hashable {
  /** Deprecated */
  const FilesResourceListProjection BASIC = const FilesResourceListProjection._internal("BASIC", 0);
  /** Deprecated */
  const FilesResourceListProjection FULL = const FilesResourceListProjection._internal("FULL", 1);

  /** All values of this enumeration */
  const core.List<FilesResourceListProjection> values = const <FilesResourceListProjection>[
    BASIC,
    FULL,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <FilesResourceListProjection>{ 
    "BASIC": BASIC,
    "FULL": FULL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FilesResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FilesResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Resource .AboutResource
class AboutResource extends core.Object {
  final DriveApi _$service;
  
  AboutResource._internal(DriveApi $service) : _$service = $service;

  // Method AboutResource.Get
  /**
   * Gets the information about the current user along with Drive API settings
   *
   *    * [includeSubscribed] Whether to include subscribed items when calculating the number of remaining change IDs
  Default:
   *        true.
   *    * [maxChangeIdCount] Maximum number of remaining change IDs to count
  Default: 1.
   *    * [startChangeId] Change ID to start counting from when calculating number of remaining change IDs
   */
  core.Future<About> get({core.bool includeSubscribed, core.String maxChangeIdCount, core.String startChangeId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?includeSubscribed) $queryParams["includeSubscribed"] = includeSubscribed;
    if (?maxChangeIdCount) $queryParams["maxChangeIdCount"] = maxChangeIdCount;
    if (?startChangeId) $queryParams["startChangeId"] = startChangeId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "about";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => About.parse(JSON.parse($text)));
  }
}

// Resource .AppsResource
class AppsResource extends core.Object {
  final DriveApi _$service;
  
  AppsResource._internal(DriveApi $service) : _$service = $service;

  // Method AppsResource.List
  /**
   * Lists a user's apps.
   *
   */
  core.Future<AppList> list() {
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
    final $path = "apps";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AppList.parse(JSON.parse($text)));
  }

  // Method AppsResource.Get
  /**
   * Gets a specific app.
   *
   *    * [appId] The ID of the app.
   */
  core.Future<App> get(core.String appId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["appId"] = appId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "apps/{appId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => App.parse(JSON.parse($text)));
  }
}

// Resource .CommentsResource
class CommentsResource extends core.Object {
  final DriveApi _$service;
  
  CommentsResource._internal(DriveApi $service) : _$service = $service;

  // Method CommentsResource.Insert
  /**
   * Creates a new comment on the given file.
   *
   *    * [content] the Comment
   *    * [fileId] The ID of the file.
   */
  core.Future<Comment> insert(core.String fileId, Comment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Comment.serialize(content));
    final $path = "files/{fileId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Get
  /**
   * Gets a comment by ID.
   *
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   */
  core.Future<Comment> get(core.String fileId, core.String commentId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/comments/{commentId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }

  // Method CommentsResource.List
  /**
   * Lists a file's comments.
   *
   *    * [fileId] The ID of the file.
   *    * [pageToken] The continuation token, used to page through large result sets. To get the next page of results, set
   *        this parameter to the value of "nextPageToken" from the previous response.
   *    * [updatedMin] Only discussions that were updated after this timestamp will be returned. Formatted as an RFC 3339
   *        timestamp.
   *    * [includeDeleted] If set, all comments, including deleted comments (with content stripped) will be returned.
  Default:
   *        false.
   *    * [maxResults] The maximum number of discussions to include in the response, used for paging.
  Default: 20.
  Minimum:
   *        0.
  Maximum: 100.
   */
  core.Future<CommentList> list(core.String fileId, {core.String pageToken, core.String updatedMin, core.bool includeDeleted, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?updatedMin) $queryParams["updatedMin"] = updatedMin;
    if (?includeDeleted) $queryParams["includeDeleted"] = includeDeleted;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommentList.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Update
  /**
   * Updates an existing comment.
   *
   *    * [content] the Comment
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   */
  core.Future<Comment> update(core.String fileId, core.String commentId, Comment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Comment.serialize(content));
    final $path = "files/{fileId}/comments/{commentId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Patch
  /**
   * Updates an existing comment. This method supports patch semantics.
   *
   *    * [content] the Comment
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   */
  core.Future<Comment> patch(core.String fileId, core.String commentId, Comment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Comment.serialize(content));
    final $path = "files/{fileId}/comments/{commentId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Delete
  /**
   * Deletes a comment.
   *
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   */
  core.Future delete(core.String fileId, core.String commentId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/comments/{commentId}";
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

// Resource .ParentsResource
class ParentsResource extends core.Object {
  final DriveApi _$service;
  
  ParentsResource._internal(DriveApi $service) : _$service = $service;

  // Method ParentsResource.Insert
  /**
   * Adds a parent folder for a file.
   *
   *    * [content] the ParentReference
   *    * [fileId] The ID of the file.
   */
  core.Future<ParentReference> insert(core.String fileId, ParentReference content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(ParentReference.serialize(content));
    final $path = "files/{fileId}/parents";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => ParentReference.parse(JSON.parse($text)));
  }

  // Method ParentsResource.Get
  /**
   * Gets a specific parent reference.
   *
   *    * [fileId] The ID of the file.
   *    * [parentId] The ID of the parent.
   */
  core.Future<ParentReference> get(core.String fileId, core.String parentId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["parentId"] = parentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/parents/{parentId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ParentReference.parse(JSON.parse($text)));
  }

  // Method ParentsResource.List
  /**
   * Lists a file's parents.
   *
   *    * [fileId] The ID of the file.
   */
  core.Future<ParentList> list(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/parents";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ParentList.parse(JSON.parse($text)));
  }

  // Method ParentsResource.Delete
  /**
   * Removes a parent from a file.
   *
   *    * [fileId] The ID of the file.
   *    * [parentId] The ID of the parent.
   */
  core.Future delete(core.String fileId, core.String parentId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["parentId"] = parentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/parents/{parentId}";
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

// Resource .RepliesResource
class RepliesResource extends core.Object {
  final DriveApi _$service;
  
  RepliesResource._internal(DriveApi $service) : _$service = $service;

  // Method RepliesResource.Insert
  /**
   * Creates a new reply to the given comment.
   *
   *    * [content] the CommentReply
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   */
  core.Future<CommentReply> insert(core.String fileId, core.String commentId, CommentReply content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CommentReply.serialize(content));
    final $path = "files/{fileId}/comments/{commentId}/replies";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommentReply.parse(JSON.parse($text)));
  }

  // Method RepliesResource.Get
  /**
   * Gets a reply.
   *
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   *    * [replyId] The ID of the reply.
   */
  core.Future<CommentReply> get(core.String fileId, core.String commentId, core.String replyId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    $pathParams["replyId"] = replyId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/comments/{commentId}/replies/{replyId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommentReply.parse(JSON.parse($text)));
  }

  // Method RepliesResource.List
  /**
   * Lists all of the replies to a comment.
   *
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   *    * [pageToken] The continuation token, used to page through large result sets. To get the next page of results, set
   *        this parameter to the value of "nextPageToken" from the previous response.
   *    * [maxResults] The maximum number of replies to include in the response, used for paging.
  Default: 20.
  Minimum: 0.
   *        Maximum: 100.
   */
  core.Future<CommentReplyList> list(core.String fileId, core.String commentId, {core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
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
    final $path = "files/{fileId}/comments/{commentId}/replies";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommentReplyList.parse(JSON.parse($text)));
  }

  // Method RepliesResource.Update
  /**
   * Updates an existing reply.
   *
   *    * [content] the CommentReply
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   *    * [replyId] The ID of the reply.
   */
  core.Future<CommentReply> update(core.String fileId, core.String commentId, core.String replyId, CommentReply content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    $pathParams["replyId"] = replyId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CommentReply.serialize(content));
    final $path = "files/{fileId}/comments/{commentId}/replies/{replyId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommentReply.parse(JSON.parse($text)));
  }

  // Method RepliesResource.Patch
  /**
   * Updates an existing reply. This method supports patch semantics.
   *
   *    * [content] the CommentReply
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   *    * [replyId] The ID of the reply.
   */
  core.Future<CommentReply> patch(core.String fileId, core.String commentId, core.String replyId, CommentReply content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    $pathParams["replyId"] = replyId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CommentReply.serialize(content));
    final $path = "files/{fileId}/comments/{commentId}/replies/{replyId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommentReply.parse(JSON.parse($text)));
  }

  // Method RepliesResource.Delete
  /**
   * Deletes a reply.
   *
   *    * [fileId] The ID of the file.
   *    * [commentId] The ID of the comment.
   *    * [replyId] The ID of the reply.
   */
  core.Future delete(core.String fileId, core.String commentId, core.String replyId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["commentId"] = commentId;
    $pathParams["replyId"] = replyId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/comments/{commentId}/replies/{replyId}";
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

// Resource .RevisionsResource
class RevisionsResource extends core.Object {
  final DriveApi _$service;
  
  RevisionsResource._internal(DriveApi $service) : _$service = $service;

  // Method RevisionsResource.Patch
  /**
   * Updates a revision. This method supports patch semantics.
   *
   *    * [content] the Revision
   *    * [fileId] The ID for the file.
   *    * [revisionId] The ID for the revision.
   */
  core.Future<Revision> patch(core.String fileId, core.String revisionId, Revision content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["revisionId"] = revisionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Revision.serialize(content));
    final $path = "files/{fileId}/revisions/{revisionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Revision.parse(JSON.parse($text)));
  }

  // Method RevisionsResource.Get
  /**
   * Gets a specific revision.
   *
   *    * [fileId] The ID of the file.
   *    * [revisionId] The ID of the revision.
   */
  core.Future<Revision> get(core.String fileId, core.String revisionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["revisionId"] = revisionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/revisions/{revisionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Revision.parse(JSON.parse($text)));
  }

  // Method RevisionsResource.List
  /**
   * Lists a file's revisions.
   *
   *    * [fileId] The ID of the file.
   */
  core.Future<RevisionList> list(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/revisions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => RevisionList.parse(JSON.parse($text)));
  }

  // Method RevisionsResource.Update
  /**
   * Updates a revision.
   *
   *    * [content] the Revision
   *    * [fileId] The ID for the file.
   *    * [revisionId] The ID for the revision.
   */
  core.Future<Revision> update(core.String fileId, core.String revisionId, Revision content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["revisionId"] = revisionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Revision.serialize(content));
    final $path = "files/{fileId}/revisions/{revisionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Revision.parse(JSON.parse($text)));
  }

  // Method RevisionsResource.Delete
  /**
   * Removes a revision.
   *
   *    * [fileId] The ID of the file.
   *    * [revisionId] The ID of the revision.
   */
  core.Future delete(core.String fileId, core.String revisionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["revisionId"] = revisionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/revisions/{revisionId}";
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

// Resource .ChangesResource
class ChangesResource extends core.Object {
  final DriveApi _$service;
  
  ChangesResource._internal(DriveApi $service) : _$service = $service;

  // Method ChangesResource.List
  /**
   * Lists the changes for a user.
   *
   *    * [includeSubscribed] Whether to include subscribed items.
  Default: true.
   *    * [startChangeId] Change ID to start listing changes from.
   *    * [includeDeleted] Whether to include deleted items.
  Default: true.
   *    * [maxResults] Maximum number of changes to return.
  Default: 100.
  Minimum: 0.
   *    * [pageToken] Page token for changes.
   */
  core.Future<ChangeList> list({core.bool includeSubscribed, core.String startChangeId, core.bool includeDeleted, core.int maxResults, core.String pageToken}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?includeSubscribed) $queryParams["includeSubscribed"] = includeSubscribed;
    if (?startChangeId) $queryParams["startChangeId"] = startChangeId;
    if (?includeDeleted) $queryParams["includeDeleted"] = includeDeleted;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "changes";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ChangeList.parse(JSON.parse($text)));
  }

  // Method ChangesResource.Get
  /**
   * Gets a specific change.
   *
   *    * [changeId] The ID of the change.
   */
  core.Future<Change> get(core.String changeId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["changeId"] = changeId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "changes/{changeId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Change.parse(JSON.parse($text)));
  }
}

// Resource .ChildrenResource
class ChildrenResource extends core.Object {
  final DriveApi _$service;
  
  ChildrenResource._internal(DriveApi $service) : _$service = $service;

  // Method ChildrenResource.Insert
  /**
   * Inserts a file into a folder.
   *
   *    * [content] the ChildReference
   *    * [folderId] The ID of the folder.
   */
  core.Future<ChildReference> insert(core.String folderId, ChildReference content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["folderId"] = folderId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(ChildReference.serialize(content));
    final $path = "files/{folderId}/children";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => ChildReference.parse(JSON.parse($text)));
  }

  // Method ChildrenResource.Get
  /**
   * Gets a specific child reference.
   *
   *    * [folderId] The ID of the folder.
   *    * [childId] The ID of the child.
   */
  core.Future<ChildReference> get(core.String folderId, core.String childId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["folderId"] = folderId;
    $pathParams["childId"] = childId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{folderId}/children/{childId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ChildReference.parse(JSON.parse($text)));
  }

  // Method ChildrenResource.List
  /**
   * Lists a folder's children.
   *
   *    * [folderId] The ID of the folder.
   *    * [q] Query string for searching children.
   *    * [pageToken] Page token for children.
   *    * [maxResults] Maximum number of children to return.
  Default: 100.
  Minimum: 0.
   */
  core.Future<ChildList> list(core.String folderId, {core.String q, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["folderId"] = folderId;
    if (?q) $queryParams["q"] = q;
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
    final $path = "files/{folderId}/children";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ChildList.parse(JSON.parse($text)));
  }

  // Method ChildrenResource.Delete
  /**
   * Removes a child from a folder.
   *
   *    * [folderId] The ID of the folder.
   *    * [childId] The ID of the child.
   */
  core.Future delete(core.String folderId, core.String childId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["folderId"] = folderId;
    $pathParams["childId"] = childId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{folderId}/children/{childId}";
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

// Resource .PermissionsResource
class PermissionsResource extends core.Object {
  final DriveApi _$service;
  
  PermissionsResource._internal(DriveApi $service) : _$service = $service;

  // Method PermissionsResource.Insert
  /**
   * Inserts a permission for a file.
   *
   *    * [content] the Permission
   *    * [fileId] The ID for the file.
   *    * [sendNotificationEmails] Whether to send notification emails.
  Default: true.
   */
  core.Future<Permission> insert(core.String fileId, Permission content, {core.bool sendNotificationEmails}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (?sendNotificationEmails) $queryParams["sendNotificationEmails"] = sendNotificationEmails;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Permission.serialize(content));
    final $path = "files/{fileId}/permissions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Permission.parse(JSON.parse($text)));
  }

  // Method PermissionsResource.Get
  /**
   * Gets a permission by ID.
   *
   *    * [fileId] The ID for the file.
   *    * [permissionId] The ID for the permission.
   */
  core.Future<Permission> get(core.String fileId, core.String permissionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["permissionId"] = permissionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/permissions/{permissionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Permission.parse(JSON.parse($text)));
  }

  // Method PermissionsResource.List
  /**
   * Lists a file's permissions.
   *
   *    * [fileId] The ID for the file.
   */
  core.Future<PermissionList> list(core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/permissions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PermissionList.parse(JSON.parse($text)));
  }

  // Method PermissionsResource.Update
  /**
   * Updates a permission.
   *
   *    * [content] the Permission
   *    * [fileId] The ID for the file.
   *    * [permissionId] The ID for the permission.
   */
  core.Future<Permission> update(core.String fileId, core.String permissionId, Permission content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["permissionId"] = permissionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Permission.serialize(content));
    final $path = "files/{fileId}/permissions/{permissionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Permission.parse(JSON.parse($text)));
  }

  // Method PermissionsResource.Patch
  /**
   * Updates a permission. This method supports patch semantics.
   *
   *    * [content] the Permission
   *    * [fileId] The ID for the file.
   *    * [permissionId] The ID for the permission.
   */
  core.Future<Permission> patch(core.String fileId, core.String permissionId, Permission content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["permissionId"] = permissionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Permission.serialize(content));
    final $path = "files/{fileId}/permissions/{permissionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Permission.parse(JSON.parse($text)));
  }

  // Method PermissionsResource.Delete
  /**
   * Deletes a permission from a file.
   *
   *    * [fileId] The ID for the file.
   *    * [permissionId] The ID for the permission.
   */
  core.Future delete(core.String fileId, core.String permissionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["fileId"] = fileId;
    $pathParams["permissionId"] = permissionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{fileId}/permissions/{permissionId}";
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

// Schema .About
class About extends IdentityHash {
  /** This is always drive#about. */
  core.String kind;

  /** List of additional features enabled on this account. */
  core.List<AboutFeatures> features;

  /** The number of quota bytes used. */
  core.String quotaBytesUsed;

  /** The authenticated user. */
  User user;

  /** The current user's ID as visible in the permissions collection. */
  core.String permissionId;

  /** List of max upload sizes for each file type. The most specific type takes precedence. */
  core.List<AboutMaxUploadSizes> maxUploadSizes;

  /** The name of the current user. */
  core.String name;

  /** The number of remaining change ids. */
  core.String remainingChangeIds;

  /**
 * Information about supported additional roles per file type. The most specific type takes
 * precedence.
 */
  core.List<AboutAdditionalRoleInfo> additionalRoleInfo;

  /** The ETag of the item. */
  core.String etag;

  /** The allowable import formats. */
  core.List<AboutImportFormats> importFormats;

  /** The total number of quota bytes. */
  core.String quotaBytesTotal;

  /** The id of the root folder. */
  core.String rootFolderId;

  /** The largest change id. */
  core.String largestChangeId;

  /** The number of quota bytes used by trashed items. */
  core.String quotaBytesUsedInTrash;

  /** The allowable export formats. */
  core.List<AboutExportFormats> exportFormats;

  /** The number of quota bytes used by all Google apps (Drive, Picasa, etc.). */
  core.String quotaBytesUsedAggregate;

  /** The domain sharing policy for the current user. */
  core.String domainSharingPolicy;

  /** A link back to this item. */
  core.String selfLink;

  /** A boolean indicating whether the authenticated app is installed by the authenticated user. */
  core.bool isCurrentAppInstalled;

  /** Parses an instance from its JSON representation. */
  static About parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new About();
    result.kind = identity(json["kind"]);
    result.features = map(AboutFeatures.parse)(json["features"]);
    result.quotaBytesUsed = identity(json["quotaBytesUsed"]);
    result.user = User.parse(json["user"]);
    result.permissionId = identity(json["permissionId"]);
    result.maxUploadSizes = map(AboutMaxUploadSizes.parse)(json["maxUploadSizes"]);
    result.name = identity(json["name"]);
    result.remainingChangeIds = identity(json["remainingChangeIds"]);
    result.additionalRoleInfo = map(AboutAdditionalRoleInfo.parse)(json["additionalRoleInfo"]);
    result.etag = identity(json["etag"]);
    result.importFormats = map(AboutImportFormats.parse)(json["importFormats"]);
    result.quotaBytesTotal = identity(json["quotaBytesTotal"]);
    result.rootFolderId = identity(json["rootFolderId"]);
    result.largestChangeId = identity(json["largestChangeId"]);
    result.quotaBytesUsedInTrash = identity(json["quotaBytesUsedInTrash"]);
    result.exportFormats = map(AboutExportFormats.parse)(json["exportFormats"]);
    result.quotaBytesUsedAggregate = identity(json["quotaBytesUsedAggregate"]);
    result.domainSharingPolicy = identity(json["domainSharingPolicy"]);
    result.selfLink = identity(json["selfLink"]);
    result.isCurrentAppInstalled = identity(json["isCurrentAppInstalled"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(About value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["features"] = map(AboutFeatures.serialize)(value.features);
    result["quotaBytesUsed"] = identity(value.quotaBytesUsed);
    result["user"] = User.serialize(value.user);
    result["permissionId"] = identity(value.permissionId);
    result["maxUploadSizes"] = map(AboutMaxUploadSizes.serialize)(value.maxUploadSizes);
    result["name"] = identity(value.name);
    result["remainingChangeIds"] = identity(value.remainingChangeIds);
    result["additionalRoleInfo"] = map(AboutAdditionalRoleInfo.serialize)(value.additionalRoleInfo);
    result["etag"] = identity(value.etag);
    result["importFormats"] = map(AboutImportFormats.serialize)(value.importFormats);
    result["quotaBytesTotal"] = identity(value.quotaBytesTotal);
    result["rootFolderId"] = identity(value.rootFolderId);
    result["largestChangeId"] = identity(value.largestChangeId);
    result["quotaBytesUsedInTrash"] = identity(value.quotaBytesUsedInTrash);
    result["exportFormats"] = map(AboutExportFormats.serialize)(value.exportFormats);
    result["quotaBytesUsedAggregate"] = identity(value.quotaBytesUsedAggregate);
    result["domainSharingPolicy"] = identity(value.domainSharingPolicy);
    result["selfLink"] = identity(value.selfLink);
    result["isCurrentAppInstalled"] = identity(value.isCurrentAppInstalled);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema About.AboutAdditionalRoleInfo
class AboutAdditionalRoleInfo extends IdentityHash {
  /** The supported additional roles per primary role. */
  core.List<AboutAdditionalRoleInfoRoleSets> roleSets;

  /** The content type that this additional role info applies to. */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static AboutAdditionalRoleInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AboutAdditionalRoleInfo();
    result.roleSets = map(AboutAdditionalRoleInfoRoleSets.parse)(json["roleSets"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AboutAdditionalRoleInfo value) {
    if (value == null) return null;
    final result = {};
    result["roleSets"] = map(AboutAdditionalRoleInfoRoleSets.serialize)(value.roleSets);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema About.AboutAdditionalRoleInfo.AboutAdditionalRoleInfoRoleSets
class AboutAdditionalRoleInfoRoleSets extends IdentityHash {
  /** A primary permission role. */
  core.String primaryRole;

  /** The supported additional roles with the primary role. */
  core.List<core.String> additionalRoles;

  /** Parses an instance from its JSON representation. */
  static AboutAdditionalRoleInfoRoleSets parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AboutAdditionalRoleInfoRoleSets();
    result.primaryRole = identity(json["primaryRole"]);
    result.additionalRoles = map(identity)(json["additionalRoles"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AboutAdditionalRoleInfoRoleSets value) {
    if (value == null) return null;
    final result = {};
    result["primaryRole"] = identity(value.primaryRole);
    result["additionalRoles"] = map(identity)(value.additionalRoles);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema About.AboutExportFormats
class AboutExportFormats extends IdentityHash {
  /** The content type to convert from. */
  core.String source;

  /** The possible content types to convert to. */
  core.List<core.String> targets;

  /** Parses an instance from its JSON representation. */
  static AboutExportFormats parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AboutExportFormats();
    result.source = identity(json["source"]);
    result.targets = map(identity)(json["targets"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AboutExportFormats value) {
    if (value == null) return null;
    final result = {};
    result["source"] = identity(value.source);
    result["targets"] = map(identity)(value.targets);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema About.AboutFeatures
class AboutFeatures extends IdentityHash {
  /** The name of the feature. */
  core.String featureName;

  /** The request limit rate for this feature, in queries per second. */
  core.double featureRate;

  /** Parses an instance from its JSON representation. */
  static AboutFeatures parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AboutFeatures();
    result.featureName = identity(json["featureName"]);
    result.featureRate = identity(json["featureRate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AboutFeatures value) {
    if (value == null) return null;
    final result = {};
    result["featureName"] = identity(value.featureName);
    result["featureRate"] = identity(value.featureRate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema About.AboutImportFormats
class AboutImportFormats extends IdentityHash {
  /** The imported file's content type to convert from. */
  core.String source;

  /** The possible content types to convert to. */
  core.List<core.String> targets;

  /** Parses an instance from its JSON representation. */
  static AboutImportFormats parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AboutImportFormats();
    result.source = identity(json["source"]);
    result.targets = map(identity)(json["targets"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AboutImportFormats value) {
    if (value == null) return null;
    final result = {};
    result["source"] = identity(value.source);
    result["targets"] = map(identity)(value.targets);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema About.AboutMaxUploadSizes
class AboutMaxUploadSizes extends IdentityHash {
  /** The file type. */
  core.String type;

  /** The max upload size for this type. */
  core.String size;

  /** Parses an instance from its JSON representation. */
  static AboutMaxUploadSizes parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AboutMaxUploadSizes();
    result.type = identity(json["type"]);
    result.size = identity(json["size"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AboutMaxUploadSizes value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["size"] = identity(value.size);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .App
class App extends IdentityHash {
  /** This is always drive#app. */
  core.String kind;

  /** The list of primary file extensions. */
  core.List<core.String> primaryFileExtensions;

  /** Whether the app is selected as the default handler for the types it supports. */
  core.bool useByDefault;

  /** The name of the app. */
  core.String name;

  /** The various icons for the app. */
  core.List<AppIcons> icons;

  /** The list of secondary file extensions. */
  core.List<core.String> secondaryFileExtensions;

  /** Whether the app is installed. */
  core.bool installed;

  /** The product URL. */
  core.String productUrl;

  /** The list of secondary mime types. */
  core.List<core.String> secondaryMimeTypes;

  /** Whether the app is authorized to access data on the user's Drive. */
  core.bool authorized;

  /** Whether this app supports creating new objects. */
  core.bool supportsCreate;

  /** Whether this app supports importing Google Docs. */
  core.bool supportsImport;

  /** The list of primary mime types. */
  core.List<core.String> primaryMimeTypes;

  /** The ID of the app. */
  core.String id;

  /**
 * The type of object this app creates (e.g. Chart). If empty, the app name should be used instead.
 */
  core.String objectType;

  /** Parses an instance from its JSON representation. */
  static App parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new App();
    result.kind = identity(json["kind"]);
    result.primaryFileExtensions = map(identity)(json["primaryFileExtensions"]);
    result.useByDefault = identity(json["useByDefault"]);
    result.name = identity(json["name"]);
    result.icons = map(AppIcons.parse)(json["icons"]);
    result.secondaryFileExtensions = map(identity)(json["secondaryFileExtensions"]);
    result.installed = identity(json["installed"]);
    result.productUrl = identity(json["productUrl"]);
    result.secondaryMimeTypes = map(identity)(json["secondaryMimeTypes"]);
    result.authorized = identity(json["authorized"]);
    result.supportsCreate = identity(json["supportsCreate"]);
    result.supportsImport = identity(json["supportsImport"]);
    result.primaryMimeTypes = map(identity)(json["primaryMimeTypes"]);
    result.id = identity(json["id"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(App value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["primaryFileExtensions"] = map(identity)(value.primaryFileExtensions);
    result["useByDefault"] = identity(value.useByDefault);
    result["name"] = identity(value.name);
    result["icons"] = map(AppIcons.serialize)(value.icons);
    result["secondaryFileExtensions"] = map(identity)(value.secondaryFileExtensions);
    result["installed"] = identity(value.installed);
    result["productUrl"] = identity(value.productUrl);
    result["secondaryMimeTypes"] = map(identity)(value.secondaryMimeTypes);
    result["authorized"] = identity(value.authorized);
    result["supportsCreate"] = identity(value.supportsCreate);
    result["supportsImport"] = identity(value.supportsImport);
    result["primaryMimeTypes"] = map(identity)(value.primaryMimeTypes);
    result["id"] = identity(value.id);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema App.AppIcons
class AppIcons extends IdentityHash {
  /**
 * Category of the icon. Allowed values are: - application - icon for the application - document -
 * icon for a file associated with the app - documentShared - icon for a shared file associated with
 * the app
 */
  core.String category;

  /** URL for the icon. */
  core.String iconUrl;

  /** Size of the icon. Represented as the maximum of the width and height. */
  core.int size;

  /** Parses an instance from its JSON representation. */
  static AppIcons parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AppIcons();
    result.category = identity(json["category"]);
    result.iconUrl = identity(json["iconUrl"]);
    result.size = identity(json["size"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AppIcons value) {
    if (value == null) return null;
    final result = {};
    result["category"] = identity(value.category);
    result["iconUrl"] = identity(value.iconUrl);
    result["size"] = identity(value.size);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AppList
class AppList extends IdentityHash {
  /** The actual list of apps. */
  core.List<App> items;

  /** This is always drive#appList. */
  core.String kind;

  /** The ETag of the list. */
  core.String etag;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static AppList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AppList();
    result.items = map(App.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AppList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(App.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Change
class Change extends IdentityHash {
  /** This is always drive#change. */
  core.String kind;

  /** Whether the file has been deleted. */
  core.bool deleted;

  /** The updated state of the file. Present if the file has not been deleted. */
  File file;

  /** The ID of the change. */
  core.String id;

  /** A link back to this change. */
  core.String selfLink;

  /** The ID of the file associated with this change. */
  core.String fileId;

  /** Parses an instance from its JSON representation. */
  static Change parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Change();
    result.kind = identity(json["kind"]);
    result.deleted = identity(json["deleted"]);
    result.file = File.parse(json["file"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.fileId = identity(json["fileId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Change value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["deleted"] = identity(value.deleted);
    result["file"] = File.serialize(value.file);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["fileId"] = identity(value.fileId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChangeList
class ChangeList extends IdentityHash {
  /** The page token for the next page of changes. */
  core.String nextPageToken;

  /** This is always drive#changeList. */
  core.String kind;

  /** The actual list of changes. */
  core.List<Change> items;

  /** A link to the next page of changes. */
  core.String nextLink;

  /** The ETag of the list. */
  core.String etag;

  /** The current largest change ID. */
  core.String largestChangeId;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ChangeList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChangeList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(Change.parse)(json["items"]);
    result.nextLink = identity(json["nextLink"]);
    result.etag = identity(json["etag"]);
    result.largestChangeId = identity(json["largestChangeId"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChangeList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(Change.serialize)(value.items);
    result["nextLink"] = identity(value.nextLink);
    result["etag"] = identity(value.etag);
    result["largestChangeId"] = identity(value.largestChangeId);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChildList
class ChildList extends IdentityHash {
  /** The page token for the next page of children. */
  core.String nextPageToken;

  /** This is always drive#childList. */
  core.String kind;

  /** The actual list of children. */
  core.List<ChildReference> items;

  /** A link to the next page of children. */
  core.String nextLink;

  /** The ETag of the list. */
  core.String etag;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ChildList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChildList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(ChildReference.parse)(json["items"]);
    result.nextLink = identity(json["nextLink"]);
    result.etag = identity(json["etag"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChildList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(ChildReference.serialize)(value.items);
    result["nextLink"] = identity(value.nextLink);
    result["etag"] = identity(value.etag);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChildReference
class ChildReference extends IdentityHash {
  /** This is always drive#childReference. */
  core.String kind;

  /** A link to the child. */
  core.String childLink;

  /** The ID of the child. */
  core.String id;

  /** A link back to this reference. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ChildReference parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChildReference();
    result.kind = identity(json["kind"]);
    result.childLink = identity(json["childLink"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChildReference value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["childLink"] = identity(value.childLink);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Comment
class Comment extends IdentityHash {
  /**
 * The status of this comment. Status can be changed by posting a reply to a comment with the
 * desired status. - "open" - The comment is still open. - "resolved" - The comment has been
 * resolved by one of its replies.
 */
  core.String status;

  /** A link back to this comment. */
  core.String selfLink;

  /** This is always drive#comment. */
  core.String kind;

  /** The user who wrote this comment. */
  User author;

  /**
 * Whether this comment has been deleted. If a comment has been deleted the content will be cleared
 * and this will only represent a comment that once existed.
 */
  core.bool deleted;

  /** Replies to this post. */
  core.List<CommentReply> replies;

  /** HTML formatted content for this comment. */
  core.String htmlContent;

  /**
 * The plain text content used to create this comment. This is not HTML safe and should only be used
 * as a starting point to make edits to a comment's content.
 */
  core.String content;

  /** The date when this comment or any of its replies were last modified. */
  core.String modifiedDate;

  /** The context of the file which is being commented on. */
  CommentContext context;

  /** The date when this comment was first created. */
  core.String createdDate;

  /** The ID of the comment. */
  core.String commentId;

  /**
 * A region of the document represented as a JSON string. See anchor documentation for details on
 * how to define and interpret anchor properties.
 */
  core.String anchor;

  /** The title of the file which this comment is addressing. */
  core.String fileTitle;

  /** The file which this comment is addressing. */
  core.String fileId;

  /** Parses an instance from its JSON representation. */
  static Comment parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Comment();
    result.status = identity(json["status"]);
    result.selfLink = identity(json["selfLink"]);
    result.kind = identity(json["kind"]);
    result.author = User.parse(json["author"]);
    result.deleted = identity(json["deleted"]);
    result.replies = map(CommentReply.parse)(json["replies"]);
    result.htmlContent = identity(json["htmlContent"]);
    result.content = identity(json["content"]);
    result.modifiedDate = identity(json["modifiedDate"]);
    result.context = CommentContext.parse(json["context"]);
    result.createdDate = identity(json["createdDate"]);
    result.commentId = identity(json["commentId"]);
    result.anchor = identity(json["anchor"]);
    result.fileTitle = identity(json["fileTitle"]);
    result.fileId = identity(json["fileId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Comment value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["selfLink"] = identity(value.selfLink);
    result["kind"] = identity(value.kind);
    result["author"] = User.serialize(value.author);
    result["deleted"] = identity(value.deleted);
    result["replies"] = map(CommentReply.serialize)(value.replies);
    result["htmlContent"] = identity(value.htmlContent);
    result["content"] = identity(value.content);
    result["modifiedDate"] = identity(value.modifiedDate);
    result["context"] = CommentContext.serialize(value.context);
    result["createdDate"] = identity(value.createdDate);
    result["commentId"] = identity(value.commentId);
    result["anchor"] = identity(value.anchor);
    result["fileTitle"] = identity(value.fileTitle);
    result["fileId"] = identity(value.fileId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentContext
class CommentContext extends IdentityHash {
  /** The MIME type of the context snippet. */
  core.String type;

  /**
 * Data representation of the segment of the file being commented on. In the case of a text file for
 * example, this would be the actual text that the comment is about.
 */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static CommentContext parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentContext();
    result.type = identity(json["type"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentContext value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentList
class CommentList extends IdentityHash {
  /** The token to use to request the next page of results. */
  core.String nextPageToken;

  /** List of comments. */
  core.List<Comment> items;

  /** This is always drive#commentList. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static CommentList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Comment.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Comment.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentReply
class CommentReply extends IdentityHash {
  /** This is always drive#commentReply. */
  core.String kind;

  /** The user who wrote this reply. */
  User author;

  /**
 * Whether this reply has been deleted. If a reply has been deleted the content will be cleared and
 * this will only represent a reply that once existed.
 */
  core.bool deleted;

  /** HTML formatted content for this reply. */
  core.String htmlContent;

  /**
 * The plain text content used to create this reply. This is not HTML safe and should only be used
 * as a starting point to make edits to a reply's content. This field is required on inserts if no
 * verb is specified (resolve/reopen).
 */
  core.String content;

  /**
 * The action this reply performed to the parent comment. When creating a new reply this is the
 * action to be perform to the parent comment. Possible values are: - "resolve" - To resolve a
 * comment. - "reopen" - To reopen (un-resolve) a comment.
 */
  core.String verb;

  /** The ID of the reply. */
  core.String replyId;

  /** The date when this reply was last modified. */
  core.String modifiedDate;

  /** The date when this reply was first created. */
  core.String createdDate;

  /** Parses an instance from its JSON representation. */
  static CommentReply parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentReply();
    result.kind = identity(json["kind"]);
    result.author = User.parse(json["author"]);
    result.deleted = identity(json["deleted"]);
    result.htmlContent = identity(json["htmlContent"]);
    result.content = identity(json["content"]);
    result.verb = identity(json["verb"]);
    result.replyId = identity(json["replyId"]);
    result.modifiedDate = identity(json["modifiedDate"]);
    result.createdDate = identity(json["createdDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentReply value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["author"] = User.serialize(value.author);
    result["deleted"] = identity(value.deleted);
    result["htmlContent"] = identity(value.htmlContent);
    result["content"] = identity(value.content);
    result["verb"] = identity(value.verb);
    result["replyId"] = identity(value.replyId);
    result["modifiedDate"] = identity(value.modifiedDate);
    result["createdDate"] = identity(value.createdDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentReplyList
class CommentReplyList extends IdentityHash {
  /** The token to use to request the next page of results. */
  core.String nextPageToken;

  /** List of reply. */
  core.List<CommentReply> items;

  /** This is always drive#commentReplyList. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static CommentReplyList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentReplyList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(CommentReply.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentReplyList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(CommentReply.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .File
class File extends IdentityHash {
  /**
 * The MIME type of the file. This is only mutable on update when uploading new content. This field
 * can be left blank, and the mimetype will be determined from the uploaded content's MIME type.
 */
  core.String mimeType;

  /** A link to the file's thumbnail. */
  core.String thumbnailLink;

  /** A group of labels for the file. */
  FileLabels labels;

  /** Indexable text attributes for the file (can only be written) */
  FileIndexableText indexableText;

  /**
 * Whether this file has been explicitly trashed, as opposed to recursively trashed. This will only
 * be populated if the file is trashed.
 */
  core.bool explicitlyTrashed;

  /** ETag of the file. */
  core.String etag;

  /**
 * Name of the last user to modify this file. This will only be populated if a user has edited this
 * file.
 */
  core.String lastModifyingUserName;

  /** Whether writers can share the document with other users. */
  core.bool writersCanShare;

  /** The id of the file. */
  core.String id;

  /** The title of this file. */
  core.String title;

  /** Name(s) of the owner(s) of this file. */
  core.List<core.String> ownerNames;

  /** Time at which this file was shared with the user (formatted RFC 3339 timestamp). */
  core.String sharedWithMeDate;

  /** Last time this file was viewed by the user (formatted RFC 3339 timestamp). */
  core.String lastViewedByMeDate;

  /**
 * Collection of parent folders which contain this file. Setting this field will put the file in all
 * of the provided folders. On insert, if no folders are provided, the file will be placed in the
 * default root folder.
 */
  core.List<ParentReference> parents;

  /** Links for exporting Google Docs to specific formats. */
  core.Map<core.String, core.String> exportLinks;

  /**
 * Thumbnail for the file. Only accepted on upload and for files that are not already thumbnailed by
 * Google.
 */
  FileThumbnail thumbnail;

  /**
 * The original filename if the file was uploaded manually, or the original title if the file was
 * inserted through the API. Note that renames of the title will not change the original filename.
 * This will only be populated on files with content stored in Drive.
 */
  core.String originalFilename;

  /** A short description of the file. */
  core.String description;

  /**
 * A link for downloading the content of the file in a browser using cookie based authentication. In
 * cases where the content is shared publicly, the content can be downloaded without any
 * credentials.
 */
  core.String webContentLink;

  /** Whether the file can be edited by the current user. */
  core.bool editable;

  /** The type of file. This is always drive#file. */
  core.String kind;

  /** The number of quota bytes used by this file. */
  core.String quotaBytesUsed;

  /**
 * The size of the file in bytes. This will only be populated on files with content stored in Drive.
 */
  core.String fileSize;

  /** Create time for this file (formatted ISO8601 timestamp). */
  core.String createdDate;

  /**
 * An MD5 checksum for the content of this file. This will only be populated on files with content
 * stored in Drive.
 */
  core.String md5Checksum;

  /**
 * Metadata about image media. This will only be present for image types, and its contents will
 * depend on what can be parsed from the image content.
 */
  FileImageMediaMetadata imageMediaMetadata;

  /** A link for embedding the file. */
  core.String embedLink;

  /** A link for opening the file in using a relevant Google editor or viewer. */
  core.String alternateLink;

  /**
 * Last time this file was modified by the user (formatted RFC 3339 timestamp). Note that setting
 * modifiedDate will also update the modifiedByMe date for the user which set the date.
 */
  core.String modifiedByMeDate;

  /**
 * Short term download URL for the file. This will only be populated on files with content stored in
 * Drive.
 */
  core.String downloadUrl;

  /** The permissions for the authenticated user on this file. */
  Permission userPermission;

  /**
 * The file extension used when downloading this file. This field is set from the title when
 * inserting or uploading new content. This will only be populated on files with content stored in
 * Drive.
 */
  core.String fileExtension;

  /** A link back to this file. */
  core.String selfLink;

  /**
 * Last time this file was modified by anyone (formatted RFC 3339 timestamp). This is only mutable
 * on update when the setModifiedDate parameter is set.
 */
  core.String modifiedDate;

  /** Parses an instance from its JSON representation. */
  static File parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new File();
    result.mimeType = identity(json["mimeType"]);
    result.thumbnailLink = identity(json["thumbnailLink"]);
    result.labels = FileLabels.parse(json["labels"]);
    result.indexableText = FileIndexableText.parse(json["indexableText"]);
    result.explicitlyTrashed = identity(json["explicitlyTrashed"]);
    result.etag = identity(json["etag"]);
    result.lastModifyingUserName = identity(json["lastModifyingUserName"]);
    result.writersCanShare = identity(json["writersCanShare"]);
    result.id = identity(json["id"]);
    result.title = identity(json["title"]);
    result.ownerNames = map(identity)(json["ownerNames"]);
    result.sharedWithMeDate = identity(json["sharedWithMeDate"]);
    result.lastViewedByMeDate = identity(json["lastViewedByMeDate"]);
    result.parents = map(ParentReference.parse)(json["parents"]);
    result.exportLinks = mapValues(identity)(json["exportLinks"]);
    result.thumbnail = FileThumbnail.parse(json["thumbnail"]);
    result.originalFilename = identity(json["originalFilename"]);
    result.description = identity(json["description"]);
    result.webContentLink = identity(json["webContentLink"]);
    result.editable = identity(json["editable"]);
    result.kind = identity(json["kind"]);
    result.quotaBytesUsed = identity(json["quotaBytesUsed"]);
    result.fileSize = identity(json["fileSize"]);
    result.createdDate = identity(json["createdDate"]);
    result.md5Checksum = identity(json["md5Checksum"]);
    result.imageMediaMetadata = FileImageMediaMetadata.parse(json["imageMediaMetadata"]);
    result.embedLink = identity(json["embedLink"]);
    result.alternateLink = identity(json["alternateLink"]);
    result.modifiedByMeDate = identity(json["modifiedByMeDate"]);
    result.downloadUrl = identity(json["downloadUrl"]);
    result.userPermission = Permission.parse(json["userPermission"]);
    result.fileExtension = identity(json["fileExtension"]);
    result.selfLink = identity(json["selfLink"]);
    result.modifiedDate = identity(json["modifiedDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(File value) {
    if (value == null) return null;
    final result = {};
    result["mimeType"] = identity(value.mimeType);
    result["thumbnailLink"] = identity(value.thumbnailLink);
    result["labels"] = FileLabels.serialize(value.labels);
    result["indexableText"] = FileIndexableText.serialize(value.indexableText);
    result["explicitlyTrashed"] = identity(value.explicitlyTrashed);
    result["etag"] = identity(value.etag);
    result["lastModifyingUserName"] = identity(value.lastModifyingUserName);
    result["writersCanShare"] = identity(value.writersCanShare);
    result["id"] = identity(value.id);
    result["title"] = identity(value.title);
    result["ownerNames"] = map(identity)(value.ownerNames);
    result["sharedWithMeDate"] = identity(value.sharedWithMeDate);
    result["lastViewedByMeDate"] = identity(value.lastViewedByMeDate);
    result["parents"] = map(ParentReference.serialize)(value.parents);
    result["exportLinks"] = mapValues(identity)(value.exportLinks);
    result["thumbnail"] = FileThumbnail.serialize(value.thumbnail);
    result["originalFilename"] = identity(value.originalFilename);
    result["description"] = identity(value.description);
    result["webContentLink"] = identity(value.webContentLink);
    result["editable"] = identity(value.editable);
    result["kind"] = identity(value.kind);
    result["quotaBytesUsed"] = identity(value.quotaBytesUsed);
    result["fileSize"] = identity(value.fileSize);
    result["createdDate"] = identity(value.createdDate);
    result["md5Checksum"] = identity(value.md5Checksum);
    result["imageMediaMetadata"] = FileImageMediaMetadata.serialize(value.imageMediaMetadata);
    result["embedLink"] = identity(value.embedLink);
    result["alternateLink"] = identity(value.alternateLink);
    result["modifiedByMeDate"] = identity(value.modifiedByMeDate);
    result["downloadUrl"] = identity(value.downloadUrl);
    result["userPermission"] = Permission.serialize(value.userPermission);
    result["fileExtension"] = identity(value.fileExtension);
    result["selfLink"] = identity(value.selfLink);
    result["modifiedDate"] = identity(value.modifiedDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileImageMediaMetadata
class FileImageMediaMetadata extends IdentityHash {
  /** Whether a flash was used to create the photo. */
  core.bool flashUsed;

  /** The length of the exposure, in seconds. */
  core.double exposureTime;

  /** The make of the camera used to create the photo. */
  core.String cameraMake;

  /** The ISO speed used to create the photo. */
  core.int isoSpeed;

  /** The focal length used to create the photo, in millimeters. */
  core.double focalLength;

  /** The height of the image in pixels. */
  core.int height;

  /** The date and time the photo was taken (EXIF format timestamp). */
  core.String date;

  /** Geographic location information stored in the image. */
  FileImageMediaMetadataLocation location;

  /** The aperture used to create the photo (f-number). */
  core.double aperture;

  /** The rotation in clockwise degrees from the image's original orientation. */
  core.int rotation;

  /** The width of the image in pixels. */
  core.int width;

  /** The model of the camera used to create the photo. */
  core.String cameraModel;

  /** Parses an instance from its JSON representation. */
  static FileImageMediaMetadata parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileImageMediaMetadata();
    result.flashUsed = identity(json["flashUsed"]);
    result.exposureTime = identity(json["exposureTime"]);
    result.cameraMake = identity(json["cameraMake"]);
    result.isoSpeed = identity(json["isoSpeed"]);
    result.focalLength = identity(json["focalLength"]);
    result.height = identity(json["height"]);
    result.date = identity(json["date"]);
    result.location = FileImageMediaMetadataLocation.parse(json["location"]);
    result.aperture = identity(json["aperture"]);
    result.rotation = identity(json["rotation"]);
    result.width = identity(json["width"]);
    result.cameraModel = identity(json["cameraModel"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileImageMediaMetadata value) {
    if (value == null) return null;
    final result = {};
    result["flashUsed"] = identity(value.flashUsed);
    result["exposureTime"] = identity(value.exposureTime);
    result["cameraMake"] = identity(value.cameraMake);
    result["isoSpeed"] = identity(value.isoSpeed);
    result["focalLength"] = identity(value.focalLength);
    result["height"] = identity(value.height);
    result["date"] = identity(value.date);
    result["location"] = FileImageMediaMetadataLocation.serialize(value.location);
    result["aperture"] = identity(value.aperture);
    result["rotation"] = identity(value.rotation);
    result["width"] = identity(value.width);
    result["cameraModel"] = identity(value.cameraModel);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileImageMediaMetadata.FileImageMediaMetadataLocation
class FileImageMediaMetadataLocation extends IdentityHash {
  /** The latitude stored in the image. */
  core.double latitude;

  /** The altitude stored in the image. */
  core.double altitude;

  /** The longitude stored in the image. */
  core.double longitude;

  /** Parses an instance from its JSON representation. */
  static FileImageMediaMetadataLocation parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileImageMediaMetadataLocation();
    result.latitude = identity(json["latitude"]);
    result.altitude = identity(json["altitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileImageMediaMetadataLocation value) {
    if (value == null) return null;
    final result = {};
    result["latitude"] = identity(value.latitude);
    result["altitude"] = identity(value.altitude);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileIndexableText
class FileIndexableText extends IdentityHash {
  /** The text to be indexed for this file */
  core.String text;

  /** Parses an instance from its JSON representation. */
  static FileIndexableText parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileIndexableText();
    result.text = identity(json["text"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileIndexableText value) {
    if (value == null) return null;
    final result = {};
    result["text"] = identity(value.text);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileLabels
class FileLabels extends IdentityHash {
  /** Whether viewers are prevented from downloading this file. */
  core.bool restricted;

  /** Whether this file is hidden from the user. */
  core.bool hidden;

  /** Whether this file has been viewed by this user. */
  core.bool viewed;

  /** Whether this file is starred by the user. */
  core.bool starred;

  /** Whether this file has been trashed. */
  core.bool trashed;

  /** Parses an instance from its JSON representation. */
  static FileLabels parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileLabels();
    result.restricted = identity(json["restricted"]);
    result.hidden = identity(json["hidden"]);
    result.viewed = identity(json["viewed"]);
    result.starred = identity(json["starred"]);
    result.trashed = identity(json["trashed"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileLabels value) {
    if (value == null) return null;
    final result = {};
    result["restricted"] = identity(value.restricted);
    result["hidden"] = identity(value.hidden);
    result["viewed"] = identity(value.viewed);
    result["starred"] = identity(value.starred);
    result["trashed"] = identity(value.trashed);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FileList
class FileList extends IdentityHash {
  /** The page token for the next page of files. */
  core.String nextPageToken;

  /** This is always drive#fileList. */
  core.String kind;

  /** The actual list of files. */
  core.List<File> items;

  /** A link to the next page of files. */
  core.String nextLink;

  /** The ETag of the list. */
  core.String etag;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static FileList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(File.parse)(json["items"]);
    result.nextLink = identity(json["nextLink"]);
    result.etag = identity(json["etag"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(File.serialize)(value.items);
    result["nextLink"] = identity(value.nextLink);
    result["etag"] = identity(value.etag);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileThumbnail
class FileThumbnail extends IdentityHash {
  /** The MIME type of the thumbnail. */
  core.String mimeType;

  /** The URL-safe Base64 encoded bytes of the thumbnail image. */
  core.String image;

  /** Parses an instance from its JSON representation. */
  static FileThumbnail parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileThumbnail();
    result.mimeType = identity(json["mimeType"]);
    result.image = identity(json["image"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileThumbnail value) {
    if (value == null) return null;
    final result = {};
    result["mimeType"] = identity(value.mimeType);
    result["image"] = identity(value.image);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ParentList
class ParentList extends IdentityHash {
  /** The actual list of parents. */
  core.List<ParentReference> items;

  /** This is always drive#parentList. */
  core.String kind;

  /** The ETag of the list. */
  core.String etag;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static ParentList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ParentList();
    result.items = map(ParentReference.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ParentList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(ParentReference.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ParentReference
class ParentReference extends IdentityHash {
  /** A link back to this reference. */
  core.String selfLink;

  /** This is always drive#parentReference. */
  core.String kind;

  /** The ID of the parent. */
  core.String id;

  /** Whether or not the parent is the root folder. */
  core.bool isRoot;

  /** A link to the parent. */
  core.String parentLink;

  /** Parses an instance from its JSON representation. */
  static ParentReference parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ParentReference();
    result.selfLink = identity(json["selfLink"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.isRoot = identity(json["isRoot"]);
    result.parentLink = identity(json["parentLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ParentReference value) {
    if (value == null) return null;
    final result = {};
    result["selfLink"] = identity(value.selfLink);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["isRoot"] = identity(value.isRoot);
    result["parentLink"] = identity(value.parentLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Permission
class Permission extends IdentityHash {
  /** Whether the link is required for this permission. */
  core.bool withLink;

  /** This is always drive#permission. */
  core.String kind;

  /** The name for this permission. */
  core.String name;

  /** The email address or domain name for the entity. This is not populated in responses. */
  core.String value;

  /** The ID of the permission. */
  core.String id;

  /** The authkey parameter required for this permission. */
  core.String authKey;

  /** The ETag of the permission. */
  core.String etag;

  /** The primary role for this user. Allowed values are:  
- owner 
- reader 
- writer */
  core.String role;

  /** A link to the profile photo, if available. */
  core.String photoLink;

  /** The account type. Allowed values are:  
- user 
- group 
- domain 
- anyone */
  core.String type;

  /** Additional roles for this user. Only commenter is currently allowed. */
  core.List<core.String> additionalRoles;

  /** A link back to this permission. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Permission parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Permission();
    result.withLink = identity(json["withLink"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.value = identity(json["value"]);
    result.id = identity(json["id"]);
    result.authKey = identity(json["authKey"]);
    result.etag = identity(json["etag"]);
    result.role = identity(json["role"]);
    result.photoLink = identity(json["photoLink"]);
    result.type = identity(json["type"]);
    result.additionalRoles = map(identity)(json["additionalRoles"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Permission value) {
    if (value == null) return null;
    final result = {};
    result["withLink"] = identity(value.withLink);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["value"] = identity(value.value);
    result["id"] = identity(value.id);
    result["authKey"] = identity(value.authKey);
    result["etag"] = identity(value.etag);
    result["role"] = identity(value.role);
    result["photoLink"] = identity(value.photoLink);
    result["type"] = identity(value.type);
    result["additionalRoles"] = map(identity)(value.additionalRoles);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PermissionList
class PermissionList extends IdentityHash {
  /** The actual list of permissions. */
  core.List<Permission> items;

  /** This is always drive#permissionList. */
  core.String kind;

  /** The ETag of the list. */
  core.String etag;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static PermissionList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PermissionList();
    result.items = map(Permission.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PermissionList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Permission.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Revision
class Revision extends IdentityHash {
  /** The MIME type of the revision. */
  core.String mimeType;

  /**
 * Whether this revision is pinned to prevent automatic purging. This will only be populated and can
 * only be modified on files with content stored in Drive which are not Google Docs. Revisions can
 * also be pinned when they are created through the drive.files.insert/update/copy by using the
 * pinned query parameter.
 */
  core.bool pinned;

  /** This is always drive#revision. */
  core.String kind;

  /** A link to the published revision. */
  core.String publishedLink;

  /**
 * Whether this revision is published outside the domain. This is only populated and can only be
 * modified for Google Docs.
 */
  core.bool publishedOutsideDomain;

  /**
 * Whether subsequent revisions will be automatically republished. This is only populated and can
 * only be modified for Google Docs.
 */
  core.bool publishAuto;

  /**
 * Whether this revision is published. This is only populated and can only be modified for Google
 * Docs.
 */
  core.bool published;

  /**
 * Short term download URL for the file. This will only be populated on files with content stored in
 * Drive.
 */
  core.String downloadUrl;

  /** A link back to this revision. */
  core.String selfLink;

  /** The ETag of the revision. */
  core.String etag;

  /**
 * The size of the revision in bytes. This will only be populated on files with content stored in
 * Drive.
 */
  core.String fileSize;

  /** Links for exporting Google Docs to specific formats. */
  core.Map<core.String, core.String> exportLinks;

  /** Name of the last user to modify this revision. */
  core.String lastModifyingUserName;

  /**
 * The original filename when this revision was created. This will only be populated on files with
 * content stored in Drive.
 */
  core.String originalFilename;

  /** The ID of the revision. */
  core.String id;

  /**
 * An MD5 checksum for the content of this revision. This will only be populated on files with
 * content stored in Drive.
 */
  core.String md5Checksum;

  /** Last time this revision was modified (formatted RFC 3339 timestamp). */
  core.String modifiedDate;

  /** Parses an instance from its JSON representation. */
  static Revision parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Revision();
    result.mimeType = identity(json["mimeType"]);
    result.pinned = identity(json["pinned"]);
    result.kind = identity(json["kind"]);
    result.publishedLink = identity(json["publishedLink"]);
    result.publishedOutsideDomain = identity(json["publishedOutsideDomain"]);
    result.publishAuto = identity(json["publishAuto"]);
    result.published = identity(json["published"]);
    result.downloadUrl = identity(json["downloadUrl"]);
    result.selfLink = identity(json["selfLink"]);
    result.etag = identity(json["etag"]);
    result.fileSize = identity(json["fileSize"]);
    result.exportLinks = mapValues(identity)(json["exportLinks"]);
    result.lastModifyingUserName = identity(json["lastModifyingUserName"]);
    result.originalFilename = identity(json["originalFilename"]);
    result.id = identity(json["id"]);
    result.md5Checksum = identity(json["md5Checksum"]);
    result.modifiedDate = identity(json["modifiedDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Revision value) {
    if (value == null) return null;
    final result = {};
    result["mimeType"] = identity(value.mimeType);
    result["pinned"] = identity(value.pinned);
    result["kind"] = identity(value.kind);
    result["publishedLink"] = identity(value.publishedLink);
    result["publishedOutsideDomain"] = identity(value.publishedOutsideDomain);
    result["publishAuto"] = identity(value.publishAuto);
    result["published"] = identity(value.published);
    result["downloadUrl"] = identity(value.downloadUrl);
    result["selfLink"] = identity(value.selfLink);
    result["etag"] = identity(value.etag);
    result["fileSize"] = identity(value.fileSize);
    result["exportLinks"] = mapValues(identity)(value.exportLinks);
    result["lastModifyingUserName"] = identity(value.lastModifyingUserName);
    result["originalFilename"] = identity(value.originalFilename);
    result["id"] = identity(value.id);
    result["md5Checksum"] = identity(value.md5Checksum);
    result["modifiedDate"] = identity(value.modifiedDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .RevisionList
class RevisionList extends IdentityHash {
  /** The actual list of revisions. */
  core.List<Revision> items;

  /** This is always drive#revisionList. */
  core.String kind;

  /** The ETag of the list. */
  core.String etag;

  /** A link back to this list. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static RevisionList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RevisionList();
    result.items = map(Revision.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RevisionList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Revision.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .User
class User extends IdentityHash {
  /** The user's profile picture. */
  UserPicture picture;

  /** This is always drive#user. */
  core.String kind;

  /**
 * Whether this user is the same as the authenticated user of which the request was made on behalf.
 */
  core.bool isAuthenticatedUser;

  /** A plain text displayable name for this user. */
  core.String displayName;

  /** Parses an instance from its JSON representation. */
  static User parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new User();
    result.picture = UserPicture.parse(json["picture"]);
    result.kind = identity(json["kind"]);
    result.isAuthenticatedUser = identity(json["isAuthenticatedUser"]);
    result.displayName = identity(json["displayName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(User value) {
    if (value == null) return null;
    final result = {};
    result["picture"] = UserPicture.serialize(value.picture);
    result["kind"] = identity(value.kind);
    result["isAuthenticatedUser"] = identity(value.isAuthenticatedUser);
    result["displayName"] = identity(value.displayName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema User.UserPicture
class UserPicture extends IdentityHash {
  /** A URL that points to a profile picture of this user. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static UserPicture parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserPicture();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserPicture value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum DriveApi.Alt
class DriveApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const DriveApiAlt JSON = const DriveApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<DriveApiAlt> values = const <DriveApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <DriveApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static DriveApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const DriveApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

