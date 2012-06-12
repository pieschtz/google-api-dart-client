#library("moderator");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API ModeratorApi
/**
 * Moderator API
 */
class ModeratorApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  ModeratorApi get _$service() => this;
  VotesResource _votes;
  VotesResource get votes() => _votes;
  ResponsesResource _responses;
  ResponsesResource get responses() => _responses;
  TagsResource _tags;
  TagsResource get tags() => _tags;
  SeriesResource _series;
  SeriesResource get series() => _series;
  TopicsResource _topics;
  TopicsResource get topics() => _topics;
  GlobalResource _global;
  GlobalResource get global() => _global;
  ProfilesResource _profiles;
  ProfilesResource get profiles() => _profiles;
  FeaturedResource _featured;
  FeaturedResource get featured() => _featured;
  MyrecentResource _myrecent;
  MyrecentResource get myrecent() => _myrecent;
  MyResource _my;
  MyResource get my() => _my;
  SubmissionsResource _submissions;
  SubmissionsResource get submissions() => _submissions;
  
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
  ModeratorApiAlt alt;


  ModeratorApi([this.baseUrl = "https://www.googleapis.com/moderator/v1/", this.applicationName]) { 
    _votes = new VotesResource._internal(this);
    _responses = new ResponsesResource._internal(this);
    _tags = new TagsResource._internal(this);
    _series = new SeriesResource._internal(this);
    _topics = new TopicsResource._internal(this);
    _global = new GlobalResource._internal(this);
    _profiles = new ProfilesResource._internal(this);
    _featured = new FeaturedResource._internal(this);
    _myrecent = new MyrecentResource._internal(this);
    _my = new MyResource._internal(this);
    _submissions = new SubmissionsResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}moderator/v1/19700115 google-api-dart-client/${clientVersion}";
  }
}

// Resource .VotesResource
class VotesResource {
  final ModeratorApi _$service;
  
  VotesResource._internal(ModeratorApi $service) : _$service = $service;

  // Method VotesResource.Insert
  /**
   * Inserts a new vote by the authenticated user for the specified submission within the specified
   * series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Vote
   */
  Future<Vote> insert(int seriesId, int submissionId, Vote content, [String unauthToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (UNSPECIFIED != unauthToken) $queryParams["unauthToken"] = unauthToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Vote.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/votes/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Vote>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Vote.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method VotesResource.Patch
  /**
   * Updates the votes by the authenticated user for the specified submission within the specified
   * series. This method supports patch semantics.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Vote
   */
  Future<Vote> patch(int seriesId, int submissionId, Vote content, [String userId = UNSPECIFIED, String unauthToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (UNSPECIFIED != userId) $queryParams["userId"] = userId;
    if (UNSPECIFIED != unauthToken) $queryParams["unauthToken"] = unauthToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Vote.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/votes/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Vote>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Vote.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method VotesResource.List
  /**
   * Lists the votes by the authenticated user for the given series.
   * [seriesId] The decimal ID of the Series.
   */
  Future<VoteList> list(int seriesId, [int maxResults = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
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
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/votes/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<VoteList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = VoteList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method VotesResource.Update
  /**
   * Updates the votes by the authenticated user for the specified submission within the specified
   * series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Vote
   */
  Future<Vote> update(int seriesId, int submissionId, Vote content, [String userId = UNSPECIFIED, String unauthToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (UNSPECIFIED != userId) $queryParams["userId"] = userId;
    if (UNSPECIFIED != unauthToken) $queryParams["unauthToken"] = unauthToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Vote.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/votes/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Vote>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Vote.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method VotesResource.Get
  /**
   * Returns the votes by the authenticated user for the specified submission within the specified
   * series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  Future<Vote> get(int seriesId, int submissionId, [String userId = UNSPECIFIED, String unauthToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (UNSPECIFIED != userId) $queryParams["userId"] = userId;
    if (UNSPECIFIED != unauthToken) $queryParams["unauthToken"] = unauthToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/votes/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Vote>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Vote.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .ResponsesResource
class ResponsesResource {
  final ModeratorApi _$service;
  
  ResponsesResource._internal(ModeratorApi $service) : _$service = $service;

  // Method ResponsesResource.Insert
  /**
   * Inserts a response for the specified submission in the specified topic within the specified
   * series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   * [parentSubmissionId] The decimal ID of the parent Submission within the Series.
   * [content] the Submission
   */
  Future<Submission> insert(int seriesId, int topicId, int parentSubmissionId, Submission content, [String unauthToken = UNSPECIFIED, bool anonymous = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["topicId"] = topicId;
    $pathParams["parentSubmissionId"] = parentSubmissionId;
    if (UNSPECIFIED != unauthToken) $queryParams["unauthToken"] = unauthToken;
    if (UNSPECIFIED != anonymous) $queryParams["anonymous"] = anonymous;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Submission.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics/{topicId}/submissions/{parentSubmissionId}/responses").generate($pathParams, $queryParams);
    final $completer = new Completer<Submission>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Submission.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ResponsesResource.List
  /**
   * Lists or searches the responses for the specified submission within the specified series and
   * returns the search results.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  Future<SubmissionList> list(int seriesId, int submissionId, [int maxResults = UNSPECIFIED, String sort = UNSPECIFIED, String author = UNSPECIFIED, int startIndex = UNSPECIFIED, String q = UNSPECIFIED, bool hasAttachedVideo = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != author) $queryParams["author"] = author;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != hasAttachedVideo) $queryParams["hasAttachedVideo"] = hasAttachedVideo;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/responses").generate($pathParams, $queryParams);
    final $completer = new Completer<SubmissionList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SubmissionList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .TagsResource
class TagsResource {
  final ModeratorApi _$service;
  
  TagsResource._internal(ModeratorApi $service) : _$service = $service;

  // Method TagsResource.Insert
  /**
   * Inserts a new tag for the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Tag
   */
  Future<Tag> insert(int seriesId, int submissionId, Tag content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Tag.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/tags").generate($pathParams, $queryParams);
    final $completer = new Completer<Tag>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Tag.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TagsResource.List
  /**
   * Lists all tags for the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  Future<TagList> list(int seriesId, int submissionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/tags").generate($pathParams, $queryParams);
    final $completer = new Completer<TagList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TagList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TagsResource.Delete
  /**
   * Deletes the specified tag from the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [tagId]
   */
  Future delete(int seriesId, int submissionId, String tagId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    $pathParams["tagId"] = tagId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}/tags/{tagId}").generate($pathParams, $queryParams);
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

// Resource .SeriesResource
class SeriesResource {
  final ModeratorApi _$service;
  final SeriesSubmissionsResourceResource submissions;
  final SeriesResponsesResourceResource responses;
  
  SeriesResource._internal(ModeratorApi $service) : _$service = $service,
    submissions = new SeriesSubmissionsResourceResource._internal($service),
    responses = new SeriesResponsesResourceResource._internal($service);

  // Method SeriesResource.Insert
  /**
   * Inserts a new series.
   * [content] the Series
   */
  Future<Series> insert(Series content) {
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
    final $body = JSON.stringify(Series.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series").generate($pathParams, $queryParams);
    final $completer = new Completer<Series>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Series.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method SeriesResource.Patch
  /**
   * Updates the specified series. This method supports patch semantics.
   * [seriesId] The decimal ID of the Series.
   * [content] the Series
   */
  Future<Series> patch(int seriesId, Series content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Series.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Series>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Series.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method SeriesResource.List
  /**
   * Searches the series and returns the search results.
   */
  Future<SeriesList> list([int maxResults = UNSPECIFIED, String q = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series").generate($pathParams, $queryParams);
    final $completer = new Completer<SeriesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SeriesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method SeriesResource.Update
  /**
   * Updates the specified series.
   * [seriesId] The decimal ID of the Series.
   * [content] the Series
   */
  Future<Series> update(int seriesId, Series content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Series.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Series>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Series.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method SeriesResource.Get
  /**
   * Returns the specified series.
   * [seriesId] The decimal ID of the Series.
   */
  Future<Series> get(int seriesId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Series>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Series.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}


// Resource SeriesResource.SeriesSubmissionsResourceResource
class SeriesSubmissionsResourceResource {
  final ModeratorApi _$service;
  
  SeriesSubmissionsResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method SeriesResource.SeriesSubmissionsResourceResource.List
  /**
   * Searches the submissions for the specified series and returns the search results.
   * [seriesId] The decimal ID of the Series.
   */
  Future<SubmissionList> list(int seriesId, [String lang = UNSPECIFIED, int maxResults = UNSPECIFIED, bool includeVotes = UNSPECIFIED, int startIndex = UNSPECIFIED, String author = UNSPECIFIED, String sort = UNSPECIFIED, String q = UNSPECIFIED, bool hasAttachedVideo = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (UNSPECIFIED != lang) $queryParams["lang"] = lang;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != includeVotes) $queryParams["includeVotes"] = includeVotes;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (UNSPECIFIED != author) $queryParams["author"] = author;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != hasAttachedVideo) $queryParams["hasAttachedVideo"] = hasAttachedVideo;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions").generate($pathParams, $queryParams);
    final $completer = new Completer<SubmissionList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SubmissionList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource SeriesResource.SeriesResponsesResourceResource
class SeriesResponsesResourceResource {
  final ModeratorApi _$service;
  
  SeriesResponsesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method SeriesResource.SeriesResponsesResourceResource.List
  /**
   * Searches the responses for the specified series and returns the search results.
   * [seriesId] The decimal ID of the Series.
   */
  Future<SeriesList> list(int seriesId, [int maxResults = UNSPECIFIED, String sort = UNSPECIFIED, String author = UNSPECIFIED, int startIndex = UNSPECIFIED, String q = UNSPECIFIED, bool hasAttachedVideo = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != author) $queryParams["author"] = author;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != hasAttachedVideo) $queryParams["hasAttachedVideo"] = hasAttachedVideo;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/responses").generate($pathParams, $queryParams);
    final $completer = new Completer<SeriesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SeriesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .TopicsResource
class TopicsResource {
  final ModeratorApi _$service;
  final TopicsSubmissionsResourceResource submissions;
  
  TopicsResource._internal(ModeratorApi $service) : _$service = $service,
    submissions = new TopicsSubmissionsResourceResource._internal($service);

  // Method TopicsResource.Insert
  /**
   * Inserts a new topic into the specified series.
   * [seriesId] The decimal ID of the Series.
   * [content] the Topic
   */
  Future<Topic> insert(int seriesId, Topic content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Topic.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics").generate($pathParams, $queryParams);
    final $completer = new Completer<Topic>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Topic.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TopicsResource.List
  /**
   * Searches the topics within the specified series and returns the search results.
   * [seriesId] The decimal ID of the Series.
   */
  Future<TopicList> list(int seriesId, [int maxResults = UNSPECIFIED, String q = UNSPECIFIED, int startIndex = UNSPECIFIED, String mode = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (UNSPECIFIED != mode) $queryParams["mode"] = mode;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics").generate($pathParams, $queryParams);
    final $completer = new Completer<TopicList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TopicList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TopicsResource.Update
  /**
   * Updates the specified topic within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   * [content] the Topic
   */
  Future<Topic> update(int seriesId, int topicId, Topic content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["topicId"] = topicId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Topic.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics/{topicId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Topic>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Topic.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TopicsResource.Get
  /**
   * Returns the specified topic from the specified series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   */
  Future<Topic> get(int seriesId, int topicId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["topicId"] = topicId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics/{topicId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Topic>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Topic.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}


// Resource TopicsResource.TopicsSubmissionsResourceResource
class TopicsSubmissionsResourceResource {
  final ModeratorApi _$service;
  
  TopicsSubmissionsResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method TopicsResource.TopicsSubmissionsResourceResource.List
  /**
   * Searches the submissions for the specified topic within the specified series and returns the
   * search results.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   */
  Future<SubmissionList> list(int seriesId, int topicId, [int maxResults = UNSPECIFIED, bool includeVotes = UNSPECIFIED, int startIndex = UNSPECIFIED, String author = UNSPECIFIED, String sort = UNSPECIFIED, String q = UNSPECIFIED, bool hasAttachedVideo = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["topicId"] = topicId;
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != includeVotes) $queryParams["includeVotes"] = includeVotes;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (UNSPECIFIED != author) $queryParams["author"] = author;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != hasAttachedVideo) $queryParams["hasAttachedVideo"] = hasAttachedVideo;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics/{topicId}/submissions").generate($pathParams, $queryParams);
    final $completer = new Completer<SubmissionList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SubmissionList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .GlobalResource
class GlobalResource {
  final ModeratorApi _$service;
  final GlobalSeriesResourceResource series;
  
  GlobalResource._internal(ModeratorApi $service) : _$service = $service,
    series = new GlobalSeriesResourceResource._internal($service);
}


// Resource GlobalResource.GlobalSeriesResourceResource
class GlobalSeriesResourceResource {
  final ModeratorApi _$service;
  
  GlobalSeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method GlobalResource.GlobalSeriesResourceResource.List
  /**
   * Searches the public series and returns the search results.
   */
  Future<SeriesList> list([int maxResults = UNSPECIFIED, String q = UNSPECIFIED, int startIndex = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != startIndex) $queryParams["start-index"] = startIndex;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "search").generate($pathParams, $queryParams);
    final $completer = new Completer<SeriesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SeriesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .ProfilesResource
class ProfilesResource {
  final ModeratorApi _$service;
  
  ProfilesResource._internal(ModeratorApi $service) : _$service = $service;

  // Method ProfilesResource.Patch
  /**
   * Updates the profile information for the authenticated user. This method supports patch semantics.
   * [content] the Profile
   */
  Future<Profile> patch(Profile content) {
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
    final $body = JSON.stringify(Profile.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "profiles/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Profile>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Profile.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ProfilesResource.Update
  /**
   * Updates the profile information for the authenticated user.
   * [content] the Profile
   */
  Future<Profile> update(Profile content) {
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
    final $body = JSON.stringify(Profile.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "profiles/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Profile>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Profile.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ProfilesResource.Get
  /**
   * Returns the profile information for the authenticated user.
   */
  Future<Profile> get() {
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
    final $url = new UrlPattern(_$service.baseUrl + "profiles/@me").generate($pathParams, $queryParams);
    final $completer = new Completer<Profile>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Profile.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .FeaturedResource
class FeaturedResource {
  final ModeratorApi _$service;
  final FeaturedSeriesResourceResource series;
  
  FeaturedResource._internal(ModeratorApi $service) : _$service = $service,
    series = new FeaturedSeriesResourceResource._internal($service);
}


// Resource FeaturedResource.FeaturedSeriesResourceResource
class FeaturedSeriesResourceResource {
  final ModeratorApi _$service;
  
  FeaturedSeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method FeaturedResource.FeaturedSeriesResourceResource.List
  /**
   * Lists the featured series.
   */
  Future<SeriesList> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "series/featured").generate($pathParams, $queryParams);
    final $completer = new Completer<SeriesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SeriesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .MyrecentResource
class MyrecentResource {
  final ModeratorApi _$service;
  final MyrecentSeriesResourceResource series;
  
  MyrecentResource._internal(ModeratorApi $service) : _$service = $service,
    series = new MyrecentSeriesResourceResource._internal($service);
}


// Resource MyrecentResource.MyrecentSeriesResourceResource
class MyrecentSeriesResourceResource {
  final ModeratorApi _$service;
  
  MyrecentSeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method MyrecentResource.MyrecentSeriesResourceResource.List
  /**
   * Lists the series the authenticated user has visited.
   */
  Future<SeriesList> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "series/@me/recent").generate($pathParams, $queryParams);
    final $completer = new Completer<SeriesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SeriesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .MyResource
class MyResource {
  final ModeratorApi _$service;
  final MySeriesResourceResource series;
  
  MyResource._internal(ModeratorApi $service) : _$service = $service,
    series = new MySeriesResourceResource._internal($service);
}


// Resource MyResource.MySeriesResourceResource
class MySeriesResourceResource {
  final ModeratorApi _$service;
  
  MySeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method MyResource.MySeriesResourceResource.List
  /**
   * Lists all series created by the authenticated user.
   */
  Future<SeriesList> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "series/@me/mine").generate($pathParams, $queryParams);
    final $completer = new Completer<SeriesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SeriesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .SubmissionsResource
class SubmissionsResource {
  final ModeratorApi _$service;
  
  SubmissionsResource._internal(ModeratorApi $service) : _$service = $service;

  // Method SubmissionsResource.Insert
  /**
   * Inserts a new submission in the specified topic within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   * [content] the Submission
   */
  Future<Submission> insert(int seriesId, int topicId, Submission content, [String unauthToken = UNSPECIFIED, bool anonymous = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["topicId"] = topicId;
    if (UNSPECIFIED != unauthToken) $queryParams["unauthToken"] = unauthToken;
    if (UNSPECIFIED != anonymous) $queryParams["anonymous"] = anonymous;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Submission.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/topics/{topicId}/submissions").generate($pathParams, $queryParams);
    final $completer = new Completer<Submission>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Submission.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method SubmissionsResource.Get
  /**
   * Returns the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  Future<Submission> get(int seriesId, int submissionId, [String lang = UNSPECIFIED, bool includeVotes = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["seriesId"] = seriesId;
    $pathParams["submissionId"] = submissionId;
    if (UNSPECIFIED != lang) $queryParams["lang"] = lang;
    if (UNSPECIFIED != includeVotes) $queryParams["includeVotes"] = includeVotes;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "series/{seriesId}/submissions/{submissionId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Submission>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Submission.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .ModeratorTopicsResourcePartial
class ModeratorTopicsResourcePartial extends IdentityHash {
  
  ModeratorTopicsResourcePartialId id;

  /** Parses an instance from its JSON representation. */
  static ModeratorTopicsResourcePartial parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ModeratorTopicsResourcePartial();
    result.id = ModeratorTopicsResourcePartialId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ModeratorTopicsResourcePartial value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = ModeratorTopicsResourcePartialId.serialize(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ModeratorTopicsResourcePartial.ModeratorTopicsResourcePartialId
class ModeratorTopicsResourcePartialId extends IdentityHash {
  
  String seriesId;

  
  String topicId;

  /** Parses an instance from its JSON representation. */
  static ModeratorTopicsResourcePartialId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ModeratorTopicsResourcePartialId();
    result.seriesId = identity(json["seriesId"]);
    result.topicId = identity(json["topicId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ModeratorTopicsResourcePartialId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    result["topicId"] = identity(value.topicId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ModeratorVotesResourcePartial
class ModeratorVotesResourcePartial extends IdentityHash {
  
  String vote;

  
  String flag;

  /** Parses an instance from its JSON representation. */
  static ModeratorVotesResourcePartial parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ModeratorVotesResourcePartial();
    result.vote = identity(json["vote"]);
    result.flag = identity(json["flag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ModeratorVotesResourcePartial value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["vote"] = identity(value.vote);
    result["flag"] = identity(value.flag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Profile
class Profile extends IdentityHash {
  
  String kind;

  
  ProfileAttribution attribution;

  
  ProfileId id;

  /** Parses an instance from its JSON representation. */
  static Profile parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Profile();
    result.kind = identity(json["kind"]);
    result.attribution = ProfileAttribution.parse(json["attribution"]);
    result.id = ProfileId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Profile value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["attribution"] = ProfileAttribution.serialize(value.attribution);
    result["id"] = ProfileId.serialize(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileAttribution
class ProfileAttribution extends IdentityHash {
  
  ProfileAttributionGeo geo;

  
  String displayName;

  
  String location;

  
  String avatarUrl;

  /** Parses an instance from its JSON representation. */
  static ProfileAttribution parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProfileAttribution();
    result.geo = ProfileAttributionGeo.parse(json["geo"]);
    result.displayName = identity(json["displayName"]);
    result.location = identity(json["location"]);
    result.avatarUrl = identity(json["avatarUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProfileAttribution value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["geo"] = ProfileAttributionGeo.serialize(value.geo);
    result["displayName"] = identity(value.displayName);
    result["location"] = identity(value.location);
    result["avatarUrl"] = identity(value.avatarUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileAttribution.ProfileAttributionGeo
class ProfileAttributionGeo extends IdentityHash {
  
  double latitude;

  
  String location;

  
  double longitude;

  /** Parses an instance from its JSON representation. */
  static ProfileAttributionGeo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProfileAttributionGeo();
    result.latitude = identity(json["latitude"]);
    result.location = identity(json["location"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProfileAttributionGeo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["latitude"] = identity(value.latitude);
    result["location"] = identity(value.location);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileId
class ProfileId extends IdentityHash {
  
  String user;

  /** Parses an instance from its JSON representation. */
  static ProfileId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProfileId();
    result.user = identity(json["user"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProfileId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["user"] = identity(value.user);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Series
class Series extends IdentityHash {
  
  String kind;

  
  String description;

  
  SeriesRules rules;

  
  bool unauthVotingAllowed;

  
  bool videoSubmissionAllowed;

  
  String name;

  
  int numTopics;

  
  bool anonymousSubmissionAllowed;

  
  bool unauthSubmissionAllowed;

  
  SeriesId id;

  
  SeriesCounters counters;

  /** Parses an instance from its JSON representation. */
  static Series parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Series();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.rules = SeriesRules.parse(json["rules"]);
    result.unauthVotingAllowed = identity(json["unauthVotingAllowed"]);
    result.videoSubmissionAllowed = identity(json["videoSubmissionAllowed"]);
    result.name = identity(json["name"]);
    result.numTopics = identity(json["numTopics"]);
    result.anonymousSubmissionAllowed = identity(json["anonymousSubmissionAllowed"]);
    result.unauthSubmissionAllowed = identity(json["unauthSubmissionAllowed"]);
    result.id = SeriesId.parse(json["id"]);
    result.counters = SeriesCounters.parse(json["counters"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Series value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["rules"] = SeriesRules.serialize(value.rules);
    result["unauthVotingAllowed"] = identity(value.unauthVotingAllowed);
    result["videoSubmissionAllowed"] = identity(value.videoSubmissionAllowed);
    result["name"] = identity(value.name);
    result["numTopics"] = identity(value.numTopics);
    result["anonymousSubmissionAllowed"] = identity(value.anonymousSubmissionAllowed);
    result["unauthSubmissionAllowed"] = identity(value.unauthSubmissionAllowed);
    result["id"] = SeriesId.serialize(value.id);
    result["counters"] = SeriesCounters.serialize(value.counters);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesCounters
class SeriesCounters extends IdentityHash {
  
  int users;

  
  int noneVotes;

  
  int videoSubmissions;

  
  int minusVotes;

  
  int anonymousSubmissions;

  
  int submissions;

  
  int plusVotes;

  /** Parses an instance from its JSON representation. */
  static SeriesCounters parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SeriesCounters();
    result.users = identity(json["users"]);
    result.noneVotes = identity(json["noneVotes"]);
    result.videoSubmissions = identity(json["videoSubmissions"]);
    result.minusVotes = identity(json["minusVotes"]);
    result.anonymousSubmissions = identity(json["anonymousSubmissions"]);
    result.submissions = identity(json["submissions"]);
    result.plusVotes = identity(json["plusVotes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SeriesCounters value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["users"] = identity(value.users);
    result["noneVotes"] = identity(value.noneVotes);
    result["videoSubmissions"] = identity(value.videoSubmissions);
    result["minusVotes"] = identity(value.minusVotes);
    result["anonymousSubmissions"] = identity(value.anonymousSubmissions);
    result["submissions"] = identity(value.submissions);
    result["plusVotes"] = identity(value.plusVotes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesId
class SeriesId extends IdentityHash {
  
  String seriesId;

  /** Parses an instance from its JSON representation. */
  static SeriesId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SeriesId();
    result.seriesId = identity(json["seriesId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SeriesId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SeriesList
class SeriesList extends IdentityHash {
  
  List<Series> items;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static SeriesList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SeriesList();
    result.items = map(Series.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SeriesList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Series.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesRules
class SeriesRules extends IdentityHash {
  
  SeriesRulesVotes votes;

  
  SeriesRulesSubmissions submissions;

  /** Parses an instance from its JSON representation. */
  static SeriesRules parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SeriesRules();
    result.votes = SeriesRulesVotes.parse(json["votes"]);
    result.submissions = SeriesRulesSubmissions.parse(json["submissions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SeriesRules value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["votes"] = SeriesRulesVotes.serialize(value.votes);
    result["submissions"] = SeriesRulesSubmissions.serialize(value.submissions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesRules.SeriesRulesSubmissions
class SeriesRulesSubmissions extends IdentityHash {
  
  String close;

  
  String open;

  /** Parses an instance from its JSON representation. */
  static SeriesRulesSubmissions parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SeriesRulesSubmissions();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SeriesRulesSubmissions value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesRules.SeriesRulesVotes
class SeriesRulesVotes extends IdentityHash {
  
  String close;

  
  String open;

  /** Parses an instance from its JSON representation. */
  static SeriesRulesVotes parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SeriesRulesVotes();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SeriesRulesVotes value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Submission
class Submission extends IdentityHash {
  
  String kind;

  
  SubmissionAttribution attribution;

  
  String created;

  
  String text;

  
  List<ModeratorTopicsResourcePartial> topics;

  
  String author;

  
  List<SubmissionTranslations> translations;

  
  SubmissionParentSubmissionId parentSubmissionId;

  
  ModeratorVotesResourcePartial vote;

  
  String attachmentUrl;

  
  SubmissionGeo geo;

  
  SubmissionId id;

  
  SubmissionCounters counters;

  /** Parses an instance from its JSON representation. */
  static Submission parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Submission();
    result.kind = identity(json["kind"]);
    result.attribution = SubmissionAttribution.parse(json["attribution"]);
    result.created = identity(json["created"]);
    result.text = identity(json["text"]);
    result.topics = map(ModeratorTopicsResourcePartial.parse)(json["topics"]);
    result.author = identity(json["author"]);
    result.translations = map(SubmissionTranslations.parse)(json["translations"]);
    result.parentSubmissionId = SubmissionParentSubmissionId.parse(json["parentSubmissionId"]);
    result.vote = ModeratorVotesResourcePartial.parse(json["vote"]);
    result.attachmentUrl = identity(json["attachmentUrl"]);
    result.geo = SubmissionGeo.parse(json["geo"]);
    result.id = SubmissionId.parse(json["id"]);
    result.counters = SubmissionCounters.parse(json["counters"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Submission value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["attribution"] = SubmissionAttribution.serialize(value.attribution);
    result["created"] = identity(value.created);
    result["text"] = identity(value.text);
    result["topics"] = map(ModeratorTopicsResourcePartial.serialize)(value.topics);
    result["author"] = identity(value.author);
    result["translations"] = map(SubmissionTranslations.serialize)(value.translations);
    result["parentSubmissionId"] = SubmissionParentSubmissionId.serialize(value.parentSubmissionId);
    result["vote"] = ModeratorVotesResourcePartial.serialize(value.vote);
    result["attachmentUrl"] = identity(value.attachmentUrl);
    result["geo"] = SubmissionGeo.serialize(value.geo);
    result["id"] = SubmissionId.serialize(value.id);
    result["counters"] = SubmissionCounters.serialize(value.counters);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionAttribution
class SubmissionAttribution extends IdentityHash {
  
  String displayName;

  
  String location;

  
  String avatarUrl;

  /** Parses an instance from its JSON representation. */
  static SubmissionAttribution parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionAttribution();
    result.displayName = identity(json["displayName"]);
    result.location = identity(json["location"]);
    result.avatarUrl = identity(json["avatarUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionAttribution value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["displayName"] = identity(value.displayName);
    result["location"] = identity(value.location);
    result["avatarUrl"] = identity(value.avatarUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionCounters
class SubmissionCounters extends IdentityHash {
  
  int noneVotes;

  
  int minusVotes;

  
  int plusVotes;

  /** Parses an instance from its JSON representation. */
  static SubmissionCounters parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionCounters();
    result.noneVotes = identity(json["noneVotes"]);
    result.minusVotes = identity(json["minusVotes"]);
    result.plusVotes = identity(json["plusVotes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionCounters value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["noneVotes"] = identity(value.noneVotes);
    result["minusVotes"] = identity(value.minusVotes);
    result["plusVotes"] = identity(value.plusVotes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionGeo
class SubmissionGeo extends IdentityHash {
  
  double latitude;

  
  String location;

  
  double longitude;

  /** Parses an instance from its JSON representation. */
  static SubmissionGeo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionGeo();
    result.latitude = identity(json["latitude"]);
    result.location = identity(json["location"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionGeo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["latitude"] = identity(value.latitude);
    result["location"] = identity(value.location);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionId
class SubmissionId extends IdentityHash {
  
  String seriesId;

  
  String submissionId;

  /** Parses an instance from its JSON representation. */
  static SubmissionId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionId();
    result.seriesId = identity(json["seriesId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SubmissionList
class SubmissionList extends IdentityHash {
  
  List<Submission> items;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static SubmissionList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionList();
    result.items = map(Submission.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Submission.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionParentSubmissionId
class SubmissionParentSubmissionId extends IdentityHash {
  
  String seriesId;

  
  String submissionId;

  /** Parses an instance from its JSON representation. */
  static SubmissionParentSubmissionId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionParentSubmissionId();
    result.seriesId = identity(json["seriesId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionParentSubmissionId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionTranslations
class SubmissionTranslations extends IdentityHash {
  
  String lang;

  
  String text;

  /** Parses an instance from its JSON representation. */
  static SubmissionTranslations parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubmissionTranslations();
    result.lang = identity(json["lang"]);
    result.text = identity(json["text"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubmissionTranslations value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["lang"] = identity(value.lang);
    result["text"] = identity(value.text);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Tag
class Tag extends IdentityHash {
  
  String text;

  
  String kind;

  
  TagId id;

  /** Parses an instance from its JSON representation. */
  static Tag parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Tag();
    result.text = identity(json["text"]);
    result.kind = identity(json["kind"]);
    result.id = TagId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Tag value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["text"] = identity(value.text);
    result["kind"] = identity(value.kind);
    result["id"] = TagId.serialize(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Tag.TagId
class TagId extends IdentityHash {
  
  String seriesId;

  
  String tagId;

  
  String submissionId;

  /** Parses an instance from its JSON representation. */
  static TagId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TagId();
    result.seriesId = identity(json["seriesId"]);
    result.tagId = identity(json["tagId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TagId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    result["tagId"] = identity(value.tagId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TagList
class TagList extends IdentityHash {
  
  List<Tag> items;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static TagList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TagList();
    result.items = map(Tag.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TagList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Tag.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Topic
class Topic extends IdentityHash {
  
  String kind;

  
  String description;

  
  TopicRules rules;

  
  Submission featuredSubmission;

  
  String presenter;

  
  TopicCounters counters;

  
  TopicId id;

  
  String name;

  /** Parses an instance from its JSON representation. */
  static Topic parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Topic();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.rules = TopicRules.parse(json["rules"]);
    result.featuredSubmission = Submission.parse(json["featuredSubmission"]);
    result.presenter = identity(json["presenter"]);
    result.counters = TopicCounters.parse(json["counters"]);
    result.id = TopicId.parse(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Topic value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["rules"] = TopicRules.serialize(value.rules);
    result["featuredSubmission"] = Submission.serialize(value.featuredSubmission);
    result["presenter"] = identity(value.presenter);
    result["counters"] = TopicCounters.serialize(value.counters);
    result["id"] = TopicId.serialize(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicCounters
class TopicCounters extends IdentityHash {
  
  int users;

  
  int noneVotes;

  
  int videoSubmissions;

  
  int minusVotes;

  
  int submissions;

  
  int plusVotes;

  /** Parses an instance from its JSON representation. */
  static TopicCounters parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TopicCounters();
    result.users = identity(json["users"]);
    result.noneVotes = identity(json["noneVotes"]);
    result.videoSubmissions = identity(json["videoSubmissions"]);
    result.minusVotes = identity(json["minusVotes"]);
    result.submissions = identity(json["submissions"]);
    result.plusVotes = identity(json["plusVotes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TopicCounters value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["users"] = identity(value.users);
    result["noneVotes"] = identity(value.noneVotes);
    result["videoSubmissions"] = identity(value.videoSubmissions);
    result["minusVotes"] = identity(value.minusVotes);
    result["submissions"] = identity(value.submissions);
    result["plusVotes"] = identity(value.plusVotes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicId
class TopicId extends IdentityHash {
  
  String seriesId;

  
  String topicId;

  /** Parses an instance from its JSON representation. */
  static TopicId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TopicId();
    result.seriesId = identity(json["seriesId"]);
    result.topicId = identity(json["topicId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TopicId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    result["topicId"] = identity(value.topicId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TopicList
class TopicList extends IdentityHash {
  
  List<Topic> items;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static TopicList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TopicList();
    result.items = map(Topic.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TopicList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Topic.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicRules
class TopicRules extends IdentityHash {
  
  TopicRulesVotes votes;

  
  TopicRulesSubmissions submissions;

  /** Parses an instance from its JSON representation. */
  static TopicRules parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TopicRules();
    result.votes = TopicRulesVotes.parse(json["votes"]);
    result.submissions = TopicRulesSubmissions.parse(json["submissions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TopicRules value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["votes"] = TopicRulesVotes.serialize(value.votes);
    result["submissions"] = TopicRulesSubmissions.serialize(value.submissions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicRules.TopicRulesSubmissions
class TopicRulesSubmissions extends IdentityHash {
  
  String close;

  
  String open;

  /** Parses an instance from its JSON representation. */
  static TopicRulesSubmissions parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TopicRulesSubmissions();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TopicRulesSubmissions value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicRules.TopicRulesVotes
class TopicRulesVotes extends IdentityHash {
  
  String close;

  
  String open;

  /** Parses an instance from its JSON representation. */
  static TopicRulesVotes parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TopicRulesVotes();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TopicRulesVotes value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Vote
class Vote extends IdentityHash {
  
  String vote;

  
  String flag;

  
  VoteId id;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static Vote parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Vote();
    result.vote = identity(json["vote"]);
    result.flag = identity(json["flag"]);
    result.id = VoteId.parse(json["id"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Vote value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["vote"] = identity(value.vote);
    result["flag"] = identity(value.flag);
    result["id"] = VoteId.serialize(value.id);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Vote.VoteId
class VoteId extends IdentityHash {
  
  String seriesId;

  
  String submissionId;

  /** Parses an instance from its JSON representation. */
  static VoteId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VoteId();
    result.seriesId = identity(json["seriesId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VoteId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["seriesId"] = identity(value.seriesId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VoteList
class VoteList extends IdentityHash {
  
  List<Vote> items;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static VoteList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new VoteList();
    result.items = map(Vote.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(VoteList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Vote.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum ModeratorApi.Alt
class ModeratorApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final ModeratorApiAlt JSON = const ModeratorApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<ModeratorApiAlt> values = const <ModeratorApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ModeratorApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ModeratorApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const ModeratorApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

