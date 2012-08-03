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

#library('books-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API BooksApi
/**
 * Lets you search for books and manage your Google Books library.
 */
class BooksApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  BooksApi get _$service() => this;
  LayersResource _layers;
  LayersResource get layers() => _layers;
  BookshelvesResource _bookshelves;
  BookshelvesResource get bookshelves() => _bookshelves;
  MyconfigResource _myconfig;
  MyconfigResource get myconfig() => _myconfig;
  VolumesResource _volumes;
  VolumesResource get volumes() => _volumes;
  MylibraryResource _mylibrary;
  MylibraryResource get mylibrary() => _mylibrary;
  
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
  BooksApiAlt alt;


  BooksApi([this.baseUrl = "https://www.googleapis.com/books/v1/", applicationName, this.authenticator]) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _layers = new LayersResource._internal(this);
    _bookshelves = new BookshelvesResource._internal(this);
    _myconfig = new MyconfigResource._internal(this);
    _volumes = new VolumesResource._internal(this);
    _mylibrary = new MylibraryResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}books/v1/20120614 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your books */
  static final core.String BOOKS_SCOPE = "https://www.googleapis.com/auth/books";
}

// Resource .LayersResource
class LayersResource extends core.Object {
  final BooksApi _$service;
  final LayersAnnotationDataResourceResource annotationData;
  final LayersVolumeAnnotationsResourceResource volumeAnnotations;
  
  LayersResource._internal(BooksApi $service) : _$service = $service,
    annotationData = new LayersAnnotationDataResourceResource._internal($service),
    volumeAnnotations = new LayersVolumeAnnotationsResourceResource._internal($service);

  // Method LayersResource.List
  /**
   * List the layer summaries for a volume.
   *
   *    * [volumeId] The volume to retrieve layers for.
   *    * [pageToken] The value of the nextToken from the previous page.
   *    * [contentVersion] The content version for the requested volume.
   *    * [maxResults] Maximum number of results to return

  Minimum: 0.
  Maximum: 200.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Layersummaries> list(core.String volumeId, [core.String pageToken = UNSPECIFIED, core.String contentVersion = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != contentVersion) $queryParams["contentVersion"] = contentVersion;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/layersummary";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Layersummaries.parse(JSON.parse($text)));
  }

  // Method LayersResource.Get
  /**
   * Gets the layer summary for a volume.
   *
   *    * [volumeId] The volume to retrieve layers for.
   *    * [summaryId] The ID for the layer to get the summary for.
   *    * [source] String to identify the originator of this request.
   *    * [contentVersion] The content version for the requested volume.
   */
  core.Future<Layersummary> get(core.String volumeId, core.String summaryId, [core.String source = UNSPECIFIED, core.String contentVersion = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["summaryId"] = summaryId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != contentVersion) $queryParams["contentVersion"] = contentVersion;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/layersummary/{summaryId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Layersummary.parse(JSON.parse($text)));
  }
}


// Resource LayersResource.LayersAnnotationDataResourceResource
class LayersAnnotationDataResourceResource extends core.Object {
  final BooksApi _$service;
  
  LayersAnnotationDataResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method LayersResource.LayersAnnotationDataResourceResource.List
  /**
   * Gets the annotation data for a volume and layer.
   *
   *    * [volumeId] The volume to retrieve annotation data for.
   *    * [layerId] The ID for the layer to get the annotation data.
   *    * [contentVersion] The content version for the requested volume.
   *    * [scale] The requested scale for the image.

  Minimum: 0.
   *    * [source] String to identify the originator of this request.
   *    * [locale] The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'.
   *    * [h] The requested pixel height for any images. If height is provided width must also be provided.
   *    * [updatedMax] RFC 3339 timestamp to restrict to items updated prior to this timestamp (exclusive).
   *    * [maxResults] Maximum number of results to return

  Minimum: 0.
  Maximum: 200.
   *    * [annotationDataId] The list of Annotation Data Ids to retrieve. Pagination is ignored if this is set.
   *    * [pageToken] The value of the nextToken from the previous page.
   *    * [w] The requested pixel width for any images. If width is provided height must also be provided.
   *    * [updatedMin] RFC 3339 timestamp to restrict to items updated since this timestamp (inclusive).
   */
  core.Future<Annotationsdata> list(core.String volumeId, core.String layerId, core.String contentVersion, [core.int scale = UNSPECIFIED, core.String source = UNSPECIFIED, core.String locale = UNSPECIFIED, core.int h = UNSPECIFIED, core.String updatedMax = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.List<core.String> annotationDataId = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int w = UNSPECIFIED, core.String updatedMin = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["layerId"] = layerId;
    $pathParams["contentVersion"] = contentVersion;
    if (UNSPECIFIED != scale) $queryParams["scale"] = scale;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != h) $queryParams["h"] = h;
    if (UNSPECIFIED != updatedMax) $queryParams["updatedMax"] = updatedMax;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != annotationDataId) $queryParams["annotationDataId"] = annotationDataId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != w) $queryParams["w"] = w;
    if (UNSPECIFIED != updatedMin) $queryParams["updatedMin"] = updatedMin;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/layers/{layerId}/data";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Annotationsdata.parse(JSON.parse($text)));
  }

  // Method LayersResource.LayersAnnotationDataResourceResource.Get
  /**
   * Gets the annotation data.
   *
   *    * [volumeId] The volume to retrieve annotations for.
   *    * [layerId] The ID for the layer to get the annotations.
   *    * [annotationDataId] The ID of the annotation data to retrieve.
   *    * [contentVersion] The content version for the volume you are trying to retrieve.
   *    * [scale] The requested scale for the image.

  Minimum: 0.
   *    * [locale] The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'.
   *    * [h] The requested pixel height for any images. If height is provided width must also be provided.
   *    * [source] String to identify the originator of this request.
   *    * [w] The requested pixel width for any images. If width is provided height must also be provided.
   */
  core.Future<Annotationdata> get(core.String volumeId, core.String layerId, core.String annotationDataId, core.String contentVersion, [core.int scale = UNSPECIFIED, core.String locale = UNSPECIFIED, core.int h = UNSPECIFIED, core.String source = UNSPECIFIED, core.int w = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["layerId"] = layerId;
    $pathParams["annotationDataId"] = annotationDataId;
    $pathParams["contentVersion"] = contentVersion;
    if (UNSPECIFIED != scale) $queryParams["scale"] = scale;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != h) $queryParams["h"] = h;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != w) $queryParams["w"] = w;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/layers/{layerId}/data/{annotationDataId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Annotationdata.parse(JSON.parse($text)));
  }
}

// Resource LayersResource.LayersVolumeAnnotationsResourceResource
class LayersVolumeAnnotationsResourceResource extends core.Object {
  final BooksApi _$service;
  
  LayersVolumeAnnotationsResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method LayersResource.LayersVolumeAnnotationsResourceResource.List
  /**
   * Gets the volume annotations for a volume and layer.
   *
   *    * [volumeId] The volume to retrieve annotations for.
   *    * [layerId] The ID for the layer to get the annotations.
   *    * [contentVersion] The content version for the requested volume.
   *    * [showDeleted] Set to true to return deleted annotations. updatedMin must be in the request to use this. Defaults
   *        to false.
   *    * [endPosition] The end position to end retrieving data from.
   *    * [endOffset] The end offset to end retrieving data from.
   *    * [locale] The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'.
   *    * [updatedMin] RFC 3339 timestamp to restrict to items updated since this timestamp (inclusive).
   *    * [updatedMax] RFC 3339 timestamp to restrict to items updated prior to this timestamp (exclusive).
   *    * [maxResults] Maximum number of results to return

  Minimum: 0.
  Maximum: 200.
   *    * [pageToken] The value of the nextToken from the previous page.
   *    * [source] String to identify the originator of this request.
   *    * [startOffset] The start offset to start retrieving data from.
   *    * [startPosition] The start position to start retrieving data from.
   */
  core.Future<Volumeannotations> list(core.String volumeId, core.String layerId, core.String contentVersion, [core.bool showDeleted = UNSPECIFIED, core.String endPosition = UNSPECIFIED, core.String endOffset = UNSPECIFIED, core.String locale = UNSPECIFIED, core.String updatedMin = UNSPECIFIED, core.String updatedMax = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.String source = UNSPECIFIED, core.String startOffset = UNSPECIFIED, core.String startPosition = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["layerId"] = layerId;
    $pathParams["contentVersion"] = contentVersion;
    if (UNSPECIFIED != showDeleted) $queryParams["showDeleted"] = showDeleted;
    if (UNSPECIFIED != endPosition) $queryParams["endPosition"] = endPosition;
    if (UNSPECIFIED != endOffset) $queryParams["endOffset"] = endOffset;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != updatedMin) $queryParams["updatedMin"] = updatedMin;
    if (UNSPECIFIED != updatedMax) $queryParams["updatedMax"] = updatedMax;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != startOffset) $queryParams["startOffset"] = startOffset;
    if (UNSPECIFIED != startPosition) $queryParams["startPosition"] = startPosition;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/layers/{layerId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumeannotations.parse(JSON.parse($text)));
  }

  // Method LayersResource.LayersVolumeAnnotationsResourceResource.Get
  /**
   * Gets the volume annotation.
   *
   *    * [volumeId] The volume to retrieve annotations for.
   *    * [layerId] The ID for the layer to get the annotations.
   *    * [annotationId] The ID of the volume annotation to retrieve.
   *    * [locale] The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Volumeannotation> get(core.String volumeId, core.String layerId, core.String annotationId, [core.String locale = UNSPECIFIED, core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["layerId"] = layerId;
    $pathParams["annotationId"] = annotationId;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/layers/{layerId}/annotations/{annotationId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumeannotation.parse(JSON.parse($text)));
  }
}

// Resource .BookshelvesResource
class BookshelvesResource extends core.Object {
  final BooksApi _$service;
  final BookshelvesVolumesResourceResource volumes;
  
  BookshelvesResource._internal(BooksApi $service) : _$service = $service,
    volumes = new BookshelvesVolumesResourceResource._internal($service);

  // Method BookshelvesResource.List
  /**
   * Retrieves a list of public bookshelves for the specified user.
   *
   *    * [userId] ID of user for whom to retrieve bookshelves.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Bookshelves> list(core.String userId, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "users/{userId}/bookshelves";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Bookshelves.parse(JSON.parse($text)));
  }

  // Method BookshelvesResource.Get
  /**
   * Retrieves metadata for a specific bookshelf for the specified user.
   *
   *    * [userId] ID of user for whom to retrieve bookshelves.
   *    * [shelf] ID of bookshelf to retrieve.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Bookshelf> get(core.String userId, core.String shelf, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    $pathParams["shelf"] = shelf;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "users/{userId}/bookshelves/{shelf}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Bookshelf.parse(JSON.parse($text)));
  }
}


// Resource BookshelvesResource.BookshelvesVolumesResourceResource
class BookshelvesVolumesResourceResource extends core.Object {
  final BooksApi _$service;
  
  BookshelvesVolumesResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method BookshelvesResource.BookshelvesVolumesResourceResource.List
  /**
   * Retrieves volumes in a specific bookshelf for the specified user.
   *
   *    * [userId] ID of user for whom to retrieve bookshelf volumes.
   *    * [shelf] ID of bookshelf to retrieve volumes.
   *    * [showPreorders] Set to true to show pre-ordered books. Defaults to false.
   *    * [maxResults] Maximum number of results to return

  Minimum: 0.
   *    * [source] String to identify the originator of this request.
   *    * [startIndex] Index of the first element to return (starts at 0)

  Minimum: 0.
   */
  core.Future<Volumes> list(core.String userId, core.String shelf, [core.bool showPreorders = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String source = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    $pathParams["shelf"] = shelf;
    if (UNSPECIFIED != showPreorders) $queryParams["showPreorders"] = showPreorders;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "users/{userId}/bookshelves/{shelf}/volumes";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumes.parse(JSON.parse($text)));
  }
}

// Resource .MyconfigResource
class MyconfigResource extends core.Object {
  final BooksApi _$service;
  
  MyconfigResource._internal(BooksApi $service) : _$service = $service;

  // Method MyconfigResource.ReleaseDownloadAccess
  /**
   * Release downloaded content access restriction.
   *
   *    * [volumeIds] The volume(s) to release restrictions for.
   *    * [cpksver] The device/version ID from which to release the restriction.
   *    * [locale] ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<DownloadAccesses> releaseDownloadAccess(core.List<core.String> volumeIds, core.String cpksver, [core.String locale = UNSPECIFIED, core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeIds"] = volumeIds;
    $pathParams["cpksver"] = cpksver;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "myconfig/releaseDownloadAccess";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => DownloadAccesses.parse(JSON.parse($text)));
  }

  // Method MyconfigResource.RequestAccess
  /**
   * Request concurrent and download access restrictions.
   *
   *    * [source] String to identify the originator of this request.
   *    * [volumeId] The volume to request concurrent/download restrictions for.
   *    * [nonce] The client nonce value.
   *    * [cpksver] The device/version ID from which to request the restrictions.
   *    * [locale] ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US.
   */
  core.Future<RequestAccess> requestAccess(core.String source, core.String volumeId, core.String nonce, core.String cpksver, [core.String locale = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["source"] = source;
    $pathParams["volumeId"] = volumeId;
    $pathParams["nonce"] = nonce;
    $pathParams["cpksver"] = cpksver;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "myconfig/requestAccess";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => RequestAccess.parse(JSON.parse($text)));
  }

  // Method MyconfigResource.SyncVolumeLicenses
  /**
   * Request downloaded content access for specified volumes on the My eBooks shelf.
   *
   *    * [source] String to identify the originator of this request.
   *    * [nonce] The client nonce value.
   *    * [cpksver] The device/version ID from which to release the restriction.
   *    * [locale] ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US.
   *    * [showPreorders] Set to true to show pre-ordered books. Defaults to false.
   *    * [volumeIds] The volume(s) to request download restrictions for.
   */
  core.Future<Volumes> syncVolumeLicenses(core.String source, core.String nonce, core.String cpksver, [core.String locale = UNSPECIFIED, core.bool showPreorders = UNSPECIFIED, core.List<core.String> volumeIds = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["source"] = source;
    $pathParams["nonce"] = nonce;
    $pathParams["cpksver"] = cpksver;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != showPreorders) $queryParams["showPreorders"] = showPreorders;
    if (UNSPECIFIED != volumeIds) $queryParams["volumeIds"] = volumeIds;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "myconfig/syncVolumeLicenses";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumes.parse(JSON.parse($text)));
  }
}

// Resource .VolumesResource
class VolumesResource extends core.Object {
  final BooksApi _$service;
  final VolumesAssociatedResourceResource associated;
  
  VolumesResource._internal(BooksApi $service) : _$service = $service,
    associated = new VolumesAssociatedResourceResource._internal($service);

  // Method VolumesResource.List
  /**
   * Performs a book search.
   *
   *    * [q] Full-text search query string.
   *    * [orderBy] Sort search results.
   *    * [projection] Restrict information returned to a set of selected fields.
   *    * [libraryRestrict] Restrict search to this user's library.
   *    * [langRestrict] Restrict results to books with this language code.
   *    * [showPreorders] Set to true to show books available for preorder. Defaults to false.
   *    * [printType] Restrict to books or magazines.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 40.
   *    * [filter] Filter search results.
   *    * [source] String to identify the originator of this request.
   *    * [startIndex] Index of the first result to return (starts at 0)

  Minimum: 0.
   *    * [download] Restrict to volumes by download availability.
   *    * [partner] Restrict and brand results for partner ID.
   */
  core.Future<Volumes> list(core.String q, [VolumesResourceListOrderBy orderBy = UNSPECIFIED, VolumesResourceListProjection projection = UNSPECIFIED, VolumesResourceListLibraryRestrict libraryRestrict = UNSPECIFIED, core.String langRestrict = UNSPECIFIED, core.bool showPreorders = UNSPECIFIED, VolumesResourceListPrintType printType = UNSPECIFIED, core.int maxResults = UNSPECIFIED, VolumesResourceListFilter filter = UNSPECIFIED, core.String source = UNSPECIFIED, core.int startIndex = UNSPECIFIED, VolumesResourceListDownload download = UNSPECIFIED, core.String partner = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["q"] = q;
    if (UNSPECIFIED != orderBy) $queryParams["orderBy"] = orderBy;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (UNSPECIFIED != libraryRestrict) $queryParams["libraryRestrict"] = libraryRestrict;
    if (UNSPECIFIED != langRestrict) $queryParams["langRestrict"] = langRestrict;
    if (UNSPECIFIED != showPreorders) $queryParams["showPreorders"] = showPreorders;
    if (UNSPECIFIED != printType) $queryParams["printType"] = printType;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != filter) $queryParams["filter"] = filter;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != download) $queryParams["download"] = download;
    if (UNSPECIFIED != partner) $queryParams["partner"] = partner;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumes.parse(JSON.parse($text)));
  }

  // Method VolumesResource.Get
  /**
   * Gets volume information for a single volume.
   *
   *    * [volumeId] ID of volume to retrieve.
   *    * [source] String to identify the originator of this request.
   *    * [country] ISO-3166-1 code to override the IP-based location.
   *    * [projection] Restrict information returned to a set of selected fields.
   *    * [partner] Brand results for partner ID.
   */
  core.Future<Volume> get(core.String volumeId, [core.String source = UNSPECIFIED, core.String country = UNSPECIFIED, VolumesResourceGetProjection projection = UNSPECIFIED, core.String partner = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != country) $queryParams["country"] = country;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (UNSPECIFIED != partner) $queryParams["partner"] = partner;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volume.parse(JSON.parse($text)));
  }
}

// Enum VolumesResource.List.OrderBy
class VolumesResourceListOrderBy extends core.Object implements core.Hashable {
  /** Most recently published. */
  static final VolumesResourceListOrderBy NEWEST = const VolumesResourceListOrderBy._internal("newest", 0);
  /** Relevance to search terms. */
  static final VolumesResourceListOrderBy RELEVANCE = const VolumesResourceListOrderBy._internal("relevance", 1);

  /** All values of this enumeration */
  static final core.List<VolumesResourceListOrderBy> values = const <VolumesResourceListOrderBy>[
    NEWEST,
    RELEVANCE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListOrderBy>{ 
    "newest": NEWEST,
    "relevance": RELEVANCE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListOrderBy valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceListOrderBy._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Enum VolumesResource.List.Projection
class VolumesResourceListProjection extends core.Object implements core.Hashable {
  /** Includes all volume data. */
  static final VolumesResourceListProjection FULL = const VolumesResourceListProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final VolumesResourceListProjection LITE = const VolumesResourceListProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final core.List<VolumesResourceListProjection> values = const <VolumesResourceListProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum VolumesResource.List.LibraryRestrict
class VolumesResourceListLibraryRestrict extends core.Object implements core.Hashable {
  /** Restrict to the user's library, any shelf. */
  static final VolumesResourceListLibraryRestrict MY_LIBRARY = const VolumesResourceListLibraryRestrict._internal("my-library", 0);
  /** Do not restrict based on user's library. */
  static final VolumesResourceListLibraryRestrict NO_RESTRICT = const VolumesResourceListLibraryRestrict._internal("no-restrict", 1);

  /** All values of this enumeration */
  static final core.List<VolumesResourceListLibraryRestrict> values = const <VolumesResourceListLibraryRestrict>[
    MY_LIBRARY,
    NO_RESTRICT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListLibraryRestrict>{ 
    "my-library": MY_LIBRARY,
    "no-restrict": NO_RESTRICT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListLibraryRestrict valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceListLibraryRestrict._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "LibraryRestrict".hashCode();
}

// Enum VolumesResource.List.PrintType
class VolumesResourceListPrintType extends core.Object implements core.Hashable {
  /** All volume content types. */
  static final VolumesResourceListPrintType ALL = const VolumesResourceListPrintType._internal("all", 0);
  /** Just books. */
  static final VolumesResourceListPrintType BOOKS = const VolumesResourceListPrintType._internal("books", 1);
  /** Just magazines. */
  static final VolumesResourceListPrintType MAGAZINES = const VolumesResourceListPrintType._internal("magazines", 2);

  /** All values of this enumeration */
  static final core.List<VolumesResourceListPrintType> values = const <VolumesResourceListPrintType>[
    ALL,
    BOOKS,
    MAGAZINES,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListPrintType>{ 
    "all": ALL,
    "books": BOOKS,
    "magazines": MAGAZINES,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListPrintType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceListPrintType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "PrintType".hashCode();
}

// Enum VolumesResource.List.Filter
class VolumesResourceListFilter extends core.Object implements core.Hashable {
  /** All Google eBooks. */
  static final VolumesResourceListFilter EBOOKS = const VolumesResourceListFilter._internal("ebooks", 0);
  /** Google eBook with full volume text viewability. */
  static final VolumesResourceListFilter FREE_EBOOKS = const VolumesResourceListFilter._internal("free-ebooks", 1);
  /** Public can view entire volume text. */
  static final VolumesResourceListFilter FULL = const VolumesResourceListFilter._internal("full", 2);
  /** Google eBook with a price. */
  static final VolumesResourceListFilter PAID_EBOOKS = const VolumesResourceListFilter._internal("paid-ebooks", 3);
  /** Public able to see parts of text. */
  static final VolumesResourceListFilter PARTIAL = const VolumesResourceListFilter._internal("partial", 4);

  /** All values of this enumeration */
  static final core.List<VolumesResourceListFilter> values = const <VolumesResourceListFilter>[
    EBOOKS,
    FREE_EBOOKS,
    FULL,
    PAID_EBOOKS,
    PARTIAL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListFilter>{ 
    "ebooks": EBOOKS,
    "free-ebooks": FREE_EBOOKS,
    "full": FULL,
    "paid-ebooks": PAID_EBOOKS,
    "partial": PARTIAL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListFilter valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceListFilter._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Filter".hashCode();
}

// Enum VolumesResource.List.Download
class VolumesResourceListDownload extends core.Object implements core.Hashable {
  /** All volumes with epub. */
  static final VolumesResourceListDownload EPUB = const VolumesResourceListDownload._internal("epub", 0);

  /** All values of this enumeration */
  static final core.List<VolumesResourceListDownload> values = const <VolumesResourceListDownload>[
    EPUB,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListDownload>{ 
    "epub": EPUB,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListDownload valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceListDownload._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Download".hashCode();
}

// Enum VolumesResource.Get.Projection
class VolumesResourceGetProjection extends core.Object implements core.Hashable {
  /** Includes all volume data. */
  static final VolumesResourceGetProjection FULL = const VolumesResourceGetProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final VolumesResourceGetProjection LITE = const VolumesResourceGetProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final core.List<VolumesResourceGetProjection> values = const <VolumesResourceGetProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceGetProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceGetProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceGetProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}


// Resource VolumesResource.VolumesAssociatedResourceResource
class VolumesAssociatedResourceResource extends core.Object {
  final BooksApi _$service;
  
  VolumesAssociatedResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method VolumesResource.VolumesAssociatedResourceResource.List
  /**
   * Return a list of associated books.
   *
   *    * [volumeId] ID of the source volume.
   *    * [projection] Restrict information returned to a set of selected fields.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 40.
   *    * [filter] Filter search results.
   *    * [source] String to identify the originator of this request.
   *    * [startIndex] Index of the first result to return (starts at 0)

  Minimum: 0.
   *    * [association] Association type.
   */
  core.Future<Volumes> list(core.String volumeId, [VolumesResourceVolumesAssociatedResourceResourceListProjection projection = UNSPECIFIED, core.int maxResults = UNSPECIFIED, VolumesResourceVolumesAssociatedResourceResourceListFilter filter = UNSPECIFIED, core.String source = UNSPECIFIED, core.int startIndex = UNSPECIFIED, VolumesResourceVolumesAssociatedResourceResourceListAssociation association = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != filter) $queryParams["filter"] = filter;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != association) $queryParams["association"] = association;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "volumes/{volumeId}/associated";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumes.parse(JSON.parse($text)));
  }
}

// Enum VolumesResource.VolumesAssociatedResourceResource.List.Projection
class VolumesResourceVolumesAssociatedResourceResourceListProjection extends core.Object implements core.Hashable {
  /** Includes all volume data. */
  static final VolumesResourceVolumesAssociatedResourceResourceListProjection FULL = const VolumesResourceVolumesAssociatedResourceResourceListProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final VolumesResourceVolumesAssociatedResourceResourceListProjection LITE = const VolumesResourceVolumesAssociatedResourceResourceListProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final core.List<VolumesResourceVolumesAssociatedResourceResourceListProjection> values = const <VolumesResourceVolumesAssociatedResourceResourceListProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceVolumesAssociatedResourceResourceListProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceVolumesAssociatedResourceResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceVolumesAssociatedResourceResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum VolumesResource.VolumesAssociatedResourceResource.List.Filter
class VolumesResourceVolumesAssociatedResourceResourceListFilter extends core.Object implements core.Hashable {
  /** All Google eBooks. */
  static final VolumesResourceVolumesAssociatedResourceResourceListFilter EBOOKS = const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal("ebooks", 0);
  /** Google eBook with full volume text viewability. */
  static final VolumesResourceVolumesAssociatedResourceResourceListFilter FREE_EBOOKS = const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal("free-ebooks", 1);
  /** Public can view entire volume text. */
  static final VolumesResourceVolumesAssociatedResourceResourceListFilter FULL = const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal("full", 2);
  /** Google eBook with a price. */
  static final VolumesResourceVolumesAssociatedResourceResourceListFilter PAID_EBOOKS = const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal("paid-ebooks", 3);
  /** Public able to see parts of text. */
  static final VolumesResourceVolumesAssociatedResourceResourceListFilter PARTIAL = const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal("partial", 4);

  /** All values of this enumeration */
  static final core.List<VolumesResourceVolumesAssociatedResourceResourceListFilter> values = const <VolumesResourceVolumesAssociatedResourceResourceListFilter>[
    EBOOKS,
    FREE_EBOOKS,
    FULL,
    PAID_EBOOKS,
    PARTIAL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceVolumesAssociatedResourceResourceListFilter>{ 
    "ebooks": EBOOKS,
    "free-ebooks": FREE_EBOOKS,
    "full": FULL,
    "paid-ebooks": PAID_EBOOKS,
    "partial": PARTIAL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceVolumesAssociatedResourceResourceListFilter valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Filter".hashCode();
}

// Enum VolumesResource.VolumesAssociatedResourceResource.List.Association
class VolumesResourceVolumesAssociatedResourceResourceListAssociation extends core.Object implements core.Hashable {
  /** Books that are complementary for additional reading. */
  static final VolumesResourceVolumesAssociatedResourceResourceListAssociation COMPLEMENTARY = const VolumesResourceVolumesAssociatedResourceResourceListAssociation._internal("complementary", 0);

  /** All values of this enumeration */
  static final core.List<VolumesResourceVolumesAssociatedResourceResourceListAssociation> values = const <VolumesResourceVolumesAssociatedResourceResourceListAssociation>[
    COMPLEMENTARY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceVolumesAssociatedResourceResourceListAssociation>{ 
    "complementary": COMPLEMENTARY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceVolumesAssociatedResourceResourceListAssociation valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const VolumesResourceVolumesAssociatedResourceResourceListAssociation._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Association".hashCode();
}

// Resource .MylibraryResource
class MylibraryResource extends core.Object {
  final BooksApi _$service;
  final MylibraryBookshelvesResourceResource bookshelves;
  final MylibraryReadingpositionsResourceResource readingpositions;
  final MylibraryAnnotationsResourceResource annotations;
  
  MylibraryResource._internal(BooksApi $service) : _$service = $service,
    bookshelves = new MylibraryBookshelvesResourceResource._internal($service),
    readingpositions = new MylibraryReadingpositionsResourceResource._internal($service),
    annotations = new MylibraryAnnotationsResourceResource._internal($service);
}


// Resource MylibraryResource.MylibraryBookshelvesResourceResource
class MylibraryBookshelvesResourceResource extends core.Object {
  final BooksApi _$service;
  final MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource volumes;
  
  MylibraryBookshelvesResourceResource._internal(BooksApi $service) : _$service = $service,
    volumes = new MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource._internal($service);

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.RemoveVolume
  /**
   * Removes a volume from a bookshelf.
   *
   *    * [shelf] ID of bookshelf from which to remove a volume.
   *    * [volumeId] ID of volume to remove.
   *    * [source] String to identify the originator of this request.
   */
  core.Future removeVolume(core.String shelf, core.String volumeId, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shelf"] = shelf;
    $pathParams["volumeId"] = volumeId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves/{shelf}/removeVolume";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.Get
  /**
   * Retrieves metadata for a specific bookshelf belonging to the authenticated user.
   *
   *    * [shelf] ID of bookshelf to retrieve.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Bookshelf> get(core.String shelf, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shelf"] = shelf;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves/{shelf}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Bookshelf.parse(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.ClearVolumes
  /**
   * Clears all volumes from a bookshelf.
   *
   *    * [shelf] ID of bookshelf from which to remove a volume.
   *    * [source] String to identify the originator of this request.
   */
  core.Future clearVolumes(core.String shelf, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shelf"] = shelf;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves/{shelf}/clearVolumes";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.List
  /**
   * Retrieves a list of bookshelves belonging to the authenticated user.
   *
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Bookshelves> list([core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Bookshelves.parse(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.AddVolume
  /**
   * Adds a volume to a bookshelf.
   *
   *    * [shelf] ID of bookshelf to which to add a volume.
   *    * [volumeId] ID of volume to add.
   *    * [source] String to identify the originator of this request.
   */
  core.Future addVolume(core.String shelf, core.String volumeId, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shelf"] = shelf;
    $pathParams["volumeId"] = volumeId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves/{shelf}/addVolume";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.MoveVolume
  /**
   * Moves a volume within a bookshelf.
   *
   *    * [shelf] ID of bookshelf with the volume.
   *    * [volumeId] ID of volume to move.
   *    * [volumePosition] Position on shelf to move the item (0 puts the item before the current first item, 1 puts it between
   *        the first and the second and so on.)
   *    * [source] String to identify the originator of this request.
   */
  core.Future moveVolume(core.String shelf, core.String volumeId, core.int volumePosition, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shelf"] = shelf;
    $pathParams["volumeId"] = volumeId;
    $pathParams["volumePosition"] = volumePosition;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves/{shelf}/moveVolume";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}


// Resource MylibraryResource.MylibraryBookshelvesResourceResource.MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource
class MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource extends core.Object {
  final BooksApi _$service;
  
  MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource.List
  /**
   * Gets volume information for volumes on a bookshelf.
   *
   *    * [shelf] The bookshelf ID or name retrieve volumes for.
   *    * [projection] Restrict information returned to a set of selected fields.
   *    * [country] ISO-3166-1 code to override the IP-based location.
   *    * [showPreorders] Set to true to show pre-ordered books. Defaults to false.
   *    * [maxResults] Maximum number of results to return

  Minimum: 0.
   *    * [q] Full-text search query string in this bookshelf.
   *    * [source] String to identify the originator of this request.
   *    * [startIndex] Index of the first element to return (starts at 0)

  Minimum: 0.
   */
  core.Future<Volumes> list(core.String shelf, [MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection projection = UNSPECIFIED, core.String country = UNSPECIFIED, core.bool showPreorders = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String q = UNSPECIFIED, core.String source = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shelf"] = shelf;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (UNSPECIFIED != country) $queryParams["country"] = country;
    if (UNSPECIFIED != showPreorders) $queryParams["showPreorders"] = showPreorders;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/bookshelves/{shelf}/volumes";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Volumes.parse(JSON.parse($text)));
  }
}

// Enum MylibraryResource.MylibraryBookshelvesResourceResource.MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource.List.Projection
class MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection extends core.Object implements core.Hashable {
  /** Includes all volume data. */
  static final MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection FULL = const MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection LITE = const MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final core.List<MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection> values = const <MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Resource MylibraryResource.MylibraryReadingpositionsResourceResource
class MylibraryReadingpositionsResourceResource extends core.Object {
  final BooksApi _$service;
  
  MylibraryReadingpositionsResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method MylibraryResource.MylibraryReadingpositionsResourceResource.SetPosition
  /**
   * Sets my reading position information for a volume.
   *
   *    * [volumeId] ID of volume for which to update the reading position.
   *    * [timestamp] RFC 3339 UTC format timestamp associated with this reading position.
   *    * [position] Position string for the new volume reading position.
   *    * [source] String to identify the originator of this request.
   *    * [contentVersion] Volume content version for which this reading position applies.
   *    * [action] Action that caused this reading position to be set.
   */
  core.Future setPosition(core.String volumeId, core.String timestamp, core.String position, [core.String source = UNSPECIFIED, core.String contentVersion = UNSPECIFIED, MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction action = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["timestamp"] = timestamp;
    $pathParams["position"] = position;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != contentVersion) $queryParams["contentVersion"] = contentVersion;
    if (UNSPECIFIED != action) $queryParams["action"] = action;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/readingpositions/{volumeId}/setPosition";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryReadingpositionsResourceResource.Get
  /**
   * Retrieves my reading position information for a volume.
   *
   *    * [volumeId] ID of volume for which to retrieve a reading position.
   *    * [source] String to identify the originator of this request.
   *    * [contentVersion] Volume content version for which this reading position is requested.
   */
  core.Future<ReadingPosition> get(core.String volumeId, [core.String source = UNSPECIFIED, core.String contentVersion = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != contentVersion) $queryParams["contentVersion"] = contentVersion;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/readingpositions/{volumeId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ReadingPosition.parse(JSON.parse($text)));
  }
}

// Enum MylibraryResource.MylibraryReadingpositionsResourceResource.SetPosition.Action
class MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction extends core.Object implements core.Hashable {
  /** User chose bookmark within volume. */
  static final MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction BOOKMARK = const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal("bookmark", 0);
  /** User selected chapter from list. */
  static final MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction CHAPTER = const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal("chapter", 1);
  /** Next page event. */
  static final MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction NEXT_PAGE = const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal("next-page", 2);
  /** Previous page event. */
  static final MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction PREV_PAGE = const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal("prev-page", 3);
  /** User navigated to page. */
  static final MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction SCROLL = const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal("scroll", 4);
  /** User chose search results within volume. */
  static final MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction SEARCH = const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal("search", 5);

  /** All values of this enumeration */
  static final core.List<MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction> values = const <MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction>[
    BOOKMARK,
    CHAPTER,
    NEXT_PAGE,
    PREV_PAGE,
    SCROLL,
    SEARCH,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction>{ 
    "bookmark": BOOKMARK,
    "chapter": CHAPTER,
    "next-page": NEXT_PAGE,
    "prev-page": PREV_PAGE,
    "scroll": SCROLL,
    "search": SEARCH,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Action".hashCode();
}

// Resource MylibraryResource.MylibraryAnnotationsResourceResource
class MylibraryAnnotationsResourceResource extends core.Object {
  final BooksApi _$service;
  
  MylibraryAnnotationsResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Insert
  /**
   * Inserts a new annotation.
   *
   *    * [content] the Annotation
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Annotation> insert(Annotation content, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Annotation.serialize(content));
    final $path = "mylibrary/annotations";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Annotation.parse(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Get
  /**
   * Gets an annotation by its ID.
   *
   *    * [annotationId] The ID for the annotation to retrieve.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Annotation> get(core.String annotationId, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["annotationId"] = annotationId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/annotations/{annotationId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Annotation.parse(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.List
  /**
   * Retrieves a list of annotations, possibly filtered.
   *
   *    * [showDeleted] Set to true to return deleted annotations. updatedMin must be in the request to use this. Defaults
   *        to false.
   *    * [updatedMin] RFC 3339 timestamp to restrict to items updated since this timestamp (inclusive).
   *    * [updatedMax] RFC 3339 timestamp to restrict to items updated prior to this timestamp (exclusive).
   *    * [volumeId] The volume to restrict annotations to.
   *    * [maxResults] Maximum number of results to return

  Minimum: 0.
  Maximum: 40.
   *    * [pageToken] The value of the nextToken from the previous page.
   *    * [pageIds] The page ID(s) for the volume that is being queried.
   *    * [contentVersion] The content version for the requested volume.
   *    * [source] String to identify the originator of this request.
   *    * [layerId] The layer ID to limit annotation by.
   */
  core.Future<Annotations> list([core.bool showDeleted = UNSPECIFIED, core.String updatedMin = UNSPECIFIED, core.String updatedMax = UNSPECIFIED, core.String volumeId = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.List<core.String> pageIds = UNSPECIFIED, core.String contentVersion = UNSPECIFIED, core.String source = UNSPECIFIED, core.String layerId = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != showDeleted) $queryParams["showDeleted"] = showDeleted;
    if (UNSPECIFIED != updatedMin) $queryParams["updatedMin"] = updatedMin;
    if (UNSPECIFIED != updatedMax) $queryParams["updatedMax"] = updatedMax;
    if (UNSPECIFIED != volumeId) $queryParams["volumeId"] = volumeId;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != pageIds) $queryParams["pageIds"] = pageIds;
    if (UNSPECIFIED != contentVersion) $queryParams["contentVersion"] = contentVersion;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (UNSPECIFIED != layerId) $queryParams["layerId"] = layerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/annotations";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Annotations.parse(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Update
  /**
   * Updates an existing annotation.
   *
   *    * [content] the Annotation
   *    * [annotationId] The ID for the annotation to update.
   *    * [source] String to identify the originator of this request.
   */
  core.Future<Annotation> update(core.String annotationId, Annotation content, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["annotationId"] = annotationId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Annotation.serialize(content));
    final $path = "mylibrary/annotations/{annotationId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Annotation.parse(JSON.parse($text)));
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Delete
  /**
   * Deletes an annotation.
   *
   *    * [annotationId] The ID for the annotation to delete.
   *    * [source] String to identify the originator of this request.
   */
  core.Future delete(core.String annotationId, [core.String source = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["annotationId"] = annotationId;
    if (UNSPECIFIED != source) $queryParams["source"] = source;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mylibrary/annotations/{annotationId}";
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

// Schema .Annotation
class Annotation extends IdentityHash {
  /** Resource type. */
  core.String kind;

  /** Timestamp for the last time this annotation was modified. */
  core.String updated;

  /** Timestamp for the created time of this annotation. */
  core.String created;

  /** Indicates that this annotation is deleted. */
  core.bool deleted;

  /** Anchor text before excerpt. */
  core.String beforeSelectedText;

  /** Selection ranges for the most recent content version. */
  AnnotationCurrentVersionRanges currentVersionRanges;

  /** Anchor text after excerpt. */
  core.String afterSelectedText;

  /** Selection ranges sent from the client. */
  AnnotationClientVersionRanges clientVersionRanges;

  /** The volume that this annotation belongs to. */
  core.String volumeId;

  /** Pages that this annotation spans. */
  core.List<core.String> pageIds;

  /** The layer this annotation is for. */
  core.String layerId;

  /** Excerpt from the volume. */
  core.String selectedText;

  /** The highlight style for this annotation. */
  core.String highlightStyle;

  /** User-created data for this annotation. */
  core.String data;

  /** Id of this annotation, in the form of a GUID. */
  core.String id;

  /** URL to this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Annotation parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Annotation();
    result.kind = identity(json["kind"]);
    result.updated = identity(json["updated"]);
    result.created = identity(json["created"]);
    result.deleted = identity(json["deleted"]);
    result.beforeSelectedText = identity(json["beforeSelectedText"]);
    result.currentVersionRanges = AnnotationCurrentVersionRanges.parse(json["currentVersionRanges"]);
    result.afterSelectedText = identity(json["afterSelectedText"]);
    result.clientVersionRanges = AnnotationClientVersionRanges.parse(json["clientVersionRanges"]);
    result.volumeId = identity(json["volumeId"]);
    result.pageIds = map(identity)(json["pageIds"]);
    result.layerId = identity(json["layerId"]);
    result.selectedText = identity(json["selectedText"]);
    result.highlightStyle = identity(json["highlightStyle"]);
    result.data = identity(json["data"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Annotation value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["updated"] = identity(value.updated);
    result["created"] = identity(value.created);
    result["deleted"] = identity(value.deleted);
    result["beforeSelectedText"] = identity(value.beforeSelectedText);
    result["currentVersionRanges"] = AnnotationCurrentVersionRanges.serialize(value.currentVersionRanges);
    result["afterSelectedText"] = identity(value.afterSelectedText);
    result["clientVersionRanges"] = AnnotationClientVersionRanges.serialize(value.clientVersionRanges);
    result["volumeId"] = identity(value.volumeId);
    result["pageIds"] = map(identity)(value.pageIds);
    result["layerId"] = identity(value.layerId);
    result["selectedText"] = identity(value.selectedText);
    result["highlightStyle"] = identity(value.highlightStyle);
    result["data"] = identity(value.data);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Annotation.AnnotationClientVersionRanges
class AnnotationClientVersionRanges extends IdentityHash {
  /** Content version the client sent in. */
  core.String contentVersion;

  /** Range in GB text format for this annotation sent by client. */
  BooksAnnotationsRange gbTextRange;

  /** Range in CFI format for this annotation sent by client. */
  BooksAnnotationsRange cfiRange;

  /** Range in GB image format for this annotation sent by client. */
  BooksAnnotationsRange gbImageRange;

  /** Parses an instance from its JSON representation. */
  static AnnotationClientVersionRanges parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnnotationClientVersionRanges();
    result.contentVersion = identity(json["contentVersion"]);
    result.gbTextRange = BooksAnnotationsRange.parse(json["gbTextRange"]);
    result.cfiRange = BooksAnnotationsRange.parse(json["cfiRange"]);
    result.gbImageRange = BooksAnnotationsRange.parse(json["gbImageRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnnotationClientVersionRanges value) {
    if (value == null) return null;
    final result = {};
    result["contentVersion"] = identity(value.contentVersion);
    result["gbTextRange"] = BooksAnnotationsRange.serialize(value.gbTextRange);
    result["cfiRange"] = BooksAnnotationsRange.serialize(value.cfiRange);
    result["gbImageRange"] = BooksAnnotationsRange.serialize(value.gbImageRange);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Annotation.AnnotationCurrentVersionRanges
class AnnotationCurrentVersionRanges extends IdentityHash {
  /** Content version applicable to ranges below. */
  core.String contentVersion;

  /** Range in GB text format for this annotation for version above. */
  BooksAnnotationsRange gbTextRange;

  /** Range in CFI format for this annotation for version above. */
  BooksAnnotationsRange cfiRange;

  /** Range in GB image format for this annotation for version above. */
  BooksAnnotationsRange gbImageRange;

  /** Parses an instance from its JSON representation. */
  static AnnotationCurrentVersionRanges parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnnotationCurrentVersionRanges();
    result.contentVersion = identity(json["contentVersion"]);
    result.gbTextRange = BooksAnnotationsRange.parse(json["gbTextRange"]);
    result.cfiRange = BooksAnnotationsRange.parse(json["cfiRange"]);
    result.gbImageRange = BooksAnnotationsRange.parse(json["gbImageRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnnotationCurrentVersionRanges value) {
    if (value == null) return null;
    final result = {};
    result["contentVersion"] = identity(value.contentVersion);
    result["gbTextRange"] = BooksAnnotationsRange.serialize(value.gbTextRange);
    result["cfiRange"] = BooksAnnotationsRange.serialize(value.cfiRange);
    result["gbImageRange"] = BooksAnnotationsRange.serialize(value.gbImageRange);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Annotationdata
class Annotationdata extends IdentityHash {
  /** The type of annotation this data is for. */
  core.String annotationType;

  /** Resource Type */
  core.String kind;

  /** Timestamp for the last time this data was updated. (RFC 3339 UTC date-time format). */
  core.String updated;

  /** The volume id for this data. * */
  core.String volumeId;

  /** Base64 encoded data for this annotation data. */
  core.String encodedData;

  /** The Layer id for this data. * */
  core.String layerId;

  /** JSON encoded data for this annotation data. */
  BooksLayerGeoData data;

  /** Unique id for this annotation data. */
  core.String id;

  /** URL for this resource. * */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Annotationdata parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Annotationdata();
    result.annotationType = identity(json["annotationType"]);
    result.kind = identity(json["kind"]);
    result.updated = identity(json["updated"]);
    result.volumeId = identity(json["volumeId"]);
    result.encodedData = identity(json["encoded_data"]);
    result.layerId = identity(json["layerId"]);
    result.data = BooksLayerGeoData.parse(json["data"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Annotationdata value) {
    if (value == null) return null;
    final result = {};
    result["annotationType"] = identity(value.annotationType);
    result["kind"] = identity(value.kind);
    result["updated"] = identity(value.updated);
    result["volumeId"] = identity(value.volumeId);
    result["encoded_data"] = identity(value.encodedData);
    result["layerId"] = identity(value.layerId);
    result["data"] = BooksLayerGeoData.serialize(value.data);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Annotations
class Annotations extends IdentityHash {
  /**
 * Token to pass in for pagination for the next page. This will not be present if this request does
 * not have more results.
 */
  core.String nextPageToken;

  /** A list of annotations. */
  core.List<Annotation> items;

  /** Resource type. */
  core.String kind;

  /**
 * Total number of annotations found. This may be greater than the number of notes returned in this
 * response if results have been paginated.
 */
  core.int totalItems;

  /** Parses an instance from its JSON representation. */
  static Annotations parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Annotations();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Annotation.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Annotations value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Annotation.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Annotationsdata
class Annotationsdata extends IdentityHash {
  /**
 * Token to pass in for pagination for the next page. This will not be present if this request does
 * not have more results.
 */
  core.String nextPageToken;

  /** A list of Annotation Data. */
  core.List<Annotationdata> items;

  /** Resource type */
  core.String kind;

  /** The total number of volume annotations found. */
  core.int totalItems;

  /** Parses an instance from its JSON representation. */
  static Annotationsdata parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Annotationsdata();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Annotationdata.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Annotationsdata value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Annotationdata.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .BooksAnnotationsRange
class BooksAnnotationsRange extends IdentityHash {
  /** The starting position for the range. */
  core.String startPosition;

  /** The ending position for the range. */
  core.String endPosition;

  /** The offset from the starting position. */
  core.String startOffset;

  /** The offset from the ending position. */
  core.String endOffset;

  /** Parses an instance from its JSON representation. */
  static BooksAnnotationsRange parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksAnnotationsRange();
    result.startPosition = identity(json["startPosition"]);
    result.endPosition = identity(json["endPosition"]);
    result.startOffset = identity(json["startOffset"]);
    result.endOffset = identity(json["endOffset"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksAnnotationsRange value) {
    if (value == null) return null;
    final result = {};
    result["startPosition"] = identity(value.startPosition);
    result["endPosition"] = identity(value.endPosition);
    result["startOffset"] = identity(value.startOffset);
    result["endOffset"] = identity(value.endOffset);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .BooksLayerGeoData
class BooksLayerGeoData extends IdentityHash {
  
  BooksLayerGeoDataGeo geo;

  
  BooksLayerGeoDataCommon common;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoData parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoData();
    result.geo = BooksLayerGeoDataGeo.parse(json["geo"]);
    result.common = BooksLayerGeoDataCommon.parse(json["common"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoData value) {
    if (value == null) return null;
    final result = {};
    result["geo"] = BooksLayerGeoDataGeo.serialize(value.geo);
    result["common"] = BooksLayerGeoDataCommon.serialize(value.common);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataCommon
class BooksLayerGeoDataCommon extends IdentityHash {
  /** The language of the information url and description. */
  core.String lang;

  /** The URL for the preview image information. */
  core.String previewImageUrl;

  /** The description for this location. */
  core.String snippet;

  /** The URL for information for this location. Ex: wikipedia link. */
  core.String snippetUrl;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataCommon parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataCommon();
    result.lang = identity(json["lang"]);
    result.previewImageUrl = identity(json["previewImageUrl"]);
    result.snippet = identity(json["snippet"]);
    result.snippetUrl = identity(json["snippetUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoDataCommon value) {
    if (value == null) return null;
    final result = {};
    result["lang"] = identity(value.lang);
    result["previewImageUrl"] = identity(value.previewImageUrl);
    result["snippet"] = identity(value.snippet);
    result["snippetUrl"] = identity(value.snippetUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo
class BooksLayerGeoDataGeo extends IdentityHash {
  /** The country code of the location. */
  core.String countryCode;

  /**
 * The Zoom level to use for the map. Zoom levels between 0 (the lowest zoom level, in which the
 * entire world can be seen on one map) to 21+ (down to individual buildings). See:
 * https://developers.google.com/maps/documentation/staticmaps/#Zoomlevels
 */
  core.int zoom;

  /** The longitude of the location. */
  core.double longitude;

  /**
 * The type of map that should be used for this location. EX: HYBRID, ROADMAP, SATELLITE, TERRAIN
 */
  core.String mapType;

  /** The latitude of the location. */
  core.double latitude;

  /**
 * The boundary of the location as a set of loops containing pairs of latitude, longitude
 * coordinates.
 */
  core.List<core.List<BooksLayerGeoDataGeoBoundary>> boundary;

  /** The resolution of the location. Ex: POI_LEVEL */
  core.String resolution;

  /** The viewport for showing this location. This is a latitude, longitude rectangle. */
  BooksLayerGeoDataGeoViewport viewport;

  /** The cache policy active for this data. EX: UNRESTRICTED, RESTRICTED, NEVER */
  core.String cachePolicy;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeo();
    result.countryCode = identity(json["countryCode"]);
    result.zoom = identity(json["zoom"]);
    result.longitude = identity(json["longitude"]);
    result.mapType = identity(json["mapType"]);
    result.latitude = identity(json["latitude"]);
    result.boundary = map(map(BooksLayerGeoDataGeoBoundary.parse))(json["boundary"]);
    result.resolution = identity(json["resolution"]);
    result.viewport = BooksLayerGeoDataGeoViewport.parse(json["viewport"]);
    result.cachePolicy = identity(json["cachePolicy"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoDataGeo value) {
    if (value == null) return null;
    final result = {};
    result["countryCode"] = identity(value.countryCode);
    result["zoom"] = identity(value.zoom);
    result["longitude"] = identity(value.longitude);
    result["mapType"] = identity(value.mapType);
    result["latitude"] = identity(value.latitude);
    result["boundary"] = map(map(BooksLayerGeoDataGeoBoundary.serialize))(value.boundary);
    result["resolution"] = identity(value.resolution);
    result["viewport"] = BooksLayerGeoDataGeoViewport.serialize(value.viewport);
    result["cachePolicy"] = identity(value.cachePolicy);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo.BooksLayerGeoDataGeoBoundary
class BooksLayerGeoDataGeoBoundary extends IdentityHash {
  
  core.int latitude;

  
  core.int longitude;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoBoundary parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoBoundary();
    result.latitude = identity(json["latitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoDataGeoBoundary value) {
    if (value == null) return null;
    final result = {};
    result["latitude"] = identity(value.latitude);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo.BooksLayerGeoDataGeoViewport
class BooksLayerGeoDataGeoViewport extends IdentityHash {
  
  BooksLayerGeoDataGeoViewportLo lo;

  
  BooksLayerGeoDataGeoViewportHi hi;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoViewport parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoViewport();
    result.lo = BooksLayerGeoDataGeoViewportLo.parse(json["lo"]);
    result.hi = BooksLayerGeoDataGeoViewportHi.parse(json["hi"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoDataGeoViewport value) {
    if (value == null) return null;
    final result = {};
    result["lo"] = BooksLayerGeoDataGeoViewportLo.serialize(value.lo);
    result["hi"] = BooksLayerGeoDataGeoViewportHi.serialize(value.hi);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo.BooksLayerGeoDataGeoViewport.BooksLayerGeoDataGeoViewportHi
class BooksLayerGeoDataGeoViewportHi extends IdentityHash {
  
  core.double latitude;

  
  core.double longitude;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoViewportHi parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoViewportHi();
    result.latitude = identity(json["latitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoDataGeoViewportHi value) {
    if (value == null) return null;
    final result = {};
    result["latitude"] = identity(value.latitude);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo.BooksLayerGeoDataGeoViewport.BooksLayerGeoDataGeoViewportLo
class BooksLayerGeoDataGeoViewportLo extends IdentityHash {
  
  core.double latitude;

  
  core.double longitude;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoViewportLo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoViewportLo();
    result.latitude = identity(json["latitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BooksLayerGeoDataGeoViewportLo value) {
    if (value == null) return null;
    final result = {};
    result["latitude"] = identity(value.latitude);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Bookshelf
class Bookshelf extends IdentityHash {
  /** Resource type for bookshelf metadata. */
  core.String kind;

  /** Description of this bookshelf. */
  core.String description;

  /** Created time for this bookshelf (formatted UTC timestamp with millisecond resolution). */
  core.String created;

  /** Number of volumes in this bookshelf. */
  core.int volumeCount;

  /** Title of this bookshelf. */
  core.String title;

  /** Last modified time of this bookshelf (formatted UTC timestamp with millisecond resolution). */
  core.String updated;

  /** Whether this bookshelf is PUBLIC or PRIVATE. */
  core.String access;

  /**
 * Last time a volume was added or removed from this bookshelf (formatted UTC timestamp with
 * millisecond resolution).
 */
  core.String volumesLastUpdated;

  /** Id of this bookshelf, only unique by user. */
  core.int id;

  /** URL to this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Bookshelf parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Bookshelf();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.created = identity(json["created"]);
    result.volumeCount = identity(json["volumeCount"]);
    result.title = identity(json["title"]);
    result.updated = identity(json["updated"]);
    result.access = identity(json["access"]);
    result.volumesLastUpdated = identity(json["volumesLastUpdated"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Bookshelf value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["created"] = identity(value.created);
    result["volumeCount"] = identity(value.volumeCount);
    result["title"] = identity(value.title);
    result["updated"] = identity(value.updated);
    result["access"] = identity(value.access);
    result["volumesLastUpdated"] = identity(value.volumesLastUpdated);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Bookshelves
class Bookshelves extends IdentityHash {
  /** A list of bookshelves. */
  core.List<Bookshelf> items;

  /** Resource type. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Bookshelves parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Bookshelves();
    result.items = map(Bookshelf.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Bookshelves value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Bookshelf.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ConcurrentAccessRestriction
class ConcurrentAccessRestriction extends IdentityHash {
  /** Client nonce for verification. Download access and client-validation only. */
  core.String nonce;

  /** Resource type. */
  core.String kind;

  /** Whether this volume has any concurrent access restrictions. */
  core.bool restricted;

  /** Identifies the volume for which this entry applies. */
  core.String volumeId;

  /** The maximum number of concurrent access licenses for this volume. */
  core.int maxConcurrentDevices;

  /** Whether access is granted for this (user, device, volume). */
  core.bool deviceAllowed;

  /** Client app identifier for verification. Download access and client-validation only. */
  core.String source;

  /** Time in seconds for license auto-expiration. */
  core.int timeWindowSeconds;

  /** Response signature. */
  core.String signature;

  /** Error/warning reason code. */
  core.String reasonCode;

  /** Error/warning message. */
  core.String message;

  /** Parses an instance from its JSON representation. */
  static ConcurrentAccessRestriction parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ConcurrentAccessRestriction();
    result.nonce = identity(json["nonce"]);
    result.kind = identity(json["kind"]);
    result.restricted = identity(json["restricted"]);
    result.volumeId = identity(json["volumeId"]);
    result.maxConcurrentDevices = identity(json["maxConcurrentDevices"]);
    result.deviceAllowed = identity(json["deviceAllowed"]);
    result.source = identity(json["source"]);
    result.timeWindowSeconds = identity(json["timeWindowSeconds"]);
    result.signature = identity(json["signature"]);
    result.reasonCode = identity(json["reasonCode"]);
    result.message = identity(json["message"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ConcurrentAccessRestriction value) {
    if (value == null) return null;
    final result = {};
    result["nonce"] = identity(value.nonce);
    result["kind"] = identity(value.kind);
    result["restricted"] = identity(value.restricted);
    result["volumeId"] = identity(value.volumeId);
    result["maxConcurrentDevices"] = identity(value.maxConcurrentDevices);
    result["deviceAllowed"] = identity(value.deviceAllowed);
    result["source"] = identity(value.source);
    result["timeWindowSeconds"] = identity(value.timeWindowSeconds);
    result["signature"] = identity(value.signature);
    result["reasonCode"] = identity(value.reasonCode);
    result["message"] = identity(value.message);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DownloadAccessRestriction
class DownloadAccessRestriction extends IdentityHash {
  /** Client nonce for verification. Download access and client-validation only. */
  core.String nonce;

  /** Resource type. */
  core.String kind;

  /** If deviceAllowed, whether access was just acquired with this request. */
  core.bool justAcquired;

  /** If restricted, the maximum number of content download licenses for this volume. */
  core.int maxDownloadDevices;

  /**
 * If restricted, the number of content download licenses already acquired (including the requesting
 * client, if licensed).
 */
  core.int downloadsAcquired;

  /** Response signature. */
  core.String signature;

  /** Identifies the volume for which this entry applies. */
  core.String volumeId;

  /** If restricted, whether access is granted for this (user, device, volume). */
  core.bool deviceAllowed;

  /** Client app identifier for verification. Download access and client-validation only. */
  core.String source;

  /** Whether this volume has any download access restrictions. */
  core.bool restricted;

  /**
 * Error/warning reason code. Additional codes may be added in the future. 0 OK 100
 * ACCESS_DENIED_PUBLISHER_LIMIT 101 ACCESS_DENIED_LIMIT 200 WARNING_USED_LAST_ACCESS
 */
  core.String reasonCode;

  /** Error/warning message. */
  core.String message;

  /** Parses an instance from its JSON representation. */
  static DownloadAccessRestriction parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DownloadAccessRestriction();
    result.nonce = identity(json["nonce"]);
    result.kind = identity(json["kind"]);
    result.justAcquired = identity(json["justAcquired"]);
    result.maxDownloadDevices = identity(json["maxDownloadDevices"]);
    result.downloadsAcquired = identity(json["downloadsAcquired"]);
    result.signature = identity(json["signature"]);
    result.volumeId = identity(json["volumeId"]);
    result.deviceAllowed = identity(json["deviceAllowed"]);
    result.source = identity(json["source"]);
    result.restricted = identity(json["restricted"]);
    result.reasonCode = identity(json["reasonCode"]);
    result.message = identity(json["message"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DownloadAccessRestriction value) {
    if (value == null) return null;
    final result = {};
    result["nonce"] = identity(value.nonce);
    result["kind"] = identity(value.kind);
    result["justAcquired"] = identity(value.justAcquired);
    result["maxDownloadDevices"] = identity(value.maxDownloadDevices);
    result["downloadsAcquired"] = identity(value.downloadsAcquired);
    result["signature"] = identity(value.signature);
    result["volumeId"] = identity(value.volumeId);
    result["deviceAllowed"] = identity(value.deviceAllowed);
    result["source"] = identity(value.source);
    result["restricted"] = identity(value.restricted);
    result["reasonCode"] = identity(value.reasonCode);
    result["message"] = identity(value.message);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DownloadAccesses
class DownloadAccesses extends IdentityHash {
  /** A list of download access responses. */
  core.List<DownloadAccessRestriction> downloadAccessList;

  /** Resource type. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static DownloadAccesses parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DownloadAccesses();
    result.downloadAccessList = map(DownloadAccessRestriction.parse)(json["downloadAccessList"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DownloadAccesses value) {
    if (value == null) return null;
    final result = {};
    result["downloadAccessList"] = map(DownloadAccessRestriction.serialize)(value.downloadAccessList);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Layersummaries
class Layersummaries extends IdentityHash {
  /** The total number of layer summaries found. */
  core.int totalItems;

  /** A list of layer summary items. */
  core.List<Layersummary> items;

  /** Resource type. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Layersummaries parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Layersummaries();
    result.totalItems = identity(json["totalItems"]);
    result.items = map(Layersummary.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Layersummaries value) {
    if (value == null) return null;
    final result = {};
    result["totalItems"] = identity(value.totalItems);
    result["items"] = map(Layersummary.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Layersummary
class Layersummary extends IdentityHash {
  /** Resource Type */
  core.String kind;

  /** The number of annotations for this layer. */
  core.int annotationCount;

  /** The number of data items for this layer. */
  core.int dataCount;

  /** The link to get the annotations for this layer. */
  core.String annotationsLink;

  /**
 * Timestamp for the last time an item in this layer was updated. (RFC 3339 UTC date-time format).
 */
  core.String updated;

  /** The volume id this resource is for. */
  core.String volumeId;

  /** Unique id of this layer summary. */
  core.String id;

  /** The list of annotation types contained for this layer. */
  core.List<core.String> annotationTypes;

  /** The content version this resource is for. */
  core.String contentVersion;

  /** The layer id for this summary. */
  core.String layerId;

  /** Link to get data for this annotation. */
  core.String annotationsDataLink;

  /** URL to this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Layersummary parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Layersummary();
    result.kind = identity(json["kind"]);
    result.annotationCount = identity(json["annotationCount"]);
    result.dataCount = identity(json["dataCount"]);
    result.annotationsLink = identity(json["annotationsLink"]);
    result.updated = identity(json["updated"]);
    result.volumeId = identity(json["volumeId"]);
    result.id = identity(json["id"]);
    result.annotationTypes = map(identity)(json["annotationTypes"]);
    result.contentVersion = identity(json["contentVersion"]);
    result.layerId = identity(json["layerId"]);
    result.annotationsDataLink = identity(json["annotationsDataLink"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Layersummary value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["annotationCount"] = identity(value.annotationCount);
    result["dataCount"] = identity(value.dataCount);
    result["annotationsLink"] = identity(value.annotationsLink);
    result["updated"] = identity(value.updated);
    result["volumeId"] = identity(value.volumeId);
    result["id"] = identity(value.id);
    result["annotationTypes"] = map(identity)(value.annotationTypes);
    result["contentVersion"] = identity(value.contentVersion);
    result["layerId"] = identity(value.layerId);
    result["annotationsDataLink"] = identity(value.annotationsDataLink);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ReadingPosition
class ReadingPosition extends IdentityHash {
  /** Resource type for a reading position. */
  core.String kind;

  /** Position in a volume for image-based content. */
  core.String gbImagePosition;

  /** Position in an EPUB as a CFI. */
  core.String epubCfiPosition;

  /**
 * Timestamp when this reading position was last updated (formatted UTC timestamp with millisecond
 * resolution).
 */
  core.String updated;

  /** Volume id associated with this reading position. */
  core.String volumeId;

  /** Position in a PDF file. */
  core.String pdfPosition;

  /** Position in a volume for text-based content. */
  core.String gbTextPosition;

  /** Parses an instance from its JSON representation. */
  static ReadingPosition parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReadingPosition();
    result.kind = identity(json["kind"]);
    result.gbImagePosition = identity(json["gbImagePosition"]);
    result.epubCfiPosition = identity(json["epubCfiPosition"]);
    result.updated = identity(json["updated"]);
    result.volumeId = identity(json["volumeId"]);
    result.pdfPosition = identity(json["pdfPosition"]);
    result.gbTextPosition = identity(json["gbTextPosition"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReadingPosition value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["gbImagePosition"] = identity(value.gbImagePosition);
    result["epubCfiPosition"] = identity(value.epubCfiPosition);
    result["updated"] = identity(value.updated);
    result["volumeId"] = identity(value.volumeId);
    result["pdfPosition"] = identity(value.pdfPosition);
    result["gbTextPosition"] = identity(value.gbTextPosition);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .RequestAccess
class RequestAccess extends IdentityHash {
  /** A download access response. */
  DownloadAccessRestriction downloadAccess;

  /** Resource type. */
  core.String kind;

  /** A concurrent access response. */
  ConcurrentAccessRestriction concurrentAccess;

  /** Parses an instance from its JSON representation. */
  static RequestAccess parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RequestAccess();
    result.downloadAccess = DownloadAccessRestriction.parse(json["downloadAccess"]);
    result.kind = identity(json["kind"]);
    result.concurrentAccess = ConcurrentAccessRestriction.parse(json["concurrentAccess"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RequestAccess value) {
    if (value == null) return null;
    final result = {};
    result["downloadAccess"] = DownloadAccessRestriction.serialize(value.downloadAccess);
    result["kind"] = identity(value.kind);
    result["concurrentAccess"] = ConcurrentAccessRestriction.serialize(value.concurrentAccess);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Review
class Review extends IdentityHash {
  /** Star rating for this review. Possible values are ONE, TWO, THREE, FOUR, FIVE or NOT_RATED. */
  core.String rating;

  /** Resource type for a review. */
  core.String kind;

  /** Author of this review. */
  ReviewAuthor author;

  /** Title for this review. */
  core.String title;

  /** Volume that this review is for. */
  core.String volumeId;

  /** Review text. */
  core.String content;

  /**
 * Information regarding the source of this review, when the review is not from a Google Books user.
 */
  ReviewSource source;

  /** Date of this review. */
  core.String date;

  /** Source type for this review. Possible values are EDITORIAL, WEB_USER or GOOGLE_USER. */
  core.String type;

  /** URL for the full review text, for reviews gathered from the web. */
  core.String fullTextUrl;

  /** Parses an instance from its JSON representation. */
  static Review parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Review();
    result.rating = identity(json["rating"]);
    result.kind = identity(json["kind"]);
    result.author = ReviewAuthor.parse(json["author"]);
    result.title = identity(json["title"]);
    result.volumeId = identity(json["volumeId"]);
    result.content = identity(json["content"]);
    result.source = ReviewSource.parse(json["source"]);
    result.date = identity(json["date"]);
    result.type = identity(json["type"]);
    result.fullTextUrl = identity(json["fullTextUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Review value) {
    if (value == null) return null;
    final result = {};
    result["rating"] = identity(value.rating);
    result["kind"] = identity(value.kind);
    result["author"] = ReviewAuthor.serialize(value.author);
    result["title"] = identity(value.title);
    result["volumeId"] = identity(value.volumeId);
    result["content"] = identity(value.content);
    result["source"] = ReviewSource.serialize(value.source);
    result["date"] = identity(value.date);
    result["type"] = identity(value.type);
    result["fullTextUrl"] = identity(value.fullTextUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Review.ReviewAuthor
class ReviewAuthor extends IdentityHash {
  /** Name of this person. */
  core.String displayName;

  /** Parses an instance from its JSON representation. */
  static ReviewAuthor parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReviewAuthor();
    result.displayName = identity(json["displayName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReviewAuthor value) {
    if (value == null) return null;
    final result = {};
    result["displayName"] = identity(value.displayName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Review.ReviewSource
class ReviewSource extends IdentityHash {
  /** Extra text about the source of the review. */
  core.String extraDescription;

  /** URL of the source of the review. */
  core.String url;

  /** Name of the source. */
  core.String description;

  /** Parses an instance from its JSON representation. */
  static ReviewSource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReviewSource();
    result.extraDescription = identity(json["extraDescription"]);
    result.url = identity(json["url"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReviewSource value) {
    if (value == null) return null;
    final result = {};
    result["extraDescription"] = identity(value.extraDescription);
    result["url"] = identity(value.url);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Volume
class Volume extends IdentityHash {
  /** Resource type for a volume. (In LITE projection.) */
  core.String kind;

  /**
 * Any information about a volume related to reading or obtaining that volume text. This information
 * can depend on country (books may be public domain in one country but not in another, e.g.).
 */
  VolumeAccessInfo accessInfo;

  /** Search result information related to this volume. */
  VolumeSearchInfo searchInfo;

  /**
 * Any information about a volume related to the eBookstore and/or purchaseability. This information
 * can depend on the country where the request originates from (i.e. books may not be for sale in
 * certain countries).
 */
  VolumeSaleInfo saleInfo;

  /** Opaque identifier for a specific version of a volume resource. (In LITE projection) */
  core.String etag;

  /**
 * User specific information related to this volume. (e.g. page this user last read or whether they
 * purchased this book)
 */
  VolumeUserInfo userInfo;

  /** General volume information. */
  VolumeVolumeInfo volumeInfo;

  /** Unique identifier for a volume. (In LITE projection.) */
  core.String id;

  /** URL to this resource. (In LITE projection.) */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Volume parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Volume();
    result.kind = identity(json["kind"]);
    result.accessInfo = VolumeAccessInfo.parse(json["accessInfo"]);
    result.searchInfo = VolumeSearchInfo.parse(json["searchInfo"]);
    result.saleInfo = VolumeSaleInfo.parse(json["saleInfo"]);
    result.etag = identity(json["etag"]);
    result.userInfo = VolumeUserInfo.parse(json["userInfo"]);
    result.volumeInfo = VolumeVolumeInfo.parse(json["volumeInfo"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Volume value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["accessInfo"] = VolumeAccessInfo.serialize(value.accessInfo);
    result["searchInfo"] = VolumeSearchInfo.serialize(value.searchInfo);
    result["saleInfo"] = VolumeSaleInfo.serialize(value.saleInfo);
    result["etag"] = identity(value.etag);
    result["userInfo"] = VolumeUserInfo.serialize(value.userInfo);
    result["volumeInfo"] = VolumeVolumeInfo.serialize(value.volumeInfo);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeAccessInfo
class VolumeAccessInfo extends IdentityHash {
  /**
 * URL to read this volume on the Google Books site. Link will not allow users to read non-viewable
 * volumes.
 */
  core.String webReaderLink;

  /** Whether or not this book is public domain in the country listed above. */
  core.bool publicDomain;

  /** Whether this volume can be embedded in a viewport using the Embedded Viewer API. */
  core.bool embeddable;

  /** Information about a volume's download license access restrictions. */
  DownloadAccessRestriction downloadAccess;

  /**
 * The two-letter ISO_3166-1 country code for which this access information is valid. (In LITE
 * projection.)
 */
  core.String country;

  /**
 * For ordered but not yet processed orders, we give a URL that can be used to go to the appropriate
 * Google Wallet page.
 */
  core.String viewOrderUrl;

  /**
 * Whether text-to-speech is permitted for this volume. Values can be ALLOWED,
 * ALLOWED_FOR_ACCESSIBILITY, or NOT_ALLOWED.
 */
  core.String textToSpeechPermission;

  /** Information about pdf content. (In LITE projection.) */
  VolumeAccessInfoPdf pdf;

  /**
 * The read access of a volume. Possible values are PARTIAL, ALL_PAGES, NO_PAGES or UNKNOWN. This
 * value depends on the country listed above. A value of PARTIAL means that the publisher has
 * allowed some portion of the volume to be viewed publicly, without purchase. This can apply to
 * eBooks as well as non-eBooks. Public domain books will always have a value of ALL_PAGES.
 */
  core.String viewability;

  /** Information about epub content. (In LITE projection.) */
  VolumeAccessInfoEpub epub;

  /**
 * Combines the access and viewability of this volume into a single status field for this user.
 * Values can be FULL_PURCHASED, FULL_PUBLIC_DOMAIN, SAMPLE or NONE. (In LITE projection.)
 */
  core.String accessViewStatus;

  /** Parses an instance from its JSON representation. */
  static VolumeAccessInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeAccessInfo();
    result.webReaderLink = identity(json["webReaderLink"]);
    result.publicDomain = identity(json["publicDomain"]);
    result.embeddable = identity(json["embeddable"]);
    result.downloadAccess = DownloadAccessRestriction.parse(json["downloadAccess"]);
    result.country = identity(json["country"]);
    result.viewOrderUrl = identity(json["viewOrderUrl"]);
    result.textToSpeechPermission = identity(json["textToSpeechPermission"]);
    result.pdf = VolumeAccessInfoPdf.parse(json["pdf"]);
    result.viewability = identity(json["viewability"]);
    result.epub = VolumeAccessInfoEpub.parse(json["epub"]);
    result.accessViewStatus = identity(json["accessViewStatus"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeAccessInfo value) {
    if (value == null) return null;
    final result = {};
    result["webReaderLink"] = identity(value.webReaderLink);
    result["publicDomain"] = identity(value.publicDomain);
    result["embeddable"] = identity(value.embeddable);
    result["downloadAccess"] = DownloadAccessRestriction.serialize(value.downloadAccess);
    result["country"] = identity(value.country);
    result["viewOrderUrl"] = identity(value.viewOrderUrl);
    result["textToSpeechPermission"] = identity(value.textToSpeechPermission);
    result["pdf"] = VolumeAccessInfoPdf.serialize(value.pdf);
    result["viewability"] = identity(value.viewability);
    result["epub"] = VolumeAccessInfoEpub.serialize(value.epub);
    result["accessViewStatus"] = identity(value.accessViewStatus);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeAccessInfo.VolumeAccessInfoEpub
class VolumeAccessInfoEpub extends IdentityHash {
  /**
 * Is a flowing text epub available either as public domain or for purchase. (In LITE projection.)
 */
  core.bool isAvailable;

  /** URL to download epub. (In LITE projection.) */
  core.String downloadLink;

  /** URL to retrieve ACS token for epub download. (In LITE projection.) */
  core.String acsTokenLink;

  /** Parses an instance from its JSON representation. */
  static VolumeAccessInfoEpub parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeAccessInfoEpub();
    result.isAvailable = identity(json["isAvailable"]);
    result.downloadLink = identity(json["downloadLink"]);
    result.acsTokenLink = identity(json["acsTokenLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeAccessInfoEpub value) {
    if (value == null) return null;
    final result = {};
    result["isAvailable"] = identity(value.isAvailable);
    result["downloadLink"] = identity(value.downloadLink);
    result["acsTokenLink"] = identity(value.acsTokenLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeAccessInfo.VolumeAccessInfoPdf
class VolumeAccessInfoPdf extends IdentityHash {
  /**
 * Is a scanned image pdf available either as public domain or for purchase. (In LITE projection.)
 */
  core.bool isAvailable;

  /** URL to download pdf. (In LITE projection.) */
  core.String downloadLink;

  /** URL to retrieve ACS token for pdf download. (In LITE projection.) */
  core.String acsTokenLink;

  /** Parses an instance from its JSON representation. */
  static VolumeAccessInfoPdf parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeAccessInfoPdf();
    result.isAvailable = identity(json["isAvailable"]);
    result.downloadLink = identity(json["downloadLink"]);
    result.acsTokenLink = identity(json["acsTokenLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeAccessInfoPdf value) {
    if (value == null) return null;
    final result = {};
    result["isAvailable"] = identity(value.isAvailable);
    result["downloadLink"] = identity(value.downloadLink);
    result["acsTokenLink"] = identity(value.acsTokenLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeSaleInfo
class VolumeSaleInfo extends IdentityHash {
  /**
 * The two-letter ISO_3166-1 country code for which this sale information is valid. (In LITE
 * projection.)
 */
  core.String country;

  /**
 * The actual selling price of the book. This is the same as the suggested retail or list price
 * unless there are offers or discounts on this volume. (In LITE projection.)
 */
  VolumeSaleInfoRetailPrice retailPrice;

  /** Whether or not this volume is an eBook (can be added to the My eBooks shelf). */
  core.bool isEbook;

  /**
 * Whether or not this book is available for sale or offered for free in the Google eBookstore for
 * the country listed above. Possible values are FOR_SALE, FREE, NOT_FOR_SALE, or FOR_PREORDER.
 */
  core.String saleability;

  /** URL to purchase this volume on the Google Books site. (In LITE projection) */
  core.String buyLink;

  /** The date on which this book is available for sale. */
  core.String onSaleDate;

  /** Suggested retail price. (In LITE projection.) */
  VolumeSaleInfoListPrice listPrice;

  /** Parses an instance from its JSON representation. */
  static VolumeSaleInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeSaleInfo();
    result.country = identity(json["country"]);
    result.retailPrice = VolumeSaleInfoRetailPrice.parse(json["retailPrice"]);
    result.isEbook = identity(json["isEbook"]);
    result.saleability = identity(json["saleability"]);
    result.buyLink = identity(json["buyLink"]);
    result.onSaleDate = identity(json["onSaleDate"]);
    result.listPrice = VolumeSaleInfoListPrice.parse(json["listPrice"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeSaleInfo value) {
    if (value == null) return null;
    final result = {};
    result["country"] = identity(value.country);
    result["retailPrice"] = VolumeSaleInfoRetailPrice.serialize(value.retailPrice);
    result["isEbook"] = identity(value.isEbook);
    result["saleability"] = identity(value.saleability);
    result["buyLink"] = identity(value.buyLink);
    result["onSaleDate"] = identity(value.onSaleDate);
    result["listPrice"] = VolumeSaleInfoListPrice.serialize(value.listPrice);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeSaleInfo.VolumeSaleInfoListPrice
class VolumeSaleInfoListPrice extends IdentityHash {
  /** Amount in the currency listed below. (In LITE projection.) */
  core.double amount;

  /** An ISO 4217, three-letter currency code. (In LITE projection.) */
  core.String currencyCode;

  /** Parses an instance from its JSON representation. */
  static VolumeSaleInfoListPrice parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeSaleInfoListPrice();
    result.amount = identity(json["amount"]);
    result.currencyCode = identity(json["currencyCode"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeSaleInfoListPrice value) {
    if (value == null) return null;
    final result = {};
    result["amount"] = identity(value.amount);
    result["currencyCode"] = identity(value.currencyCode);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeSaleInfo.VolumeSaleInfoRetailPrice
class VolumeSaleInfoRetailPrice extends IdentityHash {
  /** Amount in the currency listed below. (In LITE projection.) */
  core.double amount;

  /** An ISO 4217, three-letter currency code. (In LITE projection.) */
  core.String currencyCode;

  /** Parses an instance from its JSON representation. */
  static VolumeSaleInfoRetailPrice parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeSaleInfoRetailPrice();
    result.amount = identity(json["amount"]);
    result.currencyCode = identity(json["currencyCode"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeSaleInfoRetailPrice value) {
    if (value == null) return null;
    final result = {};
    result["amount"] = identity(value.amount);
    result["currencyCode"] = identity(value.currencyCode);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeSearchInfo
class VolumeSearchInfo extends IdentityHash {
  /** A text snippet containing the search query. */
  core.String textSnippet;

  /** Parses an instance from its JSON representation. */
  static VolumeSearchInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeSearchInfo();
    result.textSnippet = identity(json["textSnippet"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeSearchInfo value) {
    if (value == null) return null;
    final result = {};
    result["textSnippet"] = identity(value.textSnippet);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeUserInfo
class VolumeUserInfo extends IdentityHash {
  /** Whether or not this volume is currently in "my books." */
  core.bool isInMyBooks;

  /**
 * Timestamp when this volume was last modified by a user action, such as a reading position update,
 * volume purchase or writing a review. (RFC 3339 UTC date-time format).
 */
  core.String updated;

  /** This user's review of this volume, if one exists. */
  Review review;

  /**
 * Whether or not this volume was purchased by the authenticated user making the request. (In LITE
 * projection.)
 */
  core.bool isPurchased;

  /**
 * The user's current reading position in the volume, if one is available. (In LITE projection.)
 */
  ReadingPosition readingPosition;

  /**
 * Whether or not this volume was pre-ordered by the authenticated user making the request. (In LITE
 * projection.)
 */
  core.bool isPreordered;

  /** Parses an instance from its JSON representation. */
  static VolumeUserInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeUserInfo();
    result.isInMyBooks = identity(json["isInMyBooks"]);
    result.updated = identity(json["updated"]);
    result.review = Review.parse(json["review"]);
    result.isPurchased = identity(json["isPurchased"]);
    result.readingPosition = ReadingPosition.parse(json["readingPosition"]);
    result.isPreordered = identity(json["isPreordered"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeUserInfo value) {
    if (value == null) return null;
    final result = {};
    result["isInMyBooks"] = identity(value.isInMyBooks);
    result["updated"] = identity(value.updated);
    result["review"] = Review.serialize(value.review);
    result["isPurchased"] = identity(value.isPurchased);
    result["readingPosition"] = ReadingPosition.serialize(value.readingPosition);
    result["isPreordered"] = identity(value.isPreordered);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeVolumeInfo
class VolumeVolumeInfo extends IdentityHash {
  /** Publisher of this volume. (In LITE projection.) */
  core.String publisher;

  /** Volume subtitle. (In LITE projection.) */
  core.String subtitle;

  /**
 * A synopsis of the volume. The text of the description is formatted in HTML and includes simple
 * formatting elements, such as b, i, and br tags. (In LITE projection.)
 */
  core.String description;

  /**
 * Best language for this volume (based on content). It is the two-letter ISO 639-1 code such as
 * 'fr', 'en', etc.
 */
  core.String language;

  /** Total number of pages. */
  core.int pageCount;

  /** A list of image links for all the sizes that are available. (In LITE projection.) */
  VolumeVolumeInfoImageLinks imageLinks;

  /** Date of publication. (In LITE projection.) */
  core.String publishedDate;

  /** URL to preview this volume on the Google Books site. */
  core.String previewLink;

  /** Type of publication of this volume. Possible values are BOOK or MAGAZINE. */
  core.String printType;

  /** The number of review ratings for this volume. */
  core.int ratingsCount;

  /**
 * The main category to which this volume belongs. It will be the category from the categories list
 * returned below that has the highest weight.
 */
  core.String mainCategory;

  /** Physical dimensions of this volume. */
  VolumeVolumeInfoDimensions dimensions;

  /** An identifier for the version of the volume content (text & images). (In LITE projection) */
  core.String contentVersion;

  /** Industry standard identifiers for this volume. */
  core.List<VolumeVolumeInfoIndustryIdentifiers> industryIdentifiers;

  /** The names of the authors and/or editors for this volume. (In LITE projection) */
  core.List<core.String> authors;

  /** Volume title. (In LITE projection.) */
  core.String title;

  /** Canonical URL for a volume. (In LITE projection.) */
  core.String canonicalVolumeLink;

  /** URL to view information about this volume on the Google Books site. (In LITE projection) */
  core.String infoLink;

  /** A list of subject categories, such as "Fiction", "Suspense", etc. */
  core.List<core.String> categories;

  /** The mean review rating for this volume. (min = 1.0, max = 5.0) */
  core.double averageRating;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeVolumeInfo();
    result.publisher = identity(json["publisher"]);
    result.subtitle = identity(json["subtitle"]);
    result.description = identity(json["description"]);
    result.language = identity(json["language"]);
    result.pageCount = identity(json["pageCount"]);
    result.imageLinks = VolumeVolumeInfoImageLinks.parse(json["imageLinks"]);
    result.publishedDate = identity(json["publishedDate"]);
    result.previewLink = identity(json["previewLink"]);
    result.printType = identity(json["printType"]);
    result.ratingsCount = identity(json["ratingsCount"]);
    result.mainCategory = identity(json["mainCategory"]);
    result.dimensions = VolumeVolumeInfoDimensions.parse(json["dimensions"]);
    result.contentVersion = identity(json["contentVersion"]);
    result.industryIdentifiers = map(VolumeVolumeInfoIndustryIdentifiers.parse)(json["industryIdentifiers"]);
    result.authors = map(identity)(json["authors"]);
    result.title = identity(json["title"]);
    result.canonicalVolumeLink = identity(json["canonicalVolumeLink"]);
    result.infoLink = identity(json["infoLink"]);
    result.categories = map(identity)(json["categories"]);
    result.averageRating = identity(json["averageRating"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeVolumeInfo value) {
    if (value == null) return null;
    final result = {};
    result["publisher"] = identity(value.publisher);
    result["subtitle"] = identity(value.subtitle);
    result["description"] = identity(value.description);
    result["language"] = identity(value.language);
    result["pageCount"] = identity(value.pageCount);
    result["imageLinks"] = VolumeVolumeInfoImageLinks.serialize(value.imageLinks);
    result["publishedDate"] = identity(value.publishedDate);
    result["previewLink"] = identity(value.previewLink);
    result["printType"] = identity(value.printType);
    result["ratingsCount"] = identity(value.ratingsCount);
    result["mainCategory"] = identity(value.mainCategory);
    result["dimensions"] = VolumeVolumeInfoDimensions.serialize(value.dimensions);
    result["contentVersion"] = identity(value.contentVersion);
    result["industryIdentifiers"] = map(VolumeVolumeInfoIndustryIdentifiers.serialize)(value.industryIdentifiers);
    result["authors"] = map(identity)(value.authors);
    result["title"] = identity(value.title);
    result["canonicalVolumeLink"] = identity(value.canonicalVolumeLink);
    result["infoLink"] = identity(value.infoLink);
    result["categories"] = map(identity)(value.categories);
    result["averageRating"] = identity(value.averageRating);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeVolumeInfo.VolumeVolumeInfoDimensions
class VolumeVolumeInfoDimensions extends IdentityHash {
  /** Width of this volume (in cm). */
  core.String width;

  /** Thickness of this volume (in cm). */
  core.String thickness;

  /** Height or length of this volume (in cm). */
  core.String height;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfoDimensions parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeVolumeInfoDimensions();
    result.width = identity(json["width"]);
    result.thickness = identity(json["thickness"]);
    result.height = identity(json["height"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeVolumeInfoDimensions value) {
    if (value == null) return null;
    final result = {};
    result["width"] = identity(value.width);
    result["thickness"] = identity(value.thickness);
    result["height"] = identity(value.height);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeVolumeInfo.VolumeVolumeInfoImageLinks
class VolumeVolumeInfoImageLinks extends IdentityHash {
  /** Image link for medium size (width of ~575 pixels). (In LITE projection) */
  core.String medium;

  /** Image link for small thumbnail size (width of ~80 pixels). (In LITE projection) */
  core.String smallThumbnail;

  /** Image link for large size (width of ~800 pixels). (In LITE projection) */
  core.String large;

  /** Image link for extra large size (width of ~1280 pixels). (In LITE projection) */
  core.String extraLarge;

  /** Image link for small size (width of ~300 pixels). (In LITE projection) */
  core.String small;

  /** Image link for thumbnail size (width of ~128 pixels). (In LITE projection) */
  core.String thumbnail;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfoImageLinks parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeVolumeInfoImageLinks();
    result.medium = identity(json["medium"]);
    result.smallThumbnail = identity(json["smallThumbnail"]);
    result.large = identity(json["large"]);
    result.extraLarge = identity(json["extraLarge"]);
    result.small = identity(json["small"]);
    result.thumbnail = identity(json["thumbnail"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeVolumeInfoImageLinks value) {
    if (value == null) return null;
    final result = {};
    result["medium"] = identity(value.medium);
    result["smallThumbnail"] = identity(value.smallThumbnail);
    result["large"] = identity(value.large);
    result["extraLarge"] = identity(value.extraLarge);
    result["small"] = identity(value.small);
    result["thumbnail"] = identity(value.thumbnail);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeVolumeInfo.VolumeVolumeInfoIndustryIdentifiers
class VolumeVolumeInfoIndustryIdentifiers extends IdentityHash {
  /** Industry specific volume identifier. */
  core.String identifier;

  /** Identifier type. Possible values are ISBN_10, ISBN_13, ISSN and OTHER. */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfoIndustryIdentifiers parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeVolumeInfoIndustryIdentifiers();
    result.identifier = identity(json["identifier"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeVolumeInfoIndustryIdentifiers value) {
    if (value == null) return null;
    final result = {};
    result["identifier"] = identity(value.identifier);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Volumeannotation
class Volumeannotation extends IdentityHash {
  /** The type of annotation this is. */
  core.String annotationType;

  /** Resource Type */
  core.String kind;

  /** Timestamp for the last time this anntoation was updated. (RFC 3339 UTC date-time format). */
  core.String updated;

  /** Indicates that this annotation is deleted. */
  core.bool deleted;

  /** The content ranges to identify the selected text. */
  VolumeannotationContentRanges contentRanges;

  /** Excerpt from the volume. */
  core.String selectedText;

  /** The Volume this annotation is for. */
  core.String volumeId;

  /** The annotation data id for this volume annotation. */
  core.String annotationDataId;

  /** Link to get data for this annotation. */
  core.String annotationDataLink;

  /** Pages the annotation spans. */
  core.List<core.String> pageIds;

  /** The Layer this annotation is for. */
  core.String layerId;

  /** Data for this annotation. */
  core.String data;

  /** Unique id of this volume annotation. */
  core.String id;

  /** URL to this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Volumeannotation parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Volumeannotation();
    result.annotationType = identity(json["annotationType"]);
    result.kind = identity(json["kind"]);
    result.updated = identity(json["updated"]);
    result.deleted = identity(json["deleted"]);
    result.contentRanges = VolumeannotationContentRanges.parse(json["contentRanges"]);
    result.selectedText = identity(json["selectedText"]);
    result.volumeId = identity(json["volumeId"]);
    result.annotationDataId = identity(json["annotationDataId"]);
    result.annotationDataLink = identity(json["annotationDataLink"]);
    result.pageIds = map(identity)(json["pageIds"]);
    result.layerId = identity(json["layerId"]);
    result.data = identity(json["data"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Volumeannotation value) {
    if (value == null) return null;
    final result = {};
    result["annotationType"] = identity(value.annotationType);
    result["kind"] = identity(value.kind);
    result["updated"] = identity(value.updated);
    result["deleted"] = identity(value.deleted);
    result["contentRanges"] = VolumeannotationContentRanges.serialize(value.contentRanges);
    result["selectedText"] = identity(value.selectedText);
    result["volumeId"] = identity(value.volumeId);
    result["annotationDataId"] = identity(value.annotationDataId);
    result["annotationDataLink"] = identity(value.annotationDataLink);
    result["pageIds"] = map(identity)(value.pageIds);
    result["layerId"] = identity(value.layerId);
    result["data"] = identity(value.data);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volumeannotation.VolumeannotationContentRanges
class VolumeannotationContentRanges extends IdentityHash {
  /** Content version applicable to ranges below. */
  core.String contentVersion;

  /** Range in GB text format for this annotation for version above. */
  BooksAnnotationsRange gbTextRange;

  /** Range in CFI format for this annotation for version above. */
  BooksAnnotationsRange cfiRange;

  /** Range in GB image format for this annotation for version above. */
  BooksAnnotationsRange gbImageRange;

  /** Parses an instance from its JSON representation. */
  static VolumeannotationContentRanges parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VolumeannotationContentRanges();
    result.contentVersion = identity(json["contentVersion"]);
    result.gbTextRange = BooksAnnotationsRange.parse(json["gbTextRange"]);
    result.cfiRange = BooksAnnotationsRange.parse(json["cfiRange"]);
    result.gbImageRange = BooksAnnotationsRange.parse(json["gbImageRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VolumeannotationContentRanges value) {
    if (value == null) return null;
    final result = {};
    result["contentVersion"] = identity(value.contentVersion);
    result["gbTextRange"] = BooksAnnotationsRange.serialize(value.gbTextRange);
    result["cfiRange"] = BooksAnnotationsRange.serialize(value.cfiRange);
    result["gbImageRange"] = BooksAnnotationsRange.serialize(value.gbImageRange);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Volumeannotations
class Volumeannotations extends IdentityHash {
  /**
 * Token to pass in for pagination for the next page. This will not be present if this request does
 * not have more results.
 */
  core.String nextPageToken;

  /** A list of volume annotations. */
  core.List<Volumeannotation> items;

  /** Resource type */
  core.String kind;

  /** The total number of volume annotations found. */
  core.int totalItems;

  /** Parses an instance from its JSON representation. */
  static Volumeannotations parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Volumeannotations();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Volumeannotation.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Volumeannotations value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Volumeannotation.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Volumes
class Volumes extends IdentityHash {
  /**
 * Total number of volumes found. This might be greater than the number of volumes returned in this
 * response if results have been paginated.
 */
  core.int totalItems;

  /** A list of volumes. */
  core.List<Volume> items;

  /** Resource type. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Volumes parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Volumes();
    result.totalItems = identity(json["totalItems"]);
    result.items = map(Volume.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Volumes value) {
    if (value == null) return null;
    final result = {};
    result["totalItems"] = identity(value.totalItems);
    result["items"] = map(Volume.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum BooksApi.Alt
class BooksApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final BooksApiAlt JSON = const BooksApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<BooksApiAlt> values = const <BooksApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BooksApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BooksApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BooksApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

