#library('drive-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API DriveApi
/**
 * The API to interact with Drive.
 */
class DriveApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  DriveApi get _$service() => this;
  FilesResource _files;
  FilesResource get files() => _files;
  
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


  DriveApi([this.baseUrl = "https://www.googleapis.com/drive/v1/", this.applicationName, this.authenticator]) { 
    _files = new FilesResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}drive/v1/20120608 google-api-dart-client/${clientVersion}";
  }
}

// Resource .FilesResource
class FilesResource extends core.Object {
  final DriveApi _$service;
  
  FilesResource._internal(DriveApi $service) : _$service = $service;

  // Method FilesResource.Insert
  /**
   * Inserts a file, and any settable metadata or blob content sent with the request.
   * [content] the File
   */
  core.Future<File> insert(File content) {
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
    final $body = JSON.stringify(File.serialize(content));
    final $path = "files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
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
   * [id] The id for the file in question.
   * [content] the File
   */
  core.Future<File> patch(core.String id, File content, [core.bool updateViewedDate = UNSPECIFIED, core.bool updateModifiedDate = UNSPECIFIED, core.bool newRevision = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != updateViewedDate) $queryParams["updateViewedDate"] = updateViewedDate;
    if (UNSPECIFIED != updateModifiedDate) $queryParams["updateModifiedDate"] = updateModifiedDate;
    if (UNSPECIFIED != newRevision) $queryParams["newRevision"] = newRevision;
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
    final $path = "files/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Update
  /**
   * Updates file metadata and/or content
   * [id] The id for the file in question.
   * [content] the File
   */
  core.Future<File> update(core.String id, File content, [core.bool updateViewedDate = UNSPECIFIED, core.bool updateModifiedDate = UNSPECIFIED, core.bool newRevision = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != updateViewedDate) $queryParams["updateViewedDate"] = updateViewedDate;
    if (UNSPECIFIED != updateModifiedDate) $queryParams["updateModifiedDate"] = updateModifiedDate;
    if (UNSPECIFIED != newRevision) $queryParams["newRevision"] = newRevision;
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
    final $path = "files/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method FilesResource.Get
  /**
   * Gets a file's metadata by id.
   * [id] The id for the file in question.
   */
  core.Future<File> get(core.String id, [core.bool updateViewedDate = UNSPECIFIED, FilesResourceGetProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != updateViewedDate) $queryParams["updateViewedDate"] = updateViewedDate;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "files/{id}";
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

// Enum FilesResource.Get.Projection
class FilesResourceGetProjection extends core.Object implements core.Hashable {
  /** Includes only the basic metadata fields */
  static final FilesResourceGetProjection BASIC = const FilesResourceGetProjection._internal("BASIC", 0);
  /** Includes all metadata fields */
  static final FilesResourceGetProjection FULL = const FilesResourceGetProjection._internal("FULL", 1);

  /** All values of this enumeration */
  static final core.List<FilesResourceGetProjection> values = const <FilesResourceGetProjection>[
    BASIC,
    FULL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <FilesResourceGetProjection>{ 
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

// Schema .File
class File extends IdentityHash {
  /** The mimetype of the file */
  core.String mimeType;

  /** A link back to this file. */
  core.String selfLink;

  /** The type of file. This is always drive#file */
  core.String kind;

  /** A short description of the file */
  core.String description;

  /** The title of this file. */
  core.String title;

  /** Last time this file was modified by the user (formatted RFC 3339 timestamp). */
  core.String modifiedByMeDate;

  /** Labels for the file. */
  FileLabels labels;

  /** Indexable text attributes for the file (can only be written) */
  FileIndexableText indexableText;

  /**
 * Collection of parent folders which contain this file. On insert, setting this field will put the
 * file in all of the provided folders. If no folders are provided, the file will be placed in the
 * default root folder. On update, this field is ignored.
 */
  core.List<FileParentsCollection> parentsCollection;

  /**
 * Short term download URL for the file. This will only be populated on files with content stored in
 * Drive.
 */
  core.String downloadUrl;

  /** The permissions for the authenticated user on this file. */
  Permission userPermission;

  /** ETag of the file. */
  core.String etag;

  /**
 * The size of the file in bytes. This will only be populated on files with content stored in Drive.
 */
  core.String fileSize;

  /** Create time for this file (formatted ISO8601 timestamp). */
  core.String createdDate;

  /**
 * The file extension used when downloading this file. This field is read only. To set the
 * extension, include it on title when creating the file. This will only be populated on files with
 * content stored in Drive.
 */
  core.String fileExtension;

  /** Last time this file was viewed by anyone (formatted RFC 3339 timestamp). */
  core.String lastViewedDate;

  /** The id of the file. */
  core.String id;

  /**
 * An MD5 checksum for the content of this file. This will only be populated on files with content
 * stored in Drive.
 */
  core.String md5Checksum;

  /** Last time this file was modified by anyone (formatted RFC 3339 timestamp). */
  core.String modifiedDate;

  /** Parses an instance from its JSON representation. */
  static File parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new File();
    result.mimeType = identity(json["mimeType"]);
    result.selfLink = identity(json["selfLink"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.title = identity(json["title"]);
    result.modifiedByMeDate = identity(json["modifiedByMeDate"]);
    result.labels = FileLabels.parse(json["labels"]);
    result.indexableText = FileIndexableText.parse(json["indexableText"]);
    result.parentsCollection = map(FileParentsCollection.parse)(json["parentsCollection"]);
    result.downloadUrl = identity(json["downloadUrl"]);
    result.userPermission = Permission.parse(json["userPermission"]);
    result.etag = identity(json["etag"]);
    result.fileSize = identity(json["fileSize"]);
    result.createdDate = identity(json["createdDate"]);
    result.fileExtension = identity(json["fileExtension"]);
    result.lastViewedDate = identity(json["lastViewedDate"]);
    result.id = identity(json["id"]);
    result.md5Checksum = identity(json["md5Checksum"]);
    result.modifiedDate = identity(json["modifiedDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(File value) {
    if (value == null) return null;
    final result = {};
    result["mimeType"] = identity(value.mimeType);
    result["selfLink"] = identity(value.selfLink);
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["title"] = identity(value.title);
    result["modifiedByMeDate"] = identity(value.modifiedByMeDate);
    result["labels"] = FileLabels.serialize(value.labels);
    result["indexableText"] = FileIndexableText.serialize(value.indexableText);
    result["parentsCollection"] = map(FileParentsCollection.serialize)(value.parentsCollection);
    result["downloadUrl"] = identity(value.downloadUrl);
    result["userPermission"] = Permission.serialize(value.userPermission);
    result["etag"] = identity(value.etag);
    result["fileSize"] = identity(value.fileSize);
    result["createdDate"] = identity(value.createdDate);
    result["fileExtension"] = identity(value.fileExtension);
    result["lastViewedDate"] = identity(value.lastViewedDate);
    result["id"] = identity(value.id);
    result["md5Checksum"] = identity(value.md5Checksum);
    result["modifiedDate"] = identity(value.modifiedDate);
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
  /** Whether this file is hidden from the user */
  core.bool hidden;

  /** Whether this file is starred by the user. */
  core.bool starred;

  /** Whether this file has been trashed. */
  core.bool trashed;

  /** Parses an instance from its JSON representation. */
  static FileLabels parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileLabels();
    result.hidden = identity(json["hidden"]);
    result.starred = identity(json["starred"]);
    result.trashed = identity(json["trashed"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileLabels value) {
    if (value == null) return null;
    final result = {};
    result["hidden"] = identity(value.hidden);
    result["starred"] = identity(value.starred);
    result["trashed"] = identity(value.trashed);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileParentsCollection
class FileParentsCollection extends IdentityHash {
  /** A link to get the metadata for this parent */
  core.String parentLink;

  /** The id of this parent */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static FileParentsCollection parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileParentsCollection();
    result.parentLink = identity(json["parentLink"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileParentsCollection value) {
    if (value == null) return null;
    final result = {};
    result["parentLink"] = identity(value.parentLink);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Permission
class Permission extends IdentityHash {
  /** The type of permission (For example: user, group etc). */
  core.String type;

  /** The kind of this permission. This is always drive#permission */
  core.String kind;

  /** An etag for this permission. */
  core.String etag;

  /** The role that this permission describes. (For example: reader, writer, owner) */
  core.String role;

  /** Any additional roles that this permission describes. */
  core.List<core.String> additionalRoles;

  /** Parses an instance from its JSON representation. */
  static Permission parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Permission();
    result.type = identity(json["type"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.role = identity(json["role"]);
    result.additionalRoles = map(identity)(json["additionalRoles"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Permission value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["role"] = identity(value.role);
    result["additionalRoles"] = map(identity)(value.additionalRoles);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum DriveApi.Alt
class DriveApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final DriveApiAlt JSON = const DriveApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<DriveApiAlt> values = const <DriveApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <DriveApiAlt>{ 
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

