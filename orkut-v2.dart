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

#library('orkut-v2');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API OrkutApi
/**
 * Lets you manage activities, comments and badges in Orkut. More stuff coming in time.
 */
class OrkutApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  OrkutApi get _$service() => this;
  CommunityMembersResource _communityMembers;
  CommunityMembersResource get communityMembers() => _communityMembers;
  ActivitiesResource _activities;
  ActivitiesResource get activities() => _activities;
  CommunityPollCommentsResource _communityPollComments;
  CommunityPollCommentsResource get communityPollComments() => _communityPollComments;
  CommunityPollsResource _communityPolls;
  CommunityPollsResource get communityPolls() => _communityPolls;
  CommunityMessagesResource _communityMessages;
  CommunityMessagesResource get communityMessages() => _communityMessages;
  CommunityTopicsResource _communityTopics;
  CommunityTopicsResource get communityTopics() => _communityTopics;
  CommentsResource _comments;
  CommentsResource get comments() => _comments;
  AclResource _acl;
  AclResource get acl() => _acl;
  CommunityRelatedResource _communityRelated;
  CommunityRelatedResource get communityRelated() => _communityRelated;
  ScrapsResource _scraps;
  ScrapsResource get scraps() => _scraps;
  CommunityPollVotesResource _communityPollVotes;
  CommunityPollVotesResource get communityPollVotes() => _communityPollVotes;
  CommunitiesResource _communities;
  CommunitiesResource get communities() => _communities;
  CommunityFollowResource _communityFollow;
  CommunityFollowResource get communityFollow() => _communityFollow;
  ActivityVisibilityResource _activityVisibility;
  ActivityVisibilityResource get activityVisibility() => _activityVisibility;
  BadgesResource _badges;
  BadgesResource get badges() => _badges;
  CountersResource _counters;
  CountersResource get counters() => _counters;
  
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
  OrkutApiAlt alt;


  OrkutApi([this.baseUrl = "https://www.googleapis.com/orkut/v2/", applicationName, this.authenticator]) { 
    _communityMembers = new CommunityMembersResource._internal(this);
    _activities = new ActivitiesResource._internal(this);
    _communityPollComments = new CommunityPollCommentsResource._internal(this);
    _communityPolls = new CommunityPollsResource._internal(this);
    _communityMessages = new CommunityMessagesResource._internal(this);
    _communityTopics = new CommunityTopicsResource._internal(this);
    _comments = new CommentsResource._internal(this);
    _acl = new AclResource._internal(this);
    _communityRelated = new CommunityRelatedResource._internal(this);
    _scraps = new ScrapsResource._internal(this);
    _communityPollVotes = new CommunityPollVotesResource._internal(this);
    _communities = new CommunitiesResource._internal(this);
    _communityFollow = new CommunityFollowResource._internal(this);
    _activityVisibility = new ActivityVisibilityResource._internal(this);
    _badges = new BadgesResource._internal(this);
    _counters = new CountersResource._internal(this);
    this.applicationName = applicationName
      .replaceAll(const RegExp(@'\s+'), '_')
      .replaceAll(const RegExp(@'[^-_.,0-9a-zA-Z]'), '');
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}orkut/v2/20120223 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your Orkut activity */
  static final core.String ORKUT_SCOPE = "https://www.googleapis.com/auth/orkut";

  /** OAuth2 scope: View your Orkut data */
  static final core.String ORKUT_READONLY_SCOPE = "https://www.googleapis.com/auth/orkut.readonly";
}

// Resource .CommunityMembersResource
class CommunityMembersResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityMembersResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityMembersResource.Insert
  /**
   * Makes the user join a community.
   *
   *    * [communityId] ID of the community.
   *    * [userId] ID of the user.
   */
  core.Future<CommunityMembers> insert(core.int communityId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/members/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityMembers.parse(JSON.parse($text)));
  }

  // Method CommunityMembersResource.Get
  /**
   * Retrieves the relationship between a user and a community.
   *
   *    * [communityId] ID of the community.
   *    * [userId] ID of the user.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityMembers> get(core.int communityId, core.String userId, [core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["userId"] = userId;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/members/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityMembers.parse(JSON.parse($text)));
  }

  // Method CommunityMembersResource.List
  /**
   * Lists members of a community. Use the pagination tokens to retrieve the full list; do not rely on
   * the member count available in the community profile information to know when to stop iterating,
   * as that count may be approximate.
   *
   *    * [communityId] The ID of the community whose members will be listed.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [friendsOnly] Whether to list only community members who are friends of the user.
   *    * [maxResults] The maximum number of members to include in the response.

  Minimum: 1.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityMembersList> list(core.int communityId, [core.String pageToken = UNSPECIFIED, core.bool friendsOnly = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != friendsOnly) $queryParams["friendsOnly"] = friendsOnly;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/members";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityMembersList.parse(JSON.parse($text)));
  }

  // Method CommunityMembersResource.Delete
  /**
   * Makes the user leave a community.
   *
   *    * [communityId] ID of the community.
   *    * [userId] ID of the user.
   */
  core.Future delete(core.int communityId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/members/{userId}";
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

// Resource .ActivitiesResource
class ActivitiesResource extends core.Object {
  final OrkutApi _$service;
  
  ActivitiesResource._internal(OrkutApi $service) : _$service = $service;

  // Method ActivitiesResource.List
  /**
   * Retrieves a list of activities.
   *
   *    * [userId] The ID of the user whose activities will be listed. Can be me to refer to the viewer (i.e. the
   *        authenticated user).
   *    * [collection] The collection of activities to list.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [maxResults] The maximum number of activities to include in the response.

  Minimum: 1.
  Maximum: 100.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<ActivityList> list(core.String userId, ActivitiesResourceListCollection collection, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    $pathParams["collection"] = collection;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "people/{userId}/activities/{collection}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ActivityList.parse(JSON.parse($text)));
  }

  // Method ActivitiesResource.Delete
  /**
   * Deletes an existing activity, if the access controls allow it.
   *
   *    * [activityId] ID of the activity to remove.
   */
  core.Future delete(core.String activityId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "activities/{activityId}";
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

// Enum ActivitiesResource.List.Collection
class ActivitiesResourceListCollection extends core.Object implements core.Hashable {
  /**
 * All activities created by the specified user that the authenticated user is authorized to view.
 */
  static final ActivitiesResourceListCollection ALL = const ActivitiesResourceListCollection._internal("all", 0);
  /** The specified user's scrapbook. */
  static final ActivitiesResourceListCollection SCRAPS = const ActivitiesResourceListCollection._internal("scraps", 1);
  /**
 * The specified user's stream feed, intended for consumption. This includes activities posted by
 * people that the user is following, and activities in which the user has been mentioned.
 */
  static final ActivitiesResourceListCollection STREAM = const ActivitiesResourceListCollection._internal("stream", 2);

  /** All values of this enumeration */
  static final core.List<ActivitiesResourceListCollection> values = const <ActivitiesResourceListCollection>[
    ALL,
    SCRAPS,
    STREAM,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ActivitiesResourceListCollection>{ 
    "all": ALL,
    "scraps": SCRAPS,
    "stream": STREAM,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ActivitiesResourceListCollection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ActivitiesResourceListCollection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Collection".hashCode();
}

// Resource .CommunityPollCommentsResource
class CommunityPollCommentsResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityPollCommentsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityPollCommentsResource.Insert
  /**
   * Adds a comment on a community poll.
   *
   *    * [content] the CommunityPollComment
   *    * [communityId] The ID of the community whose poll is being commented.
   *    * [pollId] The ID of the poll being commented.
   */
  core.Future<CommunityPollComment> insert(core.int communityId, core.String pollId, CommunityPollComment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["pollId"] = pollId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CommunityPollComment.serialize(content));
    final $path = "communities/{communityId}/polls/{pollId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommunityPollComment.parse(JSON.parse($text)));
  }

  // Method CommunityPollCommentsResource.List
  /**
   * Retrieves the comments of a community poll.
   *
   *    * [communityId] The ID of the community whose poll is having its comments listed.
   *    * [pollId] The ID of the community whose polls will be listed.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [maxResults] The maximum number of comments to include in the response.

  Minimum: 1.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityPollCommentList> list(core.int communityId, core.String pollId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["pollId"] = pollId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/polls/{pollId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityPollCommentList.parse(JSON.parse($text)));
  }
}

// Resource .CommunityPollsResource
class CommunityPollsResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityPollsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityPollsResource.List
  /**
   * Retrieves the polls of a community.
   *
   *    * [communityId] The ID of the community which polls will be listed.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [maxResults] The maximum number of polls to include in the response.

  Minimum: 1.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityPollList> list(core.int communityId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/polls";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityPollList.parse(JSON.parse($text)));
  }

  // Method CommunityPollsResource.Get
  /**
   * Retrieves one specific poll of a community.
   *
   *    * [communityId] The ID of the community for whose poll will be retrieved.
   *    * [pollId] The ID of the poll to get.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityPoll> get(core.int communityId, core.String pollId, [core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["pollId"] = pollId;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/polls/{pollId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityPoll.parse(JSON.parse($text)));
  }
}

// Resource .CommunityMessagesResource
class CommunityMessagesResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityMessagesResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityMessagesResource.Insert
  /**
   * Adds a message to a given community topic.
   *
   *    * [content] the CommunityMessage
   *    * [communityId] The ID of the community the message should be added to.
   *    * [topicId] The ID of the topic the message should be added to.
   */
  core.Future<CommunityMessage> insert(core.int communityId, core.String topicId, CommunityMessage content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
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
    final $body = JSON.stringify(CommunityMessage.serialize(content));
    final $path = "communities/{communityId}/topics/{topicId}/messages";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommunityMessage.parse(JSON.parse($text)));
  }

  // Method CommunityMessagesResource.List
  /**
   * Retrieves the messages of a topic of a community.
   *
   *    * [communityId] The ID of the community which messages will be listed.
   *    * [topicId] The ID of the topic which messages will be listed.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [maxResults] The maximum number of messages to include in the response.

  Minimum: 1.
  Maximum: 100.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityMessageList> list(core.int communityId, core.String topicId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["topicId"] = topicId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/topics/{topicId}/messages";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityMessageList.parse(JSON.parse($text)));
  }

  // Method CommunityMessagesResource.Delete
  /**
   * Moves a message of the community to the trash folder.
   *
   *    * [communityId] The ID of the community whose message will be moved to the trash folder.
   *    * [topicId] The ID of the topic whose message will be moved to the trash folder.
   *    * [messageId] The ID of the message to be moved to the trash folder.
   */
  core.Future delete(core.int communityId, core.String topicId, core.String messageId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["topicId"] = topicId;
    $pathParams["messageId"] = messageId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/topics/{topicId}/messages/{messageId}";
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

// Resource .CommunityTopicsResource
class CommunityTopicsResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityTopicsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityTopicsResource.Insert
  /**
   * Adds a topic to a given community.
   *
   *    * [content] the CommunityTopic
   *    * [communityId] The ID of the community the topic should be added to.
   *    * [isShout] Whether this topic is a shout.
   */
  core.Future<CommunityTopic> insert(core.int communityId, CommunityTopic content, [core.bool isShout = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    if (UNSPECIFIED != isShout) $queryParams["isShout"] = isShout;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CommunityTopic.serialize(content));
    final $path = "communities/{communityId}/topics";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommunityTopic.parse(JSON.parse($text)));
  }

  // Method CommunityTopicsResource.Get
  /**
   * Retrieves a topic of a community.
   *
   *    * [communityId] The ID of the community whose topic will be retrieved.
   *    * [topicId] The ID of the topic to get.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityTopic> get(core.int communityId, core.String topicId, [core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["topicId"] = topicId;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/topics/{topicId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityTopic.parse(JSON.parse($text)));
  }

  // Method CommunityTopicsResource.List
  /**
   * Retrieves the topics of a community.
   *
   *    * [communityId] The ID of the community which topics will be listed.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [maxResults] The maximum number of topics to include in the response.

  Minimum: 1.
  Maximum: 100.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityTopicList> list(core.int communityId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/topics";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityTopicList.parse(JSON.parse($text)));
  }

  // Method CommunityTopicsResource.Delete
  /**
   * Moves a topic of the community to the trash folder.
   *
   *    * [communityId] The ID of the community whose topic will be moved to the trash folder.
   *    * [topicId] The ID of the topic to be moved to the trash folder.
   */
  core.Future delete(core.int communityId, core.String topicId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["topicId"] = topicId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/topics/{topicId}";
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

// Resource .CommentsResource
class CommentsResource extends core.Object {
  final OrkutApi _$service;
  
  CommentsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommentsResource.Insert
  /**
   * Inserts a new comment to an activity.
   *
   *    * [content] the Comment
   *    * [activityId] The ID of the activity to contain the new comment.
   */
  core.Future<Comment> insert(core.String activityId, Comment content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
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
    final $path = "activities/{activityId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Get
  /**
   * Retrieves an existing comment.
   *
   *    * [commentId] ID of the comment to get.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<Comment> get(core.String commentId, [core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["commentId"] = commentId;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "comments/{commentId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }

  // Method CommentsResource.List
  /**
   * Retrieves a list of comments, possibly filtered.
   *
   *    * [activityId] The ID of the activity containing the comments.
   *    * [orderBy] Sort search results.
  Default: DESCENDING_SORT.
   *    * [pageToken] A continuation token that allows pagination.
   *    * [maxResults] The maximum number of activities to include in the response.

  Minimum: 1.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommentList> list(core.String activityId, [CommentsResourceListOrderBy orderBy = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    if (UNSPECIFIED != orderBy) $queryParams["orderBy"] = orderBy;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "activities/{activityId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommentList.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Delete
  /**
   * Deletes an existing comment.
   *
   *    * [commentId] ID of the comment to remove.
   */
  core.Future delete(core.String commentId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "comments/{commentId}";
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

// Enum CommentsResource.List.OrderBy
class CommentsResourceListOrderBy extends core.Object implements core.Hashable {
  /** Use ascending sort order. */
  static final CommentsResourceListOrderBy ASCENDING = const CommentsResourceListOrderBy._internal("ascending", 0);
  /** Use descending sort order. */
  static final CommentsResourceListOrderBy DESCENDING = const CommentsResourceListOrderBy._internal("descending", 1);

  /** All values of this enumeration */
  static final core.List<CommentsResourceListOrderBy> values = const <CommentsResourceListOrderBy>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CommentsResourceListOrderBy>{ 
    "ascending": ASCENDING,
    "descending": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CommentsResourceListOrderBy valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const CommentsResourceListOrderBy._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Resource .AclResource
class AclResource extends core.Object {
  final OrkutApi _$service;
  
  AclResource._internal(OrkutApi $service) : _$service = $service;

  // Method AclResource.Delete
  /**
   * Excludes an element from the ACL of the activity.
   *
   *    * [activityId] ID of the activity.
   *    * [userId] ID of the user to be removed from the activity.
   */
  core.Future delete(core.String activityId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "activities/{activityId}/acl/{userId}";
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

// Resource .CommunityRelatedResource
class CommunityRelatedResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityRelatedResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityRelatedResource.List
  /**
   * Retrieves the communities related to another one.
   *
   *    * [communityId] The ID of the community whose related communities will be listed.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityList> list(core.int communityId, [core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/related";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityList.parse(JSON.parse($text)));
  }
}

// Resource .ScrapsResource
class ScrapsResource extends core.Object {
  final OrkutApi _$service;
  
  ScrapsResource._internal(OrkutApi $service) : _$service = $service;

  // Method ScrapsResource.Insert
  /**
   * Creates a new scrap.
   *
   *    * [content] the Activity
   */
  core.Future<Activity> insert(Activity content) {
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
    final $body = JSON.stringify(Activity.serialize(content));
    final $path = "activities/scraps";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Activity.parse(JSON.parse($text)));
  }
}

// Resource .CommunityPollVotesResource
class CommunityPollVotesResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityPollVotesResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityPollVotesResource.Insert
  /**
   * Votes on a community poll.
   *
   *    * [content] the CommunityPollVote
   *    * [communityId] The ID of the community whose poll is being voted.
   *    * [pollId] The ID of the poll being voted.
   */
  core.Future<CommunityPollVote> insert(core.int communityId, core.String pollId, CommunityPollVote content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["pollId"] = pollId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CommunityPollVote.serialize(content));
    final $path = "communities/{communityId}/polls/{pollId}/votes";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CommunityPollVote.parse(JSON.parse($text)));
  }
}

// Resource .CommunitiesResource
class CommunitiesResource extends core.Object {
  final OrkutApi _$service;
  
  CommunitiesResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunitiesResource.List
  /**
   * Retrieves the list of communities the current user is a member of.
   *
   *    * [userId] The ID of the user whose communities will be listed. Can be me to refer to caller.
   *    * [orderBy] How to order the communities by.
   *    * [maxResults] The maximum number of communities to include in the response.

  Minimum: 1.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<CommunityList> list(core.String userId, [CommunitiesResourceListOrderBy orderBy = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    if (UNSPECIFIED != orderBy) $queryParams["orderBy"] = orderBy;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "people/{userId}/communities";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityList.parse(JSON.parse($text)));
  }

  // Method CommunitiesResource.Get
  /**
   * Retrieves the basic information (aka. profile) of a community.
   *
   *    * [communityId] The ID of the community to get.
   *    * [hl] Specifies the interface language (host language) of your user interface.
   */
  core.Future<Community> get(core.int communityId, [core.String hl = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Community.parse(JSON.parse($text)));
  }
}

// Enum CommunitiesResource.List.OrderBy
class CommunitiesResourceListOrderBy extends core.Object implements core.Hashable {
  /** Returns the communities sorted by a fixed, natural order. */
  static final CommunitiesResourceListOrderBy ID = const CommunitiesResourceListOrderBy._internal("id", 0);
  /**
 * Returns the communities ranked accordingly to how they are displayed on the orkut web
 * application.
 */
  static final CommunitiesResourceListOrderBy RANKED = const CommunitiesResourceListOrderBy._internal("ranked", 1);

  /** All values of this enumeration */
  static final core.List<CommunitiesResourceListOrderBy> values = const <CommunitiesResourceListOrderBy>[
    ID,
    RANKED,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CommunitiesResourceListOrderBy>{ 
    "id": ID,
    "ranked": RANKED,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CommunitiesResourceListOrderBy valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const CommunitiesResourceListOrderBy._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Resource .CommunityFollowResource
class CommunityFollowResource extends core.Object {
  final OrkutApi _$service;
  
  CommunityFollowResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityFollowResource.Insert
  /**
   * Adds a user as a follower of a community.
   *
   *    * [communityId] ID of the community.
   *    * [userId] ID of the user.
   */
  core.Future<CommunityMembers> insert(core.int communityId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/followers/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommunityMembers.parse(JSON.parse($text)));
  }

  // Method CommunityFollowResource.Delete
  /**
   * Removes a user from the followers of a community.
   *
   *    * [communityId] ID of the community.
   *    * [userId] ID of the user.
   */
  core.Future delete(core.int communityId, core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["communityId"] = communityId;
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "communities/{communityId}/followers/{userId}";
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

// Resource .ActivityVisibilityResource
class ActivityVisibilityResource extends core.Object {
  final OrkutApi _$service;
  
  ActivityVisibilityResource._internal(OrkutApi $service) : _$service = $service;

  // Method ActivityVisibilityResource.Patch
  /**
   * Updates the visibility of an existing activity. This method supports patch semantics.
   *
   *    * [content] the Visibility
   *    * [activityId] ID of the activity.
   */
  core.Future<Visibility> patch(core.String activityId, Visibility content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Visibility.serialize(content));
    final $path = "activities/{activityId}/visibility";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Visibility.parse(JSON.parse($text)));
  }

  // Method ActivityVisibilityResource.Update
  /**
   * Updates the visibility of an existing activity.
   *
   *    * [content] the Visibility
   *    * [activityId] ID of the activity.
   */
  core.Future<Visibility> update(core.String activityId, Visibility content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Visibility.serialize(content));
    final $path = "activities/{activityId}/visibility";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Visibility.parse(JSON.parse($text)));
  }

  // Method ActivityVisibilityResource.Get
  /**
   * Gets the visibility of an existing activity.
   *
   *    * [activityId] ID of the activity to get the visibility.
   */
  core.Future<Visibility> get(core.String activityId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "activities/{activityId}/visibility";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Visibility.parse(JSON.parse($text)));
  }
}

// Resource .BadgesResource
class BadgesResource extends core.Object {
  final OrkutApi _$service;
  
  BadgesResource._internal(OrkutApi $service) : _$service = $service;

  // Method BadgesResource.List
  /**
   * Retrieves the list of visible badges of a user.
   *
   *    * [userId] The id of the user whose badges will be listed. Can be me to refer to caller.
   */
  core.Future<BadgeList> list(core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "people/{userId}/badges";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => BadgeList.parse(JSON.parse($text)));
  }

  // Method BadgesResource.Get
  /**
   * Retrieves a badge from a user.
   *
   *    * [userId] The ID of the user whose badges will be listed. Can be me to refer to caller.
   *    * [badgeId] The ID of the badge that will be retrieved.
   */
  core.Future<Badge> get(core.String userId, core.String badgeId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    $pathParams["badgeId"] = badgeId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "people/{userId}/badges/{badgeId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Badge.parse(JSON.parse($text)));
  }
}

// Resource .CountersResource
class CountersResource extends core.Object {
  final OrkutApi _$service;
  
  CountersResource._internal(OrkutApi $service) : _$service = $service;

  // Method CountersResource.List
  /**
   * Retrieves the counters of a user.
   *
   *    * [userId] The ID of the user whose counters will be listed. Can be me to refer to caller.
   */
  core.Future<Counters> list(core.String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "people/{userId}/counters";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Counters.parse(JSON.parse($text)));
  }
}

// Schema .Acl
class Acl extends IdentityHash {
  /** The list of ACL entries. */
  core.List<AclItems> items;

  /** Identifies this resource as an access control list. Value: "orkut#acl" */
  core.String kind;

  /** Human readable description of the access granted. */
  core.String description;

  /** The total count of participants of the parent resource. */
  core.int totalParticipants;

  /** Parses an instance from its JSON representation. */
  static Acl parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Acl();
    result.items = map(AclItems.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.totalParticipants = identity(json["totalParticipants"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Acl value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(AclItems.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["totalParticipants"] = identity(value.totalParticipants);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Acl.AclItems
class AclItems extends IdentityHash {
  /** The type of entity to whom access is granted. */
  core.String type;

  /**
 * The ID of the entity. For entities of type "person" or "circle", this is the ID of the resource.
 * For other types, this will be unset.
 */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static AclItems parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AclItems();
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AclItems value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Activity
class Activity extends IdentityHash {
  /** The kind of activity. Always orkut#activity. */
  core.String kind;

  /** Links to resources related to this activity. */
  core.List<OrkutLinkResource> links;

  /** Title of the activity. */
  core.String title;

  /** The activity's object. */
  ActivityObject object;

  /** The time at which the activity was last updated. */
  core.String updated;

  /** The person who performed the activity. */
  OrkutAuthorResource actor;

  /** Identifies who has access to see this activity. */
  Acl access;

  /**
 * This activity's verb, indicating what action was performed. Possible values are: - add - User
 * added new content to profile or album, e.g. video, photo. - post - User publish content to the
 * stream, e.g. status, scrap. - update - User commented on an activity. - make-friend - User added
 * a new friend. - birthday - User has a birthday.
 */
  core.String verb;

  /** The time at which the activity was initially published. */
  core.String published;

  /** The ID for the activity. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Activity parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Activity();
    result.kind = identity(json["kind"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.title = identity(json["title"]);
    result.object = ActivityObject.parse(json["object"]);
    result.updated = identity(json["updated"]);
    result.actor = OrkutAuthorResource.parse(json["actor"]);
    result.access = Acl.parse(json["access"]);
    result.verb = identity(json["verb"]);
    result.published = identity(json["published"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Activity value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["title"] = identity(value.title);
    result["object"] = ActivityObject.serialize(value.object);
    result["updated"] = identity(value.updated);
    result["actor"] = OrkutAuthorResource.serialize(value.actor);
    result["access"] = Acl.serialize(value.access);
    result["verb"] = identity(value.verb);
    result["published"] = identity(value.published);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ActivityList
class ActivityList extends IdentityHash {
  /**
 * The value of pageToken query parameter in activities.list request to get the next page, if there
 * are more to retrieve.
 */
  core.String nextPageToken;

  /** List of activities retrieved. */
  core.List<Activity> items;

  /** Identifies this resource as a collection of activities. Value: "orkut#activityList" */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static ActivityList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Activity.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Activity.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject
class ActivityObject extends IdentityHash {
  /**
 * The HTML-formatted content, suitable for display. When updating an activity's content, post the
 * changes to this property, using the value of originalContent as a starting point. If the update
 * is successful, the server adds HTML formatting and responds with this formatted content.
 */
  core.String content;

  /** The list of additional items. */
  core.List<OrkutActivityobjectsResource> items;

  /** Comments in reply to this activity. */
  ActivityObjectReplies replies;

  /**
 * The type of the object affected by the activity. Clients can use this information to style the
 * rendered activity object differently depending on the content.
 */
  core.String objectType;

  /** Parses an instance from its JSON representation. */
  static ActivityObject parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityObject();
    result.content = identity(json["content"]);
    result.items = map(OrkutActivityobjectsResource.parse)(json["items"]);
    result.replies = ActivityObjectReplies.parse(json["replies"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityObject value) {
    if (value == null) return null;
    final result = {};
    result["content"] = identity(value.content);
    result["items"] = map(OrkutActivityobjectsResource.serialize)(value.items);
    result["replies"] = ActivityObjectReplies.serialize(value.replies);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectReplies
class ActivityObjectReplies extends IdentityHash {
  /** Total number of comments. */
  core.String totalItems;

  /** The list of comments. */
  core.List<Comment> items;

  /** URL for the collection of comments in reply to this activity. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectReplies parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectReplies();
    result.totalItems = identity(json["totalItems"]);
    result.items = map(Comment.parse)(json["items"]);
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityObjectReplies value) {
    if (value == null) return null;
    final result = {};
    result["totalItems"] = identity(value.totalItems);
    result["items"] = map(Comment.serialize)(value.items);
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Badge
class Badge extends IdentityHash {
  /** The URL for the 24x24 badge logo. */
  core.String badgeSmallLogo;

  /** Identifies this resource as a badge. Value: "orkut#badge" */
  core.String kind;

  /** The description for the badge, suitable for display. */
  core.String description;

  /** The URL for the 32x32 badge sponsor logo. */
  core.String sponsorLogo;

  /** The name of the badge sponsor, suitable for display. */
  core.String sponsorName;

  /** The URL for the 64x64 badge logo. */
  core.String badgeLargeLogo;

  /** The name of the badge, suitable for display. */
  core.String caption;

  /** The URL for the badge sponsor. */
  core.String sponsorUrl;

  /** The unique ID for the badge. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Badge parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Badge();
    result.badgeSmallLogo = identity(json["badgeSmallLogo"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.sponsorLogo = identity(json["sponsorLogo"]);
    result.sponsorName = identity(json["sponsorName"]);
    result.badgeLargeLogo = identity(json["badgeLargeLogo"]);
    result.caption = identity(json["caption"]);
    result.sponsorUrl = identity(json["sponsorUrl"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Badge value) {
    if (value == null) return null;
    final result = {};
    result["badgeSmallLogo"] = identity(value.badgeSmallLogo);
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["sponsorLogo"] = identity(value.sponsorLogo);
    result["sponsorName"] = identity(value.sponsorName);
    result["badgeLargeLogo"] = identity(value.badgeLargeLogo);
    result["caption"] = identity(value.caption);
    result["sponsorUrl"] = identity(value.sponsorUrl);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .BadgeList
class BadgeList extends IdentityHash {
  /** List of badges retrieved. */
  core.List<Badge> items;

  /** Identifies this resource as a collection of badges. Value: "orkut#badgeList" */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static BadgeList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BadgeList();
    result.items = map(Badge.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BadgeList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Badge.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Comment
class Comment extends IdentityHash {
  /** Link to the original activity where this comment was posted. */
  CommentInReplyTo inReplyTo;

  /** Identifies this resource as a comment. Value: "orkut#comment" */
  core.String kind;

  /** List of resources for the comment. */
  core.List<OrkutLinkResource> links;

  /** The person who posted the comment. */
  OrkutAuthorResource actor;

  /** The content of the comment in text/html */
  core.String content;

  /** The time the comment was initially published, in RFC 3339 format. */
  core.String published;

  /** The unique ID for the comment. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Comment parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Comment();
    result.inReplyTo = CommentInReplyTo.parse(json["inReplyTo"]);
    result.kind = identity(json["kind"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.actor = OrkutAuthorResource.parse(json["actor"]);
    result.content = identity(json["content"]);
    result.published = identity(json["published"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Comment value) {
    if (value == null) return null;
    final result = {};
    result["inReplyTo"] = CommentInReplyTo.serialize(value.inReplyTo);
    result["kind"] = identity(value.kind);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["actor"] = OrkutAuthorResource.serialize(value.actor);
    result["content"] = identity(value.content);
    result["published"] = identity(value.published);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentInReplyTo
class CommentInReplyTo extends IdentityHash {
  /** Type of the post on activity stream being commented. Always text/html. */
  core.String type;

  /** Link to the post on activity stream being commented. */
  core.String href;

  /** Unique identifier of the post on activity stream being commented. */
  core.String ref;

  /**
 * Relationship between the comment and the post on activity stream being commented. Always
 * inReplyTo.
 */
  core.String rel;

  /** Parses an instance from its JSON representation. */
  static CommentInReplyTo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentInReplyTo();
    result.type = identity(json["type"]);
    result.href = identity(json["href"]);
    result.ref = identity(json["ref"]);
    result.rel = identity(json["rel"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentInReplyTo value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["href"] = identity(value.href);
    result["ref"] = identity(value.ref);
    result["rel"] = identity(value.rel);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentList
class CommentList extends IdentityHash {
  /**
 * The value of pageToken query parameter in comments.list request to get the next page, if there
 * are more to retrieve.
 */
  core.String nextPageToken;

  /** List of comments retrieved. */
  core.List<Comment> items;

  /** Identifies this resource as a collection of comments. Value: "orkut#commentList" */
  core.String kind;

  /**
 * The value of pageToken query parameter in comments.list request to get the previous page, if
 * there are more to retrieve.
 */
  core.String previousPageToken;

  /** Parses an instance from its JSON representation. */
  static CommentList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Comment.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.previousPageToken = identity(json["previousPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Comment.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["previousPageToken"] = identity(value.previousPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Community
class Community extends IdentityHash {
  /** The category of the community. */
  core.String category;

  /** Identifies this resource as a community. Value: "orkut#community" */
  core.String kind;

  /**
 * The number of users who are part of the community. This number may be approximate, so do not rely
 * on it for iteration.
 */
  core.int memberCount;

  /** The description of the community. */
  core.String description;

  /** The official language of the community. */
  core.String language;

  /** List of resources for the community. */
  core.List<OrkutLinkResource> links;

  /** The time the community was created, in RFC 3339 format. */
  core.String creationDate;

  /** The person who owns the community. */
  OrkutAuthorResource owner;

  /** The list of moderators of the community. */
  core.List<OrkutAuthorResource> moderators;

  /** The location of the community. */
  core.String location;

  /** The co-owners of the community. */
  core.List<OrkutAuthorResource> coOwners;

  /** The photo of the community. */
  core.String photoUrl;

  /** The id of the community. */
  core.int id;

  /** The name of the community. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Community parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Community();
    result.category = identity(json["category"]);
    result.kind = identity(json["kind"]);
    result.memberCount = identity(json["member_count"]);
    result.description = identity(json["description"]);
    result.language = identity(json["language"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.creationDate = identity(json["creation_date"]);
    result.owner = OrkutAuthorResource.parse(json["owner"]);
    result.moderators = map(OrkutAuthorResource.parse)(json["moderators"]);
    result.location = identity(json["location"]);
    result.coOwners = map(OrkutAuthorResource.parse)(json["co_owners"]);
    result.photoUrl = identity(json["photo_url"]);
    result.id = identity(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Community value) {
    if (value == null) return null;
    final result = {};
    result["category"] = identity(value.category);
    result["kind"] = identity(value.kind);
    result["member_count"] = identity(value.memberCount);
    result["description"] = identity(value.description);
    result["language"] = identity(value.language);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["creation_date"] = identity(value.creationDate);
    result["owner"] = OrkutAuthorResource.serialize(value.owner);
    result["moderators"] = map(OrkutAuthorResource.serialize)(value.moderators);
    result["location"] = identity(value.location);
    result["co_owners"] = map(OrkutAuthorResource.serialize)(value.coOwners);
    result["photo_url"] = identity(value.photoUrl);
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityList
class CommunityList extends IdentityHash {
  /** List of communities retrieved. */
  core.List<Community> items;

  /** Identifies this resource as a collection of communities. Value: "orkut#communityList" */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static CommunityList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityList();
    result.items = map(Community.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Community.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityMembers
class CommunityMembers extends IdentityHash {
  /** Status and permissions of the user related to the community. */
  CommunityMembershipStatus communityMembershipStatus;

  /** Description of the community member. */
  OrkutActivitypersonResource person;

  /** Kind of this item. Always orkut#communityMembers. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static CommunityMembers parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityMembers();
    result.communityMembershipStatus = CommunityMembershipStatus.parse(json["communityMembershipStatus"]);
    result.person = OrkutActivitypersonResource.parse(json["person"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityMembers value) {
    if (value == null) return null;
    final result = {};
    result["communityMembershipStatus"] = CommunityMembershipStatus.serialize(value.communityMembershipStatus);
    result["person"] = OrkutActivitypersonResource.serialize(value.person);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityMembersList
class CommunityMembersList extends IdentityHash {
  /**
 * The value of pageToken query parameter in community_members.list request to get the next page, if
 * there are more to retrieve.
 */
  core.String nextPageToken;

  /** Kind of this item. Always orkut#communityMembersList. */
  core.String kind;

  /** List of community members retrieved. */
  core.List<CommunityMembers> items;

  /**
 * The value of pageToken query parameter in community_members.list request to get the previous
 * page, if there are more to retrieve.
 */
  core.String prevPageToken;

  /**
 * The value of pageToken query parameter in community_members.list request to get the last page.
 */
  core.String lastPageToken;

  /**
 * The value of pageToken query parameter in community_members.list request to get the first page.
 */
  core.String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityMembersList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityMembersList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(CommunityMembers.parse)(json["items"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.lastPageToken = identity(json["lastPageToken"]);
    result.firstPageToken = identity(json["firstPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityMembersList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(CommunityMembers.serialize)(value.items);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["lastPageToken"] = identity(value.lastPageToken);
    result["firstPageToken"] = identity(value.firstPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityMembershipStatus
class CommunityMembershipStatus extends IdentityHash {
  /** The status of the current link between the community and the user. */
  core.String status;

  /** Whether the user is following this community. */
  core.bool isFollowing;

  /** Whether the restore operation is available for the community. */
  core.bool isRestoreAvailable;

  /** Whether the session user is a community moderator. */
  core.bool isModerator;

  /** Kind of this item. Always orkut#communityMembershipStatus. */
  core.String kind;

  /** Whether the session user is a community co-owner. */
  core.bool isCoOwner;

  /** Whether the user can create a poll in this community. */
  core.bool canCreatePoll;

  /** Whether the user can perform a shout operation in this community. */
  core.bool canShout;

  /** Whether the session user is the community owner. */
  core.bool isOwner;

  /** Whether the user can create a topic in this community. */
  core.bool canCreateTopic;

  /** Whether the take-back operation is available for the community. */
  core.bool isTakebackAvailable;

  /** Parses an instance from its JSON representation. */
  static CommunityMembershipStatus parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityMembershipStatus();
    result.status = identity(json["status"]);
    result.isFollowing = identity(json["isFollowing"]);
    result.isRestoreAvailable = identity(json["isRestoreAvailable"]);
    result.isModerator = identity(json["isModerator"]);
    result.kind = identity(json["kind"]);
    result.isCoOwner = identity(json["isCoOwner"]);
    result.canCreatePoll = identity(json["canCreatePoll"]);
    result.canShout = identity(json["canShout"]);
    result.isOwner = identity(json["isOwner"]);
    result.canCreateTopic = identity(json["canCreateTopic"]);
    result.isTakebackAvailable = identity(json["isTakebackAvailable"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityMembershipStatus value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["isFollowing"] = identity(value.isFollowing);
    result["isRestoreAvailable"] = identity(value.isRestoreAvailable);
    result["isModerator"] = identity(value.isModerator);
    result["kind"] = identity(value.kind);
    result["isCoOwner"] = identity(value.isCoOwner);
    result["canCreatePoll"] = identity(value.canCreatePoll);
    result["canShout"] = identity(value.canShout);
    result["isOwner"] = identity(value.isOwner);
    result["canCreateTopic"] = identity(value.canCreateTopic);
    result["isTakebackAvailable"] = identity(value.isTakebackAvailable);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityMessage
class CommunityMessage extends IdentityHash {
  /** The body of the message. */
  core.String body;

  /** Identifies this resource as a community message. Value: "orkut#communityMessage" */
  core.String kind;

  /** List of resources for the community message. */
  core.List<OrkutLinkResource> links;

  /** The creator of the message. If ommited, the message is annonimous. */
  OrkutAuthorResource author;

  /** The ID of the message. */
  core.String id;

  /** The timestamp of the date when the message was added, in RFC 3339 format. */
  core.String addedDate;

  /**
 * Whether this post was marked as spam by the viewer, when he/she is not the community owner or one
 * of its moderators.
 */
  core.bool isSpam;

  /** The subject of the message. */
  core.String subject;

  /** Parses an instance from its JSON representation. */
  static CommunityMessage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityMessage();
    result.body = identity(json["body"]);
    result.kind = identity(json["kind"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.author = OrkutAuthorResource.parse(json["author"]);
    result.id = identity(json["id"]);
    result.addedDate = identity(json["addedDate"]);
    result.isSpam = identity(json["isSpam"]);
    result.subject = identity(json["subject"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityMessage value) {
    if (value == null) return null;
    final result = {};
    result["body"] = identity(value.body);
    result["kind"] = identity(value.kind);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["author"] = OrkutAuthorResource.serialize(value.author);
    result["id"] = identity(value.id);
    result["addedDate"] = identity(value.addedDate);
    result["isSpam"] = identity(value.isSpam);
    result["subject"] = identity(value.subject);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityMessageList
class CommunityMessageList extends IdentityHash {
  /**
 * The value of pageToken query parameter in community_messages.list request to get the next page,
 * if there are more to retrieve.
 */
  core.String nextPageToken;

  /**
 * Identifies this resource as a collection of community messages. Value:
 * "orkut#communityMessageList"
 */
  core.String kind;

  /** List of messages retrieved. */
  core.List<CommunityMessage> items;

  /**
 * The value of pageToken query parameter in community_messages.list request to get the previous
 * page, if there are more to retrieve.
 */
  core.String prevPageToken;

  /**
 * The value of pageToken query parameter in community_messages.list request to get the last page.
 */
  core.String lastPageToken;

  /**
 * The value of pageToken query parameter in community_messages.list request to get the first page.
 */
  core.String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityMessageList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityMessageList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(CommunityMessage.parse)(json["items"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.lastPageToken = identity(json["lastPageToken"]);
    result.firstPageToken = identity(json["firstPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityMessageList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(CommunityMessage.serialize)(value.items);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["lastPageToken"] = identity(value.lastPageToken);
    result["firstPageToken"] = identity(value.firstPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityPoll
class CommunityPoll extends IdentityHash {
  /** List of resources for the community poll. */
  core.List<OrkutLinkResource> links;

  /** Whether this poll allows voting for more than one option. */
  core.bool isMultipleAnswers;

  /** The image representing the poll. Field is omitted if no image exists. */
  CommunityPollImage image;

  /** The ending date of this poll or empty if the poll doesn't have one. */
  core.String endingTime;

  /** Whether non-members of the community can vote on the poll. */
  core.bool isVotingAllowedForNonMembers;

  /**
 * Whether the user has marked this poll as spam. This only affects the poll for this user, not
 * globally.
 */
  core.bool isSpam;

  /** The total number of votes this poll has received. */
  core.int totalNumberOfVotes;

  /** The person who created the poll. */
  OrkutAuthorResource author;

  /** The poll question. */
  core.String question;

  /** The poll ID. */
  core.String id;

  /**
 * Whether this poll is restricted for members only. If a poll is open but the user can't vote on
 * it, it's been restricted to members only. This information is important to tell this case apart
 * from the one where the user can't vote simply because the poll is already closed.
 */
  core.bool isRestricted;

  /** The ID of the community. */
  core.int communityId;

  /** If user has already voted, whether his vote is publicly visible. */
  core.bool isUsersVotePublic;

  /** The date of the last update of this poll. */
  core.String lastUpdate;

  /** The poll description. */
  core.String description;

  /** List of options the user has voted on, if there are any. */
  core.List<core.int> votedOptions;

  /**
 * Whether this poll is still opened for voting. A poll is open for voting if it is not closed, the
 * user has not yet voted on it and the user has the permission to do so, which happens if he/she is
 * either a community member or the poll is open for everybody.
 */
  core.bool isOpenForVoting;

  /**
 * Whether the poll is not expired if there is an expiration date. A poll is open (that is, not
 * closed for voting) if it either is not expired or doesn't have an expiration date at all. Note
 * that just because a poll is open, it doesn't mean that the requester can vote on it.
 */
  core.bool isClosed;

  /** Whether the user has voted on this poll. */
  core.bool hasVoted;

  /** Identifies this resource as a community poll. Value: "orkut#communityPoll" */
  core.String kind;

  /** The date of creation of this poll */
  core.String creationTime;

  /** List of options of this poll. */
  core.List<OrkutCommunitypolloptionResource> options;

  /** Parses an instance from its JSON representation. */
  static CommunityPoll parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityPoll();
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.isMultipleAnswers = identity(json["isMultipleAnswers"]);
    result.image = CommunityPollImage.parse(json["image"]);
    result.endingTime = identity(json["endingTime"]);
    result.isVotingAllowedForNonMembers = identity(json["isVotingAllowedForNonMembers"]);
    result.isSpam = identity(json["isSpam"]);
    result.totalNumberOfVotes = identity(json["totalNumberOfVotes"]);
    result.author = OrkutAuthorResource.parse(json["author"]);
    result.question = identity(json["question"]);
    result.id = identity(json["id"]);
    result.isRestricted = identity(json["isRestricted"]);
    result.communityId = identity(json["communityId"]);
    result.isUsersVotePublic = identity(json["isUsersVotePublic"]);
    result.lastUpdate = identity(json["lastUpdate"]);
    result.description = identity(json["description"]);
    result.votedOptions = map(identity)(json["votedOptions"]);
    result.isOpenForVoting = identity(json["isOpenForVoting"]);
    result.isClosed = identity(json["isClosed"]);
    result.hasVoted = identity(json["hasVoted"]);
    result.kind = identity(json["kind"]);
    result.creationTime = identity(json["creationTime"]);
    result.options = map(OrkutCommunitypolloptionResource.parse)(json["options"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityPoll value) {
    if (value == null) return null;
    final result = {};
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["isMultipleAnswers"] = identity(value.isMultipleAnswers);
    result["image"] = CommunityPollImage.serialize(value.image);
    result["endingTime"] = identity(value.endingTime);
    result["isVotingAllowedForNonMembers"] = identity(value.isVotingAllowedForNonMembers);
    result["isSpam"] = identity(value.isSpam);
    result["totalNumberOfVotes"] = identity(value.totalNumberOfVotes);
    result["author"] = OrkutAuthorResource.serialize(value.author);
    result["question"] = identity(value.question);
    result["id"] = identity(value.id);
    result["isRestricted"] = identity(value.isRestricted);
    result["communityId"] = identity(value.communityId);
    result["isUsersVotePublic"] = identity(value.isUsersVotePublic);
    result["lastUpdate"] = identity(value.lastUpdate);
    result["description"] = identity(value.description);
    result["votedOptions"] = map(identity)(value.votedOptions);
    result["isOpenForVoting"] = identity(value.isOpenForVoting);
    result["isClosed"] = identity(value.isClosed);
    result["hasVoted"] = identity(value.hasVoted);
    result["kind"] = identity(value.kind);
    result["creationTime"] = identity(value.creationTime);
    result["options"] = map(OrkutCommunitypolloptionResource.serialize)(value.options);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityPollComment
class CommunityPollComment extends IdentityHash {
  /** The body of the message. */
  core.String body;

  /** Identifies this resource as a community poll comment. Value: "orkut#communityPollComment" */
  core.String kind;

  /** The date when the message was added, in RFC 3339 format. */
  core.String addedDate;

  /** The ID of the comment. */
  core.int id;

  /** The creator of the comment. */
  OrkutAuthorResource author;

  /** Parses an instance from its JSON representation. */
  static CommunityPollComment parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityPollComment();
    result.body = identity(json["body"]);
    result.kind = identity(json["kind"]);
    result.addedDate = identity(json["addedDate"]);
    result.id = identity(json["id"]);
    result.author = OrkutAuthorResource.parse(json["author"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityPollComment value) {
    if (value == null) return null;
    final result = {};
    result["body"] = identity(value.body);
    result["kind"] = identity(value.kind);
    result["addedDate"] = identity(value.addedDate);
    result["id"] = identity(value.id);
    result["author"] = OrkutAuthorResource.serialize(value.author);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityPollCommentList
class CommunityPollCommentList extends IdentityHash {
  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the next
 * page, if there are more to retrieve.
 */
  core.String nextPageToken;

  /**
 * Identifies this resource as a collection of community poll comments. Value:
 * "orkut#CommunityPollCommentList"
 */
  core.String kind;

  /** List of community poll comments retrieved. */
  core.List<CommunityPollComment> items;

  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the
 * previous page, if there are more to retrieve.
 */
  core.String prevPageToken;

  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the last
 * page.
 */
  core.String lastPageToken;

  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the first
 * page.
 */
  core.String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityPollCommentList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityPollCommentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(CommunityPollComment.parse)(json["items"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.lastPageToken = identity(json["lastPageToken"]);
    result.firstPageToken = identity(json["firstPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityPollCommentList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(CommunityPollComment.serialize)(value.items);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["lastPageToken"] = identity(value.lastPageToken);
    result["firstPageToken"] = identity(value.firstPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema CommunityPoll.CommunityPollImage
class CommunityPollImage extends IdentityHash {
  /** A URL that points to an image of the poll. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static CommunityPollImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityPollImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityPollImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityPollList
class CommunityPollList extends IdentityHash {
  /**
 * The value of pageToken query parameter in community_polls.list request to get the next page, if
 * there are more to retrieve.
 */
  core.String nextPageToken;

  /**
 * Identifies this resource as a collection of community polls. Value: "orkut#communityPollList"
 */
  core.String kind;

  /** List of community polls retrieved. */
  core.List<CommunityPoll> items;

  /**
 * The value of pageToken query parameter in community_polls.list request to get the previous page,
 * if there are more to retrieve.
 */
  core.String prevPageToken;

  /** The value of pageToken query parameter in community_polls.list request to get the last page. */
  core.String lastPageToken;

  /**
 * The value of pageToken query parameter in community_polls.list request to get the first page.
 */
  core.String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityPollList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityPollList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(CommunityPoll.parse)(json["items"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.lastPageToken = identity(json["lastPageToken"]);
    result.firstPageToken = identity(json["firstPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityPollList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(CommunityPoll.serialize)(value.items);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["lastPageToken"] = identity(value.lastPageToken);
    result["firstPageToken"] = identity(value.firstPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityPollVote
class CommunityPollVote extends IdentityHash {
  /** Identifies this resource as a community poll vote. Value: "orkut#communityPollVote" */
  core.String kind;

  /** The ids of the voted options. */
  core.List<core.int> optionIds;

  /** Whether this vote is visible to other users or not. */
  core.bool isVotevisible;

  /** Parses an instance from its JSON representation. */
  static CommunityPollVote parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityPollVote();
    result.kind = identity(json["kind"]);
    result.optionIds = map(identity)(json["optionIds"]);
    result.isVotevisible = identity(json["isVotevisible"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityPollVote value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["optionIds"] = map(identity)(value.optionIds);
    result["isVotevisible"] = identity(value.isVotevisible);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityTopic
class CommunityTopic extends IdentityHash {
  /** The body of the topic. */
  core.String body;

  /** The timestamp of the last update, in RFC 3339 format. */
  core.String lastUpdate;

  /** Identifies this resource as a community topic. Value: "orkut#communityTopic" */
  core.String kind;

  /** List of resources for the community. */
  core.List<OrkutLinkResource> links;

  /** The creator of the topic. */
  OrkutAuthorResource author;

  /** The title of the topic. */
  core.String title;

  /** Most recent messages. */
  core.List<CommunityMessage> messages;

  /** Snippet of the last message posted on this topic. */
  core.String latestMessageSnippet;

  /** Whether the topic is closed for new messages. */
  core.bool isClosed;

  /** The total number of replies this topic has received. */
  core.int numberOfReplies;

  /** The ID of the topic. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static CommunityTopic parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityTopic();
    result.body = identity(json["body"]);
    result.lastUpdate = identity(json["lastUpdate"]);
    result.kind = identity(json["kind"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.author = OrkutAuthorResource.parse(json["author"]);
    result.title = identity(json["title"]);
    result.messages = map(CommunityMessage.parse)(json["messages"]);
    result.latestMessageSnippet = identity(json["latestMessageSnippet"]);
    result.isClosed = identity(json["isClosed"]);
    result.numberOfReplies = identity(json["numberOfReplies"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityTopic value) {
    if (value == null) return null;
    final result = {};
    result["body"] = identity(value.body);
    result["lastUpdate"] = identity(value.lastUpdate);
    result["kind"] = identity(value.kind);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["author"] = OrkutAuthorResource.serialize(value.author);
    result["title"] = identity(value.title);
    result["messages"] = map(CommunityMessage.serialize)(value.messages);
    result["latestMessageSnippet"] = identity(value.latestMessageSnippet);
    result["isClosed"] = identity(value.isClosed);
    result["numberOfReplies"] = identity(value.numberOfReplies);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommunityTopicList
class CommunityTopicList extends IdentityHash {
  /**
 * The value of pageToken query parameter in community_topic.list request to get the next page, if
 * there are more to retrieve.
 */
  core.String nextPageToken;

  /**
 * Identifies this resource as a collection of community topics. Value: "orkut#communityTopicList"
 */
  core.String kind;

  /** List of topics retrieved. */
  core.List<CommunityTopic> items;

  /**
 * The value of pageToken query parameter in community_topic.list request to get the previous page,
 * if there are more to retrieve.
 */
  core.String prevPageToken;

  /** The value of pageToken query parameter in community_topic.list request to get the last page. */
  core.String lastPageToken;

  /**
 * The value of pageToken query parameter in community_topic.list request to get the first page.
 */
  core.String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityTopicList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommunityTopicList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(CommunityTopic.parse)(json["items"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.lastPageToken = identity(json["lastPageToken"]);
    result.firstPageToken = identity(json["firstPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommunityTopicList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(CommunityTopic.serialize)(value.items);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["lastPageToken"] = identity(value.lastPageToken);
    result["firstPageToken"] = identity(value.firstPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Counters
class Counters extends IdentityHash {
  /** List of counters retrieved. */
  core.List<OrkutCounterResource> items;

  /** Identifies this resource as a collection of counters. Value: "orkut#counters" */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Counters parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Counters();
    result.items = map(OrkutCounterResource.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Counters value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(OrkutCounterResource.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutActivityobjectsResource
class OrkutActivityobjectsResource extends IdentityHash {
  /** The title of the object. */
  core.String displayName;

  /** Links to other resources related to this object. */
  core.List<OrkutLinkResource> links;

  /** The community which is related with this activity, e.g. a joined community. */
  Community community;

  /**
 * The HTML-formatted content, suitable for display. When updating an activity's content, post the
 * changes to this property, using the value of originalContent as a starting point. If the update
 * is successful, the server adds HTML formatting and responds with this formatted content.
 */
  core.String content;

  /** The person who is related with this activity, e.g. an Added User. */
  OrkutActivitypersonResource person;

  /** The ID for the object. */
  core.String id;

  /** The object type. */
  core.String objectType;

  /** Parses an instance from its JSON representation. */
  static OrkutActivityobjectsResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutActivityobjectsResource();
    result.displayName = identity(json["displayName"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    result.community = Community.parse(json["community"]);
    result.content = identity(json["content"]);
    result.person = OrkutActivitypersonResource.parse(json["person"]);
    result.id = identity(json["id"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutActivityobjectsResource value) {
    if (value == null) return null;
    final result = {};
    result["displayName"] = identity(value.displayName);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    result["community"] = Community.serialize(value.community);
    result["content"] = identity(value.content);
    result["person"] = OrkutActivitypersonResource.serialize(value.person);
    result["id"] = identity(value.id);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutActivitypersonResource
class OrkutActivitypersonResource extends IdentityHash {
  /** An object that encapsulates the individual components of a person's name. */
  OrkutActivitypersonResourceName name;

  /**
 * The person's profile url. This is adapted from Google+ and was originaly introduced as extra
 * OpenSocial convenience fields.
 */
  core.String url;

  /** The person's gender. Values include "male", "female", and "other". */
  core.String gender;

  /**
 * The person's profile photo. This is adapted from Google+ and was originaly introduced as extra
 * OpenSocial convenience fields.
 */
  OrkutActivitypersonResourceImage image;

  /** The person's date of birth, represented as YYYY-MM-DD. */
  core.String birthday;

  /** The person's opensocial ID. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static OrkutActivitypersonResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutActivitypersonResource();
    result.name = OrkutActivitypersonResourceName.parse(json["name"]);
    result.url = identity(json["url"]);
    result.gender = identity(json["gender"]);
    result.image = OrkutActivitypersonResourceImage.parse(json["image"]);
    result.birthday = identity(json["birthday"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutActivitypersonResource value) {
    if (value == null) return null;
    final result = {};
    result["name"] = OrkutActivitypersonResourceName.serialize(value.name);
    result["url"] = identity(value.url);
    result["gender"] = identity(value.gender);
    result["image"] = OrkutActivitypersonResourceImage.serialize(value.image);
    result["birthday"] = identity(value.birthday);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema OrkutActivitypersonResource.OrkutActivitypersonResourceImage
class OrkutActivitypersonResourceImage extends IdentityHash {
  /** The URL of the person's profile photo. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static OrkutActivitypersonResourceImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutActivitypersonResourceImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutActivitypersonResourceImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema OrkutActivitypersonResource.OrkutActivitypersonResourceName
class OrkutActivitypersonResourceName extends IdentityHash {
  /** The given name (first name) of this person. */
  core.String givenName;

  /** The family name (last name) of this person. */
  core.String familyName;

  /** Parses an instance from its JSON representation. */
  static OrkutActivitypersonResourceName parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutActivitypersonResourceName();
    result.givenName = identity(json["givenName"]);
    result.familyName = identity(json["familyName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutActivitypersonResourceName value) {
    if (value == null) return null;
    final result = {};
    result["givenName"] = identity(value.givenName);
    result["familyName"] = identity(value.familyName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutAuthorResource
class OrkutAuthorResource extends IdentityHash {
  /** The URL of the author who posted the comment [not yet implemented] */
  core.String url;

  /** Image data about the author. */
  OrkutAuthorResourceImage image;

  /** The name of the author, suitable for display. */
  core.String displayName;

  /** Unique identifier of the person who posted the comment. This is the person's OpenSocial ID. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static OrkutAuthorResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutAuthorResource();
    result.url = identity(json["url"]);
    result.image = OrkutAuthorResourceImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutAuthorResource value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    result["image"] = OrkutAuthorResourceImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema OrkutAuthorResource.OrkutAuthorResourceImage
class OrkutAuthorResourceImage extends IdentityHash {
  /** A URL that points to a thumbnail photo of the author. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static OrkutAuthorResourceImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutAuthorResourceImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutAuthorResourceImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutCommunitypolloptionResource
class OrkutCommunitypolloptionResource extends IdentityHash {
  /** Image data about the poll option. Field is omitted if no image exists. */
  OrkutCommunitypolloptionResourceImage image;

  /** The poll option ID */
  core.int optionId;

  /** The option description. */
  core.String description;

  /** The total number of votes that this option received. */
  core.int numberOfVotes;

  /** Parses an instance from its JSON representation. */
  static OrkutCommunitypolloptionResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutCommunitypolloptionResource();
    result.image = OrkutCommunitypolloptionResourceImage.parse(json["image"]);
    result.optionId = identity(json["optionId"]);
    result.description = identity(json["description"]);
    result.numberOfVotes = identity(json["numberOfVotes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutCommunitypolloptionResource value) {
    if (value == null) return null;
    final result = {};
    result["image"] = OrkutCommunitypolloptionResourceImage.serialize(value.image);
    result["optionId"] = identity(value.optionId);
    result["description"] = identity(value.description);
    result["numberOfVotes"] = identity(value.numberOfVotes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema OrkutCommunitypolloptionResource.OrkutCommunitypolloptionResourceImage
class OrkutCommunitypolloptionResourceImage extends IdentityHash {
  /** A URL that points to an image of the poll question. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static OrkutCommunitypolloptionResourceImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutCommunitypolloptionResourceImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutCommunitypolloptionResourceImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutCounterResource
class OrkutCounterResource extends IdentityHash {
  /** The number of resources on the counted collection. */
  core.int total;

  /** Link to the collection being counted. */
  OrkutLinkResource link;

  /**
 * The name of the counted collection. Currently supported collections are: - scraps - The scraps of
 * the user. - photos - The photos of the user. - videos - The videos of the user. -
 * pendingTestimonials - The pending testimonials of the user.
 */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static OrkutCounterResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutCounterResource();
    result.total = identity(json["total"]);
    result.link = OrkutLinkResource.parse(json["link"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutCounterResource value) {
    if (value == null) return null;
    final result = {};
    result["total"] = identity(value.total);
    result["link"] = OrkutLinkResource.serialize(value.link);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutLinkResource
class OrkutLinkResource extends IdentityHash {
  /** URL of the link. */
  core.String href;

  /** Media type of the link. */
  core.String type;

  /** Relation between the resource and the parent object. */
  core.String rel;

  /** Title of the link. */
  core.String title;

  /** Parses an instance from its JSON representation. */
  static OrkutLinkResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OrkutLinkResource();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    result.rel = identity(json["rel"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OrkutLinkResource value) {
    if (value == null) return null;
    final result = {};
    result["href"] = identity(value.href);
    result["type"] = identity(value.type);
    result["rel"] = identity(value.rel);
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Visibility
class Visibility extends IdentityHash {
  /** Identifies this resource as a visibility item. Value: "orkut#visibility" */
  core.String kind;

  /**
 * The visibility of the resource. Possible values are: - default: not hidden by the user - hidden:
 * hidden
 */
  core.String visibility;

  /** List of resources for the visibility item. */
  core.List<OrkutLinkResource> links;

  /** Parses an instance from its JSON representation. */
  static Visibility parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Visibility();
    result.kind = identity(json["kind"]);
    result.visibility = identity(json["visibility"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Visibility value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["visibility"] = identity(value.visibility);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum OrkutApi.Alt
class OrkutApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final OrkutApiAlt JSON = const OrkutApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<OrkutApiAlt> values = const <OrkutApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <OrkutApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static OrkutApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const OrkutApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

