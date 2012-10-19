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

#library('adsensehost-v4.1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API AdSenseHostApi
/**
 * Gives AdSense Hosts access to report generation, ad code generation, and publisher management
 * capabilities.
 */
class AdSenseHostApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  AdSenseHostApi get _$service => this;
  UrlchannelsResource _urlchannels;
  UrlchannelsResource get urlchannels => _urlchannels;
  AdclientsResource _adclients;
  AdclientsResource get adclients => _adclients;
  AssociationsessionsResource _associationsessions;
  AssociationsessionsResource get associationsessions => _associationsessions;
  ReportsResource _reports;
  ReportsResource get reports => _reports;
  AccountsResource _accounts;
  AccountsResource get accounts => _accounts;
  CustomchannelsResource _customchannels;
  CustomchannelsResource get customchannels => _customchannels;
  
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
  AdSenseHostApiAlt alt;


  AdSenseHostApi({this.baseUrl:"https://www.googleapis.com/adsensehost/v4.1/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _urlchannels = new UrlchannelsResource._internal(this);
    _adclients = new AdclientsResource._internal(this);
    _associationsessions = new AssociationsessionsResource._internal(this);
    _reports = new ReportsResource._internal(this);
    _accounts = new AccountsResource._internal(this);
    _customchannels = new CustomchannelsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}adsensehost/v4.1/20121007 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage your AdSense host data and associated accounts */
  static final core.String ADSENSEHOST_SCOPE = "https://www.googleapis.com/auth/adsensehost";
}

// Resource .UrlchannelsResource
class UrlchannelsResource extends core.Object {
  final AdSenseHostApi _$service;
  
  UrlchannelsResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method UrlchannelsResource.Insert
  /**
   * Add a new URL channel to the host AdSense account.
   *
   *    * [content] the UrlChannel
   *    * [adClientId] Ad client to which the new URL channel will be added.
   */
  core.Future<UrlChannel> insert(core.String adClientId, UrlChannel content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(UrlChannel.serialize(content));
    final $path = "adclients/{adClientId}/urlchannels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => UrlChannel.parse(JSON.parse($text)));
  }

  // Method UrlchannelsResource.List
  /**
   * List all host URL channels in the host AdSense account.
   *
   *    * [adClientId] Ad client for which to list URL channels.
   *    * [pageToken] A continuation token, used to page through URL channels. To retrieve the next page, set this
   *        parameter to the value of "nextPageToken" from the previous response.
   *    * [maxResults] The maximum number of URL channels to include in the response, used for paging.

  Minimum: 0.
   *        Maximum: 10000.
   */
  core.Future<UrlChannels> list(core.String adClientId, {core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients/{adClientId}/urlchannels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UrlChannels.parse(JSON.parse($text)));
  }

  // Method UrlchannelsResource.Delete
  /**
   * Delete a URL channel from the host AdSense account.
   *
   *    * [adClientId] Ad client from which to delete the URL channel.
   *    * [urlChannelId] URL channel to delete.
   */
  core.Future<UrlChannel> delete(core.String adClientId, core.String urlChannelId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    $pathParams["urlChannelId"] = urlChannelId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients/{adClientId}/urlchannels/{urlChannelId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UrlChannel.parse(JSON.parse($text)));
  }
}

// Resource .AdclientsResource
class AdclientsResource extends core.Object {
  final AdSenseHostApi _$service;
  
  AdclientsResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method AdclientsResource.List
  /**
   * List all host ad clients in this AdSense account.
   *
   *    * [pageToken] A continuation token, used to page through ad clients. To retrieve the next page, set this parameter
   *        to the value of "nextPageToken" from the previous response.
   *    * [maxResults] The maximum number of ad clients to include in the response, used for paging.

  Minimum: 0.
  Maximum:
   *        10000.
   */
  core.Future<AdClients> list({core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdClients.parse(JSON.parse($text)));
  }

  // Method AdclientsResource.Get
  /**
   * Get information about one of the ad clients in the Host AdSense account.
   *
   *    * [adClientId] Ad client to get.
   */
  core.Future<AdClient> get(core.String adClientId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients/{adClientId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdClient.parse(JSON.parse($text)));
  }
}

// Resource .AssociationsessionsResource
class AssociationsessionsResource extends core.Object {
  final AdSenseHostApi _$service;
  
  AssociationsessionsResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method AssociationsessionsResource.Start
  /**
   * Create an association session for initiating an association with an AdSense user.
   *
   *    * [productCode] Products to associate with the user.
   *    * [websiteUrl] The URL of the user's hosted website.
   *    * [websiteLocale] The locale of the user's hosted website.
   *    * [userLocale] The preferred locale of the user.
   */
  core.Future<AssociationSession> start(AssociationsessionsResourceStartProductCode productCode, core.String websiteUrl, {core.String websiteLocale, core.String userLocale}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?productCode) $queryParams["productCode"] = productCode;
    if (?websiteUrl) $queryParams["websiteUrl"] = websiteUrl;
    if (?websiteLocale) $queryParams["websiteLocale"] = websiteLocale;
    if (?userLocale) $queryParams["userLocale"] = userLocale;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "associationsessions/start";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AssociationSession.parse(JSON.parse($text)));
  }

  // Method AssociationsessionsResource.Verify
  /**
   * Verify an association session after the association callback returns from AdSense signup.
   *
   *    * [token] The token returned to the association callback URL.
   */
  core.Future<AssociationSession> verify(core.String token) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?token) $queryParams["token"] = token;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "associationsessions/verify";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AssociationSession.parse(JSON.parse($text)));
  }
}

// Enum AssociationsessionsResource.Start.ProductCode
class AssociationsessionsResourceStartProductCode extends core.Object implements core.Hashable {
  /** AdSense For Content */
  const AssociationsessionsResourceStartProductCode AFC = const AssociationsessionsResourceStartProductCode._internal("AFC", 0);
  /** AdSense For Mobile Content */
  const AssociationsessionsResourceStartProductCode AFMC = const AssociationsessionsResourceStartProductCode._internal("AFMC", 1);
  /** AdSense For Search */
  const AssociationsessionsResourceStartProductCode AFS = const AssociationsessionsResourceStartProductCode._internal("AFS", 2);

  /** All values of this enumeration */
  const core.List<AssociationsessionsResourceStartProductCode> values = const <AssociationsessionsResourceStartProductCode>[
    AFC,
    AFMC,
    AFS,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <AssociationsessionsResourceStartProductCode>{ 
    "AFC": AFC,
    "AFMC": AFMC,
    "AFS": AFS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AssociationsessionsResourceStartProductCode valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AssociationsessionsResourceStartProductCode._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "ProductCode".hashCode();
}

// Resource .ReportsResource
class ReportsResource extends core.Object {
  final AdSenseHostApi _$service;
  
  ReportsResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method ReportsResource.Generate
  /**
   * Generate an AdSense report based on the report request sent in the query parameters. Returns the
   * result as JSON; to retrieve output in CSV format specify "alt=csv" as a query parameter.
   *
   *    * [startDate] Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
   *    * [endDate] End of the date range to report on in "YYYY-MM-DD" format, inclusive.
   *    * [sort] The name of a dimension or metric to sort the resulting report on, optionally prefixed with "+" to
   *        sort ascending or "-" to sort descending. If no prefix is specified, the column is sorted
   *        ascending.
   *    * [locale] Optional locale to use for translating report output to a local language. Defaults to "en_US" if not
   *        specified.
   *    * [metric] Numeric columns to include in the report.
   *    * [maxResults] The maximum number of rows of report data to return.

  Minimum: 0.
  Maximum: 50000.
   *    * [filter] Filters to be run on the report.
   *    * [startIndex] Index of the first row of report data to return.

  Minimum: 0.
  Maximum: 5000.
   *    * [dimension] Dimensions to base the report on.
   */
  core.Future<Report> generate(core.String startDate, core.String endDate, {core.List<core.String> sort, core.String locale, core.List<core.String> metric, core.int maxResults, core.List<core.String> filter, core.int startIndex, core.List<core.String> dimension}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?startDate) $queryParams["startDate"] = startDate;
    if (?endDate) $queryParams["endDate"] = endDate;
    if (?sort) $queryParams["sort"] = sort;
    if (?locale) $queryParams["locale"] = locale;
    if (?metric) $queryParams["metric"] = metric;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?filter) $queryParams["filter"] = filter;
    if (?startIndex) $queryParams["startIndex"] = startIndex;
    if (?dimension) $queryParams["dimension"] = dimension;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }
}

// Resource .AccountsResource
class AccountsResource extends core.Object {
  final AdSenseHostApi _$service;
  final AccountsAdunitsResourceResource adunits;
  final AccountsAdclientsResourceResource adclients;
  final AccountsReportsResourceResource reports;
  
  AccountsResource._internal(AdSenseHostApi $service) : _$service = $service,
    adunits = new AccountsAdunitsResourceResource._internal($service),
    adclients = new AccountsAdclientsResourceResource._internal($service),
    reports = new AccountsReportsResourceResource._internal($service);

  // Method AccountsResource.List
  /**
   * List hosted accounts associated with this AdSense account by ad client id.
   *
   *    * [filterAdClientId] Ad clients to list accounts for.
   */
  core.Future<Accounts> list(core.List<core.String> filterAdClientId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?filterAdClientId) $queryParams["filterAdClientId"] = filterAdClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Accounts.parse(JSON.parse($text)));
  }

  // Method AccountsResource.Get
  /**
   * Get information about the selected associated AdSense account.
   *
   *    * [accountId] Account to get information about.
   */
  core.Future<Account> get(core.String accountId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Account.parse(JSON.parse($text)));
  }
}


// Resource AccountsResource.AccountsAdunitsResourceResource
class AccountsAdunitsResourceResource extends core.Object {
  final AdSenseHostApi _$service;
  
  AccountsAdunitsResourceResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method AccountsResource.AccountsAdunitsResourceResource.Insert
  /**
   * Insert the supplied ad unit into the specified publisher AdSense account.
   *
   *    * [content] the AdUnit
   *    * [accountId] Account which will contain the ad unit.
   *    * [adClientId] Ad client into which to insert the ad unit.
   */
  core.Future<AdUnit> insert(core.String accountId, core.String adClientId, AdUnit content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AdUnit.serialize(content));
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.Get
  /**
   * Get the specified host ad unit in this AdSense account.
   *
   *    * [accountId] Account which contains the ad unit.
   *    * [adClientId] Ad client for which to get ad unit.
   *    * [adUnitId] Ad unit to get.
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
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.GetAdCode
  /**
   * Get ad code for the specified ad unit, attaching the specified host custom channels.
   *
   *    * [accountId] Account which contains the ad client.
   *    * [adClientId] Ad client with contains the ad unit.
   *    * [adUnitId] Ad unit to get the code for.
   *    * [hostCustomChannelId] Host custom channel to attach to the ad code.
   */
  core.Future<AdCode> getAdCode(core.String accountId, core.String adClientId, core.String adUnitId, {core.List<core.String> hostCustomChannelId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    $pathParams["adUnitId"] = adUnitId;
    if (?hostCustomChannelId) $queryParams["hostCustomChannelId"] = hostCustomChannelId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits/{adUnitId}/adcode";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdCode.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.List
  /**
   * List all ad units in the specified publisher's AdSense account.
   *
   *    * [accountId] Account which contains the ad client.
   *    * [adClientId] Ad client for which to list ad units.
   *    * [includeInactive] Whether to include inactive ad units. Default: true.
   *    * [pageToken] A continuation token, used to page through ad units. To retrieve the next page, set this parameter
   *        to the value of "nextPageToken" from the previous response.
   *    * [maxResults] The maximum number of ad units to include in the response, used for paging.

  Minimum: 0.
  Maximum:
   *        10000.
   */
  core.Future<AdUnits> list(core.String accountId, core.String adClientId, {core.bool includeInactive, core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    if (?includeInactive) $queryParams["includeInactive"] = includeInactive;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnits.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.Update
  /**
   * Update the supplied ad unit in the specified publisher AdSense account.
   *
   *    * [content] the AdUnit
   *    * [accountId] Account which contains the ad client.
   *    * [adClientId] Ad client which contains the ad unit.
   */
  core.Future<AdUnit> update(core.String accountId, core.String adClientId, AdUnit content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AdUnit.serialize(content));
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.Patch
  /**
   * Update the supplied ad unit in the specified publisher AdSense account. This method supports
   * patch semantics.
   *
   *    * [content] the AdUnit
   *    * [accountId] Account which contains the ad client.
   *    * [adClientId] Ad client which contains the ad unit.
   *    * [adUnitId] Ad unit to get.
   */
  core.Future<AdUnit> patch(core.String accountId, core.String adClientId, core.String adUnitId, AdUnit content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    if (?adUnitId) $queryParams["adUnitId"] = adUnitId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(AdUnit.serialize(content));
    final $path = "accounts/{accountId}/adclients/{adClientId}/adunits";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdunitsResourceResource.Delete
  /**
   * Delete the specified ad unit from the specified publisher AdSense account.
   *
   *    * [accountId] Account which contains the ad unit.
   *    * [adClientId] Ad client for which to get ad unit.
   *    * [adUnitId] Ad unit to delete.
   */
  core.Future<AdUnit> delete(core.String accountId, core.String adClientId, core.String adUnitId) {
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
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdUnit.parse(JSON.parse($text)));
  }
}

// Resource AccountsResource.AccountsAdclientsResourceResource
class AccountsAdclientsResourceResource extends core.Object {
  final AdSenseHostApi _$service;
  
  AccountsAdclientsResourceResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method AccountsResource.AccountsAdclientsResourceResource.List
  /**
   * List all hosted ad clients in the specified hosted account.
   *
   *    * [accountId] Account for which to list ad clients.
   *    * [pageToken] A continuation token, used to page through ad clients. To retrieve the next page, set this parameter
   *        to the value of "nextPageToken" from the previous response.
   *    * [maxResults] The maximum number of ad clients to include in the response, used for paging.

  Minimum: 0.
  Maximum:
   *        10000.
   */
  core.Future<AdClients> list(core.String accountId, {core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdClients.parse(JSON.parse($text)));
  }

  // Method AccountsResource.AccountsAdclientsResourceResource.Get
  /**
   * Get information about one of the ad clients in the specified publisher's AdSense account.
   *
   *    * [accountId] Account which contains the ad client.
   *    * [adClientId] Ad client to get.
   */
  core.Future<AdClient> get(core.String accountId, core.String adClientId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/adclients/{adClientId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => AdClient.parse(JSON.parse($text)));
  }
}

// Resource AccountsResource.AccountsReportsResourceResource
class AccountsReportsResourceResource extends core.Object {
  final AdSenseHostApi _$service;
  
  AccountsReportsResourceResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method AccountsResource.AccountsReportsResourceResource.Generate
  /**
   * Generate an AdSense report based on the report request sent in the query parameters. Returns the
   * result as JSON; to retrieve output in CSV format specify "alt=csv" as a query parameter.
   *
   *    * [accountId] Hosted account upon which to report.
   *    * [startDate] Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
   *    * [endDate] End of the date range to report on in "YYYY-MM-DD" format, inclusive.
   *    * [sort] The name of a dimension or metric to sort the resulting report on, optionally prefixed with "+" to
   *        sort ascending or "-" to sort descending. If no prefix is specified, the column is sorted
   *        ascending.
   *    * [locale] Optional locale to use for translating report output to a local language. Defaults to "en_US" if not
   *        specified.
   *    * [metric] Numeric columns to include in the report.
   *    * [maxResults] The maximum number of rows of report data to return.

  Minimum: 0.
  Maximum: 50000.
   *    * [filter] Filters to be run on the report.
   *    * [startIndex] Index of the first row of report data to return.

  Minimum: 0.
  Maximum: 5000.
   *    * [dimension] Dimensions to base the report on.
   */
  core.Future<Report> generate(core.String accountId, core.String startDate, core.String endDate, {core.List<core.String> sort, core.String locale, core.List<core.String> metric, core.int maxResults, core.List<core.String> filter, core.int startIndex, core.List<core.String> dimension}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["accountId"] = accountId;
    if (?startDate) $queryParams["startDate"] = startDate;
    if (?endDate) $queryParams["endDate"] = endDate;
    if (?sort) $queryParams["sort"] = sort;
    if (?locale) $queryParams["locale"] = locale;
    if (?metric) $queryParams["metric"] = metric;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?filter) $queryParams["filter"] = filter;
    if (?startIndex) $queryParams["startIndex"] = startIndex;
    if (?dimension) $queryParams["dimension"] = dimension;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "accounts/{accountId}/reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }
}

// Resource .CustomchannelsResource
class CustomchannelsResource extends core.Object {
  final AdSenseHostApi _$service;
  
  CustomchannelsResource._internal(AdSenseHostApi $service) : _$service = $service;

  // Method CustomchannelsResource.Insert
  /**
   * Add a new custom channel to the host AdSense account.
   *
   *    * [content] the CustomChannel
   *    * [adClientId] Ad client to which the new custom channel will be added.
   */
  core.Future<CustomChannel> insert(core.String adClientId, CustomChannel content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CustomChannel.serialize(content));
    final $path = "adclients/{adClientId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }

  // Method CustomchannelsResource.Get
  /**
   * Get a specific custom channel from the host AdSense account.
   *
   *    * [adClientId] Ad client from which to get the custom channel.
   *    * [customChannelId] Custom channel to get.
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
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }

  // Method CustomchannelsResource.List
  /**
   * List all host custom channels in this AdSense account.
   *
   *    * [adClientId] Ad client for which to list custom channels.
   *    * [pageToken] A continuation token, used to page through custom channels. To retrieve the next page, set this
   *        parameter to the value of "nextPageToken" from the previous response.
   *    * [maxResults] The maximum number of custom channels to include in the response, used for paging.

  Minimum: 0.
   *        Maximum: 10000.
   */
  core.Future<CustomChannels> list(core.String adClientId, {core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "adclients/{adClientId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannels.parse(JSON.parse($text)));
  }

  // Method CustomchannelsResource.Update
  /**
   * Update a custom channel in the host AdSense account.
   *
   *    * [content] the CustomChannel
   *    * [adClientId] Ad client in which the custom channel will be updated.
   */
  core.Future<CustomChannel> update(core.String adClientId, CustomChannel content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CustomChannel.serialize(content));
    final $path = "adclients/{adClientId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }

  // Method CustomchannelsResource.Patch
  /**
   * Update a custom channel in the host AdSense account. This method supports patch semantics.
   *
   *    * [content] the CustomChannel
   *    * [adClientId] Ad client in which the custom channel will be updated.
   *    * [customChannelId] Custom channel to get.
   */
  core.Future<CustomChannel> patch(core.String adClientId, core.String customChannelId, CustomChannel content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["adClientId"] = adClientId;
    if (?customChannelId) $queryParams["customChannelId"] = customChannelId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(CustomChannel.serialize(content));
    final $path = "adclients/{adClientId}/customchannels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }

  // Method CustomchannelsResource.Delete
  /**
   * Delete a specific custom channel from the host AdSense account.
   *
   *    * [adClientId] Ad client from which to delete the custom channel.
   *    * [customChannelId] Custom channel to delete.
   */
  core.Future<CustomChannel> delete(core.String adClientId, core.String customChannelId) {
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
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CustomChannel.parse(JSON.parse($text)));
  }
}

// Schema .Account
class Account extends IdentityHash {
  /** Approval status of this account. One of: PENDING, APPROVED, DISABLED. */
  core.String status;

  /** Kind of resource this is, in this case adsensehost#account. */
  core.String kind;

  /** Unique identifier of this account. */
  core.String id;

  /** Name of this account. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Account parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Account();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Account value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Accounts
class Accounts extends IdentityHash {
  /** The accounts returned in this list response. */
  core.List<Account> items;

  /** Kind of list this is, in this case adsensehost#accounts. */
  core.String kind;

  /** ETag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static Accounts parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Accounts();
    result.items = map(Account.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Accounts value) {
    if (value == null) return null;
    final result = {};
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

  /** Kind of resource this is, in this case adsensehost#adClient. */
  core.String kind;

  /** Unique identifier of this ad client. */
  core.String id;

  /** Whether this ad client is opted in to ARC. */
  core.bool arcOptIn;

  /** Whether this ad client supports being reported on. */
  core.bool supportsReporting;

  /** Parses an instance from its JSON representation. */
  static AdClient parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdClient();
    result.productCode = identity(json["productCode"]);
    result.kind = identity(json["kind"]);
    result.id = identity(json["id"]);
    result.arcOptIn = identity(json["arcOptIn"]);
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
    result["arcOptIn"] = identity(value.arcOptIn);
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

  /** Kind of list this is, in this case adsensehost#adClients. */
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

// Schema .AdCode
class AdCode extends IdentityHash {
  /** The ad code snippet. */
  core.String adCode;

  /** Kind this is, in this case adsensehost#adCode. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static AdCode parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdCode();
    result.adCode = identity(json["adCode"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdCode value) {
    if (value == null) return null;
    final result = {};
    result["adCode"] = identity(value.adCode);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdStyle
class AdStyle extends IdentityHash {
  /** The style of the corners in the ad. */
  core.String corners;

  /**
 * The colors included in the style. These are represented as six hexadecimal characters, similar to
 * HTML color codes, but without the leading hash.
 */
  AdStyleColors colors;

  /** The font which is included in the style. */
  AdStyleFont font;

  /** Kind this is, in this case adsensehost#adStyle. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static AdStyle parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdStyle();
    result.corners = identity(json["corners"]);
    result.colors = AdStyleColors.parse(json["colors"]);
    result.font = AdStyleFont.parse(json["font"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdStyle value) {
    if (value == null) return null;
    final result = {};
    result["corners"] = identity(value.corners);
    result["colors"] = AdStyleColors.serialize(value.colors);
    result["font"] = AdStyleFont.serialize(value.font);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AdStyle.AdStyleColors
class AdStyleColors extends IdentityHash {
  /** The color of the ad url. */
  core.String url;

  /** The color of the ad text. */
  core.String text;

  /** The color of the ad border. */
  core.String border;

  /** The color of the ad background. */
  core.String background;

  /** The color of the ad title. */
  core.String title;

  /** Parses an instance from its JSON representation. */
  static AdStyleColors parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdStyleColors();
    result.url = identity(json["url"]);
    result.text = identity(json["text"]);
    result.border = identity(json["border"]);
    result.background = identity(json["background"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdStyleColors value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    result["text"] = identity(value.text);
    result["border"] = identity(value.border);
    result["background"] = identity(value.background);
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AdStyle.AdStyleFont
class AdStyleFont extends IdentityHash {
  /** The family of the font. */
  core.String family;

  /** The size of the font. */
  core.String size;

  /** Parses an instance from its JSON representation. */
  static AdStyleFont parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdStyleFont();
    result.family = identity(json["family"]);
    result.size = identity(json["size"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdStyleFont value) {
    if (value == null) return null;
    final result = {};
    result["family"] = identity(value.family);
    result["size"] = identity(value.size);
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

  /** Kind of resource this is, in this case adsensehost#adUnit. */
  core.String kind;

  /** Identity code of this ad unit, not necessarily unique across ad clients. */
  core.String code;

  /** Name of this ad unit. */
  core.String name;

  /** Settings specific to content ads (AFC) and highend mobile content ads (AFMC). */
  AdUnitContentAdsSettings contentAdsSettings;

  /**
 * Unique identifier of this ad unit. This should be considered an opaque identifier; it is not safe
 * to rely on it being in any particular format.
 */
  core.String id;

  /** Settings specific to WAP mobile content ads (AFMC). */
  AdUnitMobileContentAdsSettings mobileContentAdsSettings;

  /** Custom style information specific to this ad unit. */
  AdStyle customStyle;

  /** Parses an instance from its JSON representation. */
  static AdUnit parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdUnit();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.code = identity(json["code"]);
    result.name = identity(json["name"]);
    result.contentAdsSettings = AdUnitContentAdsSettings.parse(json["contentAdsSettings"]);
    result.id = identity(json["id"]);
    result.mobileContentAdsSettings = AdUnitMobileContentAdsSettings.parse(json["mobileContentAdsSettings"]);
    result.customStyle = AdStyle.parse(json["customStyle"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdUnit value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["code"] = identity(value.code);
    result["name"] = identity(value.name);
    result["contentAdsSettings"] = AdUnitContentAdsSettings.serialize(value.contentAdsSettings);
    result["id"] = identity(value.id);
    result["mobileContentAdsSettings"] = AdUnitMobileContentAdsSettings.serialize(value.mobileContentAdsSettings);
    result["customStyle"] = AdStyle.serialize(value.customStyle);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AdUnit.AdUnitContentAdsSettings
class AdUnitContentAdsSettings extends IdentityHash {
  /** Type of this ad unit. */
  core.String type;

  /** The backup option to be used in instances where no ad is available. */
  AdUnitContentAdsSettingsBackupOption backupOption;

  /** Size of this ad unit. */
  core.String size;

  /** Parses an instance from its JSON representation. */
  static AdUnitContentAdsSettings parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdUnitContentAdsSettings();
    result.type = identity(json["type"]);
    result.backupOption = AdUnitContentAdsSettingsBackupOption.parse(json["backupOption"]);
    result.size = identity(json["size"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdUnitContentAdsSettings value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["backupOption"] = AdUnitContentAdsSettingsBackupOption.serialize(value.backupOption);
    result["size"] = identity(value.size);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AdUnit.AdUnitContentAdsSettings.AdUnitContentAdsSettingsBackupOption
class AdUnitContentAdsSettingsBackupOption extends IdentityHash {
  /** Color to use when type is set to COLOR. */
  core.String color;

  /** URL to use when type is set to URL. */
  core.String url;

  /** Type of the backup option. Possible values are BLANK, COLOR and URL. */
  core.String type;

  /** Parses an instance from its JSON representation. */
  static AdUnitContentAdsSettingsBackupOption parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdUnitContentAdsSettingsBackupOption();
    result.color = identity(json["color"]);
    result.url = identity(json["url"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdUnitContentAdsSettingsBackupOption value) {
    if (value == null) return null;
    final result = {};
    result["color"] = identity(value.color);
    result["url"] = identity(value.url);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema AdUnit.AdUnitMobileContentAdsSettings
class AdUnitMobileContentAdsSettings extends IdentityHash {
  /** The scripting language to use for this ad unit. */
  core.String scriptingLanguage;

  /** Type of this ad unit. */
  core.String type;

  /** The markup language to use for this ad unit. */
  core.String markupLanguage;

  /** Size of this ad unit. */
  core.String size;

  /** Parses an instance from its JSON representation. */
  static AdUnitMobileContentAdsSettings parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdUnitMobileContentAdsSettings();
    result.scriptingLanguage = identity(json["scriptingLanguage"]);
    result.type = identity(json["type"]);
    result.markupLanguage = identity(json["markupLanguage"]);
    result.size = identity(json["size"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdUnitMobileContentAdsSettings value) {
    if (value == null) return null;
    final result = {};
    result["scriptingLanguage"] = identity(value.scriptingLanguage);
    result["type"] = identity(value.type);
    result["markupLanguage"] = identity(value.markupLanguage);
    result["size"] = identity(value.size);
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

  /** Kind of list this is, in this case adsensehost#adUnits. */
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

// Schema .AssociationSession
class AssociationSession extends IdentityHash {
  /**
 * Status of the completed association, available once the association callback token has been
 * verified. One of ACCEPTED, REJECTED, or ERROR.
 */
  core.String status;

  /** The products to associate with the user. Options: AFC, AFF, AFS, AFMC */
  core.List<core.String> productCodes;

  /** Kind of resource this is, in this case adsensehost#associationSession. */
  core.String kind;

  /** The preferred locale of the user themselves when going through the AdSense association flow. */
  core.String userLocale;

  /** The locale of the user's hosted website. */
  core.String websiteLocale;

  /**
 * Redirect URL of this association session. Used to redirect users into the AdSense association
 * flow.
 */
  core.String redirectUrl;

  /** The URL of the user's hosted website. */
  core.String websiteUrl;

  /** Unique identifier of this association session. */
  core.String id;

  /**
 * Hosted account id of the associated publisher after association. Present if status is ACCEPTED.
 */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static AssociationSession parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AssociationSession();
    result.status = identity(json["status"]);
    result.productCodes = map(identity)(json["productCodes"]);
    result.kind = identity(json["kind"]);
    result.userLocale = identity(json["userLocale"]);
    result.websiteLocale = identity(json["websiteLocale"]);
    result.redirectUrl = identity(json["redirectUrl"]);
    result.websiteUrl = identity(json["websiteUrl"]);
    result.id = identity(json["id"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AssociationSession value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["productCodes"] = map(identity)(value.productCodes);
    result["kind"] = identity(value.kind);
    result["userLocale"] = identity(value.userLocale);
    result["websiteLocale"] = identity(value.websiteLocale);
    result["redirectUrl"] = identity(value.redirectUrl);
    result["websiteUrl"] = identity(value.websiteUrl);
    result["id"] = identity(value.id);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomChannel
class CustomChannel extends IdentityHash {
  /** Kind of resource this is, in this case adsensehost#customChannel. */
  core.String kind;

  /** Code of this custom channel, not necessarily unique across ad clients. */
  core.String code;

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
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
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

  /** Kind of list this is, in this case adsensehost#customChannels. */
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

// Schema .Report
class Report extends IdentityHash {
  /** Kind this is, in this case adsensehost#report. */
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
  core.List<ReportHeaders> headers;

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
  static Report parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Report();
    result.kind = identity(json["kind"]);
    result.rows = map(map(identity))(json["rows"]);
    result.warnings = map(identity)(json["warnings"]);
    result.totals = map(identity)(json["totals"]);
    result.headers = map(ReportHeaders.parse)(json["headers"]);
    result.totalMatchedRows = identity(json["totalMatchedRows"]);
    result.averages = map(identity)(json["averages"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Report value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["rows"] = map(map(identity))(value.rows);
    result["warnings"] = map(identity)(value.warnings);
    result["totals"] = map(identity)(value.totals);
    result["headers"] = map(ReportHeaders.serialize)(value.headers);
    result["totalMatchedRows"] = identity(value.totalMatchedRows);
    result["averages"] = map(identity)(value.averages);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportHeaders
class ReportHeaders extends IdentityHash {
  /** The currency of this column. Only present if the header type is METRIC_CURRENCY. */
  core.String currency;

  /** The type of the header; one of DIMENSION, METRIC_TALLY, METRIC_RATIO, or METRIC_CURRENCY. */
  core.String type;

  /** The name of the header. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static ReportHeaders parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportHeaders();
    result.currency = identity(json["currency"]);
    result.type = identity(json["type"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportHeaders value) {
    if (value == null) return null;
    final result = {};
    result["currency"] = identity(value.currency);
    result["type"] = identity(value.type);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UrlChannel
class UrlChannel extends IdentityHash {
  /** Kind of resource this is, in this case adsensehost#urlChannel. */
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

  /** Kind of list this is, in this case adsensehost#urlChannels. */
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

// Enum AdSenseHostApi.Alt
class AdSenseHostApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of text/csv */
  const AdSenseHostApiAlt CSV = const AdSenseHostApiAlt._internal("csv", 0);
  /** Responses with Content-Type of application/json */
  const AdSenseHostApiAlt JSON = const AdSenseHostApiAlt._internal("json", 1);

  /** All values of this enumeration */
  const core.List<AdSenseHostApiAlt> values = const <AdSenseHostApiAlt>[
    CSV,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <AdSenseHostApiAlt>{ 
    "csv": CSV,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AdSenseHostApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AdSenseHostApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

