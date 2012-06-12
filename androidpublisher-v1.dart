#library("androidpublisher");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AndroidpublisherApi
/**
 * Lets Android application developers access their Google Play accounts.
 */
class AndroidpublisherApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  AndroidpublisherApi get _$service() => this;
  PurchasesResource _purchases;
  PurchasesResource get purchases() => _purchases;
  
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
  AndroidpublisherApiAlt alt;


  AndroidpublisherApi([this.baseUrl = "https://www.googleapis.com/androidpublisher/v1/applications/", this.applicationName]) { 
    _purchases = new PurchasesResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}androidpublisher/v1/20120508 google-api-dart-client/${clientVersion}";
  }
}

// Resource .PurchasesResource
class PurchasesResource {
  final AndroidpublisherApi _$service;
  
  PurchasesResource._internal(AndroidpublisherApi $service) : _$service = $service;

  // Method PurchasesResource.Cancel
  /**
   * Cancels a user's subscription purchase. The subscription remains valid until its expiration time.
   * [packageName] The package name of the application for which this subscription was purchased (for example,
   *        'com.some.thing').
   * [subscriptionId] The purchased subscription ID (for example, 'monthly001').
   * [token] The token provided to the user's device when the subscription was purchased.
   */
  Future cancel(String packageName, String subscriptionId, String token) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["packageName"] = packageName;
    $pathParams["subscriptionId"] = subscriptionId;
    $pathParams["token"] = token;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "{packageName}/subscriptions/{subscriptionId}/purchases/{token}/cancel").generate($pathParams, $queryParams);
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

  // Method PurchasesResource.Get
  /**
   * Checks whether a user's subscription purchase is valid and returns its expiry time.
   * [packageName] The package name of the application for which this subscription was purchased (for example,
   *        'com.some.thing').
   * [subscriptionId] The purchased subscription ID (for example, 'monthly001').
   * [token] The token provided to the user's device when the subscription was purchased.
   */
  Future<SubscriptionPurchase> get(String packageName, String subscriptionId, String token) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["packageName"] = packageName;
    $pathParams["subscriptionId"] = subscriptionId;
    $pathParams["token"] = token;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "{packageName}/subscriptions/{subscriptionId}/purchases/{token}").generate($pathParams, $queryParams);
    final $completer = new Completer<SubscriptionPurchase>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = SubscriptionPurchase.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .SubscriptionPurchase
class SubscriptionPurchase extends IdentityHash {
  /** Time at which the subscription was granted, in milliseconds since Epoch. */
  String initiationTimestampMsec;

  /** Set to the fixed string 'androidpublisher#subscriptionPurchase'. */
  String kind;

  /**
 * Whether the subscription will automatically be renewed when it reaches its current expiry time.
 */
  bool autoRenewing;

  /** Time at which the subscription will expire, in milliseconds since Epoch. */
  String validUntilTimestampMsec;

  /** Parses an instance from its JSON representation. */
  static SubscriptionPurchase parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SubscriptionPurchase();
    result.initiationTimestampMsec = identity(json["initiationTimestampMsec"]);
    result.kind = identity(json["kind"]);
    result.autoRenewing = identity(json["autoRenewing"]);
    result.validUntilTimestampMsec = identity(json["validUntilTimestampMsec"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SubscriptionPurchase value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["initiationTimestampMsec"] = identity(value.initiationTimestampMsec);
    result["kind"] = identity(value.kind);
    result["autoRenewing"] = identity(value.autoRenewing);
    result["validUntilTimestampMsec"] = identity(value.validUntilTimestampMsec);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AndroidpublisherApi.Alt
class AndroidpublisherApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final AndroidpublisherApiAlt JSON = const AndroidpublisherApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<AndroidpublisherApiAlt> values = const <AndroidpublisherApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AndroidpublisherApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AndroidpublisherApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const AndroidpublisherApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

