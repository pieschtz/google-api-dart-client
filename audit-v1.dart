#library("audit");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AuditApi
/**
 * Lets you access user activities in your enterprise made through various applications.
 */
class AuditApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  AuditApi get _$service() => this;
  ActivitiesResource _activities;
  ActivitiesResource get activities() => _activities;
  
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
  AuditApiAlt alt;


  AuditApi([this.baseUrl = "https://www.googleapis.com/apps/reporting/audit/v1/", this.applicationName]) { 
    _activities = new ActivitiesResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}audit/v1/20111110 google-api-dart-client/${clientVersion}";
  }
}

// Resource .ActivitiesResource
class ActivitiesResource {
  final AuditApi _$service;
  
  ActivitiesResource._internal(AuditApi $service) : _$service = $service;

  // Method ActivitiesResource.List
  /**
   * Retrieves a list of activities for a specific customer and application.
   * [customerId] Represents the customer who is the owner of target object on which action was performed.
   * [applicationId] Application ID of the application on which the event was performed.
   */
  Future<Activities> list(String customerId, String applicationId, [String actorEmail = UNSPECIFIED, String actorApplicationId = UNSPECIFIED, String actorIpAddress = UNSPECIFIED, ActivitiesResourceListCaller caller = UNSPECIFIED, int maxResults = UNSPECIFIED, String eventName = UNSPECIFIED, String parameters = UNSPECIFIED, String startTime = UNSPECIFIED, String endTime = UNSPECIFIED, String continuationToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["applicationId"] = applicationId;
    if (UNSPECIFIED != actorEmail) $queryParams["actorEmail"] = actorEmail;
    if (UNSPECIFIED != actorApplicationId) $queryParams["actorApplicationId"] = actorApplicationId;
    if (UNSPECIFIED != actorIpAddress) $queryParams["actorIpAddress"] = actorIpAddress;
    if (UNSPECIFIED != caller) $queryParams["caller"] = caller;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != eventName) $queryParams["eventName"] = eventName;
    if (UNSPECIFIED != parameters) $queryParams["parameters"] = parameters;
    if (UNSPECIFIED != startTime) $queryParams["startTime"] = startTime;
    if (UNSPECIFIED != endTime) $queryParams["endTime"] = endTime;
    if (UNSPECIFIED != continuationToken) $queryParams["continuationToken"] = continuationToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "{customerId}/{applicationId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Activities>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Activities.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum ActivitiesResource.List.Caller
class ActivitiesResourceListCaller implements Hashable {
  /** Caller is an application owner. */
  static final ActivitiesResourceListCaller APPLICATION_OWNER = const ActivitiesResourceListCaller._internal("application_owner", 0);
  /** Caller is a customer. */
  static final ActivitiesResourceListCaller CUSTOMER = const ActivitiesResourceListCaller._internal("customer", 1);

  /** All values of this enumeration */
  static final List<ActivitiesResourceListCaller> values = const <ActivitiesResourceListCaller>[
    APPLICATION_OWNER,
    CUSTOMER,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ActivitiesResourceListCaller>{ 
    "application_owner": APPLICATION_OWNER,
    "customer": CUSTOMER,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ActivitiesResourceListCaller valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const ActivitiesResourceListCaller._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Caller".hashCode();
}

// Schema .Activities
class Activities extends IdentityHash {
  /** Each record in read response. */
  List<Activity> items;

  /** Kind of list response this is. */
  String kind;

  /** Next page URL. */
  String next;

  /** Parses an instance from its JSON representation. */
  static Activities parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Activities();
    result.items = map(Activity.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.next = identity(json["next"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Activities value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Activity.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["next"] = identity(value.next);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Activity
class Activity extends IdentityHash {
  /** Kind of resource this is. */
  String kind;

  /** Domain of source customer. */
  String ownerDomain;

  /** User doing the action. */
  ActivityActor actor;

  /** Unique identifier for each activity record. */
  ActivityId id;

  /** IP Address of the user doing the action. */
  String ipAddress;

  /** Activity events. */
  List<ActivityEvents> events;

  /** Parses an instance from its JSON representation. */
  static Activity parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Activity();
    result.kind = identity(json["kind"]);
    result.ownerDomain = identity(json["ownerDomain"]);
    result.actor = ActivityActor.parse(json["actor"]);
    result.id = ActivityId.parse(json["id"]);
    result.ipAddress = identity(json["ipAddress"]);
    result.events = map(ActivityEvents.parse)(json["events"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Activity value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["ownerDomain"] = identity(value.ownerDomain);
    result["actor"] = ActivityActor.serialize(value.actor);
    result["id"] = ActivityId.serialize(value.id);
    result["ipAddress"] = identity(value.ipAddress);
    result["events"] = map(ActivityEvents.serialize)(value.events);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityActor
class ActivityActor extends IdentityHash {
  /** ID of application which interacted on behalf of the user. */
  String applicationId;

  /** Email address of the user. */
  String email;

  /** For OAuth 2LO API requests, consumer_key of the requestor. */
  String key;

  /** User or OAuth 2LO request. */
  String callerType;

  /** Parses an instance from its JSON representation. */
  static ActivityActor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityActor();
    result.applicationId = identity(json["applicationId"]);
    result.email = identity(json["email"]);
    result.key = identity(json["key"]);
    result.callerType = identity(json["callerType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityActor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["applicationId"] = identity(value.applicationId);
    result["email"] = identity(value.email);
    result["key"] = identity(value.key);
    result["callerType"] = identity(value.callerType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityEvents
class ActivityEvents extends IdentityHash {
  /** Type of event. */
  String eventType;

  /** Name of event. */
  String name;

  /** Event parameters. */
  List<ActivityEventsParameters> parameters;

  /** Parses an instance from its JSON representation. */
  static ActivityEvents parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityEvents();
    result.eventType = identity(json["eventType"]);
    result.name = identity(json["name"]);
    result.parameters = map(ActivityEventsParameters.parse)(json["parameters"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityEvents value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["eventType"] = identity(value.eventType);
    result["name"] = identity(value.name);
    result["parameters"] = map(ActivityEventsParameters.serialize)(value.parameters);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityEvents.ActivityEventsParameters
class ActivityEventsParameters extends IdentityHash {
  /** Name of the parameter. */
  String name;

  /** Value of the parameter. */
  String value;

  /** Parses an instance from its JSON representation. */
  static ActivityEventsParameters parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityEventsParameters();
    result.name = identity(json["name"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityEventsParameters value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["name"] = identity(value.name);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityId
class ActivityId extends IdentityHash {
  /** Unique qualifier if multiple events have the same time. */
  String uniqQualifier;

  /** Application ID of the source application. */
  String applicationId;

  /** Obfuscated customer ID of the source customer. */
  String customerId;

  /** Time of occurrence of the activity. */
  String time;

  /** Parses an instance from its JSON representation. */
  static ActivityId parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ActivityId();
    result.uniqQualifier = identity(json["uniqQualifier"]);
    result.applicationId = identity(json["applicationId"]);
    result.customerId = identity(json["customerId"]);
    result.time = identity(json["time"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ActivityId value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["uniqQualifier"] = identity(value.uniqQualifier);
    result["applicationId"] = identity(value.applicationId);
    result["customerId"] = identity(value.customerId);
    result["time"] = identity(value.time);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AuditApi.Alt
class AuditApiAlt implements Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final AuditApiAlt ATOM = const AuditApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final AuditApiAlt JSON = const AuditApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final List<AuditApiAlt> values = const <AuditApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AuditApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AuditApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const AuditApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

