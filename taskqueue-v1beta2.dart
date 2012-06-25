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

#library('taskqueue-v1beta2');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API TaskqueueApi
/**
 * Lets you access a Google App Engine Pull Task Queue over REST.
 */
class TaskqueueApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  TaskqueueApi get _$service() => this;
  TaskqueuesResource _taskqueues;
  TaskqueuesResource get taskqueues() => _taskqueues;
  TasksResource _tasks;
  TasksResource get tasks() => _tasks;
  
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
  TaskqueueApiAlt alt;


  TaskqueueApi([this.baseUrl = "https://www.googleapis.com/taskqueue/v1beta2/projects/", this.applicationName, this.authenticator]) { 
    _taskqueues = new TaskqueuesResource._internal(this);
    _tasks = new TasksResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}taskqueue/v1beta2/20120501 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your Tasks and Taskqueues */
  final core.String TASKQUEUE_SCOPE = "https://www.googleapis.com/auth/taskqueue";

  /** OAuth2 scope: Consume Tasks from your Taskqueues */
  final core.String TASKQUEUE_CONSUMER_SCOPE = "https://www.googleapis.com/auth/taskqueue.consumer";
}

// Resource .TaskqueuesResource
class TaskqueuesResource extends core.Object {
  final TaskqueueApi _$service;
  
  TaskqueuesResource._internal(TaskqueueApi $service) : _$service = $service;

  // Method TaskqueuesResource.Get
  /**
   * Get detailed information about a TaskQueue.
   * [project] The project under which the queue lies.
   * [taskqueue] The id of the taskqueue to get the properties of.
   */
  core.Future<TaskQueue> get(core.String project, core.String taskqueue, [core.bool getStats = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    if (UNSPECIFIED != getStats) $queryParams["getStats"] = getStats;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/taskqueues/{taskqueue}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => TaskQueue.parse(JSON.parse($text)));
  }
}

// Resource .TasksResource
class TasksResource extends core.Object {
  final TaskqueueApi _$service;
  
  TasksResource._internal(TaskqueueApi $service) : _$service = $service;

  // Method TasksResource.Insert
  /**
   * Insert a new task in a TaskQueue
   * [project] The project under which the queue lies
   * [taskqueue] The taskqueue to insert the task into
   * [content] the Task
   */
  core.Future<Task> insert(core.String project, core.String taskqueue, Task content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Task.serialize(content));
    final $path = "{project}/taskqueues/{taskqueue}/tasks";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Task.parse(JSON.parse($text)));
  }

  // Method TasksResource.Get
  /**
   * Get a particular task from a TaskQueue.
   * [project] The project under which the queue lies.
   * [taskqueue] The taskqueue in which the task belongs.
   * [task] The task to get properties of.
   */
  core.Future<Task> get(core.String project, core.String taskqueue, core.String task) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    $pathParams["task"] = task;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/taskqueues/{taskqueue}/tasks/{task}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Task.parse(JSON.parse($text)));
  }

  // Method TasksResource.List
  /**
   * List Tasks in a TaskQueue
   * [project] The project under which the queue lies.
   * [taskqueue] The id of the taskqueue to list tasks from.
   */
  core.Future<Tasks2> list(core.String project, core.String taskqueue) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/taskqueues/{taskqueue}/tasks";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Tasks2.parse(JSON.parse($text)));
  }

  // Method TasksResource.Update
  /**
   * Update tasks that are leased out of a TaskQueue.
   * [project] The project under which the queue lies.
   * [taskqueue]
   * [task]
   * [newLeaseSeconds] The new lease in seconds.
   * [content] the Task
   */
  core.Future<Task> update(core.String project, core.String taskqueue, core.String task, core.int newLeaseSeconds, Task content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    $pathParams["task"] = task;
    $pathParams["newLeaseSeconds"] = newLeaseSeconds;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Task.serialize(content));
    final $path = "{project}/taskqueues/{taskqueue}/tasks/{task}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Task.parse(JSON.parse($text)));
  }

  // Method TasksResource.Patch
  /**
   * Update tasks that are leased out of a TaskQueue. This method supports patch semantics.
   * [project] The project under which the queue lies.
   * [taskqueue]
   * [task]
   * [newLeaseSeconds] The new lease in seconds.
   * [content] the Task
   */
  core.Future<Task> patch(core.String project, core.String taskqueue, core.String task, core.int newLeaseSeconds, Task content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    $pathParams["task"] = task;
    $pathParams["newLeaseSeconds"] = newLeaseSeconds;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Task.serialize(content));
    final $path = "{project}/taskqueues/{taskqueue}/tasks/{task}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Task.parse(JSON.parse($text)));
  }

  // Method TasksResource.Delete
  /**
   * Delete a task from a TaskQueue.
   * [project] The project under which the queue lies.
   * [taskqueue] The taskqueue to delete a task from.
   * [task] The id of the task to delete.
   */
  core.Future delete(core.String project, core.String taskqueue, core.String task) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    $pathParams["task"] = task;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/taskqueues/{taskqueue}/tasks/{task}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method TasksResource.Lease
  /**
   * Lease 1 or more tasks from a TaskQueue.
   * [project] The project under which the queue lies.
   * [taskqueue] The taskqueue to lease a task from.
   * [numTasks] The number of tasks to lease.
   * [leaseSecs] The lease in seconds.
   */
  core.Future<Tasks> lease(core.String project, core.String taskqueue, core.int numTasks, core.int leaseSecs, [core.bool groupByTag = UNSPECIFIED, core.String tag = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["project"] = project;
    $pathParams["taskqueue"] = taskqueue;
    $pathParams["numTasks"] = numTasks;
    $pathParams["leaseSecs"] = leaseSecs;
    if (UNSPECIFIED != groupByTag) $queryParams["groupByTag"] = groupByTag;
    if (UNSPECIFIED != tag) $queryParams["tag"] = tag;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{project}/taskqueues/{taskqueue}/tasks/lease";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Tasks.parse(JSON.parse($text)));
  }
}

// Schema .Task
class Task extends IdentityHash {
  /** The kind of object returned, in this case set to task. */
  core.String kind;

  /**
 * Time (in seconds since the epoch) at which the task lease will expire. This value is 0 if the
 * task isnt currently leased out to a worker.
 */
  core.String leaseTimestamp;

  /** Name of the task. */
  core.String id;

  /** Tag for the task, could be used later to lease tasks grouped by a specific tag. */
  core.String tag;

  /**
 * A bag of bytes which is the task payload. The payload on the JSON side is always Base64 encoded.
 */
  core.String payloadBase64;

  /** Name of the queue that the task is in. */
  core.String queueName;

  /** Time (in seconds since the epoch) at which the task was enqueued. */
  core.String enqueueTimestamp;

  /** Parses an instance from its JSON representation. */
  static Task parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Task();
    result.kind = identity(json["kind"]);
    result.leaseTimestamp = identity(json["leaseTimestamp"]);
    result.id = identity(json["id"]);
    result.tag = identity(json["tag"]);
    result.payloadBase64 = identity(json["payloadBase64"]);
    result.queueName = identity(json["queueName"]);
    result.enqueueTimestamp = identity(json["enqueueTimestamp"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Task value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["leaseTimestamp"] = identity(value.leaseTimestamp);
    result["id"] = identity(value.id);
    result["tag"] = identity(value.tag);
    result["payloadBase64"] = identity(value.payloadBase64);
    result["queueName"] = identity(value.queueName);
    result["enqueueTimestamp"] = identity(value.enqueueTimestamp);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TaskQueue
class TaskQueue extends IdentityHash {
  /** The kind of REST object returned, in this case taskqueue. */
  core.String kind;

  /** Statistics for the TaskQueue object in question. */
  TaskQueueStats stats;

  /** Name of the taskqueue. */
  core.String id;

  /**
 * The number of times we should lease out tasks before giving up on them. If unset we lease them
 * out forever until a worker deletes the task.
 */
  core.int maxLeases;

  /** ACLs that are applicable to this TaskQueue object. */
  TaskQueueAcl acl;

  /** Parses an instance from its JSON representation. */
  static TaskQueue parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TaskQueue();
    result.kind = identity(json["kind"]);
    result.stats = TaskQueueStats.parse(json["stats"]);
    result.id = identity(json["id"]);
    result.maxLeases = identity(json["maxLeases"]);
    result.acl = TaskQueueAcl.parse(json["acl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TaskQueue value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["stats"] = TaskQueueStats.serialize(value.stats);
    result["id"] = identity(value.id);
    result["maxLeases"] = identity(value.maxLeases);
    result["acl"] = TaskQueueAcl.serialize(value.acl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema TaskQueue.TaskQueueAcl
class TaskQueueAcl extends IdentityHash {
  /**
 * Email addresses of users who can "consume" tasks from the TaskQueue. This means they can Dequeue
 * and Delete tasks from the queue.
 */
  core.List<core.String> consumerEmails;

  /**
 * Email addresses of users who can "produce" tasks into the TaskQueue. This means they can Insert
 * tasks into the queue.
 */
  core.List<core.String> producerEmails;

  /**
 * Email addresses of users who are "admins" of the TaskQueue. This means they can control the
 * queue, eg set ACLs for the queue.
 */
  core.List<core.String> adminEmails;

  /** Parses an instance from its JSON representation. */
  static TaskQueueAcl parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TaskQueueAcl();
    result.consumerEmails = map(identity)(json["consumerEmails"]);
    result.producerEmails = map(identity)(json["producerEmails"]);
    result.adminEmails = map(identity)(json["adminEmails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TaskQueueAcl value) {
    if (value == null) return null;
    final result = {};
    result["consumerEmails"] = map(identity)(value.consumerEmails);
    result["producerEmails"] = map(identity)(value.producerEmails);
    result["adminEmails"] = map(identity)(value.adminEmails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema TaskQueue.TaskQueueStats
class TaskQueueStats extends IdentityHash {
  /** The timestamp (in seconds since the epoch) of the oldest unfinished task. */
  core.String oldestTask;

  /** Number of tasks leased in the last minute. */
  core.String leasedLastMinute;

  /** Number of tasks in the queue. */
  core.int totalTasks;

  /** Number of tasks leased in the last hour. */
  core.String leasedLastHour;

  /** Parses an instance from its JSON representation. */
  static TaskQueueStats parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TaskQueueStats();
    result.oldestTask = identity(json["oldestTask"]);
    result.leasedLastMinute = identity(json["leasedLastMinute"]);
    result.totalTasks = identity(json["totalTasks"]);
    result.leasedLastHour = identity(json["leasedLastHour"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TaskQueueStats value) {
    if (value == null) return null;
    final result = {};
    result["oldestTask"] = identity(value.oldestTask);
    result["leasedLastMinute"] = identity(value.leasedLastMinute);
    result["totalTasks"] = identity(value.totalTasks);
    result["leasedLastHour"] = identity(value.leasedLastHour);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Tasks
class Tasks extends IdentityHash {
  /** The actual list of tasks returned as a result of the lease operation. */
  core.List<Task> items;

  /** The kind of object returned, a list of tasks. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Tasks parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Tasks();
    result.items = map(Task.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Tasks value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Task.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Tasks2
class Tasks2 extends IdentityHash {
  /** The actual list of tasks currently active in the TaskQueue. */
  core.List<Task> items;

  /** The kind of object returned, a list of tasks. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Tasks2 parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Tasks2();
    result.items = map(Task.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Tasks2 value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Task.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum TaskqueueApi.Alt
class TaskqueueApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final TaskqueueApiAlt JSON = const TaskqueueApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<TaskqueueApiAlt> values = const <TaskqueueApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <TaskqueueApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static TaskqueueApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const TaskqueueApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

