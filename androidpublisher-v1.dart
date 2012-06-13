#library("androidpublisher");
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AndroidpublisherApi
/**
 * Lets Android application developers access their Google Play accounts.
 */
class AndroidpublisherApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  AndroidpublisherApi get _$service() => this;
  PurchasesResource _purchases;
  PurchasesResource get purchases() => _purchases;
  
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
  AndroidpublisherApiAlt alt;


  AndroidpublisherApi([this.baseUrl = "https://www.googleapis.com/androidpublisher/v1/applications/", this.applicationName, this.authenticator]) { 
    _purchases = new PurchasesResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}androidpublisher/v1/20120508 google-api-dart-client/${clientVersion}";
  }
}

// Resource .PurchasesResource
class PurchasesResource extends core.Object {
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
  core.Future cancel(core.String packageName, core.String subscriptionId, core.String token) {
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
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }

  // Method PurchasesResource.Get
  /**
   * Checks whether a user's subscription purchase is valid and returns its expiry time.
   * [packageName] The package name of the application for which this subscription was purchased (for example,
   *        'com.some.thing').
   * [subscriptionId] The purchased subscription ID (for example, 'monthly001').
   * [token] The token provided to the user's device when the subscription was purchased.
   */
  core.Future<SubscriptionPurchase> get(core.String packageName, core.String subscriptionId, core.String token) {
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
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SubscriptionPurchase.parse(JSON.parse($text)));
  }
}

// Schema .SubscriptionPurchase
class SubscriptionPurchase extends IdentityHash {
  /** Time at which the subscription was granted, in milliseconds since Epoch. */
  core.String initiationTimestampMsec;

  /** Set to the fixed string 'androidpublisher#subscriptionPurchase'. */
  core.String kind;

  /**
 * Whether the subscription will automatically be renewed when it reaches its current expiry time.
 */
  core.bool autoRenewing;

  /** Time at which the subscription will expire, in milliseconds since Epoch. */
  core.String validUntilTimestampMsec;

  /** Parses an instance from its JSON representation. */
  static SubscriptionPurchase parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionPurchase();
    result.initiationTimestampMsec = identity(json["initiationTimestampMsec"]);
    result.kind = identity(json["kind"]);
    result.autoRenewing = identity(json["autoRenewing"]);
    result.validUntilTimestampMsec = identity(json["validUntilTimestampMsec"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionPurchase value) {
    if (value == null) return null;
    final result = {};
    result["initiationTimestampMsec"] = identity(value.initiationTimestampMsec);
    result["kind"] = identity(value.kind);
    result["autoRenewing"] = identity(value.autoRenewing);
    result["validUntilTimestampMsec"] = identity(value.validUntilTimestampMsec);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AndroidpublisherApi.Alt
class AndroidpublisherApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final AndroidpublisherApiAlt JSON = const AndroidpublisherApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<AndroidpublisherApiAlt> values = const <AndroidpublisherApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AndroidpublisherApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AndroidpublisherApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AndroidpublisherApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

