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

#library('latitude-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API LatitudeApi
/**
 * Lets you read and update your current location and work with your location history
 */
class LatitudeApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  LatitudeApi get _$service() => this;
  CurrentLocationResource _currentLocation;
  CurrentLocationResource get currentLocation() => _currentLocation;
  LocationResource _location;
  LocationResource get location() => _location;
  
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
  LatitudeApiAlt alt;


  LatitudeApi([this.baseUrl = "https://www.googleapis.com/latitude/v1/", this.applicationName, this.authenticator]) { 
    _currentLocation = new CurrentLocationResource._internal(this);
    _location = new LocationResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}latitude/v1/20120515 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your best-available location and location history */
  static final core.String LATITUDE_ALL_BEST_SCOPE = "https://www.googleapis.com/auth/latitude.all.best";

  /** OAuth2 scope: Manage your city-level location and location history */
  static final core.String LATITUDE_ALL_CITY_SCOPE = "https://www.googleapis.com/auth/latitude.all.city";

  /** OAuth2 scope: Manage your best-available location */
  static final core.String LATITUDE_CURRENT_BEST_SCOPE = "https://www.googleapis.com/auth/latitude.current.best";

  /** OAuth2 scope: Manage your city-level location */
  static final core.String LATITUDE_CURRENT_CITY_SCOPE = "https://www.googleapis.com/auth/latitude.current.city";
}

// Resource .CurrentLocationResource
class CurrentLocationResource extends core.Object {
  final LatitudeApi _$service;
  
  CurrentLocationResource._internal(LatitudeApi $service) : _$service = $service;

  // Method CurrentLocationResource.Insert
  /**
   * Updates or creates the user's current location.
   * [content] the Location
   */
  core.Future<Location> insert(Location content) {
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
    final $path = "currentLocation";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Location.parse(JSON.parse($text)));
  }

  // Method CurrentLocationResource.Get
  /**
   * Returns the authenticated user's current location.
   */
  core.Future<Location> get([CurrentLocationResourceGetGranularity granularity = UNSPECIFIED]) {
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
    final $path = "currentLocation";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Location.parse(JSON.parse($text)));
  }

  // Method CurrentLocationResource.Delete
  /**
   * Deletes the authenticated user's current location.
   */
  core.Future delete() {
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
    final $path = "currentLocation";
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

// Enum CurrentLocationResource.Get.Granularity
class CurrentLocationResourceGetGranularity extends core.Object implements core.Hashable {
  /** Request best available granularity. */
  static final CurrentLocationResourceGetGranularity BEST = const CurrentLocationResourceGetGranularity._internal("best", 0);
  /** Request city-level granularty. */
  static final CurrentLocationResourceGetGranularity CITY = const CurrentLocationResourceGetGranularity._internal("city", 1);

  /** All values of this enumeration */
  static final core.List<CurrentLocationResourceGetGranularity> values = const <CurrentLocationResourceGetGranularity>[
    BEST,
    CITY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CurrentLocationResourceGetGranularity>{ 
    "best": BEST,
    "city": CITY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CurrentLocationResourceGetGranularity valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const CurrentLocationResourceGetGranularity._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Granularity".hashCode();
}

// Resource .LocationResource
class LocationResource extends core.Object {
  final LatitudeApi _$service;
  
  LocationResource._internal(LatitudeApi $service) : _$service = $service;

  // Method LocationResource.Insert
  /**
   * Inserts or updates a location in the user's location history.
   * [content] the Location
   */
  core.Future<Location> insert(Location content) {
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
    final $path = "location";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Location.parse(JSON.parse($text)));
  }

  // Method LocationResource.Get
  /**
   * Reads a location from the user's location history.
   * [locationId] Timestamp of the location to read (ms since epoch).
   */
  core.Future<Location> get(core.String locationId, [LocationResourceGetGranularity granularity = UNSPECIFIED]) {
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
    final $path = "location/{locationId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Location.parse(JSON.parse($text)));
  }

  // Method LocationResource.List
  /**
   * Lists the user's location history.
   */
  core.Future<LocationFeed> list([core.String maxResults = UNSPECIFIED, core.String maxTime = UNSPECIFIED, core.String minTime = UNSPECIFIED, LocationResourceListGranularity granularity = UNSPECIFIED]) {
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
    final $path = "location";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => LocationFeed.parse(JSON.parse($text)));
  }

  // Method LocationResource.Delete
  /**
   * Deletes a location from the user's location history.
   * [locationId] Timestamp of the location to delete (ms since epoch).
   */
  core.Future delete(core.String locationId) {
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
    final $path = "location/{locationId}";
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

// Enum LocationResource.Get.Granularity
class LocationResourceGetGranularity extends core.Object implements core.Hashable {
  /** Request best available granularity. */
  static final LocationResourceGetGranularity BEST = const LocationResourceGetGranularity._internal("best", 0);
  /** Request city-level granularty. */
  static final LocationResourceGetGranularity CITY = const LocationResourceGetGranularity._internal("city", 1);

  /** All values of this enumeration */
  static final core.List<LocationResourceGetGranularity> values = const <LocationResourceGetGranularity>[
    BEST,
    CITY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LocationResourceGetGranularity>{ 
    "best": BEST,
    "city": CITY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LocationResourceGetGranularity valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LocationResourceGetGranularity._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Granularity".hashCode();
}

// Enum LocationResource.List.Granularity
class LocationResourceListGranularity extends core.Object implements core.Hashable {
  /** Request best available granularity. */
  static final LocationResourceListGranularity BEST = const LocationResourceListGranularity._internal("best", 0);
  /** Request city-level granularty. */
  static final LocationResourceListGranularity CITY = const LocationResourceListGranularity._internal("city", 1);

  /** All values of this enumeration */
  static final core.List<LocationResourceListGranularity> values = const <LocationResourceListGranularity>[
    BEST,
    CITY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LocationResourceListGranularity>{ 
    "best": BEST,
    "city": CITY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LocationResourceListGranularity valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LocationResourceListGranularity._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Granularity".hashCode();
}

// Schema .Location
class Location extends IdentityHash {
  /** Kind of this item. */
  core.String kind;

  /** Altitude of the location, in meters. Optional. */
  core.Object altitude;

  /** Longitude of the location, in decimal degrees. */
  core.Object longitude;

  /**
 * Unique ID of the Buzz message that corresponds to the check-in associated with this location.
 * Available only for check-in locations. Optional.
 */
  core.Object activityId;

  /** Latitude of the location, in decimal degrees. */
  core.Object latitude;

  /** Accuracy of the altitude value, in meters. Optional. */
  core.Object altitudeAccuracy;

  /**
 * Timestamp of the Location Resource, in milliseconds since the epoch (UTC). This is also the
 * Location Resource's unique id.
 */
  core.Object timestampMs;

  /**
 * Ground speed of the user at the time this location was recorded, in meters per second. Non-
 * negative. Optional.
 */
  core.Object speed;

  /**
 * Direction of travel of the user when this location was recorded. In degrees, clockwise relative
 * to true north. Optional.
 */
  core.Object heading;

  /** Accuracy of the latitude and longitude coordinates, in non-negative meters. Optional. */
  core.Object accuracy;

  /** Parses an instance from its JSON representation. */
  static Location parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Location value) {
    if (value == null) return null;
    final result = {};
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
  
  core.List<Location> items;

  
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static LocationFeed parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new LocationFeed();
    result.items = map(Location.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(LocationFeed value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Location.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum LatitudeApi.Alt
class LatitudeApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final LatitudeApiAlt ATOM = const LatitudeApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final LatitudeApiAlt JSON = const LatitudeApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final core.List<LatitudeApiAlt> values = const <LatitudeApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LatitudeApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LatitudeApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LatitudeApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

