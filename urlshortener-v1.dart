#library("urlshortener");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API UrlshortenerApi
/**
 * Lets you create, inspect, and manage goo.gl short URLs
 */
class UrlshortenerApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  UrlshortenerApi get _$service() => this;
  UrlResource _url;
  UrlResource get url() => _url;
  
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
  UrlshortenerApiAlt alt;


  UrlshortenerApi([this.baseUrl = "https://www.googleapis.com/urlshortener/v1/", this.applicationName]) { 
    _url = new UrlResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}urlshortener/v1/snapshot google-api-dart-client/${clientVersion}";
  }
}

// Resource .UrlResource
class UrlResource {
  final UrlshortenerApi _$service;
  
  UrlResource._internal(UrlshortenerApi $service) : _$service = $service;

  // Method UrlResource.Insert
  /**
   * Creates a new short URL.
   * [content] the Url
   */
  Future<Url> insert(Url content) {
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
    final $body = JSON.stringify(Url.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "url").generate($pathParams, $queryParams);
    final $completer = new Completer<Url>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Url.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method UrlResource.List
  /**
   * Retrieves a list of URLs shortened by a user.
   */
  Future<UrlHistory> list([String startToken = UNSPECIFIED, UrlResourceListProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != startToken) $queryParams["start-token"] = startToken;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "url/history").generate($pathParams, $queryParams);
    final $completer = new Completer<UrlHistory>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = UrlHistory.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method UrlResource.Get
  /**
   * Expands a short URL or gets creation time and analytics.
   * [shortUrl] The short URL, including the protocol.
   */
  Future<Url> get(String shortUrl, [UrlResourceGetProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["shortUrl"] = shortUrl;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "url").generate($pathParams, $queryParams);
    final $completer = new Completer<Url>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Url.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum UrlResource.List.Projection
class UrlResourceListProjection implements Hashable {
  /** Returns short URL click counts. */
  static final UrlResourceListProjection ANALYTICS_CLICKS = const UrlResourceListProjection._internal("ANALYTICS_CLICKS", 0);
  /** Returns short URL click counts. */
  static final UrlResourceListProjection FULL = const UrlResourceListProjection._internal("FULL", 1);

  /** All values of this enumeration */
  static final List<UrlResourceListProjection> values = const <UrlResourceListProjection>[
    ANALYTICS_CLICKS,
    FULL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <UrlResourceListProjection>{ 
    "ANALYTICS_CLICKS": ANALYTICS_CLICKS,
    "FULL": FULL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static UrlResourceListProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const UrlResourceListProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}

// Enum UrlResource.Get.Projection
class UrlResourceGetProjection implements Hashable {
  /** Returns only click counts. */
  static final UrlResourceGetProjection ANALYTICS_CLICKS = const UrlResourceGetProjection._internal("ANALYTICS_CLICKS", 0);
  /** Returns only top string counts. */
  static final UrlResourceGetProjection ANALYTICS_TOP_STRINGS = const UrlResourceGetProjection._internal("ANALYTICS_TOP_STRINGS", 1);
  /** Returns the creation timestamp and all available analytics. */
  static final UrlResourceGetProjection FULL = const UrlResourceGetProjection._internal("FULL", 2);

  /** All values of this enumeration */
  static final List<UrlResourceGetProjection> values = const <UrlResourceGetProjection>[
    ANALYTICS_CLICKS,
    ANALYTICS_TOP_STRINGS,
    FULL,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <UrlResourceGetProjection>{ 
    "ANALYTICS_CLICKS": ANALYTICS_CLICKS,
    "ANALYTICS_TOP_STRINGS": ANALYTICS_TOP_STRINGS,
    "FULL": FULL,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static UrlResourceGetProjection valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const UrlResourceGetProjection._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Projection".hashCode();
}

// Schema .AnalyticsSnapshot
class AnalyticsSnapshot extends IdentityHash {
  /** Number of clicks on this short URL. */
  String shortUrlClicks;

  /**
 * Top countries (expressed as country codes), e.g. "US" or "DE"; sorted by (descending) click
 * counts. Only present if this data is available.
 */
  List<StringCount> countries;

  /**
 * Top platforms or OSes, e.g. "Windows"; sorted by (descending) click counts. Only present if this
 * data is available.
 */
  List<StringCount> platforms;

  /**
 * Top browsers, e.g. "Chrome"; sorted by (descending) click counts. Only present if this data is
 * available.
 */
  List<StringCount> browsers;

  /**
 * Top referring hosts, e.g. "www.google.com"; sorted by (descending) click counts. Only present if
 * this data is available.
 */
  List<StringCount> referrers;

  /** Number of clicks on all goo.gl short URLs pointing to this long URL. */
  String longUrlClicks;

  /** Parses an instance from its JSON representation. */
  static AnalyticsSnapshot parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AnalyticsSnapshot();
    result.shortUrlClicks = identity(json["shortUrlClicks"]);
    result.countries = map(StringCount.parse)(json["countries"]);
    result.platforms = map(StringCount.parse)(json["platforms"]);
    result.browsers = map(StringCount.parse)(json["browsers"]);
    result.referrers = map(StringCount.parse)(json["referrers"]);
    result.longUrlClicks = identity(json["longUrlClicks"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AnalyticsSnapshot value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["shortUrlClicks"] = identity(value.shortUrlClicks);
    result["countries"] = map(StringCount.serialize)(value.countries);
    result["platforms"] = map(StringCount.serialize)(value.platforms);
    result["browsers"] = map(StringCount.serialize)(value.browsers);
    result["referrers"] = map(StringCount.serialize)(value.referrers);
    result["longUrlClicks"] = identity(value.longUrlClicks);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AnalyticsSummary
class AnalyticsSummary extends IdentityHash {
  /** Click analytics over the last week. */
  AnalyticsSnapshot week;

  /** Click analytics over all time. */
  AnalyticsSnapshot allTime;

  /** Click analytics over the last two hours. */
  AnalyticsSnapshot twoHours;

  /** Click analytics over the last day. */
  AnalyticsSnapshot day;

  /** Click analytics over the last month. */
  AnalyticsSnapshot month;

  /** Parses an instance from its JSON representation. */
  static AnalyticsSummary parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AnalyticsSummary();
    result.week = AnalyticsSnapshot.parse(json["week"]);
    result.allTime = AnalyticsSnapshot.parse(json["allTime"]);
    result.twoHours = AnalyticsSnapshot.parse(json["twoHours"]);
    result.day = AnalyticsSnapshot.parse(json["day"]);
    result.month = AnalyticsSnapshot.parse(json["month"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AnalyticsSummary value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["week"] = AnalyticsSnapshot.serialize(value.week);
    result["allTime"] = AnalyticsSnapshot.serialize(value.allTime);
    result["twoHours"] = AnalyticsSnapshot.serialize(value.twoHours);
    result["day"] = AnalyticsSnapshot.serialize(value.day);
    result["month"] = AnalyticsSnapshot.serialize(value.month);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .StringCount
class StringCount extends IdentityHash {
  /** Number of clicks for this top entry, e.g. for this particular country or browser. */
  String count;

  /** Label assigned to this top entry, e.g. "US" or "Chrome". */
  String id;

  /** Parses an instance from its JSON representation. */
  static StringCount parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new StringCount();
    result.count = identity(json["count"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(StringCount value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["count"] = identity(value.count);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Url
class Url extends IdentityHash {
  /**
 * Status of the target URL. Possible values: "OK", "MALWARE", "PHISHING", or "REMOVED". A URL might
 * be marked "REMOVED" if it was flagged as spam, for example.
 */
  String status;

  /** The fixed string "urlshortener#url". */
  String kind;

  /**
 * Time the short URL was created; ISO 8601 representation using the yyyy-MM-dd'T'HH:mm:ss.SSSZZ
 * format, e.g. "2010-10-14T19:01:24.944+00:00".
 */
  String created;

  /**
 * A summary of the click analytics for the short and long URL. Might not be present if not
 * requested or currently unavailable.
 */
  AnalyticsSummary analytics;

  /** Long URL, e.g. "http://www.google.com/". Might not be present if the status is "REMOVED". */
  String longUrl;

  /** Short URL, e.g. "http://goo.gl/l6MS". */
  String id;

  /** Parses an instance from its JSON representation. */
  static Url parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Url();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.created = identity(json["created"]);
    result.analytics = AnalyticsSummary.parse(json["analytics"]);
    result.longUrl = identity(json["longUrl"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Url value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["created"] = identity(value.created);
    result["analytics"] = AnalyticsSummary.serialize(value.analytics);
    result["longUrl"] = identity(value.longUrl);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UrlHistory
class UrlHistory extends IdentityHash {
  /** A token to provide to get the next page of results. */
  String nextPageToken;

  /** A list of URL resources. */
  List<Url> items;

  /** The fixed string "urlshortener#urlHistory". */
  String kind;

  /**
 * Number of items returned with each full "page" of results. Note that the last page could have
 * fewer items than the "itemsPerPage" value.
 */
  int itemsPerPage;

  /** Total number of short URLs associated with this user (may be approximate). */
  int totalItems;

  /** Parses an instance from its JSON representation. */
  static UrlHistory parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new UrlHistory();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Url.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.totalItems = identity(json["totalItems"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(UrlHistory value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Url.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["totalItems"] = identity(value.totalItems);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum UrlshortenerApi.Alt
class UrlshortenerApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final UrlshortenerApiAlt JSON = const UrlshortenerApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<UrlshortenerApiAlt> values = const <UrlshortenerApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <UrlshortenerApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static UrlshortenerApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const UrlshortenerApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

