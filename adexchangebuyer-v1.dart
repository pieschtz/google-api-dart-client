#library("adexchangebuyer");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AdexchangebuyerApi
/**
 * Lets you manage your Ad Exchange Buyer account
 */
class AdexchangebuyerApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  AdexchangebuyerApi get _$service() => this;
  DirectDealsResource _directDeals;
  DirectDealsResource get directDeals() => _directDeals;
  AccountsResource _accounts;
  AccountsResource get accounts() => _accounts;
  CreativesResource _creatives;
  CreativesResource get creatives() => _creatives;
  
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
  AdexchangebuyerApiAlt alt;


  AdexchangebuyerApi([this.baseUrl = "https://www.googleapis.com/adexchangebuyer/v1/", this.applicationName]) { 
    _directDeals = new DirectDealsResource._internal(this);
    _accounts = new AccountsResource._internal(this);
    _creatives = new CreativesResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}adexchangebuyer/v1/20120508 google-api-dart-client/${clientVersion}";
  }
}

// Resource .DirectDealsResource
class DirectDealsResource {
  final AdexchangebuyerApi _$service;
  
  DirectDealsResource._internal(AdexchangebuyerApi $service) : _$service = $service;

  // Method DirectDealsResource.List
  /**
   * Retrieves the authenticated user's list of direct deals.
   */
  Future<DirectDealsList> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "directdeals").generate($pathParams, $queryParams);
    final $completer = new Completer<DirectDealsList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = DirectDealsList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method DirectDealsResource.Get
  /**
   * Gets one direct deal by ID.
   * [id] The direct deal id
   */
  Future<DirectDeal> get(String id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "directdeals/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<DirectDeal>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = DirectDeal.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .AccountsResource
class AccountsResource {
  final AdexchangebuyerApi _$service;
  
  AccountsResource._internal(AdexchangebuyerApi $service) : _$service = $service;

  // Method AccountsResource.Patch
  /**
   * Updates an existing account. This method supports patch semantics.
   * [id] The account id
   * [content] the Account
   */
  Future<Account> patch(int id, Account content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Account.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "accounts/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<Account>();
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Account.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AccountsResource.List
  /**
   * Retrieves the authenticated user's list of accounts.
   */
  Future<AccountsList> list() {
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
    final $url = new UrlPattern(_$service.baseUrl + "accounts").generate($pathParams, $queryParams);
    final $completer = new Completer<AccountsList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = AccountsList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AccountsResource.Update
  /**
   * Updates an existing account.
   * [id] The account id
   * [content] the Account
   */
  Future<Account> update(int id, Account content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Account.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "accounts/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<Account>();
    final $http = new HttpRequest($url, "PUT", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Account.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method AccountsResource.Get
  /**
   * Gets one account by ID.
   * [id] The account id
   */
  Future<Account> get(int id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "accounts/{id}").generate($pathParams, $queryParams);
    final $completer = new Completer<Account>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Account.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CreativesResource
class CreativesResource {
  final AdexchangebuyerApi _$service;
  
  CreativesResource._internal(AdexchangebuyerApi $service) : _$service = $service;

  // Method CreativesResource.Insert
  /**
   * Submit a new creative.
   * [content] the Creative
   */
  Future<Creative> insert(Creative content) {
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
    final $body = JSON.stringify(Creative.serialize(content));
    final $url = new UrlPattern(_$service.baseUrl + "creatives").generate($pathParams, $queryParams);
    final $completer = new Completer<Creative>();
    final $http = new HttpRequest($url, "POST", $headers);
    final $request = $http.request($body);
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Creative.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CreativesResource.List
  /**
   * Retrieves a list of the authenticated user's active creatives.
   */
  Future<CreativesList> list([String pageToken = UNSPECIFIED, int maxResults = UNSPECIFIED]) {
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
    final $url = new UrlPattern(_$service.baseUrl + "creatives").generate($pathParams, $queryParams);
    final $completer = new Completer<CreativesList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CreativesList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CreativesResource.Get
  /**
   * Gets the status for a single creative.
   * [accountId] The id for the account that will serve this creative.
   * [buyerCreativeId] The buyer-specific id for this creative.
   * [adgroupId] The adgroup this creative belongs to.
   */
  Future<Creative> get(int accountId, String buyerCreativeId, String adgroupId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["buyerCreativeId"] = buyerCreativeId;
    $pathParams["adgroupId"] = adgroupId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "creatives/{accountId}/{buyerCreativeId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Creative>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Creative.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .Account
class Account extends IdentityHash {
  /** Resource type. */
  String kind;

  /**
 * The sum of all bidderLocation.maximumQps values cannot exceed this. Please contact your technical
 * account manager if you need to change this.
 */
  int maximumTotalQps;

  /** Your bidder locations that have distinct URLs. */
  List<AccountBidderLocation> bidderLocation;

  /**
 * The nid parameter value used in cookie match requests. Please contact your technical account
 * manager if you need to change this.
 */
  String cookieMatchingNid;

  /** Account id. */
  int id;

  /** The base URL used in cookie match requests. */
  String cookieMatchingUrl;

  /** Parses an instance from its JSON representation. */
  static Account parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Account();
    result.kind = identity(json["kind"]);
    result.maximumTotalQps = identity(json["maximumTotalQps"]);
    result.bidderLocation = map(AccountBidderLocation.parse)(json["bidderLocation"]);
    result.cookieMatchingNid = identity(json["cookieMatchingNid"]);
    result.id = identity(json["id"]);
    result.cookieMatchingUrl = identity(json["cookieMatchingUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Account value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["maximumTotalQps"] = identity(value.maximumTotalQps);
    result["bidderLocation"] = map(AccountBidderLocation.serialize)(value.bidderLocation);
    result["cookieMatchingNid"] = identity(value.cookieMatchingNid);
    result["id"] = identity(value.id);
    result["cookieMatchingUrl"] = identity(value.cookieMatchingUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Account.AccountBidderLocation
class AccountBidderLocation extends IdentityHash {
  /** The URL to which the Ad Exchange will send bid requests. */
  String url;

  /** The maximum queries per second the Ad Exchange will send. */
  int maximumQps;

  /** Parses an instance from its JSON representation. */
  static AccountBidderLocation parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AccountBidderLocation();
    result.url = identity(json["url"]);
    result.maximumQps = identity(json["maximumQps"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AccountBidderLocation value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["maximumQps"] = identity(value.maximumQps);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AccountsList
class AccountsList extends IdentityHash {
  /** A list of accounts. */
  List<Account> items;

  /** Resource type. */
  String kind;

  /** Parses an instance from its JSON representation. */
  static AccountsList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new AccountsList();
    result.items = map(Account.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(AccountsList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Account.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Creative
class Creative extends IdentityHash {
  /** Detected product categories, if any. Read-only. This field should not be set in requests. */
  List<int> productCategories;

  /** The name of the company being advertised in the creative. */
  String advertiserName;

  /** The pretargeting adgroup id that this creative will be associated with. */
  String adgroupId;

  /** The url to fetch a video ad. If set, HTMLSnippet should not be set. */
  String videoURL;

  /** Ad width. */
  int width;

  /** All attributes for the ads that may be shown from this snippet. */
  List<int> attribute;

  /** Resource type. */
  String kind;

  /** Ad height. */
  int height;

  /** Detected advertiser id, if any. Read-only. This field should not be set in requests. */
  List<String> advertiserId;

  /**
 * The HTML snippet that displays the ad when inserted in the web page. If set, videoURL should not
 * be set.
 */
  String hTMLSnippet;

  /** Creative serving status. Read-only. This field should not be set in requests. */
  String status;

  /** A buyer-specific id identifying the creative in this ad. */
  String buyerCreativeId;

  /** The set of destination urls for the snippet. */
  List<String> clickThroughUrl;

  /** All vendor types for the ads that may be shown from this snippet. */
  List<int> vendorType;

  /**
 * The reason for disapproval, if any. Note that not all disapproval reasons may be categorized, so
 * it is possible for the creative to have a status of DISAPPROVED with an empty list for
 * disapproval_reasons. In this case, please reach out to your TAM to help debug the issue. Read-
 * only. This field should not be set in requests.
 */
  List<String> disapprovalReasons;

  /** Detected sensitive categories, if any. Read-only. This field should not be set in requests. */
  List<int> sensitiveCategories;

  /** Account id. */
  int accountId;

  /** Parses an instance from its JSON representation. */
  static Creative parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Creative();
    result.productCategories = map(identity)(json["productCategories"]);
    result.advertiserName = identity(json["advertiserName"]);
    result.adgroupId = identity(json["adgroupId"]);
    result.videoURL = identity(json["videoURL"]);
    result.width = identity(json["width"]);
    result.attribute = map(identity)(json["attribute"]);
    result.kind = identity(json["kind"]);
    result.height = identity(json["height"]);
    result.advertiserId = map(identity)(json["advertiserId"]);
    result.hTMLSnippet = identity(json["HTMLSnippet"]);
    result.status = identity(json["status"]);
    result.buyerCreativeId = identity(json["buyerCreativeId"]);
    result.clickThroughUrl = map(identity)(json["clickThroughUrl"]);
    result.vendorType = map(identity)(json["vendorType"]);
    result.disapprovalReasons = map(identity)(json["disapprovalReasons"]);
    result.sensitiveCategories = map(identity)(json["sensitiveCategories"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Creative value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["productCategories"] = map(identity)(value.productCategories);
    result["advertiserName"] = identity(value.advertiserName);
    result["adgroupId"] = identity(value.adgroupId);
    result["videoURL"] = identity(value.videoURL);
    result["width"] = identity(value.width);
    result["attribute"] = map(identity)(value.attribute);
    result["kind"] = identity(value.kind);
    result["height"] = identity(value.height);
    result["advertiserId"] = map(identity)(value.advertiserId);
    result["HTMLSnippet"] = identity(value.hTMLSnippet);
    result["status"] = identity(value.status);
    result["buyerCreativeId"] = identity(value.buyerCreativeId);
    result["clickThroughUrl"] = map(identity)(value.clickThroughUrl);
    result["vendorType"] = map(identity)(value.vendorType);
    result["disapprovalReasons"] = map(identity)(value.disapprovalReasons);
    result["sensitiveCategories"] = map(identity)(value.sensitiveCategories);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CreativesList
class CreativesList extends IdentityHash {
  /** A list of creatives. */
  List<Creative> items;

  /** Resource type. */
  String kind;

  /** Parses an instance from its JSON representation. */
  static CreativesList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CreativesList();
    result.items = map(Creative.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CreativesList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Creative.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DirectDeal
class DirectDeal extends IdentityHash {
  /** The name of the advertiser this deal is for. */
  String advertiser;

  /** Resource type. */
  String kind;

  /** The currency code that applies to the fixed_cpm value. If not set then assumed to be USD. */
  String currencyCode;

  /** The fixed price for this direct deal. In cpm micros of currency according to currency_code. */
  String fixedCpm;

  /**
 * Start time for when this deal becomes active. If not set then this deal is active immediately
 * upon creation. In seconds since the epoch.
 */
  String startTime;

  /**
 * End time for when this deal stops being active. If not set then this deal is valid until manually
 * disabled by the publisher. In seconds since the epoch.
 */
  String endTime;

  /** The name of the publisher offering this direct deal. */
  String sellerNetwork;

  /** Deal id. */
  String id;

  /** The account id of the buyer this deal is for. */
  int accountId;

  /** Parses an instance from its JSON representation. */
  static DirectDeal parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DirectDeal();
    result.advertiser = identity(json["advertiser"]);
    result.kind = identity(json["kind"]);
    result.currencyCode = identity(json["currencyCode"]);
    result.fixedCpm = identity(json["fixedCpm"]);
    result.startTime = identity(json["startTime"]);
    result.endTime = identity(json["endTime"]);
    result.sellerNetwork = identity(json["sellerNetwork"]);
    result.id = identity(json["id"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DirectDeal value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["advertiser"] = identity(value.advertiser);
    result["kind"] = identity(value.kind);
    result["currencyCode"] = identity(value.currencyCode);
    result["fixedCpm"] = identity(value.fixedCpm);
    result["startTime"] = identity(value.startTime);
    result["endTime"] = identity(value.endTime);
    result["sellerNetwork"] = identity(value.sellerNetwork);
    result["id"] = identity(value.id);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DirectDealsList
class DirectDealsList extends IdentityHash {
  /** Resource type. */
  String kind;

  /** A list of direct deals relevant for your account. */
  List<DirectDeal> directDeals;

  /** Parses an instance from its JSON representation. */
  static DirectDealsList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new DirectDealsList();
    result.kind = identity(json["kind"]);
    result.directDeals = map(DirectDeal.parse)(json["directDeals"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(DirectDealsList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["directDeals"] = map(DirectDeal.serialize)(value.directDeals);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AdexchangebuyerApi.Alt
class AdexchangebuyerApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final AdexchangebuyerApiAlt JSON = const AdexchangebuyerApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<AdexchangebuyerApiAlt> values = const <AdexchangebuyerApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AdexchangebuyerApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AdexchangebuyerApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const AdexchangebuyerApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

