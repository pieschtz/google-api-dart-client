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

#library('reseller-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API ResellerApi
/**
 * Lets you create and manage your customers and their subscriptions.
 */
class ResellerApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  ResellerApi get _$service => this;
  CustomersResource _customers;
  CustomersResource get customers => _customers;
  SubscriptionsResource _subscriptions;
  SubscriptionsResource get subscriptions => _subscriptions;
  
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
  ResellerApiAlt alt;


  ResellerApi({this.baseUrl:"https://www.googleapis.com/apps/reseller/v1/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _customers = new CustomersResource._internal(this);
    _subscriptions = new SubscriptionsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}reseller/v1/20120803 google-api-dart-client/${clientVersion}";
  }

}

// Resource .CustomersResource
class CustomersResource extends core.Object {
  final ResellerApi _$service;
  
  CustomersResource._internal(ResellerApi $service) : _$service = $service;

  // Method CustomersResource.Insert
  /**
   * Creates a customer resource if one does not already exist.
   *
   *    * [content] the Customer
   *    * [customerAuthToken] An auth token needed for inserting a customer for which domain already exists. Can be generated at
   *        https://www.google.com/a/cpanel//TransferToken. Optional.
   */
  core.Future<Customer> insert(Customer content, {core.String customerAuthToken}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?customerAuthToken) $queryParams["customerAuthToken"] = customerAuthToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Customer.serialize(content));
    final $path = "customers";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Customer.parse(JSON.parse($text)));
  }

  // Method CustomersResource.Patch
  /**
   * Update a customer resource if one it exists and is owned by the reseller. This method supports
   * patch semantics.
   *
   *    * [content] the Customer
   *    * [customerId] Id of the Customer
   */
  core.Future<Customer> patch(core.String customerId, Customer content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Customer.serialize(content));
    final $path = "customers/{customerId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Customer.parse(JSON.parse($text)));
  }

  // Method CustomersResource.Update
  /**
   * Update a customer resource if one it exists and is owned by the reseller.
   *
   *    * [content] the Customer
   *    * [customerId] Id of the Customer
   */
  core.Future<Customer> update(core.String customerId, Customer content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Customer.serialize(content));
    final $path = "customers/{customerId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Customer.parse(JSON.parse($text)));
  }

  // Method CustomersResource.Get
  /**
   * Gets a customer resource if one exists and is owned by the reseller.
   *
   *    * [customerId] Id of the Customer
   */
  core.Future<Customer> get(core.String customerId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "customers/{customerId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Customer.parse(JSON.parse($text)));
  }
}

// Resource .SubscriptionsResource
class SubscriptionsResource extends core.Object {
  final ResellerApi _$service;
  
  SubscriptionsResource._internal(ResellerApi $service) : _$service = $service;

  // Method SubscriptionsResource.Insert
  /**
   * Creates/Transfers a subscription for the customer.
   *
   *    * [content] the Subscription
   *    * [customerId] Id of the Customer
   *    * [customerAuthToken] An auth token needed for transferring a subscription. Can be generated at
   *        https://www.google.com/a/cpanel/customer-domain/TransferToken. Optional.
   */
  core.Future<Subscription> insert(core.String customerId, Subscription content, {core.String customerAuthToken}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    if (?customerAuthToken) $queryParams["customerAuthToken"] = customerAuthToken;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Subscription.serialize(content));
    final $path = "customers/{customerId}/subscriptions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.ChangeRenewalSettings
  /**
   * Changes the renewal settings of a subscription
   *
   *    * [content] the RenewalSettings
   *    * [customerId] Id of the Customer
   *    * [subscriptionId] Id of the subscription, which is unique for a customer
   */
  core.Future<Subscription> changeRenewalSettings(core.String customerId, core.String subscriptionId, RenewalSettings content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["subscriptionId"] = subscriptionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(RenewalSettings.serialize(content));
    final $path = "customers/{customerId}/subscriptions/{subscriptionId}/changeRenewalSettings";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.ChangePlan
  /**
   * Changes the plan of a subscription
   *
   *    * [content] the ChangePlanRequest
   *    * [customerId] Id of the Customer
   *    * [subscriptionId] Id of the subscription, which is unique for a customer
   */
  core.Future<Subscription> changePlan(core.String customerId, core.String subscriptionId, ChangePlanRequest content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["subscriptionId"] = subscriptionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(ChangePlanRequest.serialize(content));
    final $path = "customers/{customerId}/subscriptions/{subscriptionId}/changePlan";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.Get
  /**
   * Gets a subscription of the customer.
   *
   *    * [customerId] Id of the Customer
   *    * [subscriptionId] Id of the subscription, which is unique for a customer
   */
  core.Future<Subscription> get(core.String customerId, core.String subscriptionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["subscriptionId"] = subscriptionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "customers/{customerId}/subscriptions/{subscriptionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.List
  /**
   * Lists subscriptions of a reseller, optionally filtered by a customer name prefix.
   *
   *    * [pageToken] Token to specify next page in the list
   *    * [maxResults] Maximum number of results to return

  Minimum: 1.
  Maximum: 100.
   *    * [customerNamePrefix] Prefix of the customer's domain name by which the subscriptions should be filtered. Optional
   */
  core.Future<Subscriptions> list({core.String pageToken, core.int maxResults, core.String customerNamePrefix}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?customerNamePrefix) $queryParams["customerNamePrefix"] = customerNamePrefix;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "subscriptions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Subscriptions.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.ChangeSeats
  /**
   * Changes the seats configuration of a subscription
   *
   *    * [content] the Seats
   *    * [customerId] Id of the Customer
   *    * [subscriptionId] Id of the subscription, which is unique for a customer
   */
  core.Future<Subscription> changeSeats(core.String customerId, core.String subscriptionId, Seats content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["subscriptionId"] = subscriptionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Seats.serialize(content));
    final $path = "customers/{customerId}/subscriptions/{subscriptionId}/changeSeats";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.StartPaidService
  /**
   * Starts paid service of a trial subscription
   *
   *    * [customerId] Id of the Customer
   *    * [subscriptionId] Id of the subscription, which is unique for a customer
   */
  core.Future<Subscription> startPaidService(core.String customerId, core.String subscriptionId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["subscriptionId"] = subscriptionId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "customers/{customerId}/subscriptions/{subscriptionId}/startPaidService";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionsResource.Delete
  /**
   * Cancels/Downgrades a subscription.
   *
   *    * [customerId] Id of the Customer
   *    * [subscriptionId] Id of the subscription, which is unique for a customer
   *    * [deletionType] Whether the subscription is to be fully cancelled or downgraded
   */
  core.Future delete(core.String customerId, core.String subscriptionId, SubscriptionsResourceDeleteDeletionType deletionType) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["customerId"] = customerId;
    $pathParams["subscriptionId"] = subscriptionId;
    if (?deletionType) $queryParams["deletionType"] = deletionType;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "customers/{customerId}/subscriptions/{subscriptionId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Enum SubscriptionsResource.Delete.DeletionType
class SubscriptionsResourceDeleteDeletionType extends core.Object implements core.Hashable {
  /** Cancels the subscription immediately */
  const SubscriptionsResourceDeleteDeletionType CANCEL = const SubscriptionsResourceDeleteDeletionType._internal("cancel", 0);
  /** Downgrades a Google Apps for Business subscription to Google Apps */
  const SubscriptionsResourceDeleteDeletionType DOWNGRADE = const SubscriptionsResourceDeleteDeletionType._internal("downgrade", 1);
  /** Suspends the subscriptions for 4 days before cancelling it */
  const SubscriptionsResourceDeleteDeletionType SUSPEND = const SubscriptionsResourceDeleteDeletionType._internal("suspend", 2);

  /** All values of this enumeration */
  const core.List<SubscriptionsResourceDeleteDeletionType> values = const <SubscriptionsResourceDeleteDeletionType>[
    CANCEL,
    DOWNGRADE,
    SUSPEND,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SubscriptionsResourceDeleteDeletionType>{ 
    "cancel": CANCEL,
    "downgrade": DOWNGRADE,
    "suspend": SUSPEND,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SubscriptionsResourceDeleteDeletionType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SubscriptionsResourceDeleteDeletionType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "DeletionType".hashCode();
}

// Schema .Address
class Address extends IdentityHash {
  /** Identifies the resource as a customer address. */
  core.String kind;

  /** Name of the organization. */
  core.String organizationName;

  /** ISO 3166 country code. */
  core.String countryCode;

  /**
 * Name of the locality. This is in accordance with - http://portablecontacts.net/draft-
 * spec.html#address_element.
 */
  core.String locality;

  /**
 * Name of the region. This is in accordance with - http://portablecontacts.net/draft-
 * spec.html#address_element.
 */
  core.String region;

  /** Address line 2 of the address. */
  core.String addressLine2;

  /** Address line 3 of the address. */
  core.String addressLine3;

  /** Name of the contact person. */
  core.String contactName;

  /** Address line 1 of the address. */
  core.String addressLine1;

  /**
 * The postal code. This is in accordance with - http://portablecontacts.net/draft-
 * spec.html#address_element.
 */
  core.String postalCode;

  /** Parses an instance from its JSON representation. */
  static Address parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Address();
    result.kind = identity(json["kind"]);
    result.organizationName = identity(json["organizationName"]);
    result.countryCode = identity(json["countryCode"]);
    result.locality = identity(json["locality"]);
    result.region = identity(json["region"]);
    result.addressLine2 = identity(json["addressLine2"]);
    result.addressLine3 = identity(json["addressLine3"]);
    result.contactName = identity(json["contactName"]);
    result.addressLine1 = identity(json["addressLine1"]);
    result.postalCode = identity(json["postalCode"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Address value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["organizationName"] = identity(value.organizationName);
    result["countryCode"] = identity(value.countryCode);
    result["locality"] = identity(value.locality);
    result["region"] = identity(value.region);
    result["addressLine2"] = identity(value.addressLine2);
    result["addressLine3"] = identity(value.addressLine3);
    result["contactName"] = identity(value.contactName);
    result["addressLine1"] = identity(value.addressLine1);
    result["postalCode"] = identity(value.postalCode);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChangePlanRequest
class ChangePlanRequest extends IdentityHash {
  /** Name of the plan to change to. */
  core.String planName;

  /** Identifies the resource as a subscription change plan request. */
  core.String kind;

  /** Number/Limit of seats in the new plan. */
  Seats seats;

  /** Purchase order id for your order tracking purposes. */
  core.String purchaseOrderId;

  /** Parses an instance from its JSON representation. */
  static ChangePlanRequest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChangePlanRequest();
    result.planName = identity(json["planName"]);
    result.kind = identity(json["kind"]);
    result.seats = Seats.parse(json["seats"]);
    result.purchaseOrderId = identity(json["purchaseOrderId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChangePlanRequest value) {
    if (value == null) return null;
    final result = {};
    result["planName"] = identity(value.planName);
    result["kind"] = identity(value.kind);
    result["seats"] = Seats.serialize(value.seats);
    result["purchaseOrderId"] = identity(value.purchaseOrderId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Customer
class Customer extends IdentityHash {
  /** The domain name of the customer. */
  core.String customerDomain;

  /** The alternate email of the customer. */
  core.String alternateEmail;

  /** Identifies the resource as a customer. */
  core.String kind;

  /** The phone number of the customer. */
  core.String phoneNumber;

  /** The postal address of the customer. */
  Address postalAddress;

  /** The id of the customer. */
  core.String customerId;

  /** Parses an instance from its JSON representation. */
  static Customer parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Customer();
    result.customerDomain = identity(json["customerDomain"]);
    result.alternateEmail = identity(json["alternateEmail"]);
    result.kind = identity(json["kind"]);
    result.phoneNumber = identity(json["phoneNumber"]);
    result.postalAddress = Address.parse(json["postalAddress"]);
    result.customerId = identity(json["customerId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Customer value) {
    if (value == null) return null;
    final result = {};
    result["customerDomain"] = identity(value.customerDomain);
    result["alternateEmail"] = identity(value.alternateEmail);
    result["kind"] = identity(value.kind);
    result["phoneNumber"] = identity(value.phoneNumber);
    result["postalAddress"] = Address.serialize(value.postalAddress);
    result["customerId"] = identity(value.customerId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .RenewalSettings
class RenewalSettings extends IdentityHash {
  /** Identifies the resource as a subscription renewal setting. */
  core.String kind;

  /** Subscription renewal type. */
  core.String renewalType;

  /** Parses an instance from its JSON representation. */
  static RenewalSettings parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RenewalSettings();
    result.kind = identity(json["kind"]);
    result.renewalType = identity(json["renewalType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RenewalSettings value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["renewalType"] = identity(value.renewalType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Seats
class Seats extends IdentityHash {
  /** Identifies the resource as a subscription change plan request. */
  core.String kind;

  /** Number of seats to purchase. This is applicable only for a commitment plan. */
  core.int numberOfSeats;

  /**
 * Maximum number of seats that can be purchased. This needs to be provided only for a non-
 * commitment plan. For a commitment plan it is decided by the contract.
 */
  core.int maximumNumberOfSeats;

  /** Parses an instance from its JSON representation. */
  static Seats parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Seats();
    result.kind = identity(json["kind"]);
    result.numberOfSeats = identity(json["numberOfSeats"]);
    result.maximumNumberOfSeats = identity(json["maximumNumberOfSeats"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Seats value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["numberOfSeats"] = identity(value.numberOfSeats);
    result["maximumNumberOfSeats"] = identity(value.maximumNumberOfSeats);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Subscription
class Subscription extends IdentityHash {
  /** Renewal settings of the subscription. */
  RenewalSettings renewalSettings;

  /** Name of the sku for which this subscription is purchased. */
  core.String skuId;

  /** Identifies the resource as a Subscription. */
  core.String kind;

  /** Trial Settings of the subscription. */
  SubscriptionTrialSettings trialSettings;

  /** Number/Limit of seats in the new plan. */
  Seats seats;

  /** Creation time of this subscription in milliseconds since Unix epoch. */
  core.String creationTime;

  /** Plan details of the subscription */
  SubscriptionPlan plan;

  /** Purchase order id for your order tracking purposes. */
  core.String purchaseOrderId;

  /** The id of the subscription. */
  core.String subscriptionId;

  /** The id of the customer to whom the subscription belongs. */
  core.String customerId;

  /** Parses an instance from its JSON representation. */
  static Subscription parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Subscription();
    result.renewalSettings = RenewalSettings.parse(json["renewalSettings"]);
    result.skuId = identity(json["skuId"]);
    result.kind = identity(json["kind"]);
    result.trialSettings = SubscriptionTrialSettings.parse(json["trialSettings"]);
    result.seats = Seats.parse(json["seats"]);
    result.creationTime = identity(json["creationTime"]);
    result.plan = SubscriptionPlan.parse(json["plan"]);
    result.purchaseOrderId = identity(json["purchaseOrderId"]);
    result.subscriptionId = identity(json["subscriptionId"]);
    result.customerId = identity(json["customerId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Subscription value) {
    if (value == null) return null;
    final result = {};
    result["renewalSettings"] = RenewalSettings.serialize(value.renewalSettings);
    result["skuId"] = identity(value.skuId);
    result["kind"] = identity(value.kind);
    result["trialSettings"] = SubscriptionTrialSettings.serialize(value.trialSettings);
    result["seats"] = Seats.serialize(value.seats);
    result["creationTime"] = identity(value.creationTime);
    result["plan"] = SubscriptionPlan.serialize(value.plan);
    result["purchaseOrderId"] = identity(value.purchaseOrderId);
    result["subscriptionId"] = identity(value.subscriptionId);
    result["customerId"] = identity(value.customerId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Subscription.SubscriptionPlan
class SubscriptionPlan extends IdentityHash {
  /** The plan name of this subscription's plan. */
  core.String planName;

  /** Interval of the commitment if it is a commitment plan. */
  SubscriptionPlanCommitmentInterval commitmentInterval;

  /** Whether the plan is a commitment plan or not. */
  core.bool isCommitmentPlan;

  /** Parses an instance from its JSON representation. */
  static SubscriptionPlan parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionPlan();
    result.planName = identity(json["planName"]);
    result.commitmentInterval = SubscriptionPlanCommitmentInterval.parse(json["commitmentInterval"]);
    result.isCommitmentPlan = identity(json["isCommitmentPlan"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionPlan value) {
    if (value == null) return null;
    final result = {};
    result["planName"] = identity(value.planName);
    result["commitmentInterval"] = SubscriptionPlanCommitmentInterval.serialize(value.commitmentInterval);
    result["isCommitmentPlan"] = identity(value.isCommitmentPlan);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Subscription.SubscriptionPlan.SubscriptionPlanCommitmentInterval
class SubscriptionPlanCommitmentInterval extends IdentityHash {
  /** End time of the commitment interval in milliseconds since Unix epoch. */
  core.String endTime;

  /** Start time of the commitment interval in milliseconds since Unix epoch. */
  core.String startTime;

  /** Parses an instance from its JSON representation. */
  static SubscriptionPlanCommitmentInterval parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionPlanCommitmentInterval();
    result.endTime = identity(json["endTime"]);
    result.startTime = identity(json["startTime"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionPlanCommitmentInterval value) {
    if (value == null) return null;
    final result = {};
    result["endTime"] = identity(value.endTime);
    result["startTime"] = identity(value.startTime);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Subscription.SubscriptionTrialSettings
class SubscriptionTrialSettings extends IdentityHash {
  /** End time of the trial in milliseconds since Unix epoch. */
  core.String trialEndTime;

  /** Whether the subscription is in trial. */
  core.bool isInTrial;

  /** Parses an instance from its JSON representation. */
  static SubscriptionTrialSettings parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionTrialSettings();
    result.trialEndTime = identity(json["trialEndTime"]);
    result.isInTrial = identity(json["isInTrial"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionTrialSettings value) {
    if (value == null) return null;
    final result = {};
    result["trialEndTime"] = identity(value.trialEndTime);
    result["isInTrial"] = identity(value.isInTrial);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Subscriptions
class Subscriptions extends IdentityHash {
  /**
 * The continuation token, used to page through large result sets. Provide this value in a
 * subsequent request to return the next page of results.
 */
  core.String nextPageToken;

  /** Identifies the resource as a collection of subscriptions. */
  core.String kind;

  /** The subscriptions in this page of results. */
  core.List<Subscription> subscriptions;

  /** Parses an instance from its JSON representation. */
  static Subscriptions parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Subscriptions();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.subscriptions = map(Subscription.parse)(json["subscriptions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Subscriptions value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["subscriptions"] = map(Subscription.serialize)(value.subscriptions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum ResellerApi.Alt
class ResellerApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const ResellerApiAlt JSON = const ResellerApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<ResellerApiAlt> values = const <ResellerApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <ResellerApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ResellerApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ResellerApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

