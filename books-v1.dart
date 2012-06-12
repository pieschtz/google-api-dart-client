#library("books");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API BooksApi
/**
 * Lets you search for books and manage your Google Books library.
 */
class BooksApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
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
  BooksApiAlt alt;


  BooksApi([this.baseUrl = "https://www.googleapis.com/books/v1/", this.applicationName]) { 
    _layers = new LayersResource._internal(this);
    _bookshelves = new BookshelvesResource._internal(this);
    _myconfig = new MyconfigResource._internal(this);
    _volumes = new VolumesResource._internal(this);
    _mylibrary = new MylibraryResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}books/v1/20120423 google-api-dart-client/${clientVersion}";
  }
}

// Resource .LayersResource
class LayersResource {
  final BooksApi _$service;
  final LayersAnnotationDataResourceResource annotationData;
  final LayersVolumeAnnotationsResourceResource volumeAnnotations;
  
  LayersResource._internal(BooksApi $service) : _$service = $service,
    annotationData = new LayersAnnotationDataResourceResource._internal($service),
    volumeAnnotations = new LayersVolumeAnnotationsResourceResource._internal($service);

  // Method LayersResource.List
  /**
   * List the layer summaries for a volume.
   * [volumeId] The volume to retrieve layers for.
   */
  Future<Layersummaries> list(String volumeId, [String pageToken = UNSPECIFIED, String contentVersion = UNSPECIFIED, int maxResults = UNSPECIFIED, String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/layersummary").generate($pathParams, $queryParams);
    final $completer = new Completer<Layersummaries>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Layersummaries.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method LayersResource.Get
  /**
   * Gets the layer summary for a volume.
   * [volumeId] The volume to retrieve layers for.
   * [summaryId] The ID for the layer to get the summary for.
   */
  Future<Layersummary> get(String volumeId, String summaryId, [String source = UNSPECIFIED, String contentVersion = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/layersummary/{summaryId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Layersummary>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Layersummary.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}


// Resource LayersResource.LayersAnnotationDataResourceResource
class LayersAnnotationDataResourceResource {
  final BooksApi _$service;
  
  LayersAnnotationDataResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method LayersResource.LayersAnnotationDataResourceResource.List
  /**
   * Gets the annotation data for a volume and layer.
   * [volumeId] The volume to retrieve annotation data for.
   * [layerId] The ID for the layer to get the annotation data.
   * [contentVersion] The content version for the requested volume.
   */
  Future<Annotationsdata> list(String volumeId, String layerId, String contentVersion, [String source = UNSPECIFIED, String locale = UNSPECIFIED, int h = UNSPECIFIED, String updatedMax = UNSPECIFIED, int maxResults = UNSPECIFIED, List<String> annotationDataId = UNSPECIFIED, String pageToken = UNSPECIFIED, int w = UNSPECIFIED, String updatedMin = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["layerId"] = layerId;
    $pathParams["contentVersion"] = contentVersion;
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/layers/{layerId}/data").generate($pathParams, $queryParams);
    final $completer = new Completer<Annotationsdata>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Annotationsdata.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method LayersResource.LayersAnnotationDataResourceResource.Get
  /**
   * Gets the annotation data.
   * [volumeId] The volume to retrieve annotations for.
   * [layerId] The ID for the layer to get the annotations.
   * [annotationDataId] The ID of the annotation data to retrieve.
   * [contentVersion] The content version for the volume you are trying to retrieve.
   */
  Future<Annotationdata> get(String volumeId, String layerId, String annotationDataId, String contentVersion, [String locale = UNSPECIFIED, int h = UNSPECIFIED, String source = UNSPECIFIED, int w = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["volumeId"] = volumeId;
    $pathParams["layerId"] = layerId;
    $pathParams["annotationDataId"] = annotationDataId;
    $pathParams["contentVersion"] = contentVersion;
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/layers/{layerId}/data/{annotationDataId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Annotationdata>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Annotationdata.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource LayersResource.LayersVolumeAnnotationsResourceResource
class LayersVolumeAnnotationsResourceResource {
  final BooksApi _$service;
  
  LayersVolumeAnnotationsResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method LayersResource.LayersVolumeAnnotationsResourceResource.List
  /**
   * Gets the volume annotations for a volume and layer.
   * [volumeId] The volume to retrieve annotations for.
   * [layerId] The ID for the layer to get the annotations.
   * [contentVersion] The content version for the requested volume.
   */
  Future<Volumeannotations> list(String volumeId, String layerId, String contentVersion, [bool showDeleted = UNSPECIFIED, String endPosition = UNSPECIFIED, String endOffset = UNSPECIFIED, String locale = UNSPECIFIED, String updatedMin = UNSPECIFIED, String updatedMax = UNSPECIFIED, int maxResults = UNSPECIFIED, String pageToken = UNSPECIFIED, String source = UNSPECIFIED, String startOffset = UNSPECIFIED, String startPosition = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/layers/{layerId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumeannotations>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumeannotations.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method LayersResource.LayersVolumeAnnotationsResourceResource.Get
  /**
   * Gets the volume annotation.
   * [volumeId] The volume to retrieve annotations for.
   * [layerId] The ID for the layer to get the annotations.
   * [annotationId] The ID of the volume annotation to retrieve.
   */
  Future<Volumeannotation> get(String volumeId, String layerId, String annotationId, [String locale = UNSPECIFIED, String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/layers/{layerId}/annotations/{annotationId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumeannotation>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumeannotation.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .BookshelvesResource
class BookshelvesResource {
  final BooksApi _$service;
  final BookshelvesVolumesResourceResource volumes;
  
  BookshelvesResource._internal(BooksApi $service) : _$service = $service,
    volumes = new BookshelvesVolumesResourceResource._internal($service);

  // Method BookshelvesResource.List
  /**
   * Retrieves a list of public bookshelves for the specified user.
   * [userId] ID of user for whom to retrieve bookshelves.
   */
  Future<Bookshelves> list(String userId, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "users/{userId}/bookshelves").generate($pathParams, $queryParams);
    final $completer = new Completer<Bookshelves>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Bookshelves.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method BookshelvesResource.Get
  /**
   * Retrieves metadata for a specific bookshelf for the specified user.
   * [userId] ID of user for whom to retrieve bookshelves.
   * [shelf] ID of bookshelf to retrieve.
   */
  Future<Bookshelf> get(String userId, String shelf, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "users/{userId}/bookshelves/{shelf}").generate($pathParams, $queryParams);
    final $completer = new Completer<Bookshelf>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Bookshelf.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}


// Resource BookshelvesResource.BookshelvesVolumesResourceResource
class BookshelvesVolumesResourceResource {
  final BooksApi _$service;
  
  BookshelvesVolumesResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method BookshelvesResource.BookshelvesVolumesResourceResource.List
  /**
   * Retrieves volumes in a specific bookshelf for the specified user.
   * [userId] ID of user for whom to retrieve bookshelf volumes.
   * [shelf] ID of bookshelf to retrieve volumes.
   */
  Future<Volumes> list(String userId, String shelf, [bool showPreorders = UNSPECIFIED, int maxResults = UNSPECIFIED, String source = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "users/{userId}/bookshelves/{shelf}/volumes").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumes>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumes.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .MyconfigResource
class MyconfigResource {
  final BooksApi _$service;
  
  MyconfigResource._internal(BooksApi $service) : _$service = $service;

  // Method MyconfigResource.ReleaseDownloadAccess
  /**
   * Release downloaded content access restriction.
   * [volumeIds] The volume(s) to release restrictions for.
   * [cpksver] The device/version ID from which to release the restriction.
   */
  Future<DownloadAccesses> releaseDownloadAccess(List<String> volumeIds, String cpksver, [String locale = UNSPECIFIED, String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "myconfig/releaseDownloadAccess").generate($pathParams, $queryParams);
    final $completer = new Completer<DownloadAccesses>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = DownloadAccesses.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MyconfigResource.RequestAccess
  /**
   * Request concurrent and download access restrictions.
   * [source] String to identify the originator of this request.
   * [volumeId] The volume to request concurrent/download restrictions for.
   * [nonce] The client nonce value.
   * [cpksver] The device/version ID from which to request the restrictions.
   */
  Future<RequestAccess> requestAccess(String source, String volumeId, String nonce, String cpksver, [String locale = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "myconfig/requestAccess").generate($pathParams, $queryParams);
    final $completer = new Completer<RequestAccess>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = RequestAccess.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MyconfigResource.SyncVolumeLicenses
  /**
   * Request downloaded content access for specified volumes on the My eBooks shelf.
   * [source] String to identify the originator of this request.
   * [nonce] The client nonce value.
   * [cpksver] The device/version ID from which to release the restriction.
   */
  Future<Volumes> syncVolumeLicenses(String source, String nonce, String cpksver, [String locale = UNSPECIFIED, bool showPreorders = UNSPECIFIED, List<String> volumeIds = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "myconfig/syncVolumeLicenses").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumes>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumes.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .VolumesResource
class VolumesResource {
  final BooksApi _$service;
  final VolumesAssociatedResourceResource associated;
  
  VolumesResource._internal(BooksApi $service) : _$service = $service,
    associated = new VolumesAssociatedResourceResource._internal($service);

  // Method VolumesResource.List
  /**
   * Performs a book search.
   * [q] Full-text search query string.
   */
  Future<Volumes> list(String q, [VolumesResourceListOrderBy orderBy = UNSPECIFIED, VolumesResourceListProjection projection = UNSPECIFIED, VolumesResourceListLibraryRestrict libraryRestrict = UNSPECIFIED, String langRestrict = UNSPECIFIED, bool showPreorders = UNSPECIFIED, VolumesResourceListPrintType printType = UNSPECIFIED, int maxResults = UNSPECIFIED, VolumesResourceListFilter filter = UNSPECIFIED, String source = UNSPECIFIED, int startIndex = UNSPECIFIED, VolumesResourceListDownload download = UNSPECIFIED, String partner = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumes>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumes.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method VolumesResource.Get
  /**
   * Gets volume information for a single volume.
   * [volumeId] ID of volume to retrieve.
   */
  Future<Volume> get(String volumeId, [String source = UNSPECIFIED, String country = UNSPECIFIED, VolumesResourceGetProjection projection = UNSPECIFIED, String partner = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Volume>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volume.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum VolumesResource.List.OrderBy
class VolumesResourceListOrderBy implements Hashable {
  /** Most recently published. */
  static final VolumesResourceListOrderBy NEWEST = const VolumesResourceListOrderBy._internal("newest", 0);
  /** Relevance to search terms. */
  static final VolumesResourceListOrderBy RELEVANCE = const VolumesResourceListOrderBy._internal("relevance", 1);

  /** All values of this enumeration */
  static final List<VolumesResourceListOrderBy> values = const <VolumesResourceListOrderBy>[
    NEWEST,
    RELEVANCE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListOrderBy>{ 
    "newest": NEWEST,
    "relevance": RELEVANCE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListOrderBy valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceListOrderBy._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Enum VolumesResource.List.Projection
class VolumesResourceListProjection implements Hashable {
  /** Includes all volume data. */
  static final VolumesResourceListProjection FULL = const VolumesResourceListProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final VolumesResourceListProjection LITE = const VolumesResourceListProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final List<VolumesResourceListProjection> values = const <VolumesResourceListProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceListProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum VolumesResource.List.LibraryRestrict
class VolumesResourceListLibraryRestrict implements Hashable {
  /** Restrict to the user's library, any shelf. */
  static final VolumesResourceListLibraryRestrict MY_LIBRARY = const VolumesResourceListLibraryRestrict._internal("my-library", 0);
  /** Do not restrict based on user's library. */
  static final VolumesResourceListLibraryRestrict NO_RESTRICT = const VolumesResourceListLibraryRestrict._internal("no-restrict", 1);

  /** All values of this enumeration */
  static final List<VolumesResourceListLibraryRestrict> values = const <VolumesResourceListLibraryRestrict>[
    MY_LIBRARY,
    NO_RESTRICT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListLibraryRestrict>{ 
    "my-library": MY_LIBRARY,
    "no-restrict": NO_RESTRICT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListLibraryRestrict valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceListLibraryRestrict._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "LibraryRestrict".hashCode();
}

// Enum VolumesResource.List.PrintType
class VolumesResourceListPrintType implements Hashable {
  /** All volume content types. */
  static final VolumesResourceListPrintType ALL = const VolumesResourceListPrintType._internal("all", 0);
  /** Just books. */
  static final VolumesResourceListPrintType BOOKS = const VolumesResourceListPrintType._internal("books", 1);
  /** Just magazines. */
  static final VolumesResourceListPrintType MAGAZINES = const VolumesResourceListPrintType._internal("magazines", 2);

  /** All values of this enumeration */
  static final List<VolumesResourceListPrintType> values = const <VolumesResourceListPrintType>[
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
  static VolumesResourceListPrintType valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceListPrintType._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "PrintType".hashCode();
}

// Enum VolumesResource.List.Filter
class VolumesResourceListFilter implements Hashable {
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
  static final List<VolumesResourceListFilter> values = const <VolumesResourceListFilter>[
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
  static VolumesResourceListFilter valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceListFilter._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Filter".hashCode();
}

// Enum VolumesResource.List.Download
class VolumesResourceListDownload implements Hashable {
  /** All volumes with epub. */
  static final VolumesResourceListDownload EPUB = const VolumesResourceListDownload._internal("epub", 0);

  /** All values of this enumeration */
  static final List<VolumesResourceListDownload> values = const <VolumesResourceListDownload>[
    EPUB,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceListDownload>{ 
    "epub": EPUB,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceListDownload valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceListDownload._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Download".hashCode();
}

// Enum VolumesResource.Get.Projection
class VolumesResourceGetProjection implements Hashable {
  /** Includes all volume data. */
  static final VolumesResourceGetProjection FULL = const VolumesResourceGetProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final VolumesResourceGetProjection LITE = const VolumesResourceGetProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final List<VolumesResourceGetProjection> values = const <VolumesResourceGetProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceGetProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceGetProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceGetProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}


// Resource VolumesResource.VolumesAssociatedResourceResource
class VolumesAssociatedResourceResource {
  final BooksApi _$service;
  
  VolumesAssociatedResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method VolumesResource.VolumesAssociatedResourceResource.List
  /**
   * Return a list of associated books.
   * [volumeId] ID of the source volume.
   */
  Future<Volumes> list(String volumeId, [VolumesResourceVolumesAssociatedResourceResourceListProjection projection = UNSPECIFIED, int maxResults = UNSPECIFIED, VolumesResourceVolumesAssociatedResourceResourceListFilter filter = UNSPECIFIED, String source = UNSPECIFIED, int startIndex = UNSPECIFIED, VolumesResourceVolumesAssociatedResourceResourceListAssociation association = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "volumes/{volumeId}/associated").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumes>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumes.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum VolumesResource.VolumesAssociatedResourceResource.List.Projection
class VolumesResourceVolumesAssociatedResourceResourceListProjection implements Hashable {
  /** Includes all volume data. */
  static final VolumesResourceVolumesAssociatedResourceResourceListProjection FULL = const VolumesResourceVolumesAssociatedResourceResourceListProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final VolumesResourceVolumesAssociatedResourceResourceListProjection LITE = const VolumesResourceVolumesAssociatedResourceResourceListProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final List<VolumesResourceVolumesAssociatedResourceResourceListProjection> values = const <VolumesResourceVolumesAssociatedResourceResourceListProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceVolumesAssociatedResourceResourceListProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceVolumesAssociatedResourceResourceListProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceVolumesAssociatedResourceResourceListProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum VolumesResource.VolumesAssociatedResourceResource.List.Filter
class VolumesResourceVolumesAssociatedResourceResourceListFilter implements Hashable {
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
  static final List<VolumesResourceVolumesAssociatedResourceResourceListFilter> values = const <VolumesResourceVolumesAssociatedResourceResourceListFilter>[
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
  static VolumesResourceVolumesAssociatedResourceResourceListFilter valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceVolumesAssociatedResourceResourceListFilter._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Filter".hashCode();
}

// Enum VolumesResource.VolumesAssociatedResourceResource.List.Association
class VolumesResourceVolumesAssociatedResourceResourceListAssociation implements Hashable {
  /** Books that are complementary for additional reading. */
  static final VolumesResourceVolumesAssociatedResourceResourceListAssociation COMPLEMENTARY = const VolumesResourceVolumesAssociatedResourceResourceListAssociation._internal("complementary", 0);

  /** All values of this enumeration */
  static final List<VolumesResourceVolumesAssociatedResourceResourceListAssociation> values = const <VolumesResourceVolumesAssociatedResourceResourceListAssociation>[
    COMPLEMENTARY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <VolumesResourceVolumesAssociatedResourceResourceListAssociation>{ 
    "complementary": COMPLEMENTARY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static VolumesResourceVolumesAssociatedResourceResourceListAssociation valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const VolumesResourceVolumesAssociatedResourceResourceListAssociation._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Association".hashCode();
}

// Resource .MylibraryResource
class MylibraryResource {
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
class MylibraryBookshelvesResourceResource {
  final BooksApi _$service;
  final MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource volumes;
  
  MylibraryBookshelvesResourceResource._internal(BooksApi $service) : _$service = $service,
    volumes = new MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource._internal($service);

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.RemoveVolume
  /**
   * Removes a volume from a bookshelf.
   * [shelf] ID of bookshelf from which to remove a volume.
   * [volumeId] ID of volume to remove.
   */
  Future removeVolume(String shelf, String volumeId, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves/{shelf}/removeVolume").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "POST", $headers);
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

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.Get
  /**
   * Retrieves metadata for a specific bookshelf belonging to the authenticated user.
   * [shelf] ID of bookshelf to retrieve.
   */
  Future<Bookshelf> get(String shelf, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves/{shelf}").generate($pathParams, $queryParams);
    final $completer = new Completer<Bookshelf>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Bookshelf.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.ClearVolumes
  /**
   * Clears all volumes from a bookshelf.
   * [shelf] ID of bookshelf from which to remove a volume.
   */
  Future clearVolumes(String shelf, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves/{shelf}/clearVolumes").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "POST", $headers);
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

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.List
  /**
   * Retrieves a list of bookshelves belonging to the authenticated user.
   */
  Future<Bookshelves> list([String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves").generate($pathParams, $queryParams);
    final $completer = new Completer<Bookshelves>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Bookshelves.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.AddVolume
  /**
   * Adds a volume to a bookshelf.
   * [shelf] ID of bookshelf to which to add a volume.
   * [volumeId] ID of volume to add.
   */
  Future addVolume(String shelf, String volumeId, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves/{shelf}/addVolume").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "POST", $headers);
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

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.MoveVolume
  /**
   * Moves a volume within a bookshelf.
   * [shelf] ID of bookshelf with the volume.
   * [volumeId] ID of volume to move.
   * [volumePosition] Position on shelf to move the item (0 puts the item before the current first item, 1 puts it between
   *        the first and the second and so on.)
   */
  Future moveVolume(String shelf, String volumeId, int volumePosition, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves/{shelf}/moveVolume").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "POST", $headers);
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


// Resource MylibraryResource.MylibraryBookshelvesResourceResource.MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource
class MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource {
  final BooksApi _$service;
  
  MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method MylibraryResource.MylibraryBookshelvesResourceResource.MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource.List
  /**
   * Gets volume information for volumes on a bookshelf.
   * [shelf] The bookshelf ID or name retrieve volumes for.
   */
  Future<Volumes> list(String shelf, [MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection projection = UNSPECIFIED, String country = UNSPECIFIED, bool showPreorders = UNSPECIFIED, int maxResults = UNSPECIFIED, String q = UNSPECIFIED, String source = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/bookshelves/{shelf}/volumes").generate($pathParams, $queryParams);
    final $completer = new Completer<Volumes>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Volumes.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum MylibraryResource.MylibraryBookshelvesResourceResource.MylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResource.List.Projection
class MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection implements Hashable {
  /** Includes all volume data. */
  static final MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection FULL = const MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection._internal("full", 0);
  /** Includes a subset of fields in volumeInfo and accessInfo. */
  static final MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection LITE = const MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection._internal("lite", 1);

  /** All values of this enumeration */
  static final List<MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection> values = const <MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection>[
    FULL,
    LITE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection>{ 
    "full": FULL,
    "lite": LITE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const MylibraryResourceMylibraryBookshelvesResourceResourceMylibraryBookshelvesResourceMylibraryBookshelvesVolumesResourceResourceResourceResourceListProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}

// Resource MylibraryResource.MylibraryReadingpositionsResourceResource
class MylibraryReadingpositionsResourceResource {
  final BooksApi _$service;
  
  MylibraryReadingpositionsResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method MylibraryResource.MylibraryReadingpositionsResourceResource.SetPosition
  /**
   * Sets my reading position information for a volume.
   * [volumeId] ID of volume for which to update the reading position.
   * [timestamp] RFC 3339 UTC format timestamp associated with this reading position.
   * [position] Position string for the new volume reading position.
   */
  Future setPosition(String volumeId, String timestamp, String position, [String source = UNSPECIFIED, String contentVersion = UNSPECIFIED, MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction action = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/readingpositions/{volumeId}/setPosition").generate($pathParams, $queryParams);
    final $completer = new Completer();
    final $http = new HttpRequest($url, "POST", $headers);
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

  // Method MylibraryResource.MylibraryReadingpositionsResourceResource.Get
  /**
   * Retrieves my reading position information for a volume.
   * [volumeId] ID of volume for which to retrieve a reading position.
   */
  Future<ReadingPosition> get(String volumeId, [String source = UNSPECIFIED, String contentVersion = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/readingpositions/{volumeId}").generate($pathParams, $queryParams);
    final $completer = new Completer<ReadingPosition>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = ReadingPosition.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum MylibraryResource.MylibraryReadingpositionsResourceResource.SetPosition.Action
class MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction implements Hashable {
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
  static final List<MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction> values = const <MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction>[
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
  static MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const MylibraryResourceMylibraryReadingpositionsResourceResourceSetPositionAction._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Action".hashCode();
}

// Resource MylibraryResource.MylibraryAnnotationsResourceResource
class MylibraryAnnotationsResourceResource {
  final BooksApi _$service;
  
  MylibraryAnnotationsResourceResource._internal(BooksApi $service) : _$service = $service;

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Insert
  /**
   * Inserts a new annotation.
   * [content] the Annotation
   */
  Future<Annotation> insert(Annotation content, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/annotations").generate($pathParams, $queryParams);
    final $completer = new Completer<Annotation>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Annotation.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Get
  /**
   * Gets an annotation by its ID.
   * [annotationId] The ID for the annotation to retrieve.
   */
  Future<Annotation> get(String annotationId, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/annotations/{annotationId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Annotation>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Annotation.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.List
  /**
   * Retrieves a list of annotations, possibly filtered.
   */
  Future<Annotations> list([bool showDeleted = UNSPECIFIED, String updatedMin = UNSPECIFIED, String updatedMax = UNSPECIFIED, String volumeId = UNSPECIFIED, int maxResults = UNSPECIFIED, String pageToken = UNSPECIFIED, List<String> pageIds = UNSPECIFIED, String contentVersion = UNSPECIFIED, String source = UNSPECIFIED, String layerId = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/annotations").generate($pathParams, $queryParams);
    final $completer = new Completer<Annotations>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Annotations.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Update
  /**
   * Updates an existing annotation.
   * [annotationId] The ID for the annotation to update.
   * [content] the Annotation
   */
  Future<Annotation> update(String annotationId, Annotation content, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/annotations/{annotationId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Annotation>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Annotation.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method MylibraryResource.MylibraryAnnotationsResourceResource.Delete
  /**
   * Deletes an annotation.
   * [annotationId] The ID for the annotation to delete.
   */
  Future delete(String annotationId, [String source = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "mylibrary/annotations/{annotationId}").generate($pathParams, $queryParams);
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

// Schema .Annotation
class Annotation extends IdentityHash {
  /** Resource type. */
  String kind;

  /** Timestamp for the last time this annotation was modified. */
  String updated;

  /** Timestamp for the created time of this annotation. */
  String created;

  /** Indicates that this annotation is deleted. */
  bool deleted;

  /** Anchor text before excerpt. */
  String beforeSelectedText;

  /** Selection ranges for the most recent content version. */
  AnnotationCurrentVersionRanges currentVersionRanges;

  /** Anchor text after excerpt. */
  String afterSelectedText;

  /** Selection ranges sent from the client. */
  AnnotationClientVersionRanges clientVersionRanges;

  /** The volume that this annotation belongs to. */
  String volumeId;

  /** Pages that this annotation spans. */
  List<String> pageIds;

  /** The layer this annotation is for. */
  String layerId;

  /** Excerpt from the volume. */
  String selectedText;

  /** The highlight style for this annotation. */
  String highlightStyle;

  /** User-created data for this annotation. */
  String data;

  /** Id of this annotation, in the form of a GUID. */
  String id;

  /** URL to this resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Annotation parse(Map<String, Object> json) {
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
  static Object serialize(Annotation value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String contentVersion;

  /** Range in GB text format for this annotation sent by client. */
  BooksAnnotationsRange gbTextRange;

  /** Range in CFI format for this annotation sent by client. */
  BooksAnnotationsRange cfiRange;

  /** Range in GB image format for this annotation sent by client. */
  BooksAnnotationsRange gbImageRange;

  /** Parses an instance from its JSON representation. */
  static AnnotationClientVersionRanges parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AnnotationClientVersionRanges();
    result.contentVersion = identity(json["contentVersion"]);
    result.gbTextRange = BooksAnnotationsRange.parse(json["gbTextRange"]);
    result.cfiRange = BooksAnnotationsRange.parse(json["cfiRange"]);
    result.gbImageRange = BooksAnnotationsRange.parse(json["gbImageRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AnnotationClientVersionRanges value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String contentVersion;

  /** Range in GB text format for this annotation for version above. */
  BooksAnnotationsRange gbTextRange;

  /** Range in CFI format for this annotation for version above. */
  BooksAnnotationsRange cfiRange;

  /** Range in GB image format for this annotation for version above. */
  BooksAnnotationsRange gbImageRange;

  /** Parses an instance from its JSON representation. */
  static AnnotationCurrentVersionRanges parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AnnotationCurrentVersionRanges();
    result.contentVersion = identity(json["contentVersion"]);
    result.gbTextRange = BooksAnnotationsRange.parse(json["gbTextRange"]);
    result.cfiRange = BooksAnnotationsRange.parse(json["cfiRange"]);
    result.gbImageRange = BooksAnnotationsRange.parse(json["gbImageRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AnnotationCurrentVersionRanges value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String annotationType;

  /** Resource Type */
  String kind;

  /** Timestamp for the last time this data was updated. (RFC 3339 UTC date-time format). */
  String updated;

  /** The volume id for this data. * */
  String volumeId;

  /** Base64 encoded data for this annotation data. */
  String encodedData;

  /** The Layer id for this data. * */
  String layerId;

  /** JSON encoded data for this annotation data. */
  BooksLayerGeoData data;

  /** Unique id for this annotation data. */
  String id;

  /** URL for this resource. * */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Annotationdata parse(Map<String, Object> json) {
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
  static Object serialize(Annotationdata value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /** A list of annotations. */
  List<Annotation> items;

  /** Resource type. */
  String kind;

  /**
 * Total number of annotations found. This may be greater than the number of notes returned in this
 * response if results have been paginated.
 */
  int totalItems;

  /** Parses an instance from its JSON representation. */
  static Annotations parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Annotations();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Annotation.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Annotations value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /** A list of Annotation Data. */
  List<Annotationdata> items;

  /** Resource type */
  String kind;

  /** The total number of volume annotations found. */
  int totalItems;

  /** Parses an instance from its JSON representation. */
  static Annotationsdata parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Annotationsdata();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Annotationdata.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Annotationsdata value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String startPosition;

  /** The ending position for the range. */
  String endPosition;

  /** The offset from the starting position. */
  String startOffset;

  /** The offset from the ending position. */
  String endOffset;

  /** Parses an instance from its JSON representation. */
  static BooksAnnotationsRange parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksAnnotationsRange();
    result.startPosition = identity(json["startPosition"]);
    result.endPosition = identity(json["endPosition"]);
    result.startOffset = identity(json["startOffset"]);
    result.endOffset = identity(json["endOffset"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksAnnotationsRange value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  static BooksLayerGeoData parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoData();
    result.geo = BooksLayerGeoDataGeo.parse(json["geo"]);
    result.common = BooksLayerGeoDataCommon.parse(json["common"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksLayerGeoData value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["geo"] = BooksLayerGeoDataGeo.serialize(value.geo);
    result["common"] = BooksLayerGeoDataCommon.serialize(value.common);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataCommon
class BooksLayerGeoDataCommon extends IdentityHash {
  /** The language of the information url and description. */
  String lang;

  /** The URL for the preview image information. */
  String previewImageUrl;

  /** The description for this location. */
  String snippet;

  /** The URL for information for this location. Ex: wikipedia link. */
  String snippetUrl;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataCommon parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataCommon();
    result.lang = identity(json["lang"]);
    result.previewImageUrl = identity(json["previewImageUrl"]);
    result.snippet = identity(json["snippet"]);
    result.snippetUrl = identity(json["snippetUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksLayerGeoDataCommon value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String countryCode;

  /**
 * The Zoom level to use for the map. Zoom levels between 0 (the lowest zoom level, in which the
 * entire world can be seen on one map) to 21+ (down to individual buildings). See:
 * https://developers.google.com/maps/documentation/staticmaps/#Zoomlevels
 */
  int zoom;

  /** The longitude of the location. */
  double longitude;

  /**
 * The type of map that should be used for this location. EX: HYBRID, ROADMAP, SATELLITE, TERRAIN
 */
  String mapType;

  /** The latitude of the location. */
  double latitude;

  /**
 * The boundary of the location as a set of loops containing pairs of latitude, longitude
 * coordinates.
 */
  List<List<BooksLayerGeoDataGeoBoundary>> boundary;

  /** The resolution of the location. Ex: POI_LEVEL */
  String resolution;

  /** The viewport for showing this location. This is a latitude, longitude rectangle. */
  BooksLayerGeoDataGeoViewport viewport;

  /** The cache policy active for this data. EX: UNRESTRICTED, RESTRICTED, NEVER */
  String cachePolicy;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeo parse(Map<String, Object> json) {
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
  static Object serialize(BooksLayerGeoDataGeo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  
  int latitude;

  
  int longitude;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoBoundary parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoBoundary();
    result.latitude = identity(json["latitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksLayerGeoDataGeoBoundary value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  static BooksLayerGeoDataGeoViewport parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoViewport();
    result.lo = BooksLayerGeoDataGeoViewportLo.parse(json["lo"]);
    result.hi = BooksLayerGeoDataGeoViewportHi.parse(json["hi"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksLayerGeoDataGeoViewport value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["lo"] = BooksLayerGeoDataGeoViewportLo.serialize(value.lo);
    result["hi"] = BooksLayerGeoDataGeoViewportHi.serialize(value.hi);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo.BooksLayerGeoDataGeoViewport.BooksLayerGeoDataGeoViewportHi
class BooksLayerGeoDataGeoViewportHi extends IdentityHash {
  
  double latitude;

  
  double longitude;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoViewportHi parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoViewportHi();
    result.latitude = identity(json["latitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksLayerGeoDataGeoViewportHi value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["latitude"] = identity(value.latitude);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema BooksLayerGeoData.BooksLayerGeoDataGeo.BooksLayerGeoDataGeoViewport.BooksLayerGeoDataGeoViewportLo
class BooksLayerGeoDataGeoViewportLo extends IdentityHash {
  
  double latitude;

  
  double longitude;

  /** Parses an instance from its JSON representation. */
  static BooksLayerGeoDataGeoViewportLo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BooksLayerGeoDataGeoViewportLo();
    result.latitude = identity(json["latitude"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BooksLayerGeoDataGeoViewportLo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["latitude"] = identity(value.latitude);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Bookshelf
class Bookshelf extends IdentityHash {
  /** Resource type for bookshelf metadata. */
  String kind;

  /** Description of this bookshelf. */
  String description;

  /** Created time for this bookshelf (formatted UTC timestamp with millisecond resolution). */
  String created;

  /** Number of volumes in this bookshelf. */
  int volumeCount;

  /** Title of this bookshelf. */
  String title;

  /** Last modified time of this bookshelf (formatted UTC timestamp with millisecond resolution). */
  String updated;

  /** Whether this bookshelf is PUBLIC or PRIVATE. */
  String access;

  /**
 * Last time a volume was added or removed from this bookshelf (formatted UTC timestamp with
 * millisecond resolution).
 */
  String volumesLastUpdated;

  /** Id of this bookshelf, only unique by user. */
  int id;

  /** URL to this resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Bookshelf parse(Map<String, Object> json) {
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
  static Object serialize(Bookshelf value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<Bookshelf> items;

  /** Resource type. */
  String kind;

  /** Parses an instance from its JSON representation. */
  static Bookshelves parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Bookshelves();
    result.items = map(Bookshelf.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Bookshelves value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Bookshelf.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ConcurrentAccessRestriction
class ConcurrentAccessRestriction extends IdentityHash {
  /** Client nonce for verification. Download access and client-validation only. */
  String nonce;

  /** Resource type. */
  String kind;

  /** Whether this volume has any concurrent access restrictions. */
  bool restricted;

  /** Identifies the volume for which this entry applies. */
  String volumeId;

  /** The maximum number of concurrent access licenses for this volume. */
  int maxConcurrentDevices;

  /** Whether access is granted for this (user, device, volume). */
  bool deviceAllowed;

  /** Client app identifier for verification. Download access and client-validation only. */
  String source;

  /** Time in seconds for license auto-expiration. */
  int timeWindowSeconds;

  /** Response signature. */
  String signature;

  /** Error/warning reason code. */
  String reasonCode;

  /** Error/warning message. */
  String message;

  /** Parses an instance from its JSON representation. */
  static ConcurrentAccessRestriction parse(Map<String, Object> json) {
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
  static Object serialize(ConcurrentAccessRestriction value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nonce;

  /** Resource type. */
  String kind;

  /** If deviceAllowed, whether access was just acquired with this request. */
  bool justAcquired;

  /** If restricted, the maximum number of content download licenses for this volume. */
  int maxDownloadDevices;

  /**
 * If restricted, the number of content download licenses already acquired (including the requesting
 * client, if licensed).
 */
  int downloadsAcquired;

  /** Response signature. */
  String signature;

  /** Identifies the volume for which this entry applies. */
  String volumeId;

  /** If restricted, whether access is granted for this (user, device, volume). */
  bool deviceAllowed;

  /** Client app identifier for verification. Download access and client-validation only. */
  String source;

  /** Whether this volume has any download access restrictions. */
  bool restricted;

  /**
 * Error/warning reason code. Additional codes may be added in the future. 0 OK 100
 * ACCESS_DENIED_PUBLISHER_LIMIT 101 ACCESS_DENIED_LIMIT 200 WARNING_USED_LAST_ACCESS
 */
  String reasonCode;

  /** Error/warning message. */
  String message;

  /** Parses an instance from its JSON representation. */
  static DownloadAccessRestriction parse(Map<String, Object> json) {
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
  static Object serialize(DownloadAccessRestriction value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<DownloadAccessRestriction> downloadAccessList;

  /** Resource type. */
  String kind;

  /** Parses an instance from its JSON representation. */
  static DownloadAccesses parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DownloadAccesses();
    result.downloadAccessList = map(DownloadAccessRestriction.parse)(json["downloadAccessList"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DownloadAccesses value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["downloadAccessList"] = map(DownloadAccessRestriction.serialize)(value.downloadAccessList);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Layersummaries
class Layersummaries extends IdentityHash {
  /** The total number of layer summaries found. */
  int totalItems;

  /** A list of layer summary items. */
  List<Layersummary> items;

  /** Resource type. */
  String kind;

  /** Parses an instance from its JSON representation. */
  static Layersummaries parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Layersummaries();
    result.totalItems = identity(json["totalItems"]);
    result.items = map(Layersummary.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Layersummaries value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** The number of annotations for this layer. */
  int annotationCount;

  /** The number of data items for this layer. */
  int dataCount;

  /** The link to get the annotations for this layer. */
  String annotationsLink;

  /**
 * Timestamp for the last time an item in this layer was updated. (RFC 3339 UTC date-time format).
 */
  String updated;

  /** The volume id this resource is for. */
  String volumeId;

  /** Unique id of this layer summary. */
  String id;

  /** The list of annotation types contained for this layer. */
  List<String> annotationTypes;

  /** The content version this resource is for. */
  String contentVersion;

  /** The layer id for this summary. */
  String layerId;

  /** Link to get data for this annotation. */
  String annotationsDataLink;

  /** URL to this resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Layersummary parse(Map<String, Object> json) {
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
  static Object serialize(Layersummary value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** Position in a volume for image-based content. */
  String gbImagePosition;

  /** Position in an EPUB as a CFI. */
  String epubCfiPosition;

  /**
 * Timestamp when this reading position was last updated (formatted UTC timestamp with millisecond
 * resolution).
 */
  String updated;

  /** Volume id associated with this reading position. */
  String volumeId;

  /** Position in a PDF file. */
  String pdfPosition;

  /** Position in a volume for text-based content. */
  String gbTextPosition;

  /** Parses an instance from its JSON representation. */
  static ReadingPosition parse(Map<String, Object> json) {
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
  static Object serialize(ReadingPosition value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** A concurrent access response. */
  ConcurrentAccessRestriction concurrentAccess;

  /** Parses an instance from its JSON representation. */
  static RequestAccess parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new RequestAccess();
    result.downloadAccess = DownloadAccessRestriction.parse(json["downloadAccess"]);
    result.kind = identity(json["kind"]);
    result.concurrentAccess = ConcurrentAccessRestriction.parse(json["concurrentAccess"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(RequestAccess value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String rating;

  /** Resource type for a review. */
  String kind;

  /** Author of this review. */
  ReviewAuthor author;

  /** Title for this review. */
  String title;

  /** Volume that this review is for. */
  String volumeId;

  /** Review text. */
  String content;

  /**
 * Information regarding the source of this review, when the review is not from a Google Books user.
 */
  ReviewSource source;

  /** Date of this review. */
  String date;

  /** Source type for this review. Possible values are EDITORIAL, WEB_USER or GOOGLE_USER. */
  String type;

  /** URL for the full review text, for reviews gathered from the web. */
  String fullTextUrl;

  /** Parses an instance from its JSON representation. */
  static Review parse(Map<String, Object> json) {
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
  static Object serialize(Review value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String displayName;

  /** Parses an instance from its JSON representation. */
  static ReviewAuthor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ReviewAuthor();
    result.displayName = identity(json["displayName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ReviewAuthor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["displayName"] = identity(value.displayName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Review.ReviewSource
class ReviewSource extends IdentityHash {
  /** Extra text about the source of the review. */
  String extraDescription;

  /** URL of the source of the review. */
  String url;

  /** Name of the source. */
  String description;

  /** Parses an instance from its JSON representation. */
  static ReviewSource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ReviewSource();
    result.extraDescription = identity(json["extraDescription"]);
    result.url = identity(json["url"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ReviewSource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

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
  String etag;

  /**
 * User specific information related to this volume. (e.g. page this user last read or whether they
 * purchased this book)
 */
  VolumeUserInfo userInfo;

  /** General volume information. */
  VolumeVolumeInfo volumeInfo;

  /** Unique identifier for a volume. (In LITE projection.) */
  String id;

  /** URL to this resource. (In LITE projection.) */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Volume parse(Map<String, Object> json) {
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
  static Object serialize(Volume value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String webReaderLink;

  /** Whether or not this book is public domain in the country listed above. */
  bool publicDomain;

  /** Whether this volume can be embedded in a viewport using the Embedded Viewer API. */
  bool embeddable;

  /** Information about a volume's download license access restrictions. */
  DownloadAccessRestriction downloadAccess;

  /**
 * The two-letter ISO_3166-1 country code for which this access information is valid. (In LITE
 * projection.)
 */
  String country;

  /**
 * For ordered but not yet processed orders, we give a URL that can be used to go to the appropriate
 * Google Wallet page.
 */
  String viewOrderUrl;

  /**
 * Whether text-to-speech is permitted for this volume. Values can be ALLOWED,
 * ALLOWED_FOR_ACCESSIBILITY, or NOT_ALLOWED.
 */
  String textToSpeechPermission;

  /** Information about pdf content. (In LITE projection.) */
  VolumeAccessInfoPdf pdf;

  /**
 * The read access of a volume. Possible values are PARTIAL, ALL_PAGES, NO_PAGES or UNKNOWN. This
 * value depends on the country listed above. A value of PARTIAL means that the publisher has
 * allowed some portion of the volume to be viewed publicly, without purchase. This can apply to
 * eBooks as well as non-eBooks. Public domain books will always have a value of ALL_PAGES.
 */
  String viewability;

  /** Information about epub content. (In LITE projection.) */
  VolumeAccessInfoEpub epub;

  /**
 * Combines the access and viewability of this volume into a single status field for this user.
 * Values can be FULL_PURCHASED, FULL_PUBLIC_DOMAIN, SAMPLE or NONE. (In LITE projection.)
 */
  String accessViewStatus;

  /** Parses an instance from its JSON representation. */
  static VolumeAccessInfo parse(Map<String, Object> json) {
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
  static Object serialize(VolumeAccessInfo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  bool isAvailable;

  /** URL to download epub. (In LITE projection.) */
  String downloadLink;

  /** URL to retrieve ACS token for epub download. (In LITE projection.) */
  String acsTokenLink;

  /** Parses an instance from its JSON representation. */
  static VolumeAccessInfoEpub parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeAccessInfoEpub();
    result.isAvailable = identity(json["isAvailable"]);
    result.downloadLink = identity(json["downloadLink"]);
    result.acsTokenLink = identity(json["acsTokenLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeAccessInfoEpub value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  bool isAvailable;

  /** URL to download pdf. (In LITE projection.) */
  String downloadLink;

  /** URL to retrieve ACS token for pdf download. (In LITE projection.) */
  String acsTokenLink;

  /** Parses an instance from its JSON representation. */
  static VolumeAccessInfoPdf parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeAccessInfoPdf();
    result.isAvailable = identity(json["isAvailable"]);
    result.downloadLink = identity(json["downloadLink"]);
    result.acsTokenLink = identity(json["acsTokenLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeAccessInfoPdf value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String country;

  /**
 * The actual selling price of the book. This is the same as the suggested retail or list price
 * unless there are offers or discounts on this volume. (In LITE projection.)
 */
  VolumeSaleInfoRetailPrice retailPrice;

  /** Whether or not this volume is an eBook (can be added to the My eBooks shelf). */
  bool isEbook;

  /**
 * Whether or not this book is available for sale or offered for free in the Google eBookstore for
 * the country listed above. Possible values are FOR_SALE, FREE, NOT_FOR_SALE, or FOR_PREORDER.
 */
  String saleability;

  /** URL to purchase this volume on the Google Books site. (In LITE projection) */
  String buyLink;

  /** The date on which this book is available for sale. */
  String onSaleDate;

  /** Suggested retail price. (In LITE projection.) */
  VolumeSaleInfoListPrice listPrice;

  /** Parses an instance from its JSON representation. */
  static VolumeSaleInfo parse(Map<String, Object> json) {
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
  static Object serialize(VolumeSaleInfo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  double amount;

  /** An ISO 4217, three-letter currency code. (In LITE projection.) */
  String currencyCode;

  /** Parses an instance from its JSON representation. */
  static VolumeSaleInfoListPrice parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeSaleInfoListPrice();
    result.amount = identity(json["amount"]);
    result.currencyCode = identity(json["currencyCode"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeSaleInfoListPrice value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["amount"] = identity(value.amount);
    result["currencyCode"] = identity(value.currencyCode);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeSaleInfo.VolumeSaleInfoRetailPrice
class VolumeSaleInfoRetailPrice extends IdentityHash {
  /** Amount in the currency listed below. (In LITE projection.) */
  double amount;

  /** An ISO 4217, three-letter currency code. (In LITE projection.) */
  String currencyCode;

  /** Parses an instance from its JSON representation. */
  static VolumeSaleInfoRetailPrice parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeSaleInfoRetailPrice();
    result.amount = identity(json["amount"]);
    result.currencyCode = identity(json["currencyCode"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeSaleInfoRetailPrice value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["amount"] = identity(value.amount);
    result["currencyCode"] = identity(value.currencyCode);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeSearchInfo
class VolumeSearchInfo extends IdentityHash {
  /** A text snippet containing the search query. */
  String textSnippet;

  /** Parses an instance from its JSON representation. */
  static VolumeSearchInfo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeSearchInfo();
    result.textSnippet = identity(json["textSnippet"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeSearchInfo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["textSnippet"] = identity(value.textSnippet);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Volume.VolumeUserInfo
class VolumeUserInfo extends IdentityHash {
  /** Whether or not this volume is currently in "my books." */
  bool isInMyBooks;

  /**
 * Timestamp when this volume was last modified by a user action, such as a reading position update,
 * volume purchase or writing a review. (RFC 3339 UTC date-time format).
 */
  String updated;

  /** This user's review of this volume, if one exists. */
  Review review;

  /**
 * Whether or not this volume was purchased by the authenticated user making the request. (In LITE
 * projection.)
 */
  bool isPurchased;

  /**
 * The user's current reading position in the volume, if one is available. (In LITE projection.)
 */
  ReadingPosition readingPosition;

  /**
 * Whether or not this volume was pre-ordered by the authenticated user making the request. (In LITE
 * projection.)
 */
  bool isPreordered;

  /** Parses an instance from its JSON representation. */
  static VolumeUserInfo parse(Map<String, Object> json) {
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
  static Object serialize(VolumeUserInfo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String publisher;

  /** Volume subtitle. (In LITE projection.) */
  String subtitle;

  /**
 * A synopsis of the volume. The text of the description is formatted in HTML and includes simple
 * formatting elements, such as b, i, and br tags. (In LITE projection.)
 */
  String description;

  /**
 * Best language for this volume (based on content). It is the two-letter ISO 639-1 code such as
 * 'fr', 'en', etc.
 */
  String language;

  /** Total number of pages. */
  int pageCount;

  /** A list of image links for all the sizes that are available. (In LITE projection.) */
  VolumeVolumeInfoImageLinks imageLinks;

  /** Date of publication. (In LITE projection.) */
  String publishedDate;

  /** URL to preview this volume on the Google Books site. */
  String previewLink;

  /** Type of publication of this volume. Possible values are BOOK or MAGAZINE. */
  String printType;

  /** The number of review ratings for this volume. */
  int ratingsCount;

  /**
 * The main category to which this volume belongs. It will be the category from the categories list
 * returned below that has the highest weight.
 */
  String mainCategory;

  /** Physical dimensions of this volume. */
  VolumeVolumeInfoDimensions dimensions;

  /** An identifier for the version of the volume content (text & images). (In LITE projection) */
  String contentVersion;

  /** Industry standard identifiers for this volume. */
  List<VolumeVolumeInfoIndustryIdentifiers> industryIdentifiers;

  /** The names of the authors and/or editors for this volume. (In LITE projection) */
  List<String> authors;

  /** Volume title. (In LITE projection.) */
  String title;

  /** Canonical URL for a volume. (In LITE projection.) */
  String canonicalVolumeLink;

  /** URL to view information about this volume on the Google Books site. (In LITE projection) */
  String infoLink;

  /** A list of subject categories, such as "Fiction", "Suspense", etc. */
  List<String> categories;

  /** The mean review rating for this volume. (min = 1.0, max = 5.0) */
  double averageRating;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfo parse(Map<String, Object> json) {
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
  static Object serialize(VolumeVolumeInfo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String width;

  /** Thickness of this volume (in cm). */
  String thickness;

  /** Height or length of this volume (in cm). */
  String height;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfoDimensions parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeVolumeInfoDimensions();
    result.width = identity(json["width"]);
    result.thickness = identity(json["thickness"]);
    result.height = identity(json["height"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeVolumeInfoDimensions value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String medium;

  /** Image link for small thumbnail size (width of ~80 pixels). (In LITE projection) */
  String smallThumbnail;

  /** Image link for large size (width of ~800 pixels). (In LITE projection) */
  String large;

  /** Image link for extra large size (width of ~1280 pixels). (In LITE projection) */
  String extraLarge;

  /** Image link for small size (width of ~300 pixels). (In LITE projection) */
  String small;

  /** Image link for thumbnail size (width of ~128 pixels). (In LITE projection) */
  String thumbnail;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfoImageLinks parse(Map<String, Object> json) {
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
  static Object serialize(VolumeVolumeInfoImageLinks value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String identifier;

  /** Identifier type. Possible values are ISBN_10, ISBN_13, ISSN and OTHER. */
  String type;

  /** Parses an instance from its JSON representation. */
  static VolumeVolumeInfoIndustryIdentifiers parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeVolumeInfoIndustryIdentifiers();
    result.identifier = identity(json["identifier"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeVolumeInfoIndustryIdentifiers value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["identifier"] = identity(value.identifier);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Volumeannotation
class Volumeannotation extends IdentityHash {
  /** The type of annotation this is. */
  String annotationType;

  /** Resource Type */
  String kind;

  /** Timestamp for the last time this anntoation was updated. (RFC 3339 UTC date-time format). */
  String updated;

  /** Indicates that this annotation is deleted. */
  bool deleted;

  /** The content ranges to identify the selected text. */
  VolumeannotationContentRanges contentRanges;

  /** Excerpt from the volume. */
  String selectedText;

  /** The Volume this annotation is for. */
  String volumeId;

  /** The annotation data id for this volume annotation. */
  String annotationDataId;

  /** Link to get data for this annotation. */
  String annotationDataLink;

  /** Pages the annotation spans. */
  List<String> pageIds;

  /** The Layer this annotation is for. */
  String layerId;

  /** Data for this annotation. */
  String data;

  /** Unique id of this volume annotation. */
  String id;

  /** URL to this resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Volumeannotation parse(Map<String, Object> json) {
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
  static Object serialize(Volumeannotation value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String contentVersion;

  /** Range in GB text format for this annotation for version above. */
  BooksAnnotationsRange gbTextRange;

  /** Range in CFI format for this annotation for version above. */
  BooksAnnotationsRange cfiRange;

  /** Range in GB image format for this annotation for version above. */
  BooksAnnotationsRange gbImageRange;

  /** Parses an instance from its JSON representation. */
  static VolumeannotationContentRanges parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VolumeannotationContentRanges();
    result.contentVersion = identity(json["contentVersion"]);
    result.gbTextRange = BooksAnnotationsRange.parse(json["gbTextRange"]);
    result.cfiRange = BooksAnnotationsRange.parse(json["cfiRange"]);
    result.gbImageRange = BooksAnnotationsRange.parse(json["gbImageRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VolumeannotationContentRanges value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /** A list of volume annotations. */
  List<Volumeannotation> items;

  /** Resource type */
  String kind;

  /** The total number of volume annotations found. */
  int totalItems;

  /** Parses an instance from its JSON representation. */
  static Volumeannotations parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Volumeannotations();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Volumeannotation.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Volumeannotations value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  int totalItems;

  /** A list of volumes. */
  List<Volume> items;

  /** Resource type. */
  String kind;

  /** Parses an instance from its JSON representation. */
  static Volumes parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Volumes();
    result.totalItems = identity(json["totalItems"]);
    result.items = map(Volume.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Volumes value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["items"] = map(Volume.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum BooksApi.Alt
class BooksApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final BooksApiAlt JSON = const BooksApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<BooksApiAlt> values = const <BooksApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BooksApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BooksApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const BooksApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

