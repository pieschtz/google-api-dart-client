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

#library('coordinate-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API CoordinateApi
/**
 * Lets you view and manage jobs in a Coordinate team.
 */
class CoordinateApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  CoordinateApi get _$service => this;
  CustomFieldDefResource _customFieldDef;
  CustomFieldDefResource get customFieldDef => _customFieldDef;
  JobsResource _jobs;
  JobsResource get jobs => _jobs;
  
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
  CoordinateApiAlt alt;


  CoordinateApi({this.baseUrl:"https://www.googleapis.com/coordinate/v1/teams/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _customFieldDef = new CustomFieldDefResource._internal(this);
    _jobs = new JobsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}coordinate/v1/20121016 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage your Google Maps Coordinate jobs */
  static final core.String COORDINATE_SCOPE = "https://www.googleapis.com/auth/coordinate";

  /** OAuth2 scope: View your Google Coordinate jobs */
  static final core.String COORDINATE_READONLY_SCOPE = "https://www.googleapis.com/auth/coordinate.readonly";
}

// Resource .CustomFieldDefResource
class CustomFieldDefResource extends core.Object {
  final CoordinateApi _$service;
  
  CustomFieldDefResource._internal(CoordinateApi $service) : _$service = $service;

  // Method CustomFieldDefResource.List
  /**
   * Retrieves a list of custom field definitions for a team.
   *
   *    * [teamId] Team ID
   */
  core.Future<CustomFieldDefListResponse> list(core.String teamId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["teamId"] = teamId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{teamId}/custom_fields";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomFieldDefListResponse.parse(JSON.parse($text)));
  }
}

// Resource .JobsResource
class JobsResource extends core.Object {
  final CoordinateApi _$service;
  
  JobsResource._internal(CoordinateApi $service) : _$service = $service;

  // Method JobsResource.Insert
  /**
   * Inserts a new job. Only the state field of the job should be set.
   *
   *    * [content] the Job
   *    * [teamId] Team ID
   *    * [address] Job address as newline (Unix) separated string
   *    * [lat] The latitude coordinate of this job's location.
   *    * [lng] The longitude coordinate of this job's location.
   *    * [title] Job title
   *    * [customerName] Customer name
   *    * [note] Job note as newline (Unix) separated string
   *    * [assignee] Assignee email address, or empty string to unassign.
   *    * [customerPhoneNumber] Customer phone number
   *    * [customField] Map from custom field id (from /team//custom_fields) to the field value. For example '123=Alice'
   */
  core.Future<Job> insert(core.String teamId, core.String address, core.double lat, core.double lng, core.String title, Job content, {core.String customerName, core.String note, core.String assignee, core.String customerPhoneNumber, core.List<core.String> customField}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["teamId"] = teamId;
    if (?address) $queryParams["address"] = address;
    if (?lat) $queryParams["lat"] = lat;
    if (?lng) $queryParams["lng"] = lng;
    if (?title) $queryParams["title"] = title;
    if (?customerName) $queryParams["customerName"] = customerName;
    if (?note) $queryParams["note"] = note;
    if (?assignee) $queryParams["assignee"] = assignee;
    if (?customerPhoneNumber) $queryParams["customerPhoneNumber"] = customerPhoneNumber;
    if (?customField) $queryParams["customField"] = customField;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Job.serialize(content));
    final $path = "{teamId}/jobs";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Job.parse(JSON.parse($text)));
  }

  // Method JobsResource.Patch
  /**
   * Updates a job. Fields that are set in the job state will be updated. This method supports patch
   * semantics.
   *
   *    * [content] the Job
   *    * [teamId] Team ID
   *    * [jobId] Job number
   *    * [customerName] Customer name
   *    * [title] Job title
   *    * [note] Job note as newline (Unix) separated string
   *    * [assignee] Assignee email address, or empty string to unassign.
   *    * [customerPhoneNumber] Customer phone number
   *    * [address] Job address as newline (Unix) separated string
   *    * [lat] The latitude coordinate of this job's location.
   *    * [progress] Job progress
   *    * [lng] The longitude coordinate of this job's location.
   *    * [customField] Map from custom field id (from /team//custom_fields) to the field value. For example '123=Alice'
   */
  core.Future<Job> patch(core.String teamId, core.String jobId, Job content, {core.String customerName, core.String title, core.String note, core.String assignee, core.String customerPhoneNumber, core.String address, core.double lat, JobsResourcePatchProgress progress, core.double lng, core.List<core.String> customField}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["teamId"] = teamId;
    $pathParams["jobId"] = jobId;
    if (?customerName) $queryParams["customerName"] = customerName;
    if (?title) $queryParams["title"] = title;
    if (?note) $queryParams["note"] = note;
    if (?assignee) $queryParams["assignee"] = assignee;
    if (?customerPhoneNumber) $queryParams["customerPhoneNumber"] = customerPhoneNumber;
    if (?address) $queryParams["address"] = address;
    if (?lat) $queryParams["lat"] = lat;
    if (?progress) $queryParams["progress"] = progress;
    if (?lng) $queryParams["lng"] = lng;
    if (?customField) $queryParams["customField"] = customField;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Job.serialize(content));
    final $path = "{teamId}/jobs/{jobId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Job.parse(JSON.parse($text)));
  }

  // Method JobsResource.List
  /**
   * Retrieves jobs created or modified since the given timestamp.
   *
   *    * [teamId] Team ID
   *    * [minModifiedTimestampMs] Minimum time a job was modified in milliseconds since epoch.
   *    * [maxResults] Maximum number of results to return in one page.
   *    * [pageToken] Continuation token
   */
  core.Future<JobListResponse> list(core.String teamId, {core.String minModifiedTimestampMs, core.int maxResults, core.String pageToken}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["teamId"] = teamId;
    if (?minModifiedTimestampMs) $queryParams["minModifiedTimestampMs"] = minModifiedTimestampMs;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{teamId}/jobs";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => JobListResponse.parse(JSON.parse($text)));
  }

  // Method JobsResource.Update
  /**
   * Updates a job. Fields that are set in the job state will be updated.
   *
   *    * [content] the Job
   *    * [teamId] Team ID
   *    * [jobId] Job number
   *    * [customerName] Customer name
   *    * [title] Job title
   *    * [note] Job note as newline (Unix) separated string
   *    * [assignee] Assignee email address, or empty string to unassign.
   *    * [customerPhoneNumber] Customer phone number
   *    * [address] Job address as newline (Unix) separated string
   *    * [lat] The latitude coordinate of this job's location.
   *    * [progress] Job progress
   *    * [lng] The longitude coordinate of this job's location.
   *    * [customField] Map from custom field id (from /team//custom_fields) to the field value. For example '123=Alice'
   */
  core.Future<Job> update(core.String teamId, core.String jobId, Job content, {core.String customerName, core.String title, core.String note, core.String assignee, core.String customerPhoneNumber, core.String address, core.double lat, JobsResourceUpdateProgress progress, core.double lng, core.List<core.String> customField}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["teamId"] = teamId;
    $pathParams["jobId"] = jobId;
    if (?customerName) $queryParams["customerName"] = customerName;
    if (?title) $queryParams["title"] = title;
    if (?note) $queryParams["note"] = note;
    if (?assignee) $queryParams["assignee"] = assignee;
    if (?customerPhoneNumber) $queryParams["customerPhoneNumber"] = customerPhoneNumber;
    if (?address) $queryParams["address"] = address;
    if (?lat) $queryParams["lat"] = lat;
    if (?progress) $queryParams["progress"] = progress;
    if (?lng) $queryParams["lng"] = lng;
    if (?customField) $queryParams["customField"] = customField;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Job.serialize(content));
    final $path = "{teamId}/jobs/{jobId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Job.parse(JSON.parse($text)));
  }

  // Method JobsResource.Get
  /**
   * Retrieves a job, including all the changes made to the job.
   *
   *    * [teamId] Team ID
   *    * [jobId] Job number
   */
  core.Future<Job> get(core.String teamId, core.String jobId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["teamId"] = teamId;
    $pathParams["jobId"] = jobId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{teamId}/jobs/{jobId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Job.parse(JSON.parse($text)));
  }
}

// Enum JobsResource.Patch.Progress
class JobsResourcePatchProgress extends core.Object implements core.Hashable {
  /** Completed */
  const JobsResourcePatchProgress COMPLETED = const JobsResourcePatchProgress._internal("COMPLETED", 0);
  /** In progress */
  const JobsResourcePatchProgress IN_PROGRESS = const JobsResourcePatchProgress._internal("IN_PROGRESS", 1);
  /** Not accepted */
  const JobsResourcePatchProgress NOT_ACCEPTED = const JobsResourcePatchProgress._internal("NOT_ACCEPTED", 2);
  /** Not started */
  const JobsResourcePatchProgress NOT_STARTED = const JobsResourcePatchProgress._internal("NOT_STARTED", 3);
  /** Obsolete */
  const JobsResourcePatchProgress OBSOLETE = const JobsResourcePatchProgress._internal("OBSOLETE", 4);

  /** All values of this enumeration */
  const core.List<JobsResourcePatchProgress> values = const <JobsResourcePatchProgress>[
    COMPLETED,
    IN_PROGRESS,
    NOT_ACCEPTED,
    NOT_STARTED,
    OBSOLETE,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <JobsResourcePatchProgress>{ 
    "COMPLETED": COMPLETED,
    "IN_PROGRESS": IN_PROGRESS,
    "NOT_ACCEPTED": NOT_ACCEPTED,
    "NOT_STARTED": NOT_STARTED,
    "OBSOLETE": OBSOLETE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static JobsResourcePatchProgress valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const JobsResourcePatchProgress._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Progress".hashCode();
}

// Enum JobsResource.Update.Progress
class JobsResourceUpdateProgress extends core.Object implements core.Hashable {
  /** Completed */
  const JobsResourceUpdateProgress COMPLETED = const JobsResourceUpdateProgress._internal("COMPLETED", 0);
  /** In progress */
  const JobsResourceUpdateProgress IN_PROGRESS = const JobsResourceUpdateProgress._internal("IN_PROGRESS", 1);
  /** Not accepted */
  const JobsResourceUpdateProgress NOT_ACCEPTED = const JobsResourceUpdateProgress._internal("NOT_ACCEPTED", 2);
  /** Not started */
  const JobsResourceUpdateProgress NOT_STARTED = const JobsResourceUpdateProgress._internal("NOT_STARTED", 3);
  /** Obsolete */
  const JobsResourceUpdateProgress OBSOLETE = const JobsResourceUpdateProgress._internal("OBSOLETE", 4);

  /** All values of this enumeration */
  const core.List<JobsResourceUpdateProgress> values = const <JobsResourceUpdateProgress>[
    COMPLETED,
    IN_PROGRESS,
    NOT_ACCEPTED,
    NOT_STARTED,
    OBSOLETE,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <JobsResourceUpdateProgress>{ 
    "COMPLETED": COMPLETED,
    "IN_PROGRESS": IN_PROGRESS,
    "NOT_ACCEPTED": NOT_ACCEPTED,
    "NOT_STARTED": NOT_STARTED,
    "OBSOLETE": OBSOLETE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static JobsResourceUpdateProgress valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const JobsResourceUpdateProgress._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Progress".hashCode();
}

// Schema .CustomField
class CustomField extends IdentityHash {
  /** Identifies this object as a custom field. */
  core.String kind;

  /** Custom field id. */
  core.String customFieldId;

  /** Custom field value. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static CustomField parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomField();
    result.kind = identity(json["kind"]);
    result.customFieldId = identity(json["customFieldId"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomField value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["customFieldId"] = identity(value.customFieldId);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomFieldDef
class CustomFieldDef extends IdentityHash {
  /** Identifies this object as a custom field definition. */
  core.String kind;

  /** Custom field name. */
  core.String name;

  /** Whether the field is enabled. */
  core.bool enabled;

  /** Whether the field is required for checkout. */
  core.bool requiredForCheckout;

  /** Custom field type. */
  core.String type;

  /** Custom field id. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static CustomFieldDef parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomFieldDef();
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.enabled = identity(json["enabled"]);
    result.requiredForCheckout = identity(json["requiredForCheckout"]);
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomFieldDef value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["enabled"] = identity(value.enabled);
    result["requiredForCheckout"] = identity(value.requiredForCheckout);
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomFieldDefListResponse
class CustomFieldDefListResponse extends IdentityHash {
  /** Collection of custom field definitions in a team. */
  core.List<CustomFieldDef> items;

  /** Identifies this object as a collection of custom field definitions in a team. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static CustomFieldDefListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomFieldDefListResponse();
    result.items = map(CustomFieldDef.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomFieldDefListResponse value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(CustomFieldDef.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomFields
class CustomFields extends IdentityHash {
  /** Identifies this object as a collection of custom fields. */
  core.String kind;

  /** Collection of custom fields. */
  core.List<CustomField> customField;

  /** Parses an instance from its JSON representation. */
  static CustomFields parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomFields();
    result.kind = identity(json["kind"]);
    result.customField = map(CustomField.parse)(json["customField"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomFields value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["customField"] = map(CustomField.serialize)(value.customField);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Job
class Job extends IdentityHash {
  /** Identifies this object as a job. */
  core.String kind;

  /**
 * List of job changes since it was created. The first change corresponds to the state of the job
 * when it was created.
 */
  core.List<JobChange> jobChange;

  /** Job id. */
  core.String id;

  /** Current job state. */
  JobState state;

  /** Parses an instance from its JSON representation. */
  static Job parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Job();
    result.kind = identity(json["kind"]);
    result.jobChange = map(JobChange.parse)(json["jobChange"]);
    result.id = identity(json["id"]);
    result.state = JobState.parse(json["state"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Job value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["jobChange"] = map(JobChange.serialize)(value.jobChange);
    result["id"] = identity(value.id);
    result["state"] = JobState.serialize(value.state);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobChange
class JobChange extends IdentityHash {
  /** Time at which this change was applied. */
  core.String timestamp;

  /** Identifies this object as a job change. */
  core.String kind;

  /** Change applied to the job. Only the fields that were changed are set. */
  JobState state;

  /** Parses an instance from its JSON representation. */
  static JobChange parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new JobChange();
    result.timestamp = identity(json["timestamp"]);
    result.kind = identity(json["kind"]);
    result.state = JobState.parse(json["state"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(JobChange value) {
    if (value == null) return null;
    final result = {};
    result["timestamp"] = identity(value.timestamp);
    result["kind"] = identity(value.kind);
    result["state"] = JobState.serialize(value.state);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobListResponse
class JobListResponse extends IdentityHash {
  /** A token to provide to get the next page of results. */
  core.String nextPageToken;

  /** Jobs in the collection. */
  core.List<Job> items;

  /** Identifies this object as a list of jobs. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static JobListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new JobListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Job.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(JobListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Job.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JobState
class JobState extends IdentityHash {
  /** Identifies this object as a job state. */
  core.String kind;

  /** Customer name. */
  core.String customerName;

  /** Job title. */
  core.String title;

  /** Note added to the job. */
  core.List<core.String> note;

  /** Email address of the assignee. */
  core.String assignee;

  /** Customer phone number. */
  core.String customerPhoneNumber;

  /** Job location. */
  Location location;

  /** Job progress. */
  core.String progress;

  /** Custom fields. */
  CustomFields customFields;

  /** Parses an instance from its JSON representation. */
  static JobState parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new JobState();
    result.kind = identity(json["kind"]);
    result.customerName = identity(json["customerName"]);
    result.title = identity(json["title"]);
    result.note = map(identity)(json["note"]);
    result.assignee = identity(json["assignee"]);
    result.customerPhoneNumber = identity(json["customerPhoneNumber"]);
    result.location = Location.parse(json["location"]);
    result.progress = identity(json["progress"]);
    result.customFields = CustomFields.parse(json["customFields"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(JobState value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["customerName"] = identity(value.customerName);
    result["title"] = identity(value.title);
    result["note"] = map(identity)(value.note);
    result["assignee"] = identity(value.assignee);
    result["customerPhoneNumber"] = identity(value.customerPhoneNumber);
    result["location"] = Location.serialize(value.location);
    result["progress"] = identity(value.progress);
    result["customFields"] = CustomFields.serialize(value.customFields);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Location
class Location extends IdentityHash {
  /** Latitude. */
  core.double lat;

  /** Identifies this object as a location. */
  core.String kind;

  /** Address. */
  core.List<core.String> addressLine;

  /** Longitude. */
  core.double lng;

  /** Parses an instance from its JSON representation. */
  static Location parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Location();
    result.lat = identity(json["lat"]);
    result.kind = identity(json["kind"]);
    result.addressLine = map(identity)(json["addressLine"]);
    result.lng = identity(json["lng"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Location value) {
    if (value == null) return null;
    final result = {};
    result["lat"] = identity(value.lat);
    result["kind"] = identity(value.kind);
    result["addressLine"] = map(identity)(value.addressLine);
    result["lng"] = identity(value.lng);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum CoordinateApi.Alt
class CoordinateApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const CoordinateApiAlt JSON = const CoordinateApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<CoordinateApiAlt> values = const <CoordinateApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <CoordinateApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CoordinateApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const CoordinateApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

