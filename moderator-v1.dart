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

#library('moderator-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API ModeratorApi
/**
 * Moderator API
 */
class ModeratorApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
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
  ModeratorApiAlt alt;


  ModeratorApi([this.baseUrl = "https://www.googleapis.com/moderator/v1/", this.applicationName, this.authenticator]) { 
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
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}moderator/v1/19700115 google-api-dart-client/${clientVersion}";
  }
}

// Resource .VotesResource
class VotesResource extends core.Object {
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
  core.Future<Vote> insert(core.int seriesId, core.int submissionId, Vote content, [core.String unauthToken = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/votes/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Vote.parse(JSON.parse($text)));
  }

  // Method VotesResource.Patch
  /**
   * Updates the votes by the authenticated user for the specified submission within the specified
   * series. This method supports patch semantics.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Vote
   */
  core.Future<Vote> patch(core.int seriesId, core.int submissionId, Vote content, [core.String userId = UNSPECIFIED, core.String unauthToken = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/votes/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Vote.parse(JSON.parse($text)));
  }

  // Method VotesResource.List
  /**
   * Lists the votes by the authenticated user for the given series.
   * [seriesId] The decimal ID of the Series.
   */
  core.Future<VoteList> list(core.int seriesId, [core.int maxResults = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/votes/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => VoteList.parse(JSON.parse($text)));
  }

  // Method VotesResource.Update
  /**
   * Updates the votes by the authenticated user for the specified submission within the specified
   * series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Vote
   */
  core.Future<Vote> update(core.int seriesId, core.int submissionId, Vote content, [core.String userId = UNSPECIFIED, core.String unauthToken = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/votes/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Vote.parse(JSON.parse($text)));
  }

  // Method VotesResource.Get
  /**
   * Returns the votes by the authenticated user for the specified submission within the specified
   * series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  core.Future<Vote> get(core.int seriesId, core.int submissionId, [core.String userId = UNSPECIFIED, core.String unauthToken = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/votes/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Vote.parse(JSON.parse($text)));
  }
}

// Resource .ResponsesResource
class ResponsesResource extends core.Object {
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
  core.Future<Submission> insert(core.int seriesId, core.int topicId, core.int parentSubmissionId, Submission content, [core.String unauthToken = UNSPECIFIED, core.bool anonymous = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/topics/{topicId}/submissions/{parentSubmissionId}/responses";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Submission.parse(JSON.parse($text)));
  }

  // Method ResponsesResource.List
  /**
   * Lists or searches the responses for the specified submission within the specified series and
   * returns the search results.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  core.Future<SubmissionList> list(core.int seriesId, core.int submissionId, [core.int maxResults = UNSPECIFIED, core.String sort = UNSPECIFIED, core.String author = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String q = UNSPECIFIED, core.bool hasAttachedVideo = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/responses";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SubmissionList.parse(JSON.parse($text)));
  }
}

// Resource .TagsResource
class TagsResource extends core.Object {
  final ModeratorApi _$service;
  
  TagsResource._internal(ModeratorApi $service) : _$service = $service;

  // Method TagsResource.Insert
  /**
   * Inserts a new tag for the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [content] the Tag
   */
  core.Future<Tag> insert(core.int seriesId, core.int submissionId, Tag content) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/tags";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Tag.parse(JSON.parse($text)));
  }

  // Method TagsResource.List
  /**
   * Lists all tags for the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  core.Future<TagList> list(core.int seriesId, core.int submissionId) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/tags";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => TagList.parse(JSON.parse($text)));
  }

  // Method TagsResource.Delete
  /**
   * Deletes the specified tag from the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   * [tagId]
   */
  core.Future delete(core.int seriesId, core.int submissionId, core.String tagId) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}/tags/{tagId}";
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

// Resource .SeriesResource
class SeriesResource extends core.Object {
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
  core.Future<Series> insert(Series content) {
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
    final $path = "series";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Series.parse(JSON.parse($text)));
  }

  // Method SeriesResource.Patch
  /**
   * Updates the specified series. This method supports patch semantics.
   * [seriesId] The decimal ID of the Series.
   * [content] the Series
   */
  core.Future<Series> patch(core.int seriesId, Series content) {
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
    final $path = "series/{seriesId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Series.parse(JSON.parse($text)));
  }

  // Method SeriesResource.List
  /**
   * Searches the series and returns the search results.
   */
  core.Future<SeriesList> list([core.int maxResults = UNSPECIFIED, core.String q = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
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
    final $path = "series";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SeriesList.parse(JSON.parse($text)));
  }

  // Method SeriesResource.Update
  /**
   * Updates the specified series.
   * [seriesId] The decimal ID of the Series.
   * [content] the Series
   */
  core.Future<Series> update(core.int seriesId, Series content) {
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
    final $path = "series/{seriesId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Series.parse(JSON.parse($text)));
  }

  // Method SeriesResource.Get
  /**
   * Returns the specified series.
   * [seriesId] The decimal ID of the Series.
   */
  core.Future<Series> get(core.int seriesId) {
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
    final $path = "series/{seriesId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Series.parse(JSON.parse($text)));
  }
}


// Resource SeriesResource.SeriesSubmissionsResourceResource
class SeriesSubmissionsResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  SeriesSubmissionsResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method SeriesResource.SeriesSubmissionsResourceResource.List
  /**
   * Searches the submissions for the specified series and returns the search results.
   * [seriesId] The decimal ID of the Series.
   */
  core.Future<SubmissionList> list(core.int seriesId, [core.String lang = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.bool includeVotes = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String author = UNSPECIFIED, core.String sort = UNSPECIFIED, core.String q = UNSPECIFIED, core.bool hasAttachedVideo = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SubmissionList.parse(JSON.parse($text)));
  }
}

// Resource SeriesResource.SeriesResponsesResourceResource
class SeriesResponsesResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  SeriesResponsesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method SeriesResource.SeriesResponsesResourceResource.List
  /**
   * Searches the responses for the specified series and returns the search results.
   * [seriesId] The decimal ID of the Series.
   */
  core.Future<SeriesList> list(core.int seriesId, [core.int maxResults = UNSPECIFIED, core.String sort = UNSPECIFIED, core.String author = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String q = UNSPECIFIED, core.bool hasAttachedVideo = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/responses";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SeriesList.parse(JSON.parse($text)));
  }
}

// Resource .TopicsResource
class TopicsResource extends core.Object {
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
  core.Future<Topic> insert(core.int seriesId, Topic content) {
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
    final $path = "series/{seriesId}/topics";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Topic.parse(JSON.parse($text)));
  }

  // Method TopicsResource.List
  /**
   * Searches the topics within the specified series and returns the search results.
   * [seriesId] The decimal ID of the Series.
   */
  core.Future<TopicList> list(core.int seriesId, [core.int maxResults = UNSPECIFIED, core.String q = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String mode = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/topics";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => TopicList.parse(JSON.parse($text)));
  }

  // Method TopicsResource.Update
  /**
   * Updates the specified topic within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   * [content] the Topic
   */
  core.Future<Topic> update(core.int seriesId, core.int topicId, Topic content) {
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
    final $path = "series/{seriesId}/topics/{topicId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Topic.parse(JSON.parse($text)));
  }

  // Method TopicsResource.Get
  /**
   * Returns the specified topic from the specified series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   */
  core.Future<Topic> get(core.int seriesId, core.int topicId) {
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
    final $path = "series/{seriesId}/topics/{topicId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Topic.parse(JSON.parse($text)));
  }
}


// Resource TopicsResource.TopicsSubmissionsResourceResource
class TopicsSubmissionsResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  TopicsSubmissionsResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method TopicsResource.TopicsSubmissionsResourceResource.List
  /**
   * Searches the submissions for the specified topic within the specified series and returns the
   * search results.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   */
  core.Future<SubmissionList> list(core.int seriesId, core.int topicId, [core.int maxResults = UNSPECIFIED, core.bool includeVotes = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.String author = UNSPECIFIED, core.String sort = UNSPECIFIED, core.String q = UNSPECIFIED, core.bool hasAttachedVideo = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/topics/{topicId}/submissions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SubmissionList.parse(JSON.parse($text)));
  }
}

// Resource .GlobalResource
class GlobalResource extends core.Object {
  final ModeratorApi _$service;
  final GlobalSeriesResourceResource series;
  
  GlobalResource._internal(ModeratorApi $service) : _$service = $service,
    series = new GlobalSeriesResourceResource._internal($service);
}


// Resource GlobalResource.GlobalSeriesResourceResource
class GlobalSeriesResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  GlobalSeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method GlobalResource.GlobalSeriesResourceResource.List
  /**
   * Searches the public series and returns the search results.
   */
  core.Future<SeriesList> list([core.int maxResults = UNSPECIFIED, core.String q = UNSPECIFIED, core.int startIndex = UNSPECIFIED]) {
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
    final $path = "search";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SeriesList.parse(JSON.parse($text)));
  }
}

// Resource .ProfilesResource
class ProfilesResource extends core.Object {
  final ModeratorApi _$service;
  
  ProfilesResource._internal(ModeratorApi $service) : _$service = $service;

  // Method ProfilesResource.Patch
  /**
   * Updates the profile information for the authenticated user. This method supports patch semantics.
   * [content] the Profile
   */
  core.Future<Profile> patch(Profile content) {
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
    final $path = "profiles/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Profile.parse(JSON.parse($text)));
  }

  // Method ProfilesResource.Update
  /**
   * Updates the profile information for the authenticated user.
   * [content] the Profile
   */
  core.Future<Profile> update(Profile content) {
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
    final $path = "profiles/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Profile.parse(JSON.parse($text)));
  }

  // Method ProfilesResource.Get
  /**
   * Returns the profile information for the authenticated user.
   */
  core.Future<Profile> get() {
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
    final $path = "profiles/@me";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Profile.parse(JSON.parse($text)));
  }
}

// Resource .FeaturedResource
class FeaturedResource extends core.Object {
  final ModeratorApi _$service;
  final FeaturedSeriesResourceResource series;
  
  FeaturedResource._internal(ModeratorApi $service) : _$service = $service,
    series = new FeaturedSeriesResourceResource._internal($service);
}


// Resource FeaturedResource.FeaturedSeriesResourceResource
class FeaturedSeriesResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  FeaturedSeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method FeaturedResource.FeaturedSeriesResourceResource.List
  /**
   * Lists the featured series.
   */
  core.Future<SeriesList> list() {
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
    final $path = "series/featured";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SeriesList.parse(JSON.parse($text)));
  }
}

// Resource .MyrecentResource
class MyrecentResource extends core.Object {
  final ModeratorApi _$service;
  final MyrecentSeriesResourceResource series;
  
  MyrecentResource._internal(ModeratorApi $service) : _$service = $service,
    series = new MyrecentSeriesResourceResource._internal($service);
}


// Resource MyrecentResource.MyrecentSeriesResourceResource
class MyrecentSeriesResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  MyrecentSeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method MyrecentResource.MyrecentSeriesResourceResource.List
  /**
   * Lists the series the authenticated user has visited.
   */
  core.Future<SeriesList> list() {
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
    final $path = "series/@me/recent";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SeriesList.parse(JSON.parse($text)));
  }
}

// Resource .MyResource
class MyResource extends core.Object {
  final ModeratorApi _$service;
  final MySeriesResourceResource series;
  
  MyResource._internal(ModeratorApi $service) : _$service = $service,
    series = new MySeriesResourceResource._internal($service);
}


// Resource MyResource.MySeriesResourceResource
class MySeriesResourceResource extends core.Object {
  final ModeratorApi _$service;
  
  MySeriesResourceResource._internal(ModeratorApi $service) : _$service = $service;

  // Method MyResource.MySeriesResourceResource.List
  /**
   * Lists all series created by the authenticated user.
   */
  core.Future<SeriesList> list() {
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
    final $path = "series/@me/mine";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SeriesList.parse(JSON.parse($text)));
  }
}

// Resource .SubmissionsResource
class SubmissionsResource extends core.Object {
  final ModeratorApi _$service;
  
  SubmissionsResource._internal(ModeratorApi $service) : _$service = $service;

  // Method SubmissionsResource.Insert
  /**
   * Inserts a new submission in the specified topic within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [topicId] The decimal ID of the Topic within the Series.
   * [content] the Submission
   */
  core.Future<Submission> insert(core.int seriesId, core.int topicId, Submission content, [core.String unauthToken = UNSPECIFIED, core.bool anonymous = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/topics/{topicId}/submissions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Submission.parse(JSON.parse($text)));
  }

  // Method SubmissionsResource.Get
  /**
   * Returns the specified submission within the specified series.
   * [seriesId] The decimal ID of the Series.
   * [submissionId] The decimal ID of the Submission within the Series.
   */
  core.Future<Submission> get(core.int seriesId, core.int submissionId, [core.String lang = UNSPECIFIED, core.bool includeVotes = UNSPECIFIED]) {
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
    final $path = "series/{seriesId}/submissions/{submissionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Submission.parse(JSON.parse($text)));
  }
}

// Schema .ModeratorTopicsResourcePartial
class ModeratorTopicsResourcePartial extends IdentityHash {
  
  ModeratorTopicsResourcePartialId id;

  /** Parses an instance from its JSON representation. */
  static ModeratorTopicsResourcePartial parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ModeratorTopicsResourcePartial();
    result.id = ModeratorTopicsResourcePartialId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ModeratorTopicsResourcePartial value) {
    if (value == null) return null;
    final result = {};
    result["id"] = ModeratorTopicsResourcePartialId.serialize(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ModeratorTopicsResourcePartial.ModeratorTopicsResourcePartialId
class ModeratorTopicsResourcePartialId extends IdentityHash {
  
  core.String seriesId;

  
  core.String topicId;

  /** Parses an instance from its JSON representation. */
  static ModeratorTopicsResourcePartialId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ModeratorTopicsResourcePartialId();
    result.seriesId = identity(json["seriesId"]);
    result.topicId = identity(json["topicId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ModeratorTopicsResourcePartialId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    result["topicId"] = identity(value.topicId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ModeratorVotesResourcePartial
class ModeratorVotesResourcePartial extends IdentityHash {
  
  core.String vote;

  
  core.String flag;

  /** Parses an instance from its JSON representation. */
  static ModeratorVotesResourcePartial parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ModeratorVotesResourcePartial();
    result.vote = identity(json["vote"]);
    result.flag = identity(json["flag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ModeratorVotesResourcePartial value) {
    if (value == null) return null;
    final result = {};
    result["vote"] = identity(value.vote);
    result["flag"] = identity(value.flag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Profile
class Profile extends IdentityHash {
  
  core.String kind;

  
  ProfileAttribution attribution;

  
  ProfileId id;

  /** Parses an instance from its JSON representation. */
  static Profile parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Profile();
    result.kind = identity(json["kind"]);
    result.attribution = ProfileAttribution.parse(json["attribution"]);
    result.id = ProfileId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Profile value) {
    if (value == null) return null;
    final result = {};
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

  
  core.String displayName;

  
  core.String location;

  
  core.String avatarUrl;

  /** Parses an instance from its JSON representation. */
  static ProfileAttribution parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ProfileAttribution();
    result.geo = ProfileAttributionGeo.parse(json["geo"]);
    result.displayName = identity(json["displayName"]);
    result.location = identity(json["location"]);
    result.avatarUrl = identity(json["avatarUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ProfileAttribution value) {
    if (value == null) return null;
    final result = {};
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
  
  core.double latitude;

  
  core.String location;

  
  core.double longitude;

  /** Parses an instance from its JSON representation. */
  static ProfileAttributionGeo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ProfileAttributionGeo();
    result.latitude = identity(json["latitude"]);
    result.location = identity(json["location"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ProfileAttributionGeo value) {
    if (value == null) return null;
    final result = {};
    result["latitude"] = identity(value.latitude);
    result["location"] = identity(value.location);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Profile.ProfileId
class ProfileId extends IdentityHash {
  
  core.String user;

  /** Parses an instance from its JSON representation. */
  static ProfileId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ProfileId();
    result.user = identity(json["user"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ProfileId value) {
    if (value == null) return null;
    final result = {};
    result["user"] = identity(value.user);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Series
class Series extends IdentityHash {
  
  core.String kind;

  
  core.String description;

  
  SeriesRules rules;

  
  core.bool unauthVotingAllowed;

  
  core.bool videoSubmissionAllowed;

  
  core.String name;

  
  core.int numTopics;

  
  core.bool anonymousSubmissionAllowed;

  
  core.bool unauthSubmissionAllowed;

  
  SeriesId id;

  
  SeriesCounters counters;

  /** Parses an instance from its JSON representation. */
  static Series parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Series value) {
    if (value == null) return null;
    final result = {};
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
  
  core.int users;

  
  core.int noneVotes;

  
  core.int videoSubmissions;

  
  core.int minusVotes;

  
  core.int anonymousSubmissions;

  
  core.int submissions;

  
  core.int plusVotes;

  /** Parses an instance from its JSON representation. */
  static SeriesCounters parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(SeriesCounters value) {
    if (value == null) return null;
    final result = {};
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
  
  core.String seriesId;

  /** Parses an instance from its JSON representation. */
  static SeriesId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SeriesId();
    result.seriesId = identity(json["seriesId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SeriesId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SeriesList
class SeriesList extends IdentityHash {
  
  core.List<Series> items;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static SeriesList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SeriesList();
    result.items = map(Series.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SeriesList value) {
    if (value == null) return null;
    final result = {};
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
  static SeriesRules parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SeriesRules();
    result.votes = SeriesRulesVotes.parse(json["votes"]);
    result.submissions = SeriesRulesSubmissions.parse(json["submissions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SeriesRules value) {
    if (value == null) return null;
    final result = {};
    result["votes"] = SeriesRulesVotes.serialize(value.votes);
    result["submissions"] = SeriesRulesSubmissions.serialize(value.submissions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesRules.SeriesRulesSubmissions
class SeriesRulesSubmissions extends IdentityHash {
  
  core.String close;

  
  core.String open;

  /** Parses an instance from its JSON representation. */
  static SeriesRulesSubmissions parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SeriesRulesSubmissions();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SeriesRulesSubmissions value) {
    if (value == null) return null;
    final result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Series.SeriesRules.SeriesRulesVotes
class SeriesRulesVotes extends IdentityHash {
  
  core.String close;

  
  core.String open;

  /** Parses an instance from its JSON representation. */
  static SeriesRulesVotes parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SeriesRulesVotes();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SeriesRulesVotes value) {
    if (value == null) return null;
    final result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Submission
class Submission extends IdentityHash {
  
  core.String kind;

  
  SubmissionAttribution attribution;

  
  core.String created;

  
  core.String text;

  
  core.List<ModeratorTopicsResourcePartial> topics;

  
  core.String author;

  
  core.List<SubmissionTranslations> translations;

  
  SubmissionParentSubmissionId parentSubmissionId;

  
  ModeratorVotesResourcePartial vote;

  
  core.String attachmentUrl;

  
  SubmissionGeo geo;

  
  SubmissionId id;

  
  SubmissionCounters counters;

  /** Parses an instance from its JSON representation. */
  static Submission parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Submission value) {
    if (value == null) return null;
    final result = {};
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
  
  core.String displayName;

  
  core.String location;

  
  core.String avatarUrl;

  /** Parses an instance from its JSON representation. */
  static SubmissionAttribution parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionAttribution();
    result.displayName = identity(json["displayName"]);
    result.location = identity(json["location"]);
    result.avatarUrl = identity(json["avatarUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionAttribution value) {
    if (value == null) return null;
    final result = {};
    result["displayName"] = identity(value.displayName);
    result["location"] = identity(value.location);
    result["avatarUrl"] = identity(value.avatarUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionCounters
class SubmissionCounters extends IdentityHash {
  
  core.int noneVotes;

  
  core.int minusVotes;

  
  core.int plusVotes;

  /** Parses an instance from its JSON representation. */
  static SubmissionCounters parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionCounters();
    result.noneVotes = identity(json["noneVotes"]);
    result.minusVotes = identity(json["minusVotes"]);
    result.plusVotes = identity(json["plusVotes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionCounters value) {
    if (value == null) return null;
    final result = {};
    result["noneVotes"] = identity(value.noneVotes);
    result["minusVotes"] = identity(value.minusVotes);
    result["plusVotes"] = identity(value.plusVotes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionGeo
class SubmissionGeo extends IdentityHash {
  
  core.double latitude;

  
  core.String location;

  
  core.double longitude;

  /** Parses an instance from its JSON representation. */
  static SubmissionGeo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionGeo();
    result.latitude = identity(json["latitude"]);
    result.location = identity(json["location"]);
    result.longitude = identity(json["longitude"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionGeo value) {
    if (value == null) return null;
    final result = {};
    result["latitude"] = identity(value.latitude);
    result["location"] = identity(value.location);
    result["longitude"] = identity(value.longitude);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionId
class SubmissionId extends IdentityHash {
  
  core.String seriesId;

  
  core.String submissionId;

  /** Parses an instance from its JSON representation. */
  static SubmissionId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionId();
    result.seriesId = identity(json["seriesId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SubmissionList
class SubmissionList extends IdentityHash {
  
  core.List<Submission> items;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static SubmissionList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionList();
    result.items = map(Submission.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Submission.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionParentSubmissionId
class SubmissionParentSubmissionId extends IdentityHash {
  
  core.String seriesId;

  
  core.String submissionId;

  /** Parses an instance from its JSON representation. */
  static SubmissionParentSubmissionId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionParentSubmissionId();
    result.seriesId = identity(json["seriesId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionParentSubmissionId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Submission.SubmissionTranslations
class SubmissionTranslations extends IdentityHash {
  
  core.String lang;

  
  core.String text;

  /** Parses an instance from its JSON representation. */
  static SubmissionTranslations parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubmissionTranslations();
    result.lang = identity(json["lang"]);
    result.text = identity(json["text"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubmissionTranslations value) {
    if (value == null) return null;
    final result = {};
    result["lang"] = identity(value.lang);
    result["text"] = identity(value.text);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Tag
class Tag extends IdentityHash {
  
  core.String text;

  
  core.String kind;

  
  TagId id;

  /** Parses an instance from its JSON representation. */
  static Tag parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Tag();
    result.text = identity(json["text"]);
    result.kind = identity(json["kind"]);
    result.id = TagId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Tag value) {
    if (value == null) return null;
    final result = {};
    result["text"] = identity(value.text);
    result["kind"] = identity(value.kind);
    result["id"] = TagId.serialize(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Tag.TagId
class TagId extends IdentityHash {
  
  core.String seriesId;

  
  core.String tagId;

  
  core.String submissionId;

  /** Parses an instance from its JSON representation. */
  static TagId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TagId();
    result.seriesId = identity(json["seriesId"]);
    result.tagId = identity(json["tagId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TagId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    result["tagId"] = identity(value.tagId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TagList
class TagList extends IdentityHash {
  
  core.List<Tag> items;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static TagList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TagList();
    result.items = map(Tag.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TagList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Tag.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Topic
class Topic extends IdentityHash {
  
  core.String kind;

  
  core.String description;

  
  TopicRules rules;

  
  Submission featuredSubmission;

  
  core.String presenter;

  
  TopicCounters counters;

  
  TopicId id;

  
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Topic parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Topic value) {
    if (value == null) return null;
    final result = {};
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
  
  core.int users;

  
  core.int noneVotes;

  
  core.int videoSubmissions;

  
  core.int minusVotes;

  
  core.int submissions;

  
  core.int plusVotes;

  /** Parses an instance from its JSON representation. */
  static TopicCounters parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(TopicCounters value) {
    if (value == null) return null;
    final result = {};
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
  
  core.String seriesId;

  
  core.String topicId;

  /** Parses an instance from its JSON representation. */
  static TopicId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TopicId();
    result.seriesId = identity(json["seriesId"]);
    result.topicId = identity(json["topicId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TopicId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    result["topicId"] = identity(value.topicId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TopicList
class TopicList extends IdentityHash {
  
  core.List<Topic> items;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static TopicList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TopicList();
    result.items = map(Topic.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TopicList value) {
    if (value == null) return null;
    final result = {};
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
  static TopicRules parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TopicRules();
    result.votes = TopicRulesVotes.parse(json["votes"]);
    result.submissions = TopicRulesSubmissions.parse(json["submissions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TopicRules value) {
    if (value == null) return null;
    final result = {};
    result["votes"] = TopicRulesVotes.serialize(value.votes);
    result["submissions"] = TopicRulesSubmissions.serialize(value.submissions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicRules.TopicRulesSubmissions
class TopicRulesSubmissions extends IdentityHash {
  
  core.String close;

  
  core.String open;

  /** Parses an instance from its JSON representation. */
  static TopicRulesSubmissions parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TopicRulesSubmissions();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TopicRulesSubmissions value) {
    if (value == null) return null;
    final result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Topic.TopicRules.TopicRulesVotes
class TopicRulesVotes extends IdentityHash {
  
  core.String close;

  
  core.String open;

  /** Parses an instance from its JSON representation. */
  static TopicRulesVotes parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TopicRulesVotes();
    result.close = identity(json["close"]);
    result.open = identity(json["open"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TopicRulesVotes value) {
    if (value == null) return null;
    final result = {};
    result["close"] = identity(value.close);
    result["open"] = identity(value.open);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Vote
class Vote extends IdentityHash {
  
  core.String vote;

  
  core.String flag;

  
  VoteId id;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Vote parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Vote();
    result.vote = identity(json["vote"]);
    result.flag = identity(json["flag"]);
    result.id = VoteId.parse(json["id"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Vote value) {
    if (value == null) return null;
    final result = {};
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
  
  core.String seriesId;

  
  core.String submissionId;

  /** Parses an instance from its JSON representation. */
  static VoteId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VoteId();
    result.seriesId = identity(json["seriesId"]);
    result.submissionId = identity(json["submissionId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VoteId value) {
    if (value == null) return null;
    final result = {};
    result["seriesId"] = identity(value.seriesId);
    result["submissionId"] = identity(value.submissionId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VoteList
class VoteList extends IdentityHash {
  
  core.List<Vote> items;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static VoteList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VoteList();
    result.items = map(Vote.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VoteList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Vote.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum ModeratorApi.Alt
class ModeratorApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final ModeratorApiAlt JSON = const ModeratorApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<ModeratorApiAlt> values = const <ModeratorApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ModeratorApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ModeratorApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ModeratorApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

