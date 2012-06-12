#library("latitude");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API LatitudeApi
/**
 * Lets you read and update your current location and work with your location history
 */
class LatitudeApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  LatitudeApi get _$service() => this;
  CurrentLocationResource _currentLocation;
  CurrentLocationResource get currentLocation() => _currentLocation;
  LocationResource _location;
  LocationResource get location() => _location;
  
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
  LatitudeApiAlt alt;


  LatitudeApi([this.baseUrl = "https://www.googleapis.com/latitude/v1/", this.applicationName]) { 
    _currentLocation = new CurrentLocationResource._internal(this);
    _location = new LocationResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}latitude/v1/20120515 google-api-dart-client/${clientVersion}";
  }
}

// Resource .CurrentLocationResource
class CurrentLocationResource {
  final LatitudeApi _$service;
  
  CurrentLocationResource._internal(LatitudeApi $service) : _$service = $service;

  // Method CurrentLocationResource.Insert
  /**
   * Updates or creates the user's current location.
   * [content] the Location
   */
  Future<Location> insert(Location content) {
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
    final $body = JSON.stringify(Location.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "currentLocation").generate($pathParams, $queryParams);
    final $completer = new Completer<Location>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Location.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CurrentLocationResource.Get
  /**
   * Returns the authenticated user's current location.
   */
  Future<Location> get([CurrentLocationResourceGetGranularity granularity = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != granularity) $queryParams["granularity"] = granularity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "currentLocation").generate($pathParams, $queryParams);
    final $completer = new Completer<Location>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Location.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CurrentLocationResource.Delete
  /**
   * Deletes the authenticated user's current location.
   */
  Future delete() {
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
    final $url = new UrlPattern(_$service.baseUrl + "currentLocation").generate($pathParams, $queryParams);
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

// Enum CurrentLocationResource.Get.Granularity
class CurrentLocationResourceGetGranularity implements Hashable {
  /** Request best available granularity. */
  static final CurrentLocationResourceGetGranularity BEST = const CurrentLocationResourceGetGranularity._internal("best", 0);
  /** Request city-level granularty. */
  static final CurrentLocationResourceGetGranularity CITY = const CurrentLocationResourceGetGranularity._internal("city", 1);

  /** All values of this enumeration */
  static final List<CurrentLocationResourceGetGranularity> values = const <CurrentLocationResourceGetGranularity>[
    BEST,
    CITY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CurrentLocationResourceGetGranularity>{ 
    "best": BEST,
    "city": CITY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CurrentLocationResourceGetGranularity valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CurrentLocationResourceGetGranularity._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Granularity".hashCode();
}

// Resource .LocationResource
class LocationResource {
  final LatitudeApi _$service;
  
  LocationResource._internal(LatitudeApi $service) : _$service = $service;

  // Method LocationResource.Insert
  /**
   * Inserts or updates a location in the user's location history.
   * [content] the Location
   */
  Future<Location> insert(Location content) {
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
    final $body = JSON.stringify(Location.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "location").generate($pathParams, $queryParams);
    final $completer = new Completer<Location>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Location.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method LocationResource.Get
  /**
   * Reads a location from the user's location history.
   * [locationId] Timestamp of the location to read (ms since epoch).
   */
  Future<Location> get(String locationId, [LocationResourceGetGranularity granularity = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["locationId"] = locationId;
    if (UNSPECIFIED != granularity) $queryParams["granularity"] = granularity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "location/{locationId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Location>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Location.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method LocationResource.List
  /**
   * Lists the user's location history.
   */
  Future<LocationFeed> list([String maxResults = UNSPECIFIED, String maxTime = UNSPECIFIED, String minTime = UNSPECIFIED, LocationResourceListGranularity granularity = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != maxResults) $queryParams["max-results"] = maxResults;
    if (UNSPECIFIED != maxTime) $queryParams["max-time"] = maxTime;
    if (UNSPECIFIED != minTime) $queryParams["min-time"] = minTime;
    if (UNSPECIFIED != granularity) $queryParams["granularity"] = granularity;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "location").generate($pathParams, $queryParams);
    final $completer = new Completer<LocationFeed>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = LocationFeed.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method LocationResource.Delete
  /**
   * Deletes a location from the user's location history.
   * [locationId] Timestamp of the location to delete (ms since epoch).
   */
  Future delete(String locationId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["locationId"] = locationId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "location/{locationId}").generate($pathParams, $queryParams);
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

// Enum LocationResource.Get.Granularity
class LocationResourceGetGranularity implements Hashable {
  /** Request best available granularity. */
  static final LocationResourceGetGranularity BEST = const LocationResourceGetGranularity._internal("best", 0);
  /** Request city-level granularty. */
  static final LocationResourceGetGranularity CITY = const LocationResourceGetGranularity._internal("city", 1);

  /** All values of this enumeration */
  static final List<LocationResourceGetGranularity> values = const <LocationResourceGetGranularity>[
    BEST,
    CITY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LocationResourceGetGranularity>{ 
    "best": BEST,
    "city": CITY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LocationResourceGetGranularity valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const LocationResourceGetGranularity._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Granularity".hashCode();
}

// Enum LocationResource.List.Granularity
class LocationResourceListGranularity implements Hashable {
  /** Request best available granularity. */
  static final LocationResourceListGranularity BEST = const LocationResourceListGranularity._internal("best", 0);
  /** Request city-level granularty. */
  static final LocationResourceListGranularity CITY = const LocationResourceListGranularity._internal("city", 1);

  /** All values of this enumeration */
  static final List<LocationResourceListGranularity> values = const <LocationResourceListGranularity>[
    BEST,
    CITY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LocationResourceListGranularity>{ 
    "best": BEST,
    "city": CITY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LocationResourceListGranularity valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const LocationResourceListGranularity._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Granularity".hashCode();
}

// Schema .Location
class Location extends IdentityHash {
  /** Kind of this item. */
  String kind;

  /** Altitude of the location, in meters. Optional. */
  Object altitude;

  /** Longitude of the location, in decimal degrees. */
  Object longitude;

  /**
 * Unique ID of the Buzz message that corresponds to the check-in associated with this location.
 * Available only for check-in locations. Optional.
 */
  Object activityId;

  /** Latitude of the location, in decimal degrees. */
  Object latitude;

  /** Accuracy of the altitude value, in meters. Optional. */
  Object altitudeAccuracy;

  /**
 * Timestamp of the Location Resource, in milliseconds since the epoch (UTC). This is also the
 * Location Resource's unique id.
 */
  Object timestampMs;

  /**
 * Ground speed of the user at the time this location was recorded, in meters per second. Non-
 * negative. Optional.
 */
  Object speed;

  /**
 * Direction of travel of the user when this location was recorded. In degrees, clockwise relative
 * to true north. Optional.
 */
  Object heading;

  /** Accuracy of the latitude and longitude coordinates, in non-negative meters. Optional. */
  Object accuracy;

  /** Parses an instance from its JSON representation. */
  static Location parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Location();
    result.kind = identity(json["kind"]);
    result.altitude = identity(json["altitude"]);
    result.longitude = identity(json["longitude"]);
    result.activityId = identity(json["activityId"]);
    result.latitude = identity(json["latitude"]);
    result.altitudeAccuracy = identity(json["altitudeAccuracy"]);
    result.timestampMs = identity(json["timestampMs"]);
    result.speed = identity(json["speed"]);
    result.heading = identity(json["heading"]);
    result.accuracy = identity(json["accuracy"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Location value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["altitude"] = identity(value.altitude);
    result["longitude"] = identity(value.longitude);
    result["activityId"] = identity(value.activityId);
    result["latitude"] = identity(value.latitude);
    result["altitudeAccuracy"] = identity(value.altitudeAccuracy);
    result["timestampMs"] = identity(value.timestampMs);
    result["speed"] = identity(value.speed);
    result["heading"] = identity(value.heading);
    result["accuracy"] = identity(value.accuracy);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .LocationFeed
class LocationFeed extends IdentityHash {
  
  List<Location> items;

  
  String kind;

  /** Parses an instance from its JSON representation. */
  static LocationFeed parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new LocationFeed();
    result.items = map(Location.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(LocationFeed value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Location.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum LatitudeApi.Alt
class LatitudeApiAlt implements Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final LatitudeApiAlt ATOM = const LatitudeApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final LatitudeApiAlt JSON = const LatitudeApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final List<LatitudeApiAlt> values = const <LatitudeApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LatitudeApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LatitudeApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const LatitudeApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

