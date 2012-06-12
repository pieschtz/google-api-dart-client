#library("orkut");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API OrkutApi
/**
 * Lets you manage activities, comments and badges in Orkut. More stuff coming in time.
 */
class OrkutApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
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
  OrkutApiAlt alt;


  OrkutApi([this.baseUrl = "https://www.googleapis.com/orkut/v2/", this.applicationName]) { 
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
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}orkut/v2/20120223 google-api-dart-client/${clientVersion}";
  }
}

// Resource .CommunityMembersResource
class CommunityMembersResource {
  final OrkutApi _$service;
  
  CommunityMembersResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityMembersResource.Insert
  /**
   * Makes the user join a community.
   * [communityId] ID of the community.
   * [userId] ID of the user.
   */
  Future<CommunityMembers> insert(int communityId, String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/members/{userId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityMembers>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityMembers.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityMembersResource.Get
  /**
   * Retrieves the relationship between a user and a community.
   * [communityId] ID of the community.
   * [userId] ID of the user.
   */
  Future<CommunityMembers> get(int communityId, String userId, [String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/members/{userId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityMembers>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityMembers.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityMembersResource.List
  /**
   * Lists members of a community. Use the pagination tokens to retrieve the full list; do not rely on
   * the member count available in the community profile information to know when to stop iterating,
   * as that count may be approximate.
   * [communityId] The ID of the community whose members will be listed.
   */
  Future<CommunityMembersList> list(int communityId, [String pageToken = UNSPECIFIED, bool friendsOnly = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/members").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityMembersList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityMembersList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityMembersResource.Delete
  /**
   * Makes the user leave a community.
   * [communityId] ID of the community.
   * [userId] ID of the user.
   */
  Future delete(int communityId, String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/members/{userId}").generate($pathParams, $queryParams);
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

// Resource .ActivitiesResource
class ActivitiesResource {
  final OrkutApi _$service;
  
  ActivitiesResource._internal(OrkutApi $service) : _$service = $service;

  // Method ActivitiesResource.List
  /**
   * Retrieves a list of activities.
   * [userId] The ID of the user whose activities will be listed. Can be me to refer to the viewer (i.e. the
   *        authenticated user).
   * [collection] The collection of activities to list.
   */
  Future<ActivityList> list(String userId, ActivitiesResourceListCollection collection, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}/activities/{collection}").generate($pathParams, $queryParams);
    final $completer = new Completer<ActivityList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = ActivityList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ActivitiesResource.Delete
  /**
   * Deletes an existing activity, if the access controls allow it.
   * [activityId] ID of the activity to remove.
   */
  Future delete(String activityId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}").generate($pathParams, $queryParams);
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

// Enum ActivitiesResource.List.Collection
class ActivitiesResourceListCollection implements Hashable {
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
  static final List<ActivitiesResourceListCollection> values = const <ActivitiesResourceListCollection>[
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
  static ActivitiesResourceListCollection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const ActivitiesResourceListCollection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Collection".hashCode();
}

// Resource .CommunityPollCommentsResource
class CommunityPollCommentsResource {
  final OrkutApi _$service;
  
  CommunityPollCommentsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityPollCommentsResource.Insert
  /**
   * Adds a comment on a community poll.
   * [communityId] The ID of the community whose poll is being commented.
   * [pollId] The ID of the poll being commented.
   * [content] the CommunityPollComment
   */
  Future<CommunityPollComment> insert(int communityId, String pollId, CommunityPollComment content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/polls/{pollId}/comments").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityPollComment>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityPollComment.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityPollCommentsResource.List
  /**
   * Retrieves the comments of a community poll.
   * [communityId] The ID of the community whose poll is having its comments listed.
   * [pollId] The ID of the community whose polls will be listed.
   */
  Future<CommunityPollCommentList> list(int communityId, String pollId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/polls/{pollId}/comments").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityPollCommentList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityPollCommentList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CommunityPollsResource
class CommunityPollsResource {
  final OrkutApi _$service;
  
  CommunityPollsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityPollsResource.List
  /**
   * Retrieves the polls of a community.
   * [communityId] The ID of the community which polls will be listed.
   */
  Future<CommunityPollList> list(int communityId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/polls").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityPollList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityPollList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityPollsResource.Get
  /**
   * Retrieves one specific poll of a community.
   * [communityId] The ID of the community for whose poll will be retrieved.
   * [pollId] The ID of the poll to get.
   */
  Future<CommunityPoll> get(int communityId, String pollId, [String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/polls/{pollId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityPoll>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityPoll.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CommunityMessagesResource
class CommunityMessagesResource {
  final OrkutApi _$service;
  
  CommunityMessagesResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityMessagesResource.Insert
  /**
   * Adds a message to a given community topic.
   * [communityId] The ID of the community the message should be added to.
   * [topicId] The ID of the topic the message should be added to.
   * [content] the CommunityMessage
   */
  Future<CommunityMessage> insert(int communityId, String topicId, CommunityMessage content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics/{topicId}/messages").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityMessage>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityMessage.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityMessagesResource.List
  /**
   * Retrieves the messages of a topic of a community.
   * [communityId] The ID of the community which messages will be listed.
   * [topicId] The ID of the topic which messages will be listed.
   */
  Future<CommunityMessageList> list(int communityId, String topicId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics/{topicId}/messages").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityMessageList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityMessageList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityMessagesResource.Delete
  /**
   * Moves a message of the community to the trash folder.
   * [communityId] The ID of the community whose message will be moved to the trash folder.
   * [topicId] The ID of the topic whose message will be moved to the trash folder.
   * [messageId] The ID of the message to be moved to the trash folder.
   */
  Future delete(int communityId, String topicId, String messageId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics/{topicId}/messages/{messageId}").generate($pathParams, $queryParams);
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

// Resource .CommunityTopicsResource
class CommunityTopicsResource {
  final OrkutApi _$service;
  
  CommunityTopicsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityTopicsResource.Insert
  /**
   * Adds a topic to a given community.
   * [communityId] The ID of the community the topic should be added to.
   * [content] the CommunityTopic
   */
  Future<CommunityTopic> insert(int communityId, CommunityTopic content, [bool isShout = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityTopic>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityTopic.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityTopicsResource.Get
  /**
   * Retrieves a topic of a community.
   * [communityId] The ID of the community whose topic will be retrieved.
   * [topicId] The ID of the topic to get.
   */
  Future<CommunityTopic> get(int communityId, String topicId, [String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics/{topicId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityTopic>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityTopic.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityTopicsResource.List
  /**
   * Retrieves the topics of a community.
   * [communityId] The ID of the community which topics will be listed.
   */
  Future<CommunityTopicList> list(int communityId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityTopicList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityTopicList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityTopicsResource.Delete
  /**
   * Moves a topic of the community to the trash folder.
   * [communityId] The ID of the community whose topic will be moved to the trash folder.
   * [topicId] The ID of the topic to be moved to the trash folder.
   */
  Future delete(int communityId, String topicId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/topics/{topicId}").generate($pathParams, $queryParams);
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

// Resource .CommentsResource
class CommentsResource {
  final OrkutApi _$service;
  
  CommentsResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommentsResource.Insert
  /**
   * Inserts a new comment to an activity.
   * [activityId] The ID of the activity to contain the new comment.
   * [content] the Comment
   */
  Future<Comment> insert(String activityId, Comment content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/comments").generate($pathParams, $queryParams);
    final $completer = new Completer<Comment>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Comment.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommentsResource.Get
  /**
   * Retrieves an existing comment.
   * [commentId] ID of the comment to get.
   */
  Future<Comment> get(String commentId, [String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "comments/{commentId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Comment>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Comment.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommentsResource.List
  /**
   * Retrieves a list of comments, possibly filtered.
   * [activityId] The ID of the activity containing the comments.
   */
  Future<CommentList> list(String activityId, [CommentsResourceListOrderBy orderBy = UNSPECIFIED, String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/comments").generate($pathParams, $queryParams);
    final $completer = new Completer<CommentList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommentList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommentsResource.Delete
  /**
   * Deletes an existing comment.
   * [commentId] ID of the comment to remove.
   */
  Future delete(String commentId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "comments/{commentId}").generate($pathParams, $queryParams);
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

// Enum CommentsResource.List.OrderBy
class CommentsResourceListOrderBy implements Hashable {
  /** Use ascending sort order. */
  static final CommentsResourceListOrderBy ASCENDING = const CommentsResourceListOrderBy._internal("ascending", 0);
  /** Use descending sort order. */
  static final CommentsResourceListOrderBy DESCENDING = const CommentsResourceListOrderBy._internal("descending", 1);

  /** All values of this enumeration */
  static final List<CommentsResourceListOrderBy> values = const <CommentsResourceListOrderBy>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CommentsResourceListOrderBy>{ 
    "ascending": ASCENDING,
    "descending": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CommentsResourceListOrderBy valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CommentsResourceListOrderBy._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Resource .AclResource
class AclResource {
  final OrkutApi _$service;
  
  AclResource._internal(OrkutApi $service) : _$service = $service;

  // Method AclResource.Delete
  /**
   * Excludes an element from the ACL of the activity.
   * [activityId] ID of the activity.
   * [userId] ID of the user to be removed from the activity.
   */
  Future delete(String activityId, String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/acl/{userId}").generate($pathParams, $queryParams);
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

// Resource .CommunityRelatedResource
class CommunityRelatedResource {
  final OrkutApi _$service;
  
  CommunityRelatedResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityRelatedResource.List
  /**
   * Retrieves the communities related to another one.
   * [communityId] The ID of the community whose related communities will be listed.
   */
  Future<CommunityList> list(int communityId, [String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/related").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .ScrapsResource
class ScrapsResource {
  final OrkutApi _$service;
  
  ScrapsResource._internal(OrkutApi $service) : _$service = $service;

  // Method ScrapsResource.Insert
  /**
   * Creates a new scrap.
   * [content] the Activity
   */
  Future<Activity> insert(Activity content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/scraps").generate($pathParams, $queryParams);
    final $completer = new Completer<Activity>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Activity.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CommunityPollVotesResource
class CommunityPollVotesResource {
  final OrkutApi _$service;
  
  CommunityPollVotesResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityPollVotesResource.Insert
  /**
   * Votes on a community poll.
   * [communityId] The ID of the community whose poll is being voted.
   * [pollId] The ID of the poll being voted.
   * [content] the CommunityPollVote
   */
  Future<CommunityPollVote> insert(int communityId, String pollId, CommunityPollVote content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/polls/{pollId}/votes").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityPollVote>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityPollVote.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CommunitiesResource
class CommunitiesResource {
  final OrkutApi _$service;
  
  CommunitiesResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunitiesResource.List
  /**
   * Retrieves the list of communities the current user is a member of.
   * [userId] The ID of the user whose communities will be listed. Can be me to refer to caller.
   */
  Future<CommunityList> list(String userId, [CommunitiesResourceListOrderBy orderBy = UNSPECIFIED, int maxResults = UNSPECIFIED, String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}/communities").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunitiesResource.Get
  /**
   * Retrieves the basic information (aka. profile) of a community.
   * [communityId] The ID of the community to get.
   */
  Future<Community> get(int communityId, [String hl = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Community>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Community.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum CommunitiesResource.List.OrderBy
class CommunitiesResourceListOrderBy implements Hashable {
  /** Returns the communities sorted by a fixed, natural order. */
  static final CommunitiesResourceListOrderBy ID = const CommunitiesResourceListOrderBy._internal("id", 0);
  /**
 * Returns the communities ranked accordingly to how they are displayed on the orkut web
 * application.
 */
  static final CommunitiesResourceListOrderBy RANKED = const CommunitiesResourceListOrderBy._internal("ranked", 1);

  /** All values of this enumeration */
  static final List<CommunitiesResourceListOrderBy> values = const <CommunitiesResourceListOrderBy>[
    ID,
    RANKED,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CommunitiesResourceListOrderBy>{ 
    "id": ID,
    "ranked": RANKED,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CommunitiesResourceListOrderBy valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CommunitiesResourceListOrderBy._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Resource .CommunityFollowResource
class CommunityFollowResource {
  final OrkutApi _$service;
  
  CommunityFollowResource._internal(OrkutApi $service) : _$service = $service;

  // Method CommunityFollowResource.Insert
  /**
   * Adds a user as a follower of a community.
   * [communityId] ID of the community.
   * [userId] ID of the user.
   */
  Future<CommunityMembers> insert(int communityId, String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/followers/{userId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CommunityMembers>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommunityMembers.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommunityFollowResource.Delete
  /**
   * Removes a user from the followers of a community.
   * [communityId] ID of the community.
   * [userId] ID of the user.
   */
  Future delete(int communityId, String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "communities/{communityId}/followers/{userId}").generate($pathParams, $queryParams);
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

// Resource .ActivityVisibilityResource
class ActivityVisibilityResource {
  final OrkutApi _$service;
  
  ActivityVisibilityResource._internal(OrkutApi $service) : _$service = $service;

  // Method ActivityVisibilityResource.Patch
  /**
   * Updates the visibility of an existing activity. This method supports patch semantics.
   * [activityId] ID of the activity.
   * [content] the Visibility
   */
  Future<Visibility> patch(String activityId, Visibility content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/visibility").generate($pathParams, $queryParams);
    final $completer = new Completer<Visibility>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Visibility.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ActivityVisibilityResource.Update
  /**
   * Updates the visibility of an existing activity.
   * [activityId] ID of the activity.
   * [content] the Visibility
   */
  Future<Visibility> update(String activityId, Visibility content) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/visibility").generate($pathParams, $queryParams);
    final $completer = new Completer<Visibility>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Visibility.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ActivityVisibilityResource.Get
  /**
   * Gets the visibility of an existing activity.
   * [activityId] ID of the activity to get the visibility.
   */
  Future<Visibility> get(String activityId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/visibility").generate($pathParams, $queryParams);
    final $completer = new Completer<Visibility>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Visibility.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .BadgesResource
class BadgesResource {
  final OrkutApi _$service;
  
  BadgesResource._internal(OrkutApi $service) : _$service = $service;

  // Method BadgesResource.List
  /**
   * Retrieves the list of visible badges of a user.
   * [userId] The id of the user whose badges will be listed. Can be me to refer to caller.
   */
  Future<BadgeList> list(String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}/badges").generate($pathParams, $queryParams);
    final $completer = new Completer<BadgeList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = BadgeList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method BadgesResource.Get
  /**
   * Retrieves a badge from a user.
   * [userId] The ID of the user whose badges will be listed. Can be me to refer to caller.
   * [badgeId] The ID of the badge that will be retrieved.
   */
  Future<Badge> get(String userId, String badgeId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}/badges/{badgeId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Badge>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Badge.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CountersResource
class CountersResource {
  final OrkutApi _$service;
  
  CountersResource._internal(OrkutApi $service) : _$service = $service;

  // Method CountersResource.List
  /**
   * Retrieves the counters of a user.
   * [userId] The ID of the user whose counters will be listed. Can be me to refer to caller.
   */
  Future<Counters> list(String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}/counters").generate($pathParams, $queryParams);
    final $completer = new Completer<Counters>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Counters.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .Acl
class Acl extends IdentityHash {
  /** The list of ACL entries. */
  List<AclItems> items;

  /** Identifies this resource as an access control list. Value: "orkut#acl" */
  String kind;

  /** Human readable description of the access granted. */
  String description;

  /** The total count of participants of the parent resource. */
  int totalParticipants;

  /** Parses an instance from its JSON representation. */
  static Acl parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Acl();
    result.items = map(AclItems.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.totalParticipants = identity(json["totalParticipants"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Acl value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String type;

  /**
 * The ID of the entity. For entities of type "person" or "circle", this is the ID of the resource.
 * For other types, this will be unset.
 */
  String id;

  /** Parses an instance from its JSON representation. */
  static AclItems parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AclItems();
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AclItems value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Activity
class Activity extends IdentityHash {
  /** The kind of activity. Always orkut#activity. */
  String kind;

  /** Links to resources related to this activity. */
  List<OrkutLinkResource> links;

  /** Title of the activity. */
  String title;

  /** The activity's object. */
  ActivityObject object;

  /** The time at which the activity was last updated. */
  String updated;

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
  String verb;

  /** The time at which the activity was initially published. */
  String published;

  /** The ID for the activity. */
  String id;

  /** Parses an instance from its JSON representation. */
  static Activity parse(Map<String, Object> json) {
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
  static Object serialize(Activity value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /** List of activities retrieved. */
  List<Activity> items;

  /** Identifies this resource as a collection of activities. Value: "orkut#activityList" */
  String kind;

  /** Parses an instance from its JSON representation. */
  static ActivityList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Activity.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String content;

  /** The list of additional items. */
  List<OrkutActivityobjectsResource> items;

  /** Comments in reply to this activity. */
  ActivityObjectReplies replies;

  /**
 * The type of the object affected by the activity. Clients can use this information to style the
 * rendered activity object differently depending on the content.
 */
  String objectType;

  /** Parses an instance from its JSON representation. */
  static ActivityObject parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObject();
    result.content = identity(json["content"]);
    result.items = map(OrkutActivityobjectsResource.parse)(json["items"]);
    result.replies = ActivityObjectReplies.parse(json["replies"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObject value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String totalItems;

  /** The list of comments. */
  List<Comment> items;

  /** URL for the collection of comments in reply to this activity. */
  String url;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectReplies parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectReplies();
    result.totalItems = identity(json["totalItems"]);
    result.items = map(Comment.parse)(json["items"]);
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectReplies value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String badgeSmallLogo;

  /** Identifies this resource as a badge. Value: "orkut#badge" */
  String kind;

  /** The description for the badge, suitable for display. */
  String description;

  /** The URL for the 32x32 badge sponsor logo. */
  String sponsorLogo;

  /** The name of the badge sponsor, suitable for display. */
  String sponsorName;

  /** The URL for the 64x64 badge logo. */
  String badgeLargeLogo;

  /** The name of the badge, suitable for display. */
  String caption;

  /** The URL for the badge sponsor. */
  String sponsorUrl;

  /** The unique ID for the badge. */
  String id;

  /** Parses an instance from its JSON representation. */
  static Badge parse(Map<String, Object> json) {
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
  static Object serialize(Badge value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<Badge> items;

  /** Identifies this resource as a collection of badges. Value: "orkut#badgeList" */
  String kind;

  /** Parses an instance from its JSON representation. */
  static BadgeList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BadgeList();
    result.items = map(Badge.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BadgeList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** List of resources for the comment. */
  List<OrkutLinkResource> links;

  /** The person who posted the comment. */
  OrkutAuthorResource actor;

  /** The content of the comment in text/html */
  String content;

  /** The time the comment was initially published, in RFC 3339 format. */
  String published;

  /** The unique ID for the comment. */
  String id;

  /** Parses an instance from its JSON representation. */
  static Comment parse(Map<String, Object> json) {
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
  static Object serialize(Comment value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String type;

  /** Link to the post on activity stream being commented. */
  String href;

  /** Unique identifier of the post on activity stream being commented. */
  String ref;

  /**
 * Relationship between the comment and the post on activity stream being commented. Always
 * inReplyTo.
 */
  String rel;

  /** Parses an instance from its JSON representation. */
  static CommentInReplyTo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentInReplyTo();
    result.type = identity(json["type"]);
    result.href = identity(json["href"]);
    result.ref = identity(json["ref"]);
    result.rel = identity(json["rel"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentInReplyTo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /** List of comments retrieved. */
  List<Comment> items;

  /** Identifies this resource as a collection of comments. Value: "orkut#commentList" */
  String kind;

  /**
 * The value of pageToken query parameter in comments.list request to get the previous page, if
 * there are more to retrieve.
 */
  String previousPageToken;

  /** Parses an instance from its JSON representation. */
  static CommentList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Comment.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.previousPageToken = identity(json["previousPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String category;

  /** Identifies this resource as a community. Value: "orkut#community" */
  String kind;

  /**
 * The number of users who are part of the community. This number may be approximate, so do not rely
 * on it for iteration.
 */
  int memberCount;

  /** The description of the community. */
  String description;

  /** The official language of the community. */
  String language;

  /** List of resources for the community. */
  List<OrkutLinkResource> links;

  /** The time the community was created, in RFC 3339 format. */
  String creationDate;

  /** The person who owns the community. */
  OrkutAuthorResource owner;

  /** The list of moderators of the community. */
  List<OrkutAuthorResource> moderators;

  /** The location of the community. */
  String location;

  /** The co-owners of the community. */
  List<OrkutAuthorResource> coOwners;

  /** The photo of the community. */
  String photoUrl;

  /** The id of the community. */
  int id;

  /** The name of the community. */
  String name;

  /** Parses an instance from its JSON representation. */
  static Community parse(Map<String, Object> json) {
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
  static Object serialize(Community value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<Community> items;

  /** Identifies this resource as a collection of communities. Value: "orkut#communityList" */
  String kind;

  /** Parses an instance from its JSON representation. */
  static CommunityList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommunityList();
    result.items = map(Community.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommunityList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** Parses an instance from its JSON representation. */
  static CommunityMembers parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommunityMembers();
    result.communityMembershipStatus = CommunityMembershipStatus.parse(json["communityMembershipStatus"]);
    result.person = OrkutActivitypersonResource.parse(json["person"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommunityMembers value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /** Kind of this item. Always orkut#communityMembersList. */
  String kind;

  /** List of community members retrieved. */
  List<CommunityMembers> items;

  /**
 * The value of pageToken query parameter in community_members.list request to get the previous
 * page, if there are more to retrieve.
 */
  String prevPageToken;

  /**
 * The value of pageToken query parameter in community_members.list request to get the last page.
 */
  String lastPageToken;

  /**
 * The value of pageToken query parameter in community_members.list request to get the first page.
 */
  String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityMembersList parse(Map<String, Object> json) {
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
  static Object serialize(CommunityMembersList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String status;

  /** Whether the user is following this community. */
  bool isFollowing;

  /** Whether the restore operation is available for the community. */
  bool isRestoreAvailable;

  /** Whether the session user is a community moderator. */
  bool isModerator;

  /** Kind of this item. Always orkut#communityMembershipStatus. */
  String kind;

  /** Whether the session user is a community co-owner. */
  bool isCoOwner;

  /** Whether the user can create a poll in this community. */
  bool canCreatePoll;

  /** Whether the user can perform a shout operation in this community. */
  bool canShout;

  /** Whether the session user is the community owner. */
  bool isOwner;

  /** Whether the user can create a topic in this community. */
  bool canCreateTopic;

  /** Whether the take-back operation is available for the community. */
  bool isTakebackAvailable;

  /** Parses an instance from its JSON representation. */
  static CommunityMembershipStatus parse(Map<String, Object> json) {
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
  static Object serialize(CommunityMembershipStatus value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String body;

  /** Identifies this resource as a community message. Value: "orkut#communityMessage" */
  String kind;

  /** List of resources for the community message. */
  List<OrkutLinkResource> links;

  /** The creator of the message. If ommited, the message is annonimous. */
  OrkutAuthorResource author;

  /** The ID of the message. */
  String id;

  /** The timestamp of the date when the message was added, in RFC 3339 format. */
  String addedDate;

  /**
 * Whether this post was marked as spam by the viewer, when he/she is not the community owner or one
 * of its moderators.
 */
  bool isSpam;

  /** The subject of the message. */
  String subject;

  /** Parses an instance from its JSON representation. */
  static CommunityMessage parse(Map<String, Object> json) {
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
  static Object serialize(CommunityMessage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /**
 * Identifies this resource as a collection of community messages. Value:
 * "orkut#communityMessageList"
 */
  String kind;

  /** List of messages retrieved. */
  List<CommunityMessage> items;

  /**
 * The value of pageToken query parameter in community_messages.list request to get the previous
 * page, if there are more to retrieve.
 */
  String prevPageToken;

  /**
 * The value of pageToken query parameter in community_messages.list request to get the last page.
 */
  String lastPageToken;

  /**
 * The value of pageToken query parameter in community_messages.list request to get the first page.
 */
  String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityMessageList parse(Map<String, Object> json) {
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
  static Object serialize(CommunityMessageList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<OrkutLinkResource> links;

  /** Whether this poll allows voting for more than one option. */
  bool isMultipleAnswers;

  /** The image representing the poll. Field is omitted if no image exists. */
  CommunityPollImage image;

  /** The ending date of this poll or empty if the poll doesn't have one. */
  String endingTime;

  /** Whether non-members of the community can vote on the poll. */
  bool isVotingAllowedForNonMembers;

  /**
 * Whether the user has marked this poll as spam. This only affects the poll for this user, not
 * globally.
 */
  bool isSpam;

  /** The total number of votes this poll has received. */
  int totalNumberOfVotes;

  /** The person who created the poll. */
  OrkutAuthorResource author;

  /** The poll question. */
  String question;

  /** The poll ID. */
  String id;

  /**
 * Whether this poll is restricted for members only. If a poll is open but the user can't vote on
 * it, it's been restricted to members only. This information is important to tell this case apart
 * from the one where the user can't vote simply because the poll is already closed.
 */
  bool isRestricted;

  /** The ID of the community. */
  int communityId;

  /** If user has already voted, whether his vote is publicly visible. */
  bool isUsersVotePublic;

  /** The date of the last update of this poll. */
  String lastUpdate;

  /** The poll description. */
  String description;

  /** List of options the user has voted on, if there are any. */
  List<int> votedOptions;

  /**
 * Whether this poll is still opened for voting. A poll is open for voting if it is not closed, the
 * user has not yet voted on it and the user has the permission to do so, which happens if he/she is
 * either a community member or the poll is open for everybody.
 */
  bool isOpenForVoting;

  /**
 * Whether the poll is not expired if there is an expiration date. A poll is open (that is, not
 * closed for voting) if it either is not expired or doesn't have an expiration date at all. Note
 * that just because a poll is open, it doesn't mean that the requester can vote on it.
 */
  bool isClosed;

  /** Whether the user has voted on this poll. */
  bool hasVoted;

  /** Identifies this resource as a community poll. Value: "orkut#communityPoll" */
  String kind;

  /** The date of creation of this poll */
  String creationTime;

  /** List of options of this poll. */
  List<OrkutCommunitypolloptionResource> options;

  /** Parses an instance from its JSON representation. */
  static CommunityPoll parse(Map<String, Object> json) {
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
  static Object serialize(CommunityPoll value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String body;

  /** Identifies this resource as a community poll comment. Value: "orkut#communityPollComment" */
  String kind;

  /** The date when the message was added, in RFC 3339 format. */
  String addedDate;

  /** The ID of the comment. */
  int id;

  /** The creator of the comment. */
  OrkutAuthorResource author;

  /** Parses an instance from its JSON representation. */
  static CommunityPollComment parse(Map<String, Object> json) {
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
  static Object serialize(CommunityPollComment value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /**
 * Identifies this resource as a collection of community poll comments. Value:
 * "orkut#CommunityPollCommentList"
 */
  String kind;

  /** List of community poll comments retrieved. */
  List<CommunityPollComment> items;

  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the
 * previous page, if there are more to retrieve.
 */
  String prevPageToken;

  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the last
 * page.
 */
  String lastPageToken;

  /**
 * The value of pageToken query parameter in community_poll_comments.list request to get the first
 * page.
 */
  String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityPollCommentList parse(Map<String, Object> json) {
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
  static Object serialize(CommunityPollCommentList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String url;

  /** Parses an instance from its JSON representation. */
  static CommunityPollImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommunityPollImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommunityPollImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /**
 * Identifies this resource as a collection of community polls. Value: "orkut#communityPollList"
 */
  String kind;

  /** List of community polls retrieved. */
  List<CommunityPoll> items;

  /**
 * The value of pageToken query parameter in community_polls.list request to get the previous page,
 * if there are more to retrieve.
 */
  String prevPageToken;

  /** The value of pageToken query parameter in community_polls.list request to get the last page. */
  String lastPageToken;

  /**
 * The value of pageToken query parameter in community_polls.list request to get the first page.
 */
  String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityPollList parse(Map<String, Object> json) {
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
  static Object serialize(CommunityPollList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /** The ids of the voted options. */
  List<int> optionIds;

  /** Whether this vote is visible to other users or not. */
  bool isVotevisible;

  /** Parses an instance from its JSON representation. */
  static CommunityPollVote parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommunityPollVote();
    result.kind = identity(json["kind"]);
    result.optionIds = map(identity)(json["optionIds"]);
    result.isVotevisible = identity(json["isVotevisible"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommunityPollVote value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String body;

  /** The timestamp of the last update, in RFC 3339 format. */
  String lastUpdate;

  /** Identifies this resource as a community topic. Value: "orkut#communityTopic" */
  String kind;

  /** List of resources for the community. */
  List<OrkutLinkResource> links;

  /** The creator of the topic. */
  OrkutAuthorResource author;

  /** The title of the topic. */
  String title;

  /** Most recent messages. */
  List<CommunityMessage> messages;

  /** Snippet of the last message posted on this topic. */
  String latestMessageSnippet;

  /** Whether the topic is closed for new messages. */
  bool isClosed;

  /** The total number of replies this topic has received. */
  int numberOfReplies;

  /** The ID of the topic. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommunityTopic parse(Map<String, Object> json) {
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
  static Object serialize(CommunityTopic value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String nextPageToken;

  /**
 * Identifies this resource as a collection of community topics. Value: "orkut#communityTopicList"
 */
  String kind;

  /** List of topics retrieved. */
  List<CommunityTopic> items;

  /**
 * The value of pageToken query parameter in community_topic.list request to get the previous page,
 * if there are more to retrieve.
 */
  String prevPageToken;

  /** The value of pageToken query parameter in community_topic.list request to get the last page. */
  String lastPageToken;

  /**
 * The value of pageToken query parameter in community_topic.list request to get the first page.
 */
  String firstPageToken;

  /** Parses an instance from its JSON representation. */
  static CommunityTopicList parse(Map<String, Object> json) {
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
  static Object serialize(CommunityTopicList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  List<OrkutCounterResource> items;

  /** Identifies this resource as a collection of counters. Value: "orkut#counters" */
  String kind;

  /** Parses an instance from its JSON representation. */
  static Counters parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Counters();
    result.items = map(OrkutCounterResource.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Counters value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(OrkutCounterResource.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutActivityobjectsResource
class OrkutActivityobjectsResource extends IdentityHash {
  /** The title of the object. */
  String displayName;

  /** Links to other resources related to this object. */
  List<OrkutLinkResource> links;

  /** The community which is related with this activity, e.g. a joined community. */
  Community community;

  /**
 * The HTML-formatted content, suitable for display. When updating an activity's content, post the
 * changes to this property, using the value of originalContent as a starting point. If the update
 * is successful, the server adds HTML formatting and responds with this formatted content.
 */
  String content;

  /** The person who is related with this activity, e.g. an Added User. */
  OrkutActivitypersonResource person;

  /** The ID for the object. */
  String id;

  /** The object type. */
  String objectType;

  /** Parses an instance from its JSON representation. */
  static OrkutActivityobjectsResource parse(Map<String, Object> json) {
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
  static Object serialize(OrkutActivityobjectsResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String url;

  /** The person's gender. Values include "male", "female", and "other". */
  String gender;

  /**
 * The person's profile photo. This is adapted from Google+ and was originaly introduced as extra
 * OpenSocial convenience fields.
 */
  OrkutActivitypersonResourceImage image;

  /** The person's date of birth, represented as YYYY-MM-DD. */
  String birthday;

  /** The person's opensocial ID. */
  String id;

  /** Parses an instance from its JSON representation. */
  static OrkutActivitypersonResource parse(Map<String, Object> json) {
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
  static Object serialize(OrkutActivitypersonResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String url;

  /** Parses an instance from its JSON representation. */
  static OrkutActivitypersonResourceImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutActivitypersonResourceImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutActivitypersonResourceImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema OrkutActivitypersonResource.OrkutActivitypersonResourceName
class OrkutActivitypersonResourceName extends IdentityHash {
  /** The given name (first name) of this person. */
  String givenName;

  /** The family name (last name) of this person. */
  String familyName;

  /** Parses an instance from its JSON representation. */
  static OrkutActivitypersonResourceName parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutActivitypersonResourceName();
    result.givenName = identity(json["givenName"]);
    result.familyName = identity(json["familyName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutActivitypersonResourceName value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["givenName"] = identity(value.givenName);
    result["familyName"] = identity(value.familyName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutAuthorResource
class OrkutAuthorResource extends IdentityHash {
  /** The URL of the author who posted the comment [not yet implemented] */
  String url;

  /** Image data about the author. */
  OrkutAuthorResourceImage image;

  /** The name of the author, suitable for display. */
  String displayName;

  /** Unique identifier of the person who posted the comment. This is the person's OpenSocial ID. */
  String id;

  /** Parses an instance from its JSON representation. */
  static OrkutAuthorResource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutAuthorResource();
    result.url = identity(json["url"]);
    result.image = OrkutAuthorResourceImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutAuthorResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String url;

  /** Parses an instance from its JSON representation. */
  static OrkutAuthorResourceImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutAuthorResourceImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutAuthorResourceImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  int optionId;

  /** The option description. */
  String description;

  /** The total number of votes that this option received. */
  int numberOfVotes;

  /** Parses an instance from its JSON representation. */
  static OrkutCommunitypolloptionResource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutCommunitypolloptionResource();
    result.image = OrkutCommunitypolloptionResourceImage.parse(json["image"]);
    result.optionId = identity(json["optionId"]);
    result.description = identity(json["description"]);
    result.numberOfVotes = identity(json["numberOfVotes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutCommunitypolloptionResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String url;

  /** Parses an instance from its JSON representation. */
  static OrkutCommunitypolloptionResourceImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutCommunitypolloptionResourceImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutCommunitypolloptionResourceImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .OrkutCounterResource
class OrkutCounterResource extends IdentityHash {
  /** The number of resources on the counted collection. */
  int total;

  /** Link to the collection being counted. */
  OrkutLinkResource link;

  /**
 * The name of the counted collection. Currently supported collections are: - scraps - The scraps of
 * the user. - photos - The photos of the user. - videos - The videos of the user. -
 * pendingTestimonials - The pending testimonials of the user.
 */
  String name;

  /** Parses an instance from its JSON representation. */
  static OrkutCounterResource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutCounterResource();
    result.total = identity(json["total"]);
    result.link = OrkutLinkResource.parse(json["link"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutCounterResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String href;

  /** Media type of the link. */
  String type;

  /** Relation between the resource and the parent object. */
  String rel;

  /** Title of the link. */
  String title;

  /** Parses an instance from its JSON representation. */
  static OrkutLinkResource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new OrkutLinkResource();
    result.href = identity(json["href"]);
    result.type = identity(json["type"]);
    result.rel = identity(json["rel"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(OrkutLinkResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
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
  String kind;

  /**
 * The visibility of the resource. Possible values are: - default: not hidden by the user - hidden:
 * hidden
 */
  String visibility;

  /** List of resources for the visibility item. */
  List<OrkutLinkResource> links;

  /** Parses an instance from its JSON representation. */
  static Visibility parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Visibility();
    result.kind = identity(json["kind"]);
    result.visibility = identity(json["visibility"]);
    result.links = map(OrkutLinkResource.parse)(json["links"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Visibility value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["visibility"] = identity(value.visibility);
    result["links"] = map(OrkutLinkResource.serialize)(value.links);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum OrkutApi.Alt
class OrkutApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final OrkutApiAlt JSON = const OrkutApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<OrkutApiAlt> values = const <OrkutApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <OrkutApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static OrkutApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const OrkutApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

