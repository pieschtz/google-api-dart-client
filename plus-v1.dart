#library("plus");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API PlusApi
/**
 * The Google+ API enables developers to build on top of the Google+ platform.
 */
class PlusApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  PlusApi get _$service() => this;
  ActivitiesResource _activities;
  ActivitiesResource get activities() => _activities;
  CommentsResource _comments;
  CommentsResource get comments() => _comments;
  PeopleResource _people;
  PeopleResource get people() => _people;
  
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
  PlusApiAlt alt;


  PlusApi([this.baseUrl = "https://www.googleapis.com/plus/v1/", this.applicationName]) { 
    _activities = new ActivitiesResource._internal(this);
    _comments = new CommentsResource._internal(this);
    _people = new PeopleResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}plus/v1/20120430 google-api-dart-client/${clientVersion}";
  }
}

// Resource .ActivitiesResource
class ActivitiesResource {
  final PlusApi _$service;
  
  ActivitiesResource._internal(PlusApi $service) : _$service = $service;

  // Method ActivitiesResource.Search
  /**
   * Search public activities.
   * [query] Full-text search query string.
   */
  Future<ActivityFeed> search(String query, [ActivitiesResourceSearchOrderBy orderBy = UNSPECIFIED, String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String language = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["query"] = query;
    if (UNSPECIFIED != orderBy) $queryParams["orderBy"] = orderBy;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != language) $queryParams["language"] = language;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "activities").generate($pathParams, $queryParams);
    final $completer = new Completer<ActivityFeed>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = ActivityFeed.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ActivitiesResource.List
  /**
   * List all of the activities in the specified collection for a particular user.
   * [userId] The ID of the user to get activities for. The special value "me" can be used to indicate the
   *        authenticated user.
   * [collection] The collection of activities to list.
   */
  Future<ActivityFeed> list(String userId, ActivitiesResourceListCollection collection, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    $pathParams["collection"] = collection;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}/activities/{collection}").generate($pathParams, $queryParams);
    final $completer = new Completer<ActivityFeed>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = ActivityFeed.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ActivitiesResource.Get
  /**
   * Get an activity.
   * [activityId] The ID of the activity to get.
   */
  Future<Activity> get(String activityId) {
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
    final $completer = new Completer<Activity>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
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

// Enum ActivitiesResource.Search.OrderBy
class ActivitiesResourceSearchOrderBy implements Hashable {
  /** Sort activities by relevance to the user, most relevant first. */
  static final ActivitiesResourceSearchOrderBy BEST = const ActivitiesResourceSearchOrderBy._internal("best", 0);
  /** Sort activities by published date, most recent first. */
  static final ActivitiesResourceSearchOrderBy RECENT = const ActivitiesResourceSearchOrderBy._internal("recent", 1);

  /** All values of this enumeration */
  static final List<ActivitiesResourceSearchOrderBy> values = const <ActivitiesResourceSearchOrderBy>[
    BEST,
    RECENT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ActivitiesResourceSearchOrderBy>{ 
    "best": BEST,
    "recent": RECENT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ActivitiesResourceSearchOrderBy valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const ActivitiesResourceSearchOrderBy._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Enum ActivitiesResource.List.Collection
class ActivitiesResourceListCollection implements Hashable {
  /** All public activities created by the specified user. */
  static final ActivitiesResourceListCollection PUBLIC = const ActivitiesResourceListCollection._internal("public", 0);

  /** All values of this enumeration */
  static final List<ActivitiesResourceListCollection> values = const <ActivitiesResourceListCollection>[
    PUBLIC,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ActivitiesResourceListCollection>{ 
    "public": PUBLIC,
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

// Resource .CommentsResource
class CommentsResource {
  final PlusApi _$service;
  
  CommentsResource._internal(PlusApi $service) : _$service = $service;

  // Method CommentsResource.List
  /**
   * List all of the comments for an activity.
   * [activityId] The ID of the activity to get comments for.
   */
  Future<CommentFeed> list(String activityId, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, CommentsResourceListSortOrder sortOrder = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/comments").generate($pathParams, $queryParams);
    final $completer = new Completer<CommentFeed>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommentFeed.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommentsResource.Get
  /**
   * Get a comment.
   * [commentId] The ID of the comment to get.
   */
  Future<Comment> get(String commentId) {
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
}

// Enum CommentsResource.List.SortOrder
class CommentsResourceListSortOrder implements Hashable {
  /** Sort oldest comments first. */
  static final CommentsResourceListSortOrder ASCENDING = const CommentsResourceListSortOrder._internal("ascending", 0);
  /** Sort newest comments first. */
  static final CommentsResourceListSortOrder DESCENDING = const CommentsResourceListSortOrder._internal("descending", 1);

  /** All values of this enumeration */
  static final List<CommentsResourceListSortOrder> values = const <CommentsResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CommentsResourceListSortOrder>{ 
    "ascending": ASCENDING,
    "descending": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CommentsResourceListSortOrder valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CommentsResourceListSortOrder._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "SortOrder".hashCode();
}

// Resource .PeopleResource
class PeopleResource {
  final PlusApi _$service;
  
  PeopleResource._internal(PlusApi $service) : _$service = $service;

  // Method PeopleResource.ListByActivity
  /**
   * List all of the people in the specified collection for a particular activity.
   * [activityId] The ID of the activity to get the list of people for.
   * [collection] The collection of people to list.
   */
  Future<PeopleFeed> listByActivity(String activityId, PeopleResourceListByActivityCollection collection, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["activityId"] = activityId;
    $pathParams["collection"] = collection;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "activities/{activityId}/people/{collection}").generate($pathParams, $queryParams);
    final $completer = new Completer<PeopleFeed>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = PeopleFeed.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method PeopleResource.Search
  /**
   * Search all public profiles.
   * [query]
   */
  Future<PeopleFeed> search(String query, [String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED, String language = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["query"] = query;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != language) $queryParams["language"] = language;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "people").generate($pathParams, $queryParams);
    final $completer = new Completer<PeopleFeed>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = PeopleFeed.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method PeopleResource.Get
  /**
   * Get a person's profile.
   * [userId] The ID of the person to get the profile for. The special value "me" can be used to indicate the
   *        authenticated user.
   */
  Future<Person> get(String userId) {
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
    final $url = new UrlPattern(_$service.baseUrl + "people/{userId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Person>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Person.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum PeopleResource.ListByActivity.Collection
class PeopleResourceListByActivityCollection implements Hashable {
  /** List all people who have +1'd this activity. */
  static final PeopleResourceListByActivityCollection PLUSONERS = const PeopleResourceListByActivityCollection._internal("plusoners", 0);
  /** List all people who have reshared this activity. */
  static final PeopleResourceListByActivityCollection RESHARERS = const PeopleResourceListByActivityCollection._internal("resharers", 1);

  /** All values of this enumeration */
  static final List<PeopleResourceListByActivityCollection> values = const <PeopleResourceListByActivityCollection>[
    PLUSONERS,
    RESHARERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PeopleResourceListByActivityCollection>{ 
    "plusoners": PLUSONERS,
    "resharers": RESHARERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PeopleResourceListByActivityCollection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const PeopleResourceListByActivityCollection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Collection".hashCode();
}

// Schema .Acl
class Acl extends IdentityHash {
  /** The list of access entries. */
  List<PlusAclentryResource> items;

  /** Identifies this resource as a collection of access controls. Value: "plus#acl". */
  String kind;

  /** Description of the access granted, suitable for display. */
  String description;

  /** Parses an instance from its JSON representation. */
  static Acl parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Acl();
    result.items = map(PlusAclentryResource.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Acl value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(PlusAclentryResource.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Activity
class Activity extends IdentityHash {
  /** Name of the place where this activity occurred. */
  String placeName;

  /** Identifies this resource as an activity. Value: "plus#activity". */
  String kind;

  /** The time at which this activity was last updated. Formatted as an RFC 3339 timestamp. */
  String updated;

  /** The service provider that initially published this activity. */
  ActivityProvider provider;

  /** Title of this activity. */
  String title;

  /** The link to this activity. */
  String url;

  /**
 * Latitude and longitude where this activity occurred. Format is latitude followed by longitude,
 * space separated.
 */
  String geocode;

  /** The object of this activity. */
  ActivityObject object;

  /** ID of the place where this activity occurred. */
  String placeId;

  /** The person who performed this activity. */
  ActivityActor actor;

  /** The ID of this activity. */
  String id;

  /** Identifies who has access to see this activity. */
  Acl access;

  /**
 * This activity's verb, indicating what action was performed. Possible values are: - "post" -
 * Publish content to the stream. - "checkin" - Check in to a location. - "share" - Reshare an
 * activity.
 */
  String verb;

  /** ETag of this response for caching purposes. */
  String etag;

  /**
 * Radius, in meters, of the region where this activity occurred, centered at the latitude and
 * longitude identified in geocode.
 */
  String radius;

  /** Street address where this activity occurred. */
  String address;

  /**
 * If this activity is a crosspost from another system, this property specifies the ID of the
 * original activity.
 */
  String crosspostSource;

  /**
 * Additional content added by the person who shared this activity, applicable only when resharing
 * an activity.
 */
  String annotation;

  /** The time at which this activity was initially published. Formatted as an RFC 3339 timestamp. */
  String published;

  /** Parses an instance from its JSON representation. */
  static Activity parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Activity();
    result.placeName = identity(json["placeName"]);
    result.kind = identity(json["kind"]);
    result.updated = identity(json["updated"]);
    result.provider = ActivityProvider.parse(json["provider"]);
    result.title = identity(json["title"]);
    result.url = identity(json["url"]);
    result.geocode = identity(json["geocode"]);
    result.object = ActivityObject.parse(json["object"]);
    result.placeId = identity(json["placeId"]);
    result.actor = ActivityActor.parse(json["actor"]);
    result.id = identity(json["id"]);
    result.access = Acl.parse(json["access"]);
    result.verb = identity(json["verb"]);
    result.etag = identity(json["etag"]);
    result.radius = identity(json["radius"]);
    result.address = identity(json["address"]);
    result.crosspostSource = identity(json["crosspostSource"]);
    result.annotation = identity(json["annotation"]);
    result.published = identity(json["published"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Activity value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["placeName"] = identity(value.placeName);
    result["kind"] = identity(value.kind);
    result["updated"] = identity(value.updated);
    result["provider"] = ActivityProvider.serialize(value.provider);
    result["title"] = identity(value.title);
    result["url"] = identity(value.url);
    result["geocode"] = identity(value.geocode);
    result["object"] = ActivityObject.serialize(value.object);
    result["placeId"] = identity(value.placeId);
    result["actor"] = ActivityActor.serialize(value.actor);
    result["id"] = identity(value.id);
    result["access"] = Acl.serialize(value.access);
    result["verb"] = identity(value.verb);
    result["etag"] = identity(value.etag);
    result["radius"] = identity(value.radius);
    result["address"] = identity(value.address);
    result["crosspostSource"] = identity(value.crosspostSource);
    result["annotation"] = identity(value.annotation);
    result["published"] = identity(value.published);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityActor
class ActivityActor extends IdentityHash {
  /** The link to the actor's Google profile. */
  String url;

  /** The image representation of the actor. */
  ActivityActorImage image;

  /** The name of the actor, suitable for display. */
  String displayName;

  /** The ID of the actor's person resource. */
  String id;

  /** An object representation of the individual components of name. */
  ActivityActorName name;

  /** Parses an instance from its JSON representation. */
  static ActivityActor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityActor();
    result.url = identity(json["url"]);
    result.image = ActivityActorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    result.name = ActivityActorName.parse(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityActor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["image"] = ActivityActorImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    result["name"] = ActivityActorName.serialize(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityActor.ActivityActorImage
class ActivityActorImage extends IdentityHash {
  /**
 * The URL of the actor's profile photo. To re-size the image and crop it to a square, append the
 * query string ?sz=x, where x is the dimension in pixels of each side.
 */
  String url;

  /** Parses an instance from its JSON representation. */
  static ActivityActorImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityActorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityActorImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityActor.ActivityActorName
class ActivityActorName extends IdentityHash {
  /** The given name (first name) of the actor. */
  String givenName;

  /** The family name (last name) of the actor. */
  String familyName;

  /** Parses an instance from its JSON representation. */
  static ActivityActorName parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityActorName();
    result.givenName = identity(json["givenName"]);
    result.familyName = identity(json["familyName"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityActorName value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["givenName"] = identity(value.givenName);
    result["familyName"] = identity(value.familyName);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ActivityFeed
class ActivityFeed extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  String nextPageToken;

  /** Identifies this resource as a collection of activities. Value: "plus#activityFeed". */
  String kind;

  /** The title of this collection of activities. */
  String title;

  /** The activities in this page of results. */
  List<Activity> items;

  /**
 * The time at which this collection of activities was last updated. Formatted as an RFC 3339
 * timestamp.
 */
  String updated;

  /** Link to the next page of activities. */
  String nextLink;

  /** ETag of this response for caching purposes. */
  String etag;

  /** The ID of this collection of activities. */
  String id;

  /** Link to this activity resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static ActivityFeed parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityFeed();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.title = identity(json["title"]);
    result.items = map(Activity.parse)(json["items"]);
    result.updated = identity(json["updated"]);
    result.nextLink = identity(json["nextLink"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityFeed value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["title"] = identity(value.title);
    result["items"] = map(Activity.serialize)(value.items);
    result["updated"] = identity(value.updated);
    result["nextLink"] = identity(value.nextLink);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject
class ActivityObject extends IdentityHash {
  /** People who reshared this activity. */
  ActivityObjectResharers resharers;

  /** The media objects attached to this activity. */
  List<ActivityObjectAttachments> attachments;

  /**
 * The content (text) as provided by the author, stored without any HTML formatting. When updating
 * an activity's content, use the value of originalContent as the starting point from which to make
 * edits.
 */
  String originalContent;

  /** People who +1'd this activity. */
  ActivityObjectPlusoners plusoners;

  /**
 * If this activity's object is itself another activity (for example, when a person reshares an
 * activity), this property specifies the original activity's actor.
 */
  ActivityObjectActor actor;

  /**
 * The HTML-formatted content, suitable for display. When creating or updating an activity, this
 * value must be supplied as plain text in the request. If successful, the response will contain the
 * HTML-formatted content. When updating an activity, use originalContent as the starting value,
 * then assign the updated text to this property.
 */
  String content;

  /** The URL that points to the linked resource. */
  String url;

  /** Comments in reply to this activity. */
  ActivityObjectReplies replies;

  /**
 * The ID of the object. When resharing an activity, this is the ID of the activity being reshared.
 */
  String id;

  /**
 * The type of the object. Possible values are: - "note" - Textual content. - "activity" - A Google+
 * activity.
 */
  String objectType;

  /** Parses an instance from its JSON representation. */
  static ActivityObject parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObject();
    result.resharers = ActivityObjectResharers.parse(json["resharers"]);
    result.attachments = map(ActivityObjectAttachments.parse)(json["attachments"]);
    result.originalContent = identity(json["originalContent"]);
    result.plusoners = ActivityObjectPlusoners.parse(json["plusoners"]);
    result.actor = ActivityObjectActor.parse(json["actor"]);
    result.content = identity(json["content"]);
    result.url = identity(json["url"]);
    result.replies = ActivityObjectReplies.parse(json["replies"]);
    result.id = identity(json["id"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObject value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["resharers"] = ActivityObjectResharers.serialize(value.resharers);
    result["attachments"] = map(ActivityObjectAttachments.serialize)(value.attachments);
    result["originalContent"] = identity(value.originalContent);
    result["plusoners"] = ActivityObjectPlusoners.serialize(value.plusoners);
    result["actor"] = ActivityObjectActor.serialize(value.actor);
    result["content"] = identity(value.content);
    result["url"] = identity(value.url);
    result["replies"] = ActivityObjectReplies.serialize(value.replies);
    result["id"] = identity(value.id);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectActor
class ActivityObjectActor extends IdentityHash {
  /** A link to the original actor's Google profile. */
  String url;

  /** The image representation of the original actor. */
  ActivityObjectActorImage image;

  /** The original actor's name, suitable for display. */
  String displayName;

  /** ID of the original actor. */
  String id;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectActor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectActor();
    result.url = identity(json["url"]);
    result.image = ActivityObjectActorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectActor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["image"] = ActivityObjectActorImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectActor.ActivityObjectActorImage
class ActivityObjectActorImage extends IdentityHash {
  /** A URL that points to a thumbnail photo of the original actor. */
  String url;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectActorImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectActorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectActorImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectAttachments
class ActivityObjectAttachments extends IdentityHash {
  /** The title of the attachment (such as a photo caption or an article title). */
  String displayName;

  /** The full image url for photo attachments. */
  ActivityObjectAttachmentsFullImage fullImage;

  /** The link to the attachment, should be of type text/html. */
  String url;

  /** The preview image for photos or videos. */
  ActivityObjectAttachmentsImage image;

  /** If the attachment is an article, this property contains a snippet of text from the article. */
  String content;

  /** If the attachment is a video, the embeddable link. */
  ActivityObjectAttachmentsEmbed embed;

  /** The ID of the media object's resource. */
  String id;

  /**
 * The type of media object. Possible values are: - "photo" - A photo. - "video" - A video. -
 * "article" - An article, specified by a link.
 */
  String objectType;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectAttachments parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectAttachments();
    result.displayName = identity(json["displayName"]);
    result.fullImage = ActivityObjectAttachmentsFullImage.parse(json["fullImage"]);
    result.url = identity(json["url"]);
    result.image = ActivityObjectAttachmentsImage.parse(json["image"]);
    result.content = identity(json["content"]);
    result.embed = ActivityObjectAttachmentsEmbed.parse(json["embed"]);
    result.id = identity(json["id"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectAttachments value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["displayName"] = identity(value.displayName);
    result["fullImage"] = ActivityObjectAttachmentsFullImage.serialize(value.fullImage);
    result["url"] = identity(value.url);
    result["image"] = ActivityObjectAttachmentsImage.serialize(value.image);
    result["content"] = identity(value.content);
    result["embed"] = ActivityObjectAttachmentsEmbed.serialize(value.embed);
    result["id"] = identity(value.id);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectAttachments.ActivityObjectAttachmentsEmbed
class ActivityObjectAttachmentsEmbed extends IdentityHash {
  /** URL of the link. */
  String url;

  /** Media type of the link. */
  String type;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectAttachmentsEmbed parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectAttachmentsEmbed();
    result.url = identity(json["url"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectAttachmentsEmbed value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectAttachments.ActivityObjectAttachmentsFullImage
class ActivityObjectAttachmentsFullImage extends IdentityHash {
  /** URL of the link. */
  String url;

  /** The width, in pixels, of the linked resource. */
  int width;

  /** Media type of the link. */
  String type;

  /** The height, in pixels, of the linked resource. */
  int height;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectAttachmentsFullImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectAttachmentsFullImage();
    result.url = identity(json["url"]);
    result.width = identity(json["width"]);
    result.type = identity(json["type"]);
    result.height = identity(json["height"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectAttachmentsFullImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["width"] = identity(value.width);
    result["type"] = identity(value.type);
    result["height"] = identity(value.height);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectAttachments.ActivityObjectAttachmentsImage
class ActivityObjectAttachmentsImage extends IdentityHash {
  /** URL of the link. */
  String url;

  /** The width, in pixels, of the linked resource. */
  int width;

  /** Media type of the link. */
  String type;

  /** The height, in pixels, of the linked resource. */
  int height;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectAttachmentsImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectAttachmentsImage();
    result.url = identity(json["url"]);
    result.width = identity(json["width"]);
    result.type = identity(json["type"]);
    result.height = identity(json["height"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectAttachmentsImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["width"] = identity(value.width);
    result["type"] = identity(value.type);
    result["height"] = identity(value.height);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectPlusoners
class ActivityObjectPlusoners extends IdentityHash {
  /** Total number of people who +1'd this activity. */
  int totalItems;

  /** The URL for the collection of people who +1'd this activity. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectPlusoners parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectPlusoners();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectPlusoners value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectReplies
class ActivityObjectReplies extends IdentityHash {
  /** Total number of comments on this activity. */
  int totalItems;

  /** The URL for the collection of comments in reply to this activity. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectReplies parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectReplies();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectReplies value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityObject.ActivityObjectResharers
class ActivityObjectResharers extends IdentityHash {
  /** Total number of people who reshared this activity. */
  int totalItems;

  /** The URL for the collection of resharers. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static ActivityObjectResharers parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityObjectResharers();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityObjectResharers value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityProvider
class ActivityProvider extends IdentityHash {
  /** Name of the service provider. */
  String title;

  /** Parses an instance from its JSON representation. */
  static ActivityProvider parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityProvider();
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityProvider value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Comment
class Comment extends IdentityHash {
  /** The activity this comment replied to. */
  List<CommentInReplyTo> inReplyTo;

  /** Identifies this resource as a comment. Value: "plus#comment". */
  String kind;

  /** The object of this comment. */
  CommentObject object;

  /** The time at which this comment was last updated. Formatted as an RFC 3339 timestamp. */
  String updated;

  /** The person who posted this comment. */
  CommentActor actor;

  /**
 * This comment's verb, indicating what action was performed. Possible values are: - "post" -
 * Publish content to the stream.
 */
  String verb;

  /** ETag of this response for caching purposes. */
  String etag;

  /** The time at which this comment was initially published. Formatted as an RFC 3339 timestamp. */
  String published;

  /** The ID of this comment. */
  String id;

  /** Link to this comment resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Comment parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Comment();
    result.inReplyTo = map(CommentInReplyTo.parse)(json["inReplyTo"]);
    result.kind = identity(json["kind"]);
    result.object = CommentObject.parse(json["object"]);
    result.updated = identity(json["updated"]);
    result.actor = CommentActor.parse(json["actor"]);
    result.verb = identity(json["verb"]);
    result.etag = identity(json["etag"]);
    result.published = identity(json["published"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Comment value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["inReplyTo"] = map(CommentInReplyTo.serialize)(value.inReplyTo);
    result["kind"] = identity(value.kind);
    result["object"] = CommentObject.serialize(value.object);
    result["updated"] = identity(value.updated);
    result["actor"] = CommentActor.serialize(value.actor);
    result["verb"] = identity(value.verb);
    result["etag"] = identity(value.etag);
    result["published"] = identity(value.published);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentActor
class CommentActor extends IdentityHash {
  /** A link to the person resource for this actor. */
  String url;

  /** The image representation of this actor. */
  CommentActorImage image;

  /** The name of this actor, suitable for display. */
  String displayName;

  /** The ID of the actor. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentActor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentActor();
    result.url = identity(json["url"]);
    result.image = CommentActorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentActor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["image"] = CommentActorImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentActor.CommentActorImage
class CommentActorImage extends IdentityHash {
  /**
 * The URL of the actor's profile photo. To re-size the image and crop it to a square, append the
 * query string ?sz=x, where x is the dimension in pixels of each side.
 */
  String url;

  /** Parses an instance from its JSON representation. */
  static CommentActorImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentActorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentActorImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentFeed
class CommentFeed extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  String nextPageToken;

  /** Identifies this resource as a collection of comments. Value: "plus#commentFeed". */
  String kind;

  /** The title of this collection of comments. */
  String title;

  /** The comments in this page of results. */
  List<Comment> items;

  /**
 * The time at which this collection of comments was last updated. Formatted as an RFC 3339
 * timestamp.
 */
  String updated;

  /** Link to the next page of activities. */
  String nextLink;

  /** ETag of this response for caching purposes. */
  String etag;

  /** The ID of this collection of comments. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentFeed parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentFeed();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.title = identity(json["title"]);
    result.items = map(Comment.parse)(json["items"]);
    result.updated = identity(json["updated"]);
    result.nextLink = identity(json["nextLink"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentFeed value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["title"] = identity(value.title);
    result["items"] = map(Comment.serialize)(value.items);
    result["updated"] = identity(value.updated);
    result["nextLink"] = identity(value.nextLink);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentInReplyTo
class CommentInReplyTo extends IdentityHash {
  /** The url of the activity. */
  String url;

  /** The id of the activity. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentInReplyTo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentInReplyTo();
    result.url = identity(json["url"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentInReplyTo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentObject
class CommentObject extends IdentityHash {
  /** The content of this comment. */
  String content;

  /**
 * The object type of this comment. Possible values are: - "comment" - A comment in reply to an
 * activity.
 */
  String objectType;

  /** Parses an instance from its JSON representation. */
  static CommentObject parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentObject();
    result.content = identity(json["content"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentObject value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["content"] = identity(value.content);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PeopleFeed
class PeopleFeed extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  String nextPageToken;

  /** Identifies this resource as a collection of people. Value: "plus#peopleFeed". */
  String kind;

  /** The title of this collection of people. */
  String title;

  /**
 * The people in this page of results. Each item will include the id, displayName, image, and url
 * for the person. To retrieve additional profile data, see the people.get method.
 */
  List<Person> items;

  /** ETag of this response for caching purposes. */
  String etag;

  /**
 * The total number of people available in this list. The number of people in a response may be
 * smaller due to paging. This may not be set for all collections.
 */
  int totalItems;

  /** Link to this resource. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static PeopleFeed parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PeopleFeed();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.title = identity(json["title"]);
    result.items = map(Person.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PeopleFeed value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["title"] = identity(value.title);
    result["items"] = map(Person.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Person
class Person extends IdentityHash {
  /**
 * The person's relationship status. Possible values are: - "single" - Person is single. -
 * "in_a_relationship" - Person is in a relationship. - "engaged" - Person is engaged. - "married" -
 * Person is married. - "its_complicated" - The relationship is complicated. - "open_relationship" -
 * Person is in an open relationship. - "widowed" - Person is widowed. - "in_domestic_partnership" -
 * Person is in a domestic partnership. - "in_civil_union" - Person is in a civil union.
 */
  String relationshipStatus;

  /** A list of current or past organizations with which this person is associated. */
  List<PersonOrganizations> organizations;

  /** Identifies this resource as a person. Value: "plus#person". */
  String kind;

  /** The name of this person, suitable for display. */
  String displayName;

  /** An object representation of the individual components of a person's name. */
  PersonName name;

  /** The URL of this person's profile. */
  String url;

  /**
 * The person's gender. Possible values are: - "male" - Male gender. - "female" - Female gender. -
 * "other" - Other.
 */
  String gender;

  /** A short biography for this person. */
  String aboutMe;

  /** The brief description (tagline) of this person. */
  String tagline;

  /** A list of URLs for this person. */
  List<PersonUrls> urls;

  /** A list of places where this person has lived. */
  List<PersonPlacesLived> placesLived;

  /** A list of email addresses for this person. */
  List<PersonEmails> emails;

  /** The nickname of this person. */
  String nickname;

  /** The person's date of birth, represented as YYYY-MM-DD. */
  String birthday;

  /** ETag of this response for caching purposes. */
  String etag;

  /** The representation of the person's profile photo. */
  PersonImage image;

  /**
 * If "true", indicates that the person has installed the app that is making the request and has
 * chosen to expose this install state to the caller. A value of "false" indicates that the install
 * state cannot be determined (it is either not installed or the person has chosen to keep this
 * information private).
 */
  bool hasApp;

  /** The ID of this person. */
  String id;

  /** The languages spoken by this person. */
  List<String> languagesSpoken;

  /** The current location for this person. */
  String currentLocation;

  /**
 * Type of person within Google+. Possible values are: - "person" - represents an actual person. -
 * "page" - represents a page.
 */
  String objectType;

  /** Parses an instance from its JSON representation. */
  static Person parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Person();
    result.relationshipStatus = identity(json["relationshipStatus"]);
    result.organizations = map(PersonOrganizations.parse)(json["organizations"]);
    result.kind = identity(json["kind"]);
    result.displayName = identity(json["displayName"]);
    result.name = PersonName.parse(json["name"]);
    result.url = identity(json["url"]);
    result.gender = identity(json["gender"]);
    result.aboutMe = identity(json["aboutMe"]);
    result.tagline = identity(json["tagline"]);
    result.urls = map(PersonUrls.parse)(json["urls"]);
    result.placesLived = map(PersonPlacesLived.parse)(json["placesLived"]);
    result.emails = map(PersonEmails.parse)(json["emails"]);
    result.nickname = identity(json["nickname"]);
    result.birthday = identity(json["birthday"]);
    result.etag = identity(json["etag"]);
    result.image = PersonImage.parse(json["image"]);
    result.hasApp = identity(json["hasApp"]);
    result.id = identity(json["id"]);
    result.languagesSpoken = map(identity)(json["languagesSpoken"]);
    result.currentLocation = identity(json["currentLocation"]);
    result.objectType = identity(json["objectType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Person value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["relationshipStatus"] = identity(value.relationshipStatus);
    result["organizations"] = map(PersonOrganizations.serialize)(value.organizations);
    result["kind"] = identity(value.kind);
    result["displayName"] = identity(value.displayName);
    result["name"] = PersonName.serialize(value.name);
    result["url"] = identity(value.url);
    result["gender"] = identity(value.gender);
    result["aboutMe"] = identity(value.aboutMe);
    result["tagline"] = identity(value.tagline);
    result["urls"] = map(PersonUrls.serialize)(value.urls);
    result["placesLived"] = map(PersonPlacesLived.serialize)(value.placesLived);
    result["emails"] = map(PersonEmails.serialize)(value.emails);
    result["nickname"] = identity(value.nickname);
    result["birthday"] = identity(value.birthday);
    result["etag"] = identity(value.etag);
    result["image"] = PersonImage.serialize(value.image);
    result["hasApp"] = identity(value.hasApp);
    result["id"] = identity(value.id);
    result["languagesSpoken"] = map(identity)(value.languagesSpoken);
    result["currentLocation"] = identity(value.currentLocation);
    result["objectType"] = identity(value.objectType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Person.PersonEmails
class PersonEmails extends IdentityHash {
  /**
 * The type of address. Possible values are: - "home" - Home email address. - "work" - Work email
 * address. - "other" - Other.
 */
  String type;

  /** If "true", indicates this email address is the person's primary one. */
  bool primary;

  /** The email address. */
  String value;

  /** Parses an instance from its JSON representation. */
  static PersonEmails parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PersonEmails();
    result.type = identity(json["type"]);
    result.primary = identity(json["primary"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PersonEmails value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["primary"] = identity(value.primary);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Person.PersonImage
class PersonImage extends IdentityHash {
  /**
 * The URL of the person's profile photo. To re-size the image and crop it to a square, append the
 * query string ?sz=x, where x is the dimension in pixels of each side.
 */
  String url;

  /** Parses an instance from its JSON representation. */
  static PersonImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PersonImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PersonImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Person.PersonName
class PersonName extends IdentityHash {
  /** The honorific prefixes (such as "Dr." or "Mrs.") for this person. */
  String honorificPrefix;

  /** The middle name of this person. */
  String middleName;

  /** The family name (last name) of this person. */
  String familyName;

  /** The full name of this person, including middle names, suffixes, etc. */
  String formatted;

  /** The given name (first name) of this person. */
  String givenName;

  /** The honorific suffixes (such as "Jr.") for this person. */
  String honorificSuffix;

  /** Parses an instance from its JSON representation. */
  static PersonName parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PersonName();
    result.honorificPrefix = identity(json["honorificPrefix"]);
    result.middleName = identity(json["middleName"]);
    result.familyName = identity(json["familyName"]);
    result.formatted = identity(json["formatted"]);
    result.givenName = identity(json["givenName"]);
    result.honorificSuffix = identity(json["honorificSuffix"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PersonName value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["honorificPrefix"] = identity(value.honorificPrefix);
    result["middleName"] = identity(value.middleName);
    result["familyName"] = identity(value.familyName);
    result["formatted"] = identity(value.formatted);
    result["givenName"] = identity(value.givenName);
    result["honorificSuffix"] = identity(value.honorificSuffix);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Person.PersonOrganizations
class PersonOrganizations extends IdentityHash {
  /** The date the person joined this organization. */
  String startDate;

  /** The date the person left this organization. */
  String endDate;

  /** A short description of the person's role in this organization. */
  String description;

  /** The person's job title or role within the organization. */
  String title;

  /**
 * If "true", indicates this organization is the person's primary one (typically interpreted as
 * current one).
 */
  bool primary;

  /** The location of this organization. */
  String location;

  /** The department within the organization. */
  String department;

  /** The type of organization. Possible values are:  
- "work" - Work. 
- "school" - School. */
  String type;

  /** The name of the organization. */
  String name;

  /** Parses an instance from its JSON representation. */
  static PersonOrganizations parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PersonOrganizations();
    result.startDate = identity(json["startDate"]);
    result.endDate = identity(json["endDate"]);
    result.description = identity(json["description"]);
    result.title = identity(json["title"]);
    result.primary = identity(json["primary"]);
    result.location = identity(json["location"]);
    result.department = identity(json["department"]);
    result.type = identity(json["type"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PersonOrganizations value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["startDate"] = identity(value.startDate);
    result["endDate"] = identity(value.endDate);
    result["description"] = identity(value.description);
    result["title"] = identity(value.title);
    result["primary"] = identity(value.primary);
    result["location"] = identity(value.location);
    result["department"] = identity(value.department);
    result["type"] = identity(value.type);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Person.PersonPlacesLived
class PersonPlacesLived extends IdentityHash {
  /** If "true", this place of residence is this person's primary residence. */
  bool primary;

  /** A place where this person has lived. For example: "Seattle, WA", "Near Toronto". */
  String value;

  /** Parses an instance from its JSON representation. */
  static PersonPlacesLived parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PersonPlacesLived();
    result.primary = identity(json["primary"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PersonPlacesLived value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["primary"] = identity(value.primary);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Person.PersonUrls
class PersonUrls extends IdentityHash {
  /**
 * The type of URL. Possible values are: - "home" - URL for home. - "work" - URL for work. - "blog"
 * - URL for blog. - "profile" - URL for profile. - "other" - Other.
 */
  String type;

  /** If "true", this URL is the person's primary URL. */
  bool primary;

  /** The URL value. */
  String value;

  /** Parses an instance from its JSON representation. */
  static PersonUrls parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PersonUrls();
    result.type = identity(json["type"]);
    result.primary = identity(json["primary"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PersonUrls value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["primary"] = identity(value.primary);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlusAclentryResource
class PlusAclentryResource extends IdentityHash {
  /**
 * The type of entry describing to whom access is granted. Possible values are: - "person" - Access
 * to an individual. - "circle" - Access to members of a circle. - "myCircles" - Access to members
 * of all the person's circles. - "extendedCircles" - Access to members of everyone in a person's
 * circles, plus all of the people in their circles. - "public" - Access to anyone on the web.
 */
  String type;

  /**
 * The ID of the entry. For entries of type "person" or "circle", this is the ID of the resource.
 * For other types, this property is not set.
 */
  String id;

  /** Parses an instance from its JSON representation. */
  static PlusAclentryResource parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PlusAclentryResource();
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PlusAclentryResource value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum PlusApi.Alt
class PlusApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final PlusApiAlt JSON = const PlusApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<PlusApiAlt> values = const <PlusApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PlusApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PlusApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const PlusApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

