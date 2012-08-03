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

#library('audit-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AuditApi
/**
 * Lets you access user activities in your enterprise made through various applications.
 */
class AuditApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  AuditApi get _$service() => this;
  ActivitiesResource _activities;
  ActivitiesResource get activities() => _activities;
  
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
  AuditApiAlt alt;


  AuditApi([this.baseUrl = "https://www.googleapis.com/apps/reporting/audit/v1/", applicationName, this.authenticator]) :
      this.applicationName = applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _activities = new ActivitiesResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}audit/v1/20111110 google-api-dart-client/${clientVersion}";
  }

}

// Resource .ActivitiesResource
class ActivitiesResource extends core.Object {
  final AuditApi _$service;
  
  ActivitiesResource._internal(AuditApi $service) : _$service = $service;

  // Method ActivitiesResource.List
  /**
   * Retrieves a list of activities for a specific customer and application.
   *
   *    * [customerId] Represents the customer who is the owner of target object on which action was performed.
   *    * [applicationId] Application ID of the application on which the event was performed.
   *    * [actorEmail] Email address of the user who performed the action.
   *    * [actorApplicationId] Application ID of the application which interacted on behalf of the user while performing the event.
   *    * [actorIpAddress] IP Address of host where the event was performed. Supports both IPv4 and IPv6 addresses.
   *    * [caller] Type of the caller.
   *    * [maxResults] Number of activity records to be shown in each page.

  Minimum: 1.
  Maximum: 1000.
   *    * [eventName] Name of the event being queried.
   *    * [parameters] Event parameters in the form [parameter1 name]:[parameter1 value],[parameter2 name]:[parameter2
   *        value],...
   *    * [startTime] Return events which occured at or after this time.
   *    * [endTime] Return events which occured at or before this time.
   *    * [continuationToken] Next page URL.
   */
  core.Future<Activities> list(core.String customerId, core.String applicationId, [core.String actorEmail = UNSPECIFIED, core.String actorApplicationId = UNSPECIFIED, core.String actorIpAddress = UNSPECIFIED, ActivitiesResourceListCaller caller = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String eventName = UNSPECIFIED, core.String parameters = UNSPECIFIED, core.String startTime = UNSPECIFIED, core.String endTime = UNSPECIFIED, core.String continuationToken = UNSPECIFIED]) {
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
    final $path = "{customerId}/{applicationId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Activities.parse(JSON.parse($text)));
  }
}

// Enum ActivitiesResource.List.Caller
class ActivitiesResourceListCaller extends core.Object implements core.Hashable {
  /** Caller is an application owner. */
  static final ActivitiesResourceListCaller APPLICATION_OWNER = const ActivitiesResourceListCaller._internal("application_owner", 0);
  /** Caller is a customer. */
  static final ActivitiesResourceListCaller CUSTOMER = const ActivitiesResourceListCaller._internal("customer", 1);

  /** All values of this enumeration */
  static final core.List<ActivitiesResourceListCaller> values = const <ActivitiesResourceListCaller>[
    APPLICATION_OWNER,
    CUSTOMER,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ActivitiesResourceListCaller>{ 
    "application_owner": APPLICATION_OWNER,
    "customer": CUSTOMER,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ActivitiesResourceListCaller valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ActivitiesResourceListCaller._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Caller".hashCode();
}

// Schema .Activities
class Activities extends IdentityHash {
  /** Each record in read response. */
  core.List<Activity> items;

  /** Kind of list response this is. */
  core.String kind;

  /** Next page URL. */
  core.String next;

  /** Parses an instance from its JSON representation. */
  static Activities parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Activities();
    result.items = map(Activity.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.next = identity(json["next"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Activities value) {
    if (value == null) return null;
    final result = {};
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
  core.String kind;

  /** Domain of source customer. */
  core.String ownerDomain;

  /** User doing the action. */
  ActivityActor actor;

  /** Unique identifier for each activity record. */
  ActivityId id;

  /** IP Address of the user doing the action. */
  core.String ipAddress;

  /** Activity events. */
  core.List<ActivityEvents> events;

  /** Parses an instance from its JSON representation. */
  static Activity parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Activity value) {
    if (value == null) return null;
    final result = {};
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
  core.String applicationId;

  /** Email address of the user. */
  core.String email;

  /** For OAuth 2LO API requests, consumer_key of the requestor. */
  core.String key;

  /** User or OAuth 2LO request. */
  core.String callerType;

  /** Parses an instance from its JSON representation. */
  static ActivityActor parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityActor();
    result.applicationId = identity(json["applicationId"]);
    result.email = identity(json["email"]);
    result.key = identity(json["key"]);
    result.callerType = identity(json["callerType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityActor value) {
    if (value == null) return null;
    final result = {};
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
  core.String eventType;

  /** Name of event. */
  core.String name;

  /** Event parameters. */
  core.List<ActivityEventsParameters> parameters;

  /** Parses an instance from its JSON representation. */
  static ActivityEvents parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityEvents();
    result.eventType = identity(json["eventType"]);
    result.name = identity(json["name"]);
    result.parameters = map(ActivityEventsParameters.parse)(json["parameters"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityEvents value) {
    if (value == null) return null;
    final result = {};
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
  core.String name;

  /** Value of the parameter. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static ActivityEventsParameters parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityEventsParameters();
    result.name = identity(json["name"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityEventsParameters value) {
    if (value == null) return null;
    final result = {};
    result["name"] = identity(value.name);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Activity.ActivityId
class ActivityId extends IdentityHash {
  /** Unique qualifier if multiple events have the same time. */
  core.String uniqQualifier;

  /** Application ID of the source application. */
  core.String applicationId;

  /** Obfuscated customer ID of the source customer. */
  core.String customerId;

  /** Time of occurrence of the activity. */
  core.String time;

  /** Parses an instance from its JSON representation. */
  static ActivityId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityId();
    result.uniqQualifier = identity(json["uniqQualifier"]);
    result.applicationId = identity(json["applicationId"]);
    result.customerId = identity(json["customerId"]);
    result.time = identity(json["time"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityId value) {
    if (value == null) return null;
    final result = {};
    result["uniqQualifier"] = identity(value.uniqQualifier);
    result["applicationId"] = identity(value.applicationId);
    result["customerId"] = identity(value.customerId);
    result["time"] = identity(value.time);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AuditApi.Alt
class AuditApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final AuditApiAlt ATOM = const AuditApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final AuditApiAlt JSON = const AuditApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final core.List<AuditApiAlt> values = const <AuditApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AuditApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AuditApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AuditApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

