#library("tasks");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API TasksApi
/**
 * Lets you manage your tasks and task lists.
 */
class TasksApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  TasksApi get _$service() => this;
  TasksResource _tasks;
  TasksResource get tasks() => _tasks;
  TasklistsResource _tasklists;
  TasklistsResource get tasklists() => _tasklists;
  
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
  TasksApiAlt alt;


  TasksApi([this.baseUrl = "https://www.googleapis.com/tasks/v1/", this.applicationName]) { 
    _tasks = new TasksResource._internal(this);
    _tasklists = new TasklistsResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}tasks/v1/20111027 google-api-dart-client/${clientVersion}";
  }
}

// Resource .TasksResource
class TasksResource {
  final TasksApi _$service;
  
  TasksResource._internal(TasksApi $service) : _$service = $service;

  // Method TasksResource.Insert
  /**
   * Creates a new task on the specified task list.
   * [tasklist] Task list identifier.
   * [content] the Task
   */
  Future<Task> insert(String tasklist, Task content, [String parent = UNSPECIFIED, String previous = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (UNSPECIFIED != parent) $queryParams["parent"] = parent;
    if (UNSPECIFIED != previous) $queryParams["previous"] = previous;
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
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks").generate($pathParams, $queryParams);
    final $completer = new Completer<Task>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Task.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasksResource.Get
  /**
   * Returns the specified task.
   * [tasklist] Task list identifier.
   * [task] Task identifier.
   */
  Future<Task> get(String tasklist, String task) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    $pathParams["task"] = task;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks/{task}").generate($pathParams, $queryParams);
    final $completer = new Completer<Task>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Task.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasksResource.Clear
  /**
   * Clears all completed tasks from the specified task list. The affected tasks will be marked as
   * 'hidden' and no longer be returned by default when retrieving all tasks for a task list.
   * [tasklist] Task list identifier.
   */
  Future clear(String tasklist) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/clear").generate($pathParams, $queryParams);
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

  // Method TasksResource.Move
  /**
   * Moves the specified task to another position in the task list. This can include putting it as a
   * child task under a new parent and/or move it to a different position among its sibling tasks.
   * [tasklist] Task list identifier.
   * [task] Task identifier.
   */
  Future<Task> move(String tasklist, String task, [String parent = UNSPECIFIED, String previous = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    $pathParams["task"] = task;
    if (UNSPECIFIED != parent) $queryParams["parent"] = parent;
    if (UNSPECIFIED != previous) $queryParams["previous"] = previous;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks/{task}/move").generate($pathParams, $queryParams);
    final $completer = new Completer<Task>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Task.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasksResource.List
  /**
   * Returns all tasks in the specified task list.
   * [tasklist] Task list identifier.
   */
  Future<Tasks> list(String tasklist, [String dueMax = UNSPECIFIED, bool showDeleted = UNSPECIFIED, String updatedMin = UNSPECIFIED, String completedMin = UNSPECIFIED, String maxResults = UNSPECIFIED, bool showCompleted = UNSPECIFIED, String pageToken = UNSPECIFIED, String completedMax = UNSPECIFIED, bool showHidden = UNSPECIFIED, String dueMin = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (UNSPECIFIED != dueMax) $queryParams["dueMax"] = dueMax;
    if (UNSPECIFIED != showDeleted) $queryParams["showDeleted"] = showDeleted;
    if (UNSPECIFIED != updatedMin) $queryParams["updatedMin"] = updatedMin;
    if (UNSPECIFIED != completedMin) $queryParams["completedMin"] = completedMin;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != showCompleted) $queryParams["showCompleted"] = showCompleted;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != completedMax) $queryParams["completedMax"] = completedMax;
    if (UNSPECIFIED != showHidden) $queryParams["showHidden"] = showHidden;
    if (UNSPECIFIED != dueMin) $queryParams["dueMin"] = dueMin;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks").generate($pathParams, $queryParams);
    final $completer = new Completer<Tasks>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Tasks.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasksResource.Update
  /**
   * Updates the specified task.
   * [tasklist] Task list identifier.
   * [task] Task identifier.
   * [content] the Task
   */
  Future<Task> update(String tasklist, String task, Task content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    $pathParams["task"] = task;
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
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks/{task}").generate($pathParams, $queryParams);
    final $completer = new Completer<Task>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Task.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasksResource.Patch
  /**
   * Updates the specified task. This method supports patch semantics.
   * [tasklist] Task list identifier.
   * [task] Task identifier.
   * [content] the Task
   */
  Future<Task> patch(String tasklist, String task, Task content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    $pathParams["task"] = task;
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
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks/{task}").generate($pathParams, $queryParams);
    final $completer = new Completer<Task>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Task.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasksResource.Delete
  /**
   * Deletes the specified task from the task list.
   * [tasklist] Task list identifier.
   * [task] Task identifier.
   */
  Future delete(String tasklist, String task) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    $pathParams["task"] = task;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "lists/{tasklist}/tasks/{task}").generate($pathParams, $queryParams);
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

// Resource .TasklistsResource
class TasklistsResource {
  final TasksApi _$service;
  
  TasklistsResource._internal(TasksApi $service) : _$service = $service;

  // Method TasklistsResource.Insert
  /**
   * Creates a new task list and adds it to the authenticated user's task lists.
   * [content] the TaskList
   */
  Future<TaskList> insert(TaskList content) {
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
    final $body = JSON.stringify(TaskList.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "users/@me/lists").generate($pathParams, $queryParams);
    final $completer = new Completer<TaskList>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TaskList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasklistsResource.Get
  /**
   * Returns the authenticated user's specified task list.
   * [tasklist] Task list identifier.
   */
  Future<TaskList> get(String tasklist) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/@me/lists/{tasklist}").generate($pathParams, $queryParams);
    final $completer = new Completer<TaskList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TaskList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasklistsResource.List
  /**
   * Returns all the authenticated user's task lists.
   */
  Future<TaskLists> list([String pageToken = UNSPECIFIED, String maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
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
    final $url = new UrlPattern(_$service.baseUrl + "users/@me/lists").generate($pathParams, $queryParams);
    final $completer = new Completer<TaskLists>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TaskLists.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasklistsResource.Update
  /**
   * Updates the authenticated user's specified task list.
   * [tasklist] Task list identifier.
   * [content] the TaskList
   */
  Future<TaskList> update(String tasklist, TaskList content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(TaskList.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "users/@me/lists/{tasklist}").generate($pathParams, $queryParams);
    final $completer = new Completer<TaskList>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TaskList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasklistsResource.Patch
  /**
   * Updates the authenticated user's specified task list. This method supports patch semantics.
   * [tasklist] Task list identifier.
   * [content] the TaskList
   */
  Future<TaskList> patch(String tasklist, TaskList content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(TaskList.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "users/@me/lists/{tasklist}").generate($pathParams, $queryParams);
    final $completer = new Completer<TaskList>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = TaskList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method TasklistsResource.Delete
  /**
   * Deletes the authenticated user's specified task list.
   * [tasklist] Task list identifier.
   */
  Future delete(String tasklist) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["tasklist"] = tasklist;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/@me/lists/{tasklist}").generate($pathParams, $queryParams);
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

// Schema .Task
class Task extends IdentityHash {
  /** Status of the task. This is either "needsAction" or "completed". */
  String status;

  /** Type of the resource. This is always "tasks#task". */
  String kind;

  /** Last modification time of the task (as a RFC 3339 timestamp). */
  String updated;

  /**
 * Parent task identifier. This field is omitted if it is a top-level task. This field is read-only.
 * Use the "move" method to move the task under a different parent or to the top level.
 */
  String parent;

  /** Collection of links. This collection is read-only. */
  List<TaskLinks> links;

  /** Title of the task. */
  String title;

  /** Flag indicating whether the task has been deleted. The default if False. */
  bool deleted;

  /**
 * Completion date of the task (as a RFC 3339 timestamp). This field is omitted if the task has not
 * been completed.
 */
  String completed;

  /** Due date of the task (as a RFC 3339 timestamp). Optional. */
  String due;

  /** ETag of the resource. */
  String etag;

  /** Notes describing the task. Optional. */
  String notes;

  /**
 * String indicating the position of the task among its sibling tasks under the same parent task or
 * at the top level. If this string is greater than another task's corresponding position string
 * according to lexicographical ordering, the task is positioned after the other task under the same
 * parent task (or at the top level). This field is read-only. Use the "move" method to move the
 * task to another position.
 */
  String position;

  /**
 * Flag indicating whether the task is hidden. This is the case if the task had been marked
 * completed when the task list was last cleared. The default is False. This field is read-only.
 */
  bool hidden;

  /** Task identifier. */
  String id;

  /** URL pointing to this task. Used to retrieve, update, or delete this task. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Task parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Task();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.updated = identity(json["updated"]);
    result.parent = identity(json["parent"]);
    result.links = map(TaskLinks.parse)(json["links"]);
    result.title = identity(json["title"]);
    result.deleted = identity(json["deleted"]);
    result.completed = identity(json["completed"]);
    result.due = identity(json["due"]);
    result.etag = identity(json["etag"]);
    result.notes = identity(json["notes"]);
    result.position = identity(json["position"]);
    result.hidden = identity(json["hidden"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Task value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["updated"] = identity(value.updated);
    result["parent"] = identity(value.parent);
    result["links"] = map(TaskLinks.serialize)(value.links);
    result["title"] = identity(value.title);
    result["deleted"] = identity(value.deleted);
    result["completed"] = identity(value.completed);
    result["due"] = identity(value.due);
    result["etag"] = identity(value.etag);
    result["notes"] = identity(value.notes);
    result["position"] = identity(value.position);
    result["hidden"] = identity(value.hidden);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Task.TaskLinks
class TaskLinks extends IdentityHash {
  /** Type of the link, e.g. "email". */
  String type;

  /** The URL. */
  String link;

  /** The description. In HTML speak: Everything between  and . */
  String description;

  /** Parses an instance from its JSON representation. */
  static TaskLinks parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TaskLinks();
    result.type = identity(json["type"]);
    result.link = identity(json["link"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TaskLinks value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["link"] = identity(value.link);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TaskList
class TaskList extends IdentityHash {
  /** Type of the resource. This is always "tasks#taskList". */
  String kind;

  /** Title of the task list. */
  String title;

  /** Last modification time of the task list (as a RFC 3339 timestamp). */
  String updated;

  /** ETag of the resource. */
  String etag;

  /** Task list identifier. */
  String id;

  /** URL pointing to this task list. Used to retrieve, update, or delete this task list. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static TaskList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TaskList();
    result.kind = identity(json["kind"]);
    result.title = identity(json["title"]);
    result.updated = identity(json["updated"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TaskList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["title"] = identity(value.title);
    result["updated"] = identity(value.updated);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TaskLists
class TaskLists extends IdentityHash {
  /** Token that can be used to request the next page of this result. */
  String nextPageToken;

  /** Collection of task lists. */
  List<TaskList> items;

  /** Type of the resource. This is always "tasks#taskLists". */
  String kind;

  /** ETag of the resource. */
  String etag;

  /** Parses an instance from its JSON representation. */
  static TaskLists parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TaskLists();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(TaskList.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TaskLists value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(TaskList.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Tasks
class Tasks extends IdentityHash {
  /** Token used to access the next page of this result. */
  String nextPageToken;

  /** Collection of tasks. */
  List<Task> items;

  /** Type of the resource. This is always "tasks#tasks". */
  String kind;

  /** ETag of the resource. */
  String etag;

  /** Parses an instance from its JSON representation. */
  static Tasks parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Tasks();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Task.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Tasks value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Task.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum TasksApi.Alt
class TasksApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final TasksApiAlt JSON = const TasksApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<TasksApiAlt> values = const <TasksApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <TasksApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static TasksApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const TasksApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

