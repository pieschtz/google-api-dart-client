#library('adsense-v1.1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API AdsenseApi
/**
 * Gives AdSense publishers access to their inventory and the ability to generate reports
 */
class AdsenseApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  AdsenseApi get _$service() => this;
  UrlchannelsResource _urlchannels;
  UrlchannelsResource get urlchannels() => _urlchannels;
  AdunitsResource _adunits;
  AdunitsResource get adunits() => _adunits;
  AdclientsResource _adclients;
  AdclientsResource get adclients() => _adclients;
  ReportsResource _reports;
  ReportsResource get reports() => _reports;
  AccountsResource _accounts;
  AccountsResource get accounts() => _accounts;
  CustomchannelsResource _customchannels;
  CustomchannelsResource get customchannels() => _customchannels;
  
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
  AdsenseApiAlt alt;


  AdsenseApi([this.baseUrl = "https://www.googleapis.com/adsense/v1.1/", this.applicationName, this.authenticator]) { 
    _urlchannels = new UrlchannelsResource._internal(this);
    _adunits = new AdunitsResource._internal(this);
    _adclients = new AdclientsResource._internal(this);
    _reports = new ReportsResource._internal(this);
    _accounts = new AccountsResource._internal(this);
    _customchannels = new CustomchannelsResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}adsense/v1.1/20120607 google-api-dart-client/${clientVersion}";
  }
}

// Resource .UrlchannelsResource
class UrlchannelsResource extends core.Object {
  final AdsenseApi _$service;
  
  UrlchannelsResource._internal(AdsenseApi $service) : _$service = $service;

  // Method UrlchannelsResource.List
  /**
   * List all URL channels in the specified ad client for this AdSense account.
   * [adClientId] Ad client for which to list URL channels.
   */
  core.Future<UrlChannels> list(core.String adClientId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
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
    final $path = "adclients/{adClientId}/urlchannels";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UrlChannels.parse(JSON.parse($text)));
  }
}

// Resource .AdunitsResource
class AdunitsResource extends core.Object {
  final AdsenseApi _$service;
  final AdunitsCustomchannelsResourceResource customchannels;
  
  AdunitsResource._internal(AdsenseApi $service) : _$service = $service,
    customchannels = new AdunitsCustomchannelsResourceResource._internal($service);

  // Method AdunitsResource.List
  /**
   * List all ad units in the specified ad client for this AdSense account.
   * [adClientId] Ad client for which to list ad units.
   */
  core.Future<AdUnits> list(core.String adClientId, [core.bool includeInactive = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (UNSPECIFIED != includeInactive) $queryParams["includeInactive"] = includeInactive;
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
    final $path = "adclients/{adClientId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnits.parse(JSON.parse($text)));
  }

  // Method AdunitsResource.Get
  /**
   * Gets the specified ad unit in the specified ad client.
   * [adClientId] Ad client for which to get the ad unit.
   * [adUnitId] Ad unit to retrieve.
   */
  core.Future<AdUnit> get(core.String adClientId, core.String adUnitId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    $pathParams["adUnitId"] = adUnitId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients/{adClientId}/adunits/{adUnitId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }
}


// Resource AdunitsResource.AdunitsCustomchannelsResourceResource
class AdunitsCustomchannelsResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  AdunitsCustomchannelsResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AdunitsResource.AdunitsCustomchannelsResourceResource.List
  /**
   * List all custom channels which the specified ad unit belongs to.
   * [adClientId] Ad client which contains the ad unit.
   * [adUnitId] Ad unit for which to list custom channels.
   */
  core.Future<CustomChannels> list(core.String adClientId, core.String adUnitId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    $pathParams["adUnitId"] = adUnitId;
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
    final $path = "adclients/{adClientId}/adunits/{adUnitId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannels.parse(JSON.parse($text)));
  }
}

// Resource .AdclientsResource
class AdclientsResource extends core.Object {
  final AdsenseApi _$service;
  
  AdclientsResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AdclientsResource.List
  /**
   * List all ad clients in this AdSense account.
   */
  core.Future<AdClients> list([core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
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
    final $path = "adclients";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdClients.parse(JSON.parse($text)));
  }
}

// Resource .ReportsResource
class ReportsResource extends core.Object {
  final AdsenseApi _$service;
  
  ReportsResource._internal(AdsenseApi $service) : _$service = $service;

  // Method ReportsResource.Generate
  /**
   * Generate an AdSense report based on the report request sent in the query parameters. Returns the
   * result as JSON; to retrieve output in CSV format specify "alt=csv" as a query parameter.
   * [startDate] Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
   * [endDate] End of the date range to report on in "YYYY-MM-DD" format, inclusive.
   */
  core.Future<AdsenseReportsGenerateResponse> generate(core.String startDate, core.String endDate, [core.List<core.String> sort = UNSPECIFIED, core.String locale = UNSPECIFIED, core.List<core.String> metric = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.List<core.String> filter = UNSPECIFIED, core.String currency = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.List<core.String> dimension = UNSPECIFIED, core.List<core.String> accountId = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["startDate"] = startDate;
    $pathParams["endDate"] = endDate;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != metric) $queryParams["metric"] = metric;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != filter) $queryParams["filter"] = filter;
    if (UNSPECIFIED != currency) $queryParams["currency"] = currency;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != dimension) $queryParams["dimension"] = dimension;
    if (UNSPECIFIED != accountId) $queryParams["accountId"] = accountId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "reports";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdsenseReportsGenerateResponse.parse(JSON.parse($text)));
  }
}

// Resource .AccountsResource
class AccountsResource extends core.Object {
  final AdsenseApi _$service;
  final AccountsUrlchannelsResourceResource urlchannels;
  final AccountsAdunitsResourceResource adunits;
  final AccountsAdclientsResourceResource adclients;
  final AccountsReportsResourceResource reports;
  final AccountsCustomchannelsResourceResource customchannels;
  
  AccountsResource._internal(AdsenseApi $service) : _$service = $service,
    urlchannels = new AccountsUrlchannelsResourceResource._internal($service),
    adunits = new AccountsAdunitsResourceResource._internal($service),
    adclients = new AccountsAdclientsResourceResource._internal($service),
    reports = new AccountsReportsResourceResource._internal($service),
    customchannels = new AccountsCustomchannelsResourceResource._internal($service);

  // Method AccountsResource.List
  /**
   * List all accounts available to this AdSense account.
   */
  core.Future<Accounts> list([core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
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
    final $path = "accounts";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Accounts.parse(JSON.parse($text)));
  }

  // Method AccountsResource.Get
  /**
   * Get information about the selected AdSense account.
   * [accountId] Account to get information about.
   */
  core.Future<Account> get(core.String accountId, [core.bool tree = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    if (UNSPECIFIED != tree) $queryParams["tree"] = tree;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Account.parse(JSON.parse($text)));
  }
}


// Resource AccountsResource.AccountsUrlchannelsResourceResource
class AccountsUrlchannelsResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  AccountsUrlchannelsResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AccountsResource.AccountsUrlchannelsResourceResource.List
  /**
   * List all URL channels in the specified ad client for the specified account.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client for which to list URL channels.
   */
  core.Future<UrlChannels> list(core.String accountId, core.String adClientId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
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
    final $path = "accounts/{accountId}/adclients/{adClientId}/urlchannels";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UrlChannels.parse(JSON.parse($text)));
  }
}

// Resource AccountsResource.AccountsAdunitsResourceResource
class AccountsAdunitsResourceResource extends core.Object {
  final AdsenseApi _$service;
  final AccountsAdunitsResourceAccountsAdunitsCustomchannelsResourceResourceResourceResource customchannels;
  
  AccountsAdunitsResourceResource._internal(AdsenseApi $service) : _$service = $service,
    customchannels = new AccountsAdunitsResourceAccountsAdunitsCustomchannelsResourceResourceResourceResource._internal($service);

  // Method AccountsResource.AccountsAdunitsResourceResource.List
  /**
   * List all ad units in the specified ad client for the specified account.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client for which to list ad units.
   */
  core.Future<AdUnits> list(core.String accountId, core.String adClientId, [core.bool includeInactive = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    if (UNSPECIFIED != includeInactive) $queryParams["includeInactive"] = includeInactive;
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
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnits.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.Get
  /**
   * Gets the specified ad unit in the specified ad client for the specified account.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client for which to get the ad unit.
   * [adUnitId] Ad unit to retrieve.
   */
  core.Future<AdUnit> get(core.String accountId, core.String adClientId, core.String adUnitId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    $pathParams["adUnitId"] = adUnitId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits/{adUnitId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }
}


// Resource AccountsResource.AccountsAdunitsResourceResource.AccountsAdunitsResourceAccountsAdunitsCustomchannelsResourceResourceResourceResource
class AccountsAdunitsResourceAccountsAdunitsCustomchannelsResourceResourceResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  AccountsAdunitsResourceAccountsAdunitsCustomchannelsResourceResourceResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AccountsResource.AccountsAdunitsResourceResource.AccountsAdunitsResourceAccountsAdunitsCustomchannelsResourceResourceResourceResource.List
  /**
   * List all custom channels which the specified ad unit belongs to.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client which contains the ad unit.
   * [adUnitId] Ad unit for which to list custom channels.
   */
  core.Future<CustomChannels> list(core.String accountId, core.String adClientId, core.String adUnitId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    $pathParams["adUnitId"] = adUnitId;
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
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits/{adUnitId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannels.parse(JSON.parse($text)));
  }
}

// Resource AccountsResource.AccountsAdclientsResourceResource
class AccountsAdclientsResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  AccountsAdclientsResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AccountsResource.AccountsAdclientsResourceResource.List
  /**
   * List all ad clients in the specified account.
   * [accountId] Account for which to list ad clients.
   */
  core.Future<AdClients> list(core.String accountId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
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
    final $path = "accounts/{accountId}/adclients";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdClients.parse(JSON.parse($text)));
  }
}

// Resource AccountsResource.AccountsReportsResourceResource
class AccountsReportsResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  AccountsReportsResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AccountsResource.AccountsReportsResourceResource.Generate
  /**
   * Generate an AdSense report based on the report request sent in the query parameters. Returns the
   * result as JSON; to retrieve output in CSV format specify "alt=csv" as a query parameter.
   * [accountId] Account upon which to report.
   * [startDate] Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
   * [endDate] End of the date range to report on in "YYYY-MM-DD" format, inclusive.
   */
  core.Future<AdsenseReportsGenerateResponse> generate(core.String accountId, core.String startDate, core.String endDate, [core.List<core.String> sort = UNSPECIFIED, core.String locale = UNSPECIFIED, core.List<core.String> metric = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.List<core.String> filter = UNSPECIFIED, core.String currency = UNSPECIFIED, core.int startIndex = UNSPECIFIED, core.List<core.String> dimension = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["startDate"] = startDate;
    $pathParams["endDate"] = endDate;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != metric) $queryParams["metric"] = metric;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != filter) $queryParams["filter"] = filter;
    if (UNSPECIFIED != currency) $queryParams["currency"] = currency;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != dimension) $queryParams["dimension"] = dimension;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/reports";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdsenseReportsGenerateResponse.parse(JSON.parse($text)));
  }
}

// Resource AccountsResource.AccountsCustomchannelsResourceResource
class AccountsCustomchannelsResourceResource extends core.Object {
  final AdsenseApi _$service;
  final AccountsCustomchannelsResourceAccountsCustomchannelsAdunitsResourceResourceResourceResource adunits;
  
  AccountsCustomchannelsResourceResource._internal(AdsenseApi $service) : _$service = $service,
    adunits = new AccountsCustomchannelsResourceAccountsCustomchannelsAdunitsResourceResourceResourceResource._internal($service);

  // Method AccountsResource.AccountsCustomchannelsResourceResource.List
  /**
   * List all custom channels in the specified ad client for the specified account.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client for which to list custom channels.
   */
  core.Future<CustomChannels> list(core.String accountId, core.String adClientId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
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
    final $path = "accounts/{accountId}/adclients/{adClientId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannels.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsCustomchannelsResourceResource.Get
  /**
   * Get the specified custom channel from the specified ad client for the specified account.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client which contains the custom channel.
   * [customChannelId] Custom channel to retrieve.
   */
  core.Future<CustomChannel> get(core.String accountId, core.String adClientId, core.String customChannelId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    $pathParams["customChannelId"] = customChannelId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients/{adClientId}/customchannels/{customChannelId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }
}


// Resource AccountsResource.AccountsCustomchannelsResourceResource.AccountsCustomchannelsResourceAccountsCustomchannelsAdunitsResourceResourceResourceResource
class AccountsCustomchannelsResourceAccountsCustomchannelsAdunitsResourceResourceResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  AccountsCustomchannelsResourceAccountsCustomchannelsAdunitsResourceResourceResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method AccountsResource.AccountsCustomchannelsResourceResource.AccountsCustomchannelsResourceAccountsCustomchannelsAdunitsResourceResourceResourceResource.List
  /**
   * List all ad units in the specified custom channel.
   * [accountId] Account to which the ad client belongs.
   * [adClientId] Ad client which contains the custom channel.
   * [customChannelId] Custom channel for which to list ad units.
   */
  core.Future<AdUnits> list(core.String accountId, core.String adClientId, core.String customChannelId, [core.bool includeInactive = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String pageToken = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    $pathParams["customChannelId"] = customChannelId;
    if (UNSPECIFIED != includeInactive) $queryParams["includeInactive"] = includeInactive;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients/{adClientId}/customchannels/{customChannelId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnits.parse(JSON.parse($text)));
  }
}

// Resource .CustomchannelsResource
class CustomchannelsResource extends core.Object {
  final AdsenseApi _$service;
  final CustomchannelsAdunitsResourceResource adunits;
  
  CustomchannelsResource._internal(AdsenseApi $service) : _$service = $service,
    adunits = new CustomchannelsAdunitsResourceResource._internal($service);

  // Method CustomchannelsResource.List
  /**
   * List all custom channels in the specified ad client for this AdSense account.
   * [adClientId] Ad client for which to list custom channels.
   */
  core.Future<CustomChannels> list(core.String adClientId, [core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
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
    final $path = "adclients/{adClientId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannels.parse(JSON.parse($text)));
  }

  // Method CustomchannelsResource.Get
  /**
   * Get the specified custom channel from the specified ad client.
   * [adClientId] Ad client which contains the custom channel.
   * [customChannelId] Custom channel to retrieve.
   */
  core.Future<CustomChannel> get(core.String adClientId, core.String customChannelId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    $pathParams["customChannelId"] = customChannelId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients/{adClientId}/customchannels/{customChannelId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }
}


// Resource CustomchannelsResource.CustomchannelsAdunitsResourceResource
class CustomchannelsAdunitsResourceResource extends core.Object {
  final AdsenseApi _$service;
  
  CustomchannelsAdunitsResourceResource._internal(AdsenseApi $service) : _$service = $service;

  // Method CustomchannelsResource.CustomchannelsAdunitsResourceResource.List
  /**
   * List all ad units in the specified custom channel.
   * [adClientId] Ad client which contains the custom channel.
   * [customChannelId] Custom channel for which to list ad units.
   */
  core.Future<AdUnits> list(core.String adClientId, core.String customChannelId, [core.bool includeInactive = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    $pathParams["customChannelId"] = customChannelId;
    if (UNSPECIFIED != includeInactive) $queryParams["includeInactive"] = includeInactive;
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
    final $path = "adclients/{adClientId}/customchannels/{customChannelId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnits.parse(JSON.parse($text)));
  }
}

// Schema .Account
class Account extends IdentityHash {
  /** Kind of resource this is, in this case adsense#account. */
  core.String kind;

  /** Unique identifier of this account. */
  core.String id;

  /** Sub accounts of the this account. */
  core.List<Account> subAccounts;

  /** Name of this account. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Account parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Account();
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.subAccounts = map(Account.parse)(json["subAccounts"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Account value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["subAccounts"] = map(Account.serialize)(value.subAccounts);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Accounts
class Accounts extends IdentityHash {
  /**
 * Continuation token used to page through accounts. To retrieve the next page of results, set the
 * next request's "pageToken" value to this.
 */
  core.String nextPageToken;

  /** The accounts returned in this list response. */
  core.List<Account> items;

  /** Kind of list this is, in this case adsense#accounts. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static Accounts parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Accounts();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Account.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Accounts value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Account.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdClient
class AdClient extends IdentityHash {
  /** This ad client's product code, which corresponds to the PRODUCT_CODE report dimension. */
  core.String productCode;

  /** Kind of resource this is, in this case adsense#adClient. */
  core.String kind;

  /** Unique identifier of this ad client. */
  core.String id;

  /** Whether this ad client supports being reported on. */
  core.bool supportsReporting;

  /** Parses an instance from its JSON representation. */
  static AdClient parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdClient();
    result.productCode = identity(json["productCode"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.supportsReporting = identity(json["supportsReporting"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdClient value) {
    if (value == null) return null;
    final result = {};
    result["productCode"] = identity(value.productCode);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["supportsReporting"] = identity(value.supportsReporting);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdClients
class AdClients extends IdentityHash {
  /**
 * Continuation token used to page through ad clients. To retrieve the next page of results, set the
 * next request's "pageToken" value to this.
 */
  core.String nextPageToken;

  /** The ad clients returned in this list response. */
  core.List<AdClient> items;

  /** Kind of list this is, in this case adsense#adClients. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static AdClients parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdClients();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(AdClient.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdClients value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(AdClient.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdUnit
class AdUnit extends IdentityHash {
  /**
 * Status of this ad unit. Possible values are: NEW: Indicates that the ad unit was created within
 * the last seven days and does not yet have any activity associated with it.
 *
 * ACTIVE: Indicates that there has been activity on this ad unit in the last seven days.
 *
 * INACTIVE: Indicates that there has been no activity on this ad unit in the last seven days.
 */
  core.String status;

  /** Kind of resource this is, in this case adsense#adUnit. */
  core.String kind;

  /** Identity code of this ad unit, not necessarily unique across ad clients. */
  core.String code;

  /**
 * Unique identifier of this ad unit. This should be considered an opaque identifier; it is not safe
 * to rely on it being in any particular format.
 */
  core.String id;

  /** Name of this ad unit. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static AdUnit parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdUnit();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.code = identity(json["code"]);
    result.id = identity(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdUnit value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["code"] = identity(value.code);
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdUnits
class AdUnits extends IdentityHash {
  /**
 * Continuation token used to page through ad units. To retrieve the next page of results, set the
 * next request's "pageToken" value to this.
 */
  core.String nextPageToken;

  /** The ad units returned in this list response. */
  core.List<AdUnit> items;

  /** Kind of list this is, in this case adsense#adUnits. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static AdUnits parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdUnits();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(AdUnit.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdUnits value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(AdUnit.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdsenseReportsGenerateResponse
class AdsenseReportsGenerateResponse extends IdentityHash {
  /** Kind this is, in this case adsense#report. */
  core.String kind;

  /**
 * The output rows of the report. Each row is a list of cells; one for each dimension in the
 * request, followed by one for each metric in the request. The dimension cells contain strings, and
 * the metric cells contain numbers.
 */
  core.List<core.List<core.String>> rows;

  /** Any warnings associated with generation of the report. */
  core.List<core.String> warnings;

  /**
 * The totals of the report. This is the same length as any other row in the report; cells
 * corresponding to dimension columns are empty.
 */
  core.List<core.String> totals;

  /**
 * The header information of the columns requested in the report. This is a list of headers; one for
 * each dimension in the request, followed by one for each metric in the request.
 */
  core.List<AdsenseReportsGenerateResponseHeaders> headers;

  /**
 * The total number of rows matched by the report request. Fewer rows may be returned in the
 * response due to being limited by the row count requested or the report row limit.
 */
  core.String totalMatchedRows;

  /**
 * The averages of the report. This is the same length as any other row in the report; cells
 * corresponding to dimension columns are empty.
 */
  core.List<core.String> averages;

  /** Parses an instance from its JSON representation. */
  static AdsenseReportsGenerateResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdsenseReportsGenerateResponse();
    result.kind = identity(json["kind"]);
    result.rows = map(map(identity))(json["rows"]);
    result.warnings = map(identity)(json["warnings"]);
    result.totals = map(identity)(json["totals"]);
    result.headers = map(AdsenseReportsGenerateResponseHeaders.parse)(json["headers"]);
    result.totalMatchedRows = identity(json["totalMatchedRows"]);
    result.averages = map(identity)(json["averages"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdsenseReportsGenerateResponse value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(map(identity))(value.rows);
    result["warnings"] = map(identity)(value.warnings);
    result["totals"] = map(identity)(value.totals);
    result["headers"] = map(AdsenseReportsGenerateResponseHeaders.serialize)(value.headers);
    result["totalMatchedRows"] = identity(value.totalMatchedRows);
    result["averages"] = map(identity)(value.averages);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AdsenseReportsGenerateResponse.AdsenseReportsGenerateResponseHeaders
class AdsenseReportsGenerateResponseHeaders extends IdentityHash {
  /** The currency of this column. Only present if the header type is METRIC_CURRENCY. */
  core.String currency;

  /** The type of the header; one of DIMENSION, METRIC_TALLY, METRIC_RATIO, or METRIC_CURRENCY. */
  core.String type;

  /** The name of the header. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static AdsenseReportsGenerateResponseHeaders parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdsenseReportsGenerateResponseHeaders();
    result.currency = identity(json["currency"]);
    result.type = identity(json["type"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdsenseReportsGenerateResponseHeaders value) {
    if (value == null) return null;
    final result = {};
    result["currency"] = identity(value.currency);
    result["type"] = identity(value.type);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomChannel
class CustomChannel extends IdentityHash {
  /** Kind of resource this is, in this case adsense#customChannel. */
  core.String kind;

  /** Code of this custom channel, not necessarily unique across ad clients. */
  core.String code;

  /** The targeting information of this custom channel, if activated. */
  CustomChannelTargetingInfo targetingInfo;

  /**
 * Unique identifier of this custom channel. This should be considered an opaque identifier; it is
 * not safe to rely on it being in any particular format.
 */
  core.String id;

  /** Name of this custom channel. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static CustomChannel parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomChannel();
    result.kind = identity(json["kind"]);
    result.code = identity(json["code"]);
    result.targetingInfo = CustomChannelTargetingInfo.parse(json["targetingInfo"]);
    result.id = identity(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomChannel value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["code"] = identity(value.code);
    result["targetingInfo"] = CustomChannelTargetingInfo.serialize(value.targetingInfo);
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema CustomChannel.CustomChannelTargetingInfo
class CustomChannelTargetingInfo extends IdentityHash {
  /**
 * The locations in which ads appear. (Only valid for content and mobile content ads). Acceptable
 * values for content ads are: TOP_LEFT, TOP_CENTER, TOP_RIGHT, MIDDLE_LEFT, MIDDLE_CENTER,
 * MIDDLE_RIGHT, BOTTOM_LEFT, BOTTOM_CENTER, BOTTOM_RIGHT, MULTIPLE_LOCATIONS. Acceptable values for
 * mobile content ads are: TOP, MIDDLE, BOTTOM, MULTIPLE_LOCATIONS.
 */
  core.String location;

  /** The name used to describe this channel externally. */
  core.String adsAppearOn;

  /** The language of the sites ads will be displayed on. */
  core.String siteLanguage;

  /** The external description of the channel. */
  core.String description;

  /** Parses an instance from its JSON representation. */
  static CustomChannelTargetingInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomChannelTargetingInfo();
    result.location = identity(json["location"]);
    result.adsAppearOn = identity(json["adsAppearOn"]);
    result.siteLanguage = identity(json["siteLanguage"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomChannelTargetingInfo value) {
    if (value == null) return null;
    final result = {};
    result["location"] = identity(value.location);
    result["adsAppearOn"] = identity(value.adsAppearOn);
    result["siteLanguage"] = identity(value.siteLanguage);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomChannels
class CustomChannels extends IdentityHash {
  /**
 * Continuation token used to page through custom channels. To retrieve the next page of results,
 * set the next request's "pageToken" value to this.
 */
  core.String nextPageToken;

  /** The custom channels returned in this list response. */
  core.List<CustomChannel> items;

  /** Kind of list this is, in this case adsense#customChannels. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static CustomChannels parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomChannels();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(CustomChannel.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomChannels value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(CustomChannel.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UrlChannel
class UrlChannel extends IdentityHash {
  /** Kind of resource this is, in this case adsense#urlChannel. */
  core.String kind;

  /**
 * Unique identifier of this URL channel. This should be considered an opaque identifier; it is not
 * safe to rely on it being in any particular format.
 */
  core.String id;

  /**
 * URL Pattern of this URL channel. Does not include "http://" or "https://". Example:
 * www.example.com/home
 */
  core.String urlPattern;

  /** Parses an instance from its JSON representation. */
  static UrlChannel parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UrlChannel();
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.urlPattern = identity(json["urlPattern"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UrlChannel value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["urlPattern"] = identity(value.urlPattern);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UrlChannels
class UrlChannels extends IdentityHash {
  /**
 * Continuation token used to page through URL channels. To retrieve the next page of results, set
 * the next request's "pageToken" value to this.
 */
  core.String nextPageToken;

  /** The URL channels returned in this list response. */
  core.List<UrlChannel> items;

  /** Kind of list this is, in this case adsense#urlChannels. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static UrlChannels parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UrlChannels();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(UrlChannel.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UrlChannels value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(UrlChannel.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum AdsenseApi.Alt
class AdsenseApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of text/csv */
  static final AdsenseApiAlt CSV = const AdsenseApiAlt._internal("csv", 0);
  /** Responses with Content-Type of application/json */
  static final AdsenseApiAlt JSON = const AdsenseApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final core.List<AdsenseApiAlt> values = const <AdsenseApiAlt>[
    CSV,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AdsenseApiAlt>{ 
    "csv": CSV,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AdsenseApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AdsenseApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

