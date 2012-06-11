#library("calendar");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API CalendarApi
/**
 * Lets you manipulate events and other calendar data.
 */
class CalendarApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  CalendarApi get _$service() => this;
  FreebusyResource _freebusy;
  FreebusyResource get freebusy() => _freebusy;
  SettingsResource _settings;
  SettingsResource get settings() => _settings;
  CalendarListResource _calendarList;
  CalendarListResource get calendarList() => _calendarList;
  CalendarsResource _calendars;
  CalendarsResource get calendars() => _calendars;
  AclResource _acl;
  AclResource get acl() => _acl;
  ColorsResource _colors;
  ColorsResource get colors() => _colors;
  EventsResource _events;
  EventsResource get events() => _events;
  
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
  CalendarApiAlt alt;


  CalendarApi([this.baseUrl = "https://www.googleapis.com/calendar/v3/", this.applicationName]) { 
    _freebusy = new FreebusyResource._internal(this);
    _settings = new SettingsResource._internal(this);
    _calendarList = new CalendarListResource._internal(this);
    _calendars = new CalendarsResource._internal(this);
    _acl = new AclResource._internal(this);
    _colors = new ColorsResource._internal(this);
    _events = new EventsResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}calendar/v3/20120423 google-api-dart-client/${clientVersion}";
  }
}

// Resource .FreebusyResource
class FreebusyResource {
  final CalendarApi _$service;
  
  FreebusyResource._internal(CalendarApi $service) : _$service = $service;

  // Method FreebusyResource.Query
  /**
   * Returns free/busy information for a set of calendars.
   * [content] the FreeBusyRequest
   */
  Future<FreeBusyResponse> query(FreeBusyRequest content) {
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
    final $body = JSON.stringify(FreeBusyRequest.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "freeBusy").generate($pathParams, $queryParams);
    final $completer = new Completer<FreeBusyResponse>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = FreeBusyResponse.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .SettingsResource
class SettingsResource {
  final CalendarApi _$service;
  
  SettingsResource._internal(CalendarApi $service) : _$service = $service;

  // Method SettingsResource.List
  /**
   * Returns all user settings for the authenticated user.
   */
  Future<Settings> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "users/me/settings").generate($pathParams, $queryParams);
    final $completer = new Completer<Settings>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Settings.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method SettingsResource.Get
  /**
   * Returns a single user setting.
   * [setting] Name of the user setting.
   */
  Future<Setting> get(String setting) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["setting"] = setting;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/me/settings/{setting}").generate($pathParams, $queryParams);
    final $completer = new Completer<Setting>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Setting.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CalendarListResource
class CalendarListResource {
  final CalendarApi _$service;
  
  CalendarListResource._internal(CalendarApi $service) : _$service = $service;

  // Method CalendarListResource.Insert
  /**
   * Adds an entry to the user's calendar list.
   * [content] the CalendarListEntry
   */
  Future<CalendarListEntry> insert(CalendarListEntry content) {
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
    final $body = JSON.stringify(CalendarListEntry.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "users/me/calendarList").generate($pathParams, $queryParams);
    final $completer = new Completer<CalendarListEntry>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CalendarListEntry.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarListResource.Get
  /**
   * Returns an entry on the user's calendar list.
   * [calendarId] Calendar identifier.
   */
  Future<CalendarListEntry> get(String calendarId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/me/calendarList/{calendarId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CalendarListEntry>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CalendarListEntry.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarListResource.List
  /**
   * Returns entries on the user's calendar list.
   */
  Future<CalendarList> list([String pageToken = UNSPECIFIED, bool showHidden = UNSPECIFIED, int maxResults = UNSPECIFIED, CalendarListResourceListMinAccessRole minAccessRole = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != showHidden) $queryParams["showHidden"] = showHidden;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != minAccessRole) $queryParams["minAccessRole"] = minAccessRole;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/me/calendarList").generate($pathParams, $queryParams);
    final $completer = new Completer<CalendarList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CalendarList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarListResource.Update
  /**
   * Updates an entry on the user's calendar list.
   * [calendarId] Calendar identifier.
   * [content] the CalendarListEntry
   */
  Future<CalendarListEntry> update(String calendarId, CalendarListEntry content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CalendarListEntry.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "users/me/calendarList/{calendarId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CalendarListEntry>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CalendarListEntry.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarListResource.Patch
  /**
   * Updates an entry on the user's calendar list. This method supports patch semantics.
   * [calendarId] Calendar identifier.
   * [content] the CalendarListEntry
   */
  Future<CalendarListEntry> patch(String calendarId, CalendarListEntry content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CalendarListEntry.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "users/me/calendarList/{calendarId}").generate($pathParams, $queryParams);
    final $completer = new Completer<CalendarListEntry>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CalendarListEntry.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarListResource.Delete
  /**
   * Deletes an entry on the user's calendar list.
   * [calendarId] Calendar identifier.
   */
  Future delete(String calendarId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/me/calendarList/{calendarId}").generate($pathParams, $queryParams);
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

// Enum CalendarListResource.List.MinAccessRole
class CalendarListResourceListMinAccessRole implements Hashable {
  /** The user can read free/busy information. */
  static final CalendarListResourceListMinAccessRole FREEBUSYREADER = const CalendarListResourceListMinAccessRole._internal("freeBusyReader", 0);
  /** The user can read and modify events and access control lists. */
  static final CalendarListResourceListMinAccessRole OWNER = const CalendarListResourceListMinAccessRole._internal("owner", 1);
  /** The user can read events that are not private. */
  static final CalendarListResourceListMinAccessRole READER = const CalendarListResourceListMinAccessRole._internal("reader", 2);
  /** The user can read and modify events. */
  static final CalendarListResourceListMinAccessRole WRITER = const CalendarListResourceListMinAccessRole._internal("writer", 3);

  /** All values of this enumeration */
  static final List<CalendarListResourceListMinAccessRole> values = const <CalendarListResourceListMinAccessRole>[
    FREEBUSYREADER,
    OWNER,
    READER,
    WRITER,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CalendarListResourceListMinAccessRole>{ 
    "freeBusyReader": FREEBUSYREADER,
    "owner": OWNER,
    "reader": READER,
    "writer": WRITER,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CalendarListResourceListMinAccessRole valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CalendarListResourceListMinAccessRole._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "MinAccessRole".hashCode();
}

// Resource .CalendarsResource
class CalendarsResource {
  final CalendarApi _$service;
  
  CalendarsResource._internal(CalendarApi $service) : _$service = $service;

  // Method CalendarsResource.Insert
  /**
   * Creates a secondary calendar.
   * [content] the Calendar
   */
  Future<Calendar> insert(Calendar content) {
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
    final $body = JSON.stringify(Calendar.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars").generate($pathParams, $queryParams);
    final $completer = new Completer<Calendar>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Calendar.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarsResource.Get
  /**
   * Returns metadata for a calendar.
   * [calendarId] Calendar identifier.
   */
  Future<Calendar> get(String calendarId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Calendar>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Calendar.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarsResource.Clear
  /**
   * Clears a primary calendar. This operation deletes all data associated with the primary calendar
   * of an account and cannot be undone.
   * [calendarId] Calendar identifier.
   */
  Future clear(String calendarId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/clear").generate($pathParams, $queryParams);
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

  // Method CalendarsResource.Update
  /**
   * Updates metadata for a calendar.
   * [calendarId] Calendar identifier.
   * [content] the Calendar
   */
  Future<Calendar> update(String calendarId, Calendar content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Calendar.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Calendar>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Calendar.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarsResource.Patch
  /**
   * Updates metadata for a calendar. This method supports patch semantics.
   * [calendarId] Calendar identifier.
   * [content] the Calendar
   */
  Future<Calendar> patch(String calendarId, Calendar content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Calendar.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Calendar>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Calendar.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CalendarsResource.Delete
  /**
   * Deletes a secondary calendar.
   * [calendarId] Calendar identifier.
   */
  Future delete(String calendarId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}").generate($pathParams, $queryParams);
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

// Resource .AclResource
class AclResource {
  final CalendarApi _$service;
  
  AclResource._internal(CalendarApi $service) : _$service = $service;

  // Method AclResource.Insert
  /**
   * Creates an access control rule.
   * [calendarId] Calendar identifier.
   * [content] the AclRule
   */
  Future<AclRule> insert(String calendarId, AclRule content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AclRule.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/acl").generate($pathParams, $queryParams);
    final $completer = new Completer<AclRule>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = AclRule.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AclResource.Get
  /**
   * Returns an access control rule.
   * [calendarId] Calendar identifier.
   * [ruleId] ACL rule identifier.
   */
  Future<AclRule> get(String calendarId, String ruleId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["ruleId"] = ruleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/acl/{ruleId}").generate($pathParams, $queryParams);
    final $completer = new Completer<AclRule>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = AclRule.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AclResource.List
  /**
   * Returns the rules in the access control list for the calendar.
   * [calendarId] Calendar identifier.
   */
  Future<Acl> list(String calendarId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/acl").generate($pathParams, $queryParams);
    final $completer = new Completer<Acl>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Acl.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AclResource.Update
  /**
   * Updates an access control rule.
   * [calendarId] Calendar identifier.
   * [ruleId] ACL rule identifier.
   * [content] the AclRule
   */
  Future<AclRule> update(String calendarId, String ruleId, AclRule content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["ruleId"] = ruleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AclRule.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/acl/{ruleId}").generate($pathParams, $queryParams);
    final $completer = new Completer<AclRule>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = AclRule.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AclResource.Patch
  /**
   * Updates an access control rule. This method supports patch semantics.
   * [calendarId] Calendar identifier.
   * [ruleId] ACL rule identifier.
   * [content] the AclRule
   */
  Future<AclRule> patch(String calendarId, String ruleId, AclRule content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["ruleId"] = ruleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AclRule.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/acl/{ruleId}").generate($pathParams, $queryParams);
    final $completer = new Completer<AclRule>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = AclRule.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AclResource.Delete
  /**
   * Deletes an access control rule.
   * [calendarId] Calendar identifier.
   * [ruleId] ACL rule identifier.
   */
  Future delete(String calendarId, String ruleId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["ruleId"] = ruleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/acl/{ruleId}").generate($pathParams, $queryParams);
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

// Resource .ColorsResource
class ColorsResource {
  final CalendarApi _$service;
  
  ColorsResource._internal(CalendarApi $service) : _$service = $service;

  // Method ColorsResource.Get
  /**
   * Returns the color definitions for calendars and events.
   */
  Future<Colors> get() {
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
    final $url = new UrlPattern(_$service.baseUrl + "colors").generate($pathParams, $queryParams);
    final $completer = new Completer<Colors>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Colors.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .EventsResource
class EventsResource {
  final CalendarApi _$service;
  
  EventsResource._internal(CalendarApi $service) : _$service = $service;

  // Method EventsResource.Insert
  /**
   * Creates an event.
   * [calendarId] Calendar identifier.
   * [content] the Event
   */
  Future<Event> insert(String calendarId, Event content, [bool sendNotifications = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (UNSPECIFIED != sendNotifications) $queryParams["sendNotifications"] = sendNotifications;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Event.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Get
  /**
   * Returns an event.
   * [calendarId] Calendar identifier.
   * [eventId] Event identifier.
   */
  Future<Event> get(String calendarId, String eventId, [String timeZone = UNSPECIFIED, int maxAttendees = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["eventId"] = eventId;
    if (UNSPECIFIED != timeZone) $queryParams["timeZone"] = timeZone;
    if (UNSPECIFIED != maxAttendees) $queryParams["maxAttendees"] = maxAttendees;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/{eventId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Move
  /**
   * Moves an event to another calendar, i.e. changes an event's organizer.
   * [calendarId] Calendar identifier of the source calendar where the event currently is on.
   * [eventId] Event identifier.
   * [destination] Calendar identifier of the target calendar where the event is to be moved to.
   */
  Future<Event> move(String calendarId, String eventId, String destination, [bool sendNotifications = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["eventId"] = eventId;
    $pathParams["destination"] = destination;
    if (UNSPECIFIED != sendNotifications) $queryParams["sendNotifications"] = sendNotifications;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/{eventId}/move").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.List
  /**
   * Returns events on the specified calendar.
   * [calendarId] Calendar identifier.
   */
  Future<Events> list(String calendarId, [EventsResourceListOrderBy orderBy = UNSPECIFIED, bool showHiddenInvitations = UNSPECIFIED, bool showDeleted = UNSPECIFIED, String iCalUID = UNSPECIFIED, String updatedMin = UNSPECIFIED, bool singleEvents = UNSPECIFIED, int maxResults = UNSPECIFIED, String q = UNSPECIFIED, String pageToken = UNSPECIFIED, String timeMin = UNSPECIFIED, String timeZone = UNSPECIFIED, String timeMax = UNSPECIFIED, int maxAttendees = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (UNSPECIFIED != orderBy) $queryParams["orderBy"] = orderBy;
    if (UNSPECIFIED != showHiddenInvitations) $queryParams["showHiddenInvitations"] = showHiddenInvitations;
    if (UNSPECIFIED != showDeleted) $queryParams["showDeleted"] = showDeleted;
    if (UNSPECIFIED != iCalUID) $queryParams["iCalUID"] = iCalUID;
    if (UNSPECIFIED != updatedMin) $queryParams["updatedMin"] = updatedMin;
    if (UNSPECIFIED != singleEvents) $queryParams["singleEvents"] = singleEvents;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != timeMin) $queryParams["timeMin"] = timeMin;
    if (UNSPECIFIED != timeZone) $queryParams["timeZone"] = timeZone;
    if (UNSPECIFIED != timeMax) $queryParams["timeMax"] = timeMax;
    if (UNSPECIFIED != maxAttendees) $queryParams["maxAttendees"] = maxAttendees;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events").generate($pathParams, $queryParams);
    final $completer = new Completer<Events>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Events.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Update
  /**
   * Updates an event.
   * [calendarId] Calendar identifier.
   * [eventId] Event identifier.
   * [content] the Event
   */
  Future<Event> update(String calendarId, String eventId, Event content, [bool sendNotifications = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["eventId"] = eventId;
    if (UNSPECIFIED != sendNotifications) $queryParams["sendNotifications"] = sendNotifications;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Event.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/{eventId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Patch
  /**
   * Updates an event. This method supports patch semantics.
   * [calendarId] Calendar identifier.
   * [eventId] Event identifier.
   * [content] the Event
   */
  Future<Event> patch(String calendarId, String eventId, Event content, [bool sendNotifications = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["eventId"] = eventId;
    if (UNSPECIFIED != sendNotifications) $queryParams["sendNotifications"] = sendNotifications;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Event.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/{eventId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Instances
  /**
   * Returns instances of the specified recurring event.
   * [calendarId] Calendar identifier.
   * [eventId] Recurring event identifier.
   */
  Future<Events> instances(String calendarId, String eventId, [bool showDeleted = UNSPECIFIED, int maxResults = UNSPECIFIED, String pageToken = UNSPECIFIED, String timeZone = UNSPECIFIED, String originalStart = UNSPECIFIED, int maxAttendees = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["eventId"] = eventId;
    if (UNSPECIFIED != showDeleted) $queryParams["showDeleted"] = showDeleted;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != timeZone) $queryParams["timeZone"] = timeZone;
    if (UNSPECIFIED != originalStart) $queryParams["originalStart"] = originalStart;
    if (UNSPECIFIED != maxAttendees) $queryParams["maxAttendees"] = maxAttendees;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/{eventId}/instances").generate($pathParams, $queryParams);
    final $completer = new Completer<Events>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Events.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Import
  /**
   * Imports an event.
   * [calendarId] Calendar identifier.
   * [content] the Event
   */
  Future<Event> import(String calendarId, Event content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Event.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/import").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.QuickAdd
  /**
   * Creates an event based on a simple text string.
   * [calendarId] Calendar identifier.
   * [text] The text describing the event to be created.
   */
  Future<Event> quickAdd(String calendarId, String text, [bool sendNotifications = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["text"] = text;
    if (UNSPECIFIED != sendNotifications) $queryParams["sendNotifications"] = sendNotifications;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/quickAdd").generate($pathParams, $queryParams);
    final $completer = new Completer<Event>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Event.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method EventsResource.Delete
  /**
   * Deletes an event.
   * [calendarId] Calendar identifier.
   * [eventId] Event identifier.
   */
  Future delete(String calendarId, String eventId, [bool sendNotifications = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["calendarId"] = calendarId;
    $pathParams["eventId"] = eventId;
    if (UNSPECIFIED != sendNotifications) $queryParams["sendNotifications"] = sendNotifications;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "calendars/{calendarId}/events/{eventId}").generate($pathParams, $queryParams);
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

// Enum EventsResource.List.OrderBy
class EventsResourceListOrderBy implements Hashable {
  /**
 * Order by the start date/time (ascending). This is only available when querying single events
 * (i.e. the parameter "singleEvents" is True)
 */
  static final EventsResourceListOrderBy STARTTIME = const EventsResourceListOrderBy._internal("startTime", 0);
  /** Order by last modification time (ascending). */
  static final EventsResourceListOrderBy UPDATED = const EventsResourceListOrderBy._internal("updated", 1);

  /** All values of this enumeration */
  static final List<EventsResourceListOrderBy> values = const <EventsResourceListOrderBy>[
    STARTTIME,
    UPDATED,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <EventsResourceListOrderBy>{ 
    "startTime": STARTTIME,
    "updated": UPDATED,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static EventsResourceListOrderBy valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const EventsResourceListOrderBy._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "OrderBy".hashCode();
}

// Schema .Acl
class Acl extends IdentityHash {
  /**
 * Token used to access the next page of this result. Omitted if no further results are available.
 */
  String nextPageToken;

  /** List of rules on the access control list. */
  List<AclRule> items;

  /** Type of the collection ("calendar#acl"). */
  String kind;

  /** ETag of the collection. */
  String etag;

  /** Parses an instance from its JSON representation. */
  static Acl parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Acl();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(AclRule.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Acl value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(AclRule.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AclRule
class AclRule extends IdentityHash {
  /** The scope of the rule. */
  AclRuleScope scope;

  /** Type of the resource ("calendar#aclRule"). */
  String kind;

  /** ETag of the resource. */
  String etag;

  /**
 * The role assigned to the scope. Possible values are: - "none" - Provides no access. -
 * "freeBusyReader" - Provides read access to free/busy information. - "reader" - Provides read
 * access to the calendar. Private events will appear to users with reader access, but event details
 * will be hidden. - "writer" - Provides read and write access to the calendar. Private events will
 * appear to users with writer access, and event details will be visible. - "owner" - Provides
 * ownership of the calendar. This role has all of the permissions of the writer role with the
 * additional ability to see and manipulate ACLs.
 */
  String role;

  /** Identifier of the ACL rule. */
  String id;

  /** Parses an instance from its JSON representation. */
  static AclRule parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AclRule();
    result.scope = AclRuleScope.parse(json["scope"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.role = identity(json["role"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AclRule value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["scope"] = AclRuleScope.serialize(value.scope);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["role"] = identity(value.role);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AclRule.AclRuleScope
class AclRuleScope extends IdentityHash {
  /**
 * The type of the scope. Possible values are: - "default" - The public scope. This is the default
 * value. - "user" - Limits the scope to a single user. - "group" - Limits the scope to a group. -
 * "domain" - Limits the scope to a domain.  Note: The permissions granted to the "default", or
 * public, scope apply to any user, authenticated or not.
 */
  String type;

  /**
 * The email address of a user or group, or the name of a domain, depending on the scope type.
 * Omitted for type "default".
 */
  String value;

  /** Parses an instance from its JSON representation. */
  static AclRuleScope parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AclRuleScope();
    result.type = identity(json["type"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AclRuleScope value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Calendar
class Calendar extends IdentityHash {
  /** Type of the resource ("calendar#calendar"). */
  String kind;

  /** Description of the calendar. Optional. */
  String description;

  /** Title of the calendar. */
  String summary;

  /** ETag of the resource. */
  String etag;

  /** Geographic location of the calendar as free-form text. Optional. */
  String location;

  /** The time zone of the calendar. Optional. */
  String timeZone;

  /** Identifier of the calendar. */
  String id;

  /** Parses an instance from its JSON representation. */
  static Calendar parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Calendar();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.summary = identity(json["summary"]);
    result.etag = identity(json["etag"]);
    result.location = identity(json["location"]);
    result.timeZone = identity(json["timeZone"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Calendar value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["summary"] = identity(value.summary);
    result["etag"] = identity(value.etag);
    result["location"] = identity(value.location);
    result["timeZone"] = identity(value.timeZone);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CalendarList
class CalendarList extends IdentityHash {
  /** Token used to access the next page of this result. */
  String nextPageToken;

  /** Calendars that are present on the user's calendar list. */
  List<CalendarListEntry> items;

  /** Type of the collection ("calendar#calendarList"). */
  String kind;

  /** ETag of the collection. */
  String etag;

  /** Parses an instance from its JSON representation. */
  static CalendarList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CalendarList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(CalendarListEntry.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CalendarList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(CalendarListEntry.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CalendarListEntry
class CalendarListEntry extends IdentityHash {
  /** Type of the resource ("calendar#calendarListEntry"). */
  String kind;

  /** The default reminders that the authenticated user has for this calendar. */
  List<EventReminder> defaultReminders;

  /** Description of the calendar. Optional. Read-only. */
  String description;

  /**
 * The color of the calendar. This is an ID referring to an entry in the "calendar" section of the
 * colors definition (see the "colors" endpoint). Optional.
 */
  String colorId;

  /** Whether the calendar content shows up in the calendar UI. Optional. The default is False. */
  bool selected;

  /** Title of the calendar. Read-only. */
  String summary;

  /** ETag of the resource. */
  String etag;

  /** Geographic location of the calendar as free-form text. Optional. Read-only. */
  String location;

  /** The summary that the authenticated user has set for this calendar. Optional. */
  String summaryOverride;

  /** The time zone of the calendar. Optional. Read-only. */
  String timeZone;

  /** Whether the calendar has been hidden from the list. Optional. The default is False. */
  bool hidden;

  /**
 * The effective access role that the authenticated user has on the calendar. Read-only. Possible
 * values are: - "freeBusyReader" - Provides read access to free/busy information. - "reader" -
 * Provides read access to the calendar. Private events will appear to users with reader access, but
 * event details will be hidden. - "writer" - Provides read and write access to the calendar.
 * Private events will appear to users with writer access, and event details will be visible. -
 * "owner" - Provides ownership of the calendar. This role has all of the permissions of the writer
 * role with the additional ability to see and manipulate ACLs.
 */
  String accessRole;

  /** Identifier of the calendar. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CalendarListEntry parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CalendarListEntry();
    result.kind = identity(json["kind"]);
    result.defaultReminders = map(EventReminder.parse)(json["defaultReminders"]);
    result.description = identity(json["description"]);
    result.colorId = identity(json["colorId"]);
    result.selected = identity(json["selected"]);
    result.summary = identity(json["summary"]);
    result.etag = identity(json["etag"]);
    result.location = identity(json["location"]);
    result.summaryOverride = identity(json["summaryOverride"]);
    result.timeZone = identity(json["timeZone"]);
    result.hidden = identity(json["hidden"]);
    result.accessRole = identity(json["accessRole"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CalendarListEntry value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["defaultReminders"] = map(EventReminder.serialize)(value.defaultReminders);
    result["description"] = identity(value.description);
    result["colorId"] = identity(value.colorId);
    result["selected"] = identity(value.selected);
    result["summary"] = identity(value.summary);
    result["etag"] = identity(value.etag);
    result["location"] = identity(value.location);
    result["summaryOverride"] = identity(value.summaryOverride);
    result["timeZone"] = identity(value.timeZone);
    result["hidden"] = identity(value.hidden);
    result["accessRole"] = identity(value.accessRole);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ColorDefinition
class ColorDefinition extends IdentityHash {
  /**
 * The foreground color that can be used to write on top of a background with 'background' color.
 */
  String foreground;

  /** The background color associated with this color definition. */
  String background;

  /** Parses an instance from its JSON representation. */
  static ColorDefinition parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ColorDefinition();
    result.foreground = identity(json["foreground"]);
    result.background = identity(json["background"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ColorDefinition value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["foreground"] = identity(value.foreground);
    result["background"] = identity(value.background);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Colors
class Colors extends IdentityHash {
  /**
 * Palette of calendar colors, mapping from the color ID to its definition. An 'calendarListEntry'
 * resource refers to one of these color IDs in its 'color' field. Read-only.
 */
  Map<String, ColorDefinition> calendar;

  /** Last modification time of the color palette (as a RFC 3339 timestamp). Read-only. */
  String updated;

  /**
 * Palette of event colors, mapping from the color ID to its definition. An 'event' resource may
 * refer to one of these color IDs in its 'color' field. Read-only.
 */
  Map<String, ColorDefinition> event;

  /** Type of the resource ("calendar#colors"). */
  String kind;

  /** Parses an instance from its JSON representation. */
  static Colors parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Colors();
    result.calendar = mapValues(ColorDefinition.parse)(json["calendar"]);
    result.updated = identity(json["updated"]);
    result.event = mapValues(ColorDefinition.parse)(json["event"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Colors value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["calendar"] = mapValues(ColorDefinition.serialize)(value.calendar);
    result["updated"] = identity(value.updated);
    result["event"] = mapValues(ColorDefinition.serialize)(value.event);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Error
class Error extends IdentityHash {
  /** Domain, or broad category, of the error. */
  String domain;

  /**
 * Specific reason for the error. Some of the possible values are: - "groupTooBig" - The group of
 * users requested is too large for a single query. - "tooManyCalendarsRequested" - The number of
 * calendars requested is too large for a single query. - "notFound" - The requested resource was
 * not found. - "internalError" - The API service has encountered an internal error.  Additional
 * error types may be added in the future, so clients should gracefully handle additional error
 * statuses not included in this list.
 */
  String reason;

  /** Parses an instance from its JSON representation. */
  static Error parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Error();
    result.domain = identity(json["domain"]);
    result.reason = identity(json["reason"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Error value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["domain"] = identity(value.domain);
    result["reason"] = identity(value.reason);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Event
class Event extends IdentityHash {
  /** The creator of the event. Read-only. */
  EventCreator creator;

  /**
 * The organizer of the event. If the organizer is also an attendee, this is indicated with a
 * separate entry in 'attendees' with the 'organizer' field set to True. To change the organizer,
 * use the "move" operation. Read-only, except when importing an event.
 */
  EventOrganizer organizer;

  /** Identifier of the event. */
  String id;

  /** The attendees of the event. */
  List<EventAttendee> attendees;

  /** An absolute link to this event in the Google Calendar Web UI. Read-only. */
  String htmlLink;

  /**
 * List of RRULE, EXRULE, RDATE and EXDATE lines for a recurring event. This field is omitted for
 * single events or instances of recurring events.
 */
  List<String> recurrence;

  /**
 * The (inclusive) start time of the event. For a recurring event, this is the start time of the
 * first instance.
 */
  EventDateTime start;

  /** ETag of the resource. */
  String etag;

  /** Geographic location of the event as free-form text. Optional. */
  String location;

  /**
 * For an instance of a recurring event, this is the event ID of the recurring event itself.
 * Immutable.
 */
  String recurringEventId;

  /**
 * For an instance of a recurring event, this is the time at which this event would start according
 * to the recurrence data in the recurring event identified by recurringEventId. Immutable.
 */
  EventDateTime originalStartTime;

  /**
 * Status of the event. Optional. Possible values are: - "confirmed" - The event is confirmed. This
 * is the default status. - "tentative" - The event is tentatively confirmed. - "cancelled" - The
 * event is cancelled.
 */
  String status;

  /** Last modification time of the event (as a RFC 3339 timestamp). Read-only. */
  String updated;

  /** A gadget that extends this event. */
  EventGadget gadget;

  /** Description of the event. Optional. */
  String description;

  /** Event ID in the iCalendar format. */
  String iCalUID;

  /** Extended properties of the event. */
  EventExtendedProperties extendedProperties;

  /** Sequence number as per iCalendar. */
  int sequence;

  /**
 * Visibility of the event. Optional. Possible values are: - "default" - Uses the default visibility
 * for events on the calendar. This is the default value. - "public" - The event is public and event
 * details are visible to all readers of the calendar. - "private" - The event is private and only
 * event attendees may view event details. - "confidential" - The event is private. This value is
 * provided for compatibility reasons.
 */
  String visibility;

  /**
 * Whether attendees other than the organizer can modify the event. Optional. The default is False.
 */
  bool guestsCanModify;

  /**
 * The (exclusive) end time of the event. For a recurring event, this is the end time of the first
 * instance.
 */
  EventDateTime end;

  /**
 * Whether attendees have been omitted from the event's representation. When retrieving an event,
 * this is due to a restriction specified by the 'maxAttendee' query parameter. When updating an
 * event, this can be used to only update the participant's response. Optional. The default is
 * False.
 */
  bool attendeesOmitted;

  /** Type of the resource ("calendar#event"). */
  String kind;

  /** Creation time of the event (as a RFC 3339 timestamp). Read-only. */
  String created;

  /**
 * The color of the event. This is an ID referring to an entry in the "event" section of the colors
 * definition (see the "colors" endpoint). Optional.
 */
  String colorId;

  /** Whether anyone can invite themselves to the event. Optional. The default is False. */
  bool anyoneCanAddSelf;

  /** Information about the event's reminders for the authenticated user. */
  EventReminders reminders;

  /**
 * Whether attendees other than the organizer can see who the event's attendees are. Optional. The
 * default is False.
 */
  bool guestsCanSeeOtherGuests;

  /** Title of the event. */
  String summary;

  /**
 * Whether attendees other than the organizer can invite others to the event. Optional. The default
 * is False.
 */
  bool guestsCanInviteOthers;

  /**
 * Whether the event blocks time on the calendar. Optional. Possible values are: - "opaque" - The
 * event blocks time on the calendar. This is the default value. - "transparent" - The event does
 * not block time on the calendar.
 */
  String transparency;

  /**
 * Whether this is a private event copy where changes are not shared with other copies on other
 * calendars. Optional. Immutable.
 */
  bool privateCopy;

  /** Parses an instance from its JSON representation. */
  static Event parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Event();
    result.creator = EventCreator.parse(json["creator"]);
    result.organizer = EventOrganizer.parse(json["organizer"]);
    result.id = identity(json["id"]);
    result.attendees = map(EventAttendee.parse)(json["attendees"]);
    result.htmlLink = identity(json["htmlLink"]);
    result.recurrence = map(identity)(json["recurrence"]);
    result.start = EventDateTime.parse(json["start"]);
    result.etag = identity(json["etag"]);
    result.location = identity(json["location"]);
    result.recurringEventId = identity(json["recurringEventId"]);
    result.originalStartTime = EventDateTime.parse(json["originalStartTime"]);
    result.status = identity(json["status"]);
    result.updated = identity(json["updated"]);
    result.gadget = EventGadget.parse(json["gadget"]);
    result.description = identity(json["description"]);
    result.iCalUID = identity(json["iCalUID"]);
    result.extendedProperties = EventExtendedProperties.parse(json["extendedProperties"]);
    result.sequence = identity(json["sequence"]);
    result.visibility = identity(json["visibility"]);
    result.guestsCanModify = identity(json["guestsCanModify"]);
    result.end = EventDateTime.parse(json["end"]);
    result.attendeesOmitted = identity(json["attendeesOmitted"]);
    result.kind = identity(json["kind"]);
    result.created = identity(json["created"]);
    result.colorId = identity(json["colorId"]);
    result.anyoneCanAddSelf = identity(json["anyoneCanAddSelf"]);
    result.reminders = EventReminders.parse(json["reminders"]);
    result.guestsCanSeeOtherGuests = identity(json["guestsCanSeeOtherGuests"]);
    result.summary = identity(json["summary"]);
    result.guestsCanInviteOthers = identity(json["guestsCanInviteOthers"]);
    result.transparency = identity(json["transparency"]);
    result.privateCopy = identity(json["privateCopy"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Event value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["creator"] = EventCreator.serialize(value.creator);
    result["organizer"] = EventOrganizer.serialize(value.organizer);
    result["id"] = identity(value.id);
    result["attendees"] = map(EventAttendee.serialize)(value.attendees);
    result["htmlLink"] = identity(value.htmlLink);
    result["recurrence"] = map(identity)(value.recurrence);
    result["start"] = EventDateTime.serialize(value.start);
    result["etag"] = identity(value.etag);
    result["location"] = identity(value.location);
    result["recurringEventId"] = identity(value.recurringEventId);
    result["originalStartTime"] = EventDateTime.serialize(value.originalStartTime);
    result["status"] = identity(value.status);
    result["updated"] = identity(value.updated);
    result["gadget"] = EventGadget.serialize(value.gadget);
    result["description"] = identity(value.description);
    result["iCalUID"] = identity(value.iCalUID);
    result["extendedProperties"] = EventExtendedProperties.serialize(value.extendedProperties);
    result["sequence"] = identity(value.sequence);
    result["visibility"] = identity(value.visibility);
    result["guestsCanModify"] = identity(value.guestsCanModify);
    result["end"] = EventDateTime.serialize(value.end);
    result["attendeesOmitted"] = identity(value.attendeesOmitted);
    result["kind"] = identity(value.kind);
    result["created"] = identity(value.created);
    result["colorId"] = identity(value.colorId);
    result["anyoneCanAddSelf"] = identity(value.anyoneCanAddSelf);
    result["reminders"] = EventReminders.serialize(value.reminders);
    result["guestsCanSeeOtherGuests"] = identity(value.guestsCanSeeOtherGuests);
    result["summary"] = identity(value.summary);
    result["guestsCanInviteOthers"] = identity(value.guestsCanInviteOthers);
    result["transparency"] = identity(value.transparency);
    result["privateCopy"] = identity(value.privateCopy);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .EventAttendee
class EventAttendee extends IdentityHash {
  /** The attendee's response comment. Optional. */
  String comment;

  /** The attendee's name, if available. Optional. */
  String displayName;

  /**
 * Whether this entry represents the calendar on which this copy of the event appears. Read-only.
 * The default is False.
 */
  bool self;

  /**
 * The attendee's response status. Possible values are: - "needsAction" - The attendee has not
 * responded to the invitation. - "declined" - The attendee has declined the invitation. -
 * "tentative" - The attendee has tentatively accepted the invitation. - "accepted" - The attendee
 * has accepted the invitation.
 */
  String responseStatus;

  /** Number of additional guests. Optional. The default is 0. */
  int additionalGuests;

  /** Whether the attendee is a resource. Read-only. The default is False. */
  bool resource;

  /** Whether the attendee is the organizer of the event. Read-only. The default is False. */
  bool organizer;

  /** Whether this is an optional attendee. Optional. The default is False. */
  bool optional;

  /**
 * The attendee's email address, if available. This field must be present when adding an attendee.
 */
  String email;

  /** Parses an instance from its JSON representation. */
  static EventAttendee parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventAttendee();
    result.comment = identity(json["comment"]);
    result.displayName = identity(json["displayName"]);
    result.self = identity(json["self"]);
    result.responseStatus = identity(json["responseStatus"]);
    result.additionalGuests = identity(json["additionalGuests"]);
    result.resource = identity(json["resource"]);
    result.organizer = identity(json["organizer"]);
    result.optional = identity(json["optional"]);
    result.email = identity(json["email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventAttendee value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["comment"] = identity(value.comment);
    result["displayName"] = identity(value.displayName);
    result["self"] = identity(value.self);
    result["responseStatus"] = identity(value.responseStatus);
    result["additionalGuests"] = identity(value.additionalGuests);
    result["resource"] = identity(value.resource);
    result["organizer"] = identity(value.organizer);
    result["optional"] = identity(value.optional);
    result["email"] = identity(value.email);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Event.EventCreator
class EventCreator extends IdentityHash {
  /**
 * Whether the creator corresponds to the calendar on which this copy of the event appears. Read-
 * only. The default is False.
 */
  bool self;

  /** The creator's name, if available. */
  String displayName;

  /** The creator's email address, if available. */
  String email;

  /** Parses an instance from its JSON representation. */
  static EventCreator parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventCreator();
    result.self = identity(json["self"]);
    result.displayName = identity(json["displayName"]);
    result.email = identity(json["email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventCreator value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["self"] = identity(value.self);
    result["displayName"] = identity(value.displayName);
    result["email"] = identity(value.email);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .EventDateTime
class EventDateTime extends IdentityHash {
  /** The date, in the format "yyyy-mm-dd", if this is an all-day event. */
  String date;

  /**
 * The name of the time zone in which the time is specified (e.g. "Europe/Zurich"). Optional. The
 * default is the time zone of the calendar.
 */
  String timeZone;

  /**
 * The time, as a combined date-time value (formatted according to RFC 3339). A time zone offset is
 * required unless a time zone is explicitly specified in 'timeZone'.
 */
  String dateTime;

  /** Parses an instance from its JSON representation. */
  static EventDateTime parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventDateTime();
    result.date = identity(json["date"]);
    result.timeZone = identity(json["timeZone"]);
    result.dateTime = identity(json["dateTime"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventDateTime value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["date"] = identity(value.date);
    result["timeZone"] = identity(value.timeZone);
    result["dateTime"] = identity(value.dateTime);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Event.EventExtendedProperties
class EventExtendedProperties extends IdentityHash {
  /** Properties that are shared between copies of the event on other attendees' calendars. */
  Map<String, String> shared;

  /** Properties that are private to the copy of the event that appears on this calendar. */
  Map<String, String> private;

  /** Parses an instance from its JSON representation. */
  static EventExtendedProperties parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventExtendedProperties();
    result.shared = mapValues(identity)(json["shared"]);
    result.private = mapValues(identity)(json["private"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventExtendedProperties value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["shared"] = mapValues(identity)(value.shared);
    result["private"] = mapValues(identity)(value.private);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Event.EventGadget
class EventGadget extends IdentityHash {
  /** Preferences. */
  Map<String, String> preferences;

  /** The gadget's title. */
  String title;

  /** The gadget's height in pixels. Optional. */
  int height;

  /** The gadget's width in pixels. Optional. */
  int width;

  /** The gadget's URL. */
  String link;

  /** The gadget's type. */
  String type;

  /**
 * The gadget's display mode. Optional. Possible values are: - "icon" - The gadget displays next to
 * the event's title in the calendar view. - "chip" - The gadget displays when the event is clicked.
 */
  String display;

  /** The gadget's icon URL. */
  String iconLink;

  /** Parses an instance from its JSON representation. */
  static EventGadget parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventGadget();
    result.preferences = mapValues(identity)(json["preferences"]);
    result.title = identity(json["title"]);
    result.height = identity(json["height"]);
    result.width = identity(json["width"]);
    result.link = identity(json["link"]);
    result.type = identity(json["type"]);
    result.display = identity(json["display"]);
    result.iconLink = identity(json["iconLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventGadget value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["preferences"] = mapValues(identity)(value.preferences);
    result["title"] = identity(value.title);
    result["height"] = identity(value.height);
    result["width"] = identity(value.width);
    result["link"] = identity(value.link);
    result["type"] = identity(value.type);
    result["display"] = identity(value.display);
    result["iconLink"] = identity(value.iconLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Event.EventOrganizer
class EventOrganizer extends IdentityHash {
  /**
 * Whether the organizer corresponds to the calendar on which this copy of the event appears. Read-
 * only. The default is False.
 */
  bool self;

  /** The organizer's name, if available. */
  String displayName;

  /** The organizer's email address, if available. */
  String email;

  /** Parses an instance from its JSON representation. */
  static EventOrganizer parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventOrganizer();
    result.self = identity(json["self"]);
    result.displayName = identity(json["displayName"]);
    result.email = identity(json["email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventOrganizer value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["self"] = identity(value.self);
    result["displayName"] = identity(value.displayName);
    result["email"] = identity(value.email);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .EventReminder
class EventReminder extends IdentityHash {
  /** Number of minutes before the start of the event when the reminder should trigger. */
  int minutes;

  /**
 * The method used by this reminder. Possible values are: - "email" - Reminders are sent via email.
 * - "sms" - Reminders are sent via SMS. - "popup" - Reminders are sent via a UI popup.
 */
  String method;

  /** Parses an instance from its JSON representation. */
  static EventReminder parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventReminder();
    result.minutes = identity(json["minutes"]);
    result.method = identity(json["method"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventReminder value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["minutes"] = identity(value.minutes);
    result["method"] = identity(value.method);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Event.EventReminders
class EventReminders extends IdentityHash {
  /**
 * If the event doesn't use the default reminders, this lists the reminders specific to the event,
 * or, if not set, indicates that no reminders are set for this event.
 */
  List<EventReminder> overrides;

  /** Whether the default reminders of the calendar apply to the event. */
  bool useDefault;

  /** Parses an instance from its JSON representation. */
  static EventReminders parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new EventReminders();
    result.overrides = map(EventReminder.parse)(json["overrides"]);
    result.useDefault = identity(json["useDefault"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(EventReminders value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["overrides"] = map(EventReminder.serialize)(value.overrides);
    result["useDefault"] = identity(value.useDefault);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Events
class Events extends IdentityHash {
  /**
 * Token used to access the next page of this result. Omitted if no further results are available.
 */
  String nextPageToken;

  /** Type of the collection ("calendar#events"). */
  String kind;

  /**
 * The default reminders on the calendar for the authenticated user. These reminders apply to all
 * events on this calendar that do not explicitly override them (i.e. do not have
 * 'reminders.useDefault' set to 'true').
 */
  List<EventReminder> defaultReminders;

  /** Description of the calendar. Read-only. */
  String description;

  /** List of events on the calendar. */
  List<Event> items;

  /** Last modification time of the calendar (as a RFC 3339 timestamp). Read-only. */
  String updated;

  /** Title of the calendar. Read-only. */
  String summary;

  /** ETag of the collection. */
  String etag;

  /** The time zone of the calendar. Read-only. */
  String timeZone;

  /**
 * The user's access role for this calendar. Read-only. Possible values are: - "none" - The user has
 * no access. - "freeBusyReader" - The user has read access to free/busy information. - "reader" -
 * The user has read access to the calendar. Private events will appear to users with reader access,
 * but event details will be hidden. - "writer" - The user has read and write access to the
 * calendar. Private events will appear to users with writer access, and event details will be
 * visible. - "owner" - The user has ownership of the calendar. This role has all of the permissions
 * of the writer role with the additional ability to see and manipulate ACLs.
 */
  String accessRole;

  /** Parses an instance from its JSON representation. */
  static Events parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Events();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.defaultReminders = map(EventReminder.parse)(json["defaultReminders"]);
    result.description = identity(json["description"]);
    result.items = map(Event.parse)(json["items"]);
    result.updated = identity(json["updated"]);
    result.summary = identity(json["summary"]);
    result.etag = identity(json["etag"]);
    result.timeZone = identity(json["timeZone"]);
    result.accessRole = identity(json["accessRole"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Events value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["defaultReminders"] = map(EventReminder.serialize)(value.defaultReminders);
    result["description"] = identity(value.description);
    result["items"] = map(Event.serialize)(value.items);
    result["updated"] = identity(value.updated);
    result["summary"] = identity(value.summary);
    result["etag"] = identity(value.etag);
    result["timeZone"] = identity(value.timeZone);
    result["accessRole"] = identity(value.accessRole);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FreeBusyCalendar
class FreeBusyCalendar extends IdentityHash {
  /** List of time ranges during which this calendar should be regarded as busy. */
  List<TimePeriod> busy;

  /** Optional error(s) (if computation for the calendar failed). */
  List<Error> errors;

  /** Parses an instance from its JSON representation. */
  static FreeBusyCalendar parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new FreeBusyCalendar();
    result.busy = map(TimePeriod.parse)(json["busy"]);
    result.errors = map(Error.parse)(json["errors"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(FreeBusyCalendar value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["busy"] = map(TimePeriod.serialize)(value.busy);
    result["errors"] = map(Error.serialize)(value.errors);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FreeBusyGroup
class FreeBusyGroup extends IdentityHash {
  /** Optional error(s) (if computation for the group failed). */
  List<Error> errors;

  /** List of calendars' identifiers within a group. */
  List<String> calendars;

  /** Parses an instance from its JSON representation. */
  static FreeBusyGroup parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new FreeBusyGroup();
    result.errors = map(Error.parse)(json["errors"]);
    result.calendars = map(identity)(json["calendars"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(FreeBusyGroup value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["errors"] = map(Error.serialize)(value.errors);
    result["calendars"] = map(identity)(value.calendars);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FreeBusyRequest
class FreeBusyRequest extends IdentityHash {
  /** Maximal number of calendars for which FreeBusy information is to be provided. Optional. */
  int calendarExpansionMax;

  /**
 * Maximal number of calendar identifiers to be provided for a single group. Optional. An error will
 * be returned for a group with more members than this value.
 */
  int groupExpansionMax;

  /** The end of the interval for the query. */
  String timeMax;

  /** List of calendars and/or groups to query. */
  List<FreeBusyRequestItem> items;

  /** The start of the interval for the query. */
  String timeMin;

  /** Time zone used in the response. Optional. The default is UTC. */
  String timeZone;

  /** Parses an instance from its JSON representation. */
  static FreeBusyRequest parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new FreeBusyRequest();
    result.calendarExpansionMax = identity(json["calendarExpansionMax"]);
    result.groupExpansionMax = identity(json["groupExpansionMax"]);
    result.timeMax = identity(json["timeMax"]);
    result.items = map(FreeBusyRequestItem.parse)(json["items"]);
    result.timeMin = identity(json["timeMin"]);
    result.timeZone = identity(json["timeZone"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(FreeBusyRequest value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["calendarExpansionMax"] = identity(value.calendarExpansionMax);
    result["groupExpansionMax"] = identity(value.groupExpansionMax);
    result["timeMax"] = identity(value.timeMax);
    result["items"] = map(FreeBusyRequestItem.serialize)(value.items);
    result["timeMin"] = identity(value.timeMin);
    result["timeZone"] = identity(value.timeZone);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FreeBusyRequestItem
class FreeBusyRequestItem extends IdentityHash {
  /** The identifier of a calendar or a group. */
  String id;

  /** Parses an instance from its JSON representation. */
  static FreeBusyRequestItem parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new FreeBusyRequestItem();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(FreeBusyRequestItem value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FreeBusyResponse
class FreeBusyResponse extends IdentityHash {
  /** The end of the interval. */
  String timeMax;

  /** Type of the resource ("calendar#freeBusy"). */
  String kind;

  /** List of free/busy information for calendars. */
  Map<String, FreeBusyCalendar> calendars;

  /** The start of the interval. */
  String timeMin;

  /** Expansion of groups. */
  Map<String, FreeBusyGroup> groups;

  /** Parses an instance from its JSON representation. */
  static FreeBusyResponse parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new FreeBusyResponse();
    result.timeMax = identity(json["timeMax"]);
    result.kind = identity(json["kind"]);
    result.calendars = mapValues(FreeBusyCalendar.parse)(json["calendars"]);
    result.timeMin = identity(json["timeMin"]);
    result.groups = mapValues(FreeBusyGroup.parse)(json["groups"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(FreeBusyResponse value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["timeMax"] = identity(value.timeMax);
    result["kind"] = identity(value.kind);
    result["calendars"] = mapValues(FreeBusyCalendar.serialize)(value.calendars);
    result["timeMin"] = identity(value.timeMin);
    result["groups"] = mapValues(FreeBusyGroup.serialize)(value.groups);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Setting
class Setting extends IdentityHash {
  /** Type of the resource ("calendar#setting"). */
  String kind;

  /** ETag of the resource. */
  String etag;

  /** Name of the user setting. */
  String id;

  /** Value of the user setting. The format of the value depends on the ID of the setting. */
  String value;

  /** Parses an instance from its JSON representation. */
  static Setting parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Setting();
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Setting value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Settings
class Settings extends IdentityHash {
  /** List of user settings. */
  List<Setting> items;

  /** Type of the collection ("calendar#settings"). */
  String kind;

  /** Etag of the collection. */
  String etag;

  /** Parses an instance from its JSON representation. */
  static Settings parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Settings();
    result.items = map(Setting.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Settings value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Setting.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .TimePeriod
class TimePeriod extends IdentityHash {
  /** The (inclusive) start of the time period. */
  String start;

  /** The (exclusive) end of the time period. */
  String end;

  /** Parses an instance from its JSON representation. */
  static TimePeriod parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new TimePeriod();
    result.start = identity(json["start"]);
    result.end = identity(json["end"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(TimePeriod value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["start"] = identity(value.start);
    result["end"] = identity(value.end);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum CalendarApi.Alt
class CalendarApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final CalendarApiAlt JSON = const CalendarApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<CalendarApiAlt> values = const <CalendarApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CalendarApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CalendarApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CalendarApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

