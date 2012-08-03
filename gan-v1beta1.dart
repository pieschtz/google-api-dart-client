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

#library('gan-v1beta1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API GanApi
/**
 * Lets you have programmatic access to your Google Affiliate Network data.
 */
class GanApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  GanApi get _$service() => this;
  AdvertisersResource _advertisers;
  AdvertisersResource get advertisers() => _advertisers;
  CcOffersResource _ccOffers;
  CcOffersResource get ccOffers() => _ccOffers;
  EventsResource _events;
  EventsResource get events() => _events;
  LinksResource _links;
  LinksResource get links() => _links;
  PublishersResource _publishers;
  PublishersResource get publishers() => _publishers;
  
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
  GanApiAlt alt;


  GanApi([this.baseUrl = "https://www.googleapis.com/gan/v1beta1/", applicationName, this.authenticator]) :
      this.applicationName = applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _advertisers = new AdvertisersResource._internal(this);
    _ccOffers = new CcOffersResource._internal(this);
    _events = new EventsResource._internal(this);
    _links = new LinksResource._internal(this);
    _publishers = new PublishersResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}gan/v1beta1/20120727 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your GAN data */
  static final core.String GAN_SCOPE = "https://www.googleapis.com/auth/gan";

  /** OAuth2 scope: View your GAN data */
  static final core.String GAN_READONLY_SCOPE = "https://www.googleapis.com/auth/gan.readonly";
}

// Resource .AdvertisersResource
class AdvertisersResource extends core.Object {
  final GanApi _$service;
  
  AdvertisersResource._internal(GanApi $service) : _$service = $service;

  // Method AdvertisersResource.List
  /**
   * Retrieves data about all advertisers that the requesting advertiser/publisher has access to.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [relationshipStatus] Filters out all advertisers for which do not have the given relationship status with the requesting
   *        publisher.
   *    * [minSevenDayEpc] Filters out all advertisers that have a seven day EPC average lower than the given value
   *        (inclusive). Min value: 0.0. Optional.
   *    * [advertiserCategory] Caret(^) delimted list of advertiser categories. Valid categories are defined here:
   *        http://www.google.com/support/affiliatenetwork/advertiser/bin/answer.py?hl=en=107581.
   *        Filters out all advertisers not in one of the given advertiser categories. Optional.
   *    * [minNinetyDayEpc] Filters out all advertisers that have a ninety day EPC average lower than the given value
   *        (inclusive). Min value: 0.0. Optional.
   *    * [pageToken] The value of 'nextPageToken' from the previous page. Optional.
   *    * [maxResults] Max number of items to return in this page. Optional. Defaults to 20.

  Minimum: 0.
  Maximum: 100.
   *    * [minPayoutRank] A value between 1 and 4, where 1 represents the quartile of advertisers with the lowest ranks and 4
   *        represents the quartile of advertisers with the highest ranks. Filters out all advertisers
   *        with a lower rank than the given quartile. For example if a 2 was given only advertisers
   *        with a payout rank of 25 or higher would be included. Optional.

  Minimum: 1.
  Maximum: 4.
   */
  core.Future<Advertisers> list(AdvertisersResourceListRole role, core.String roleId, [AdvertisersResourceListRelationshipStatus relationshipStatus = UNSPECIFIED, core.double minSevenDayEpc = UNSPECIFIED, core.String advertiserCategory = UNSPECIFIED, core.double minNinetyDayEpc = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.int minPayoutRank = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (UNSPECIFIED != relationshipStatus) $queryParams["relationshipStatus"] = relationshipStatus;
    if (UNSPECIFIED != minSevenDayEpc) $queryParams["minSevenDayEpc"] = minSevenDayEpc;
    if (UNSPECIFIED != advertiserCategory) $queryParams["advertiserCategory"] = advertiserCategory;
    if (UNSPECIFIED != minNinetyDayEpc) $queryParams["minNinetyDayEpc"] = minNinetyDayEpc;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != minPayoutRank) $queryParams["minPayoutRank"] = minPayoutRank;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/advertisers";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Advertisers.parse(JSON.parse($text)));
  }

  // Method AdvertisersResource.Get
  /**
   * Retrieves data about a single advertiser if that the requesting advertiser/publisher has access
   * to it. Only publishers can lookup advertisers. Advertisers can request information about
   * themselves by omitting the advertiserId query parameter.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [advertiserId] The ID of the advertiser to look up. Optional.
   */
  core.Future<Advertiser> get(AdvertisersResourceGetRole role, core.String roleId, [core.String advertiserId = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (UNSPECIFIED != advertiserId) $queryParams["advertiserId"] = advertiserId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/advertiser";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Advertiser.parse(JSON.parse($text)));
  }
}

// Enum AdvertisersResource.List.Role
class AdvertisersResourceListRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final AdvertisersResourceListRole ADVERTISERS = const AdvertisersResourceListRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final AdvertisersResourceListRole PUBLISHERS = const AdvertisersResourceListRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<AdvertisersResourceListRole> values = const <AdvertisersResourceListRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AdvertisersResourceListRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AdvertisersResourceListRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AdvertisersResourceListRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Enum AdvertisersResource.List.RelationshipStatus
class AdvertisersResourceListRelationshipStatus extends core.Object implements core.Hashable {
  /** An advertiser that has approved your application. */
  static final AdvertisersResourceListRelationshipStatus APPROVED = const AdvertisersResourceListRelationshipStatus._internal("approved", 0);
  /** An advertiser program that's accepting new publishers. */
  static final AdvertisersResourceListRelationshipStatus AVAILABLE = const AdvertisersResourceListRelationshipStatus._internal("available", 1);
  /**
 * Deactivated means either the advertiser has removed you from their program, or it could also mean
 * that you chose to remove yourself from the advertiser's program.
 */
  static final AdvertisersResourceListRelationshipStatus DEACTIVATED = const AdvertisersResourceListRelationshipStatus._internal("deactivated", 2);
  /** An advertiser that did not approve your application. */
  static final AdvertisersResourceListRelationshipStatus DECLINED = const AdvertisersResourceListRelationshipStatus._internal("declined", 3);
  /**
 * An advertiser program that you've already applied to, but they haven't yet decided to approve or
 * decline your application.
 */
  static final AdvertisersResourceListRelationshipStatus PENDING = const AdvertisersResourceListRelationshipStatus._internal("pending", 4);

  /** All values of this enumeration */
  static final core.List<AdvertisersResourceListRelationshipStatus> values = const <AdvertisersResourceListRelationshipStatus>[
    APPROVED,
    AVAILABLE,
    DEACTIVATED,
    DECLINED,
    PENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AdvertisersResourceListRelationshipStatus>{ 
    "approved": APPROVED,
    "available": AVAILABLE,
    "deactivated": DEACTIVATED,
    "declined": DECLINED,
    "pending": PENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AdvertisersResourceListRelationshipStatus valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AdvertisersResourceListRelationshipStatus._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "RelationshipStatus".hashCode();
}

// Enum AdvertisersResource.Get.Role
class AdvertisersResourceGetRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final AdvertisersResourceGetRole ADVERTISERS = const AdvertisersResourceGetRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final AdvertisersResourceGetRole PUBLISHERS = const AdvertisersResourceGetRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<AdvertisersResourceGetRole> values = const <AdvertisersResourceGetRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <AdvertisersResourceGetRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static AdvertisersResourceGetRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const AdvertisersResourceGetRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Resource .CcOffersResource
class CcOffersResource extends core.Object {
  final GanApi _$service;
  
  CcOffersResource._internal(GanApi $service) : _$service = $service;

  // Method CcOffersResource.List
  /**
   * Retrieves credit card offers for the given publisher.
   *
   *    * [publisher] The ID of the publisher in question.
   *    * [advertiser] The advertiser ID of a card issuer whose offers to include. Optional, may be repeated.
   *    * [projection] The set of fields to return.
   */
  core.Future<CcOffers> list(core.String publisher, [core.List<core.String> advertiser = UNSPECIFIED, CcOffersResourceListProjection projection = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["publisher"] = publisher;
    if (UNSPECIFIED != advertiser) $queryParams["advertiser"] = advertiser;
    if (UNSPECIFIED != projection) $queryParams["projection"] = projection;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "publishers/{publisher}/ccOffers";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CcOffers.parse(JSON.parse($text)));
  }
}

// Enum CcOffersResource.List.Projection
class CcOffersResourceListProjection extends core.Object implements core.Hashable {
  /** Include all offer fields. This is the default. */
  static final CcOffersResourceListProjection FULL = const CcOffersResourceListProjection._internal("full", 0);
  /** Include only the basic fields needed to display an offer. */
  static final CcOffersResourceListProjection SUMMARY = const CcOffersResourceListProjection._internal("summary", 1);

  /** All values of this enumeration */
  static final core.List<CcOffersResourceListProjection> values = const <CcOffersResourceListProjection>[
    FULL,
    SUMMARY,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CcOffersResourceListProjection>{ 
    "full": FULL,
    "summary": SUMMARY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CcOffersResourceListProjection valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const CcOffersResourceListProjection._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Projection".hashCode();
}

// Resource .EventsResource
class EventsResource extends core.Object {
  final GanApi _$service;
  
  EventsResource._internal(GanApi $service) : _$service = $service;

  // Method EventsResource.List
  /**
   * Retrieves event data for a given advertiser/publisher.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [orderId] Caret(^) delimited list of order IDs. Filters out all events that do not reference one of the given
   *        order IDs. Optional.
   *    * [sku] Caret(^) delimited list of SKUs. Filters out all events that do not reference one of the given SKU.
   *        Optional.
   *    * [eventDateMax] Filters out all events later than given date. Optional. Defaults to 24 hours after eventMin.
   *    * [type] Filters out all events that are not of the given type. Valid values: 'action', 'transaction',
   *        'charge'. Optional.
   *    * [linkId] Caret(^) delimited list of link IDs. Filters out all events that do not reference one of the given
   *        link IDs. Optional.
   *    * [modifyDateMin] Filters out all events modified earlier than given date. Optional. Defaults to 24 hours before the
   *        current modifyDateMax, if modifyDateMax is explicitly set.
   *    * [eventDateMin] Filters out all events earlier than given date. Optional. Defaults to 24 hours from current
   *        date/time.
   *    * [memberId] Caret(^) delimited list of member IDs. Filters out all events that do not reference one of the given
   *        member IDs. Optional.
   *    * [maxResults] Max number of offers to return in this page. Optional. Defaults to 20.

  Minimum: 0.
  Maximum: 100.
   *    * [advertiserId] Caret(^) delimited list of advertiser IDs. Filters out all events that do not reference one of the
   *        given advertiser IDs. Only used when under publishers role. Optional.
   *    * [pageToken] The value of 'nextPageToken' from the previous page. Optional.
   *    * [productCategory] Caret(^) delimited list of product categories. Filters out all events that do not reference a
   *        product in one of the given product categories. Optional.
   *    * [chargeType] Filters out all charge events that are not of the given charge type. Valid values: 'other',
   *        'slotting_fee', 'monthly_minimum', 'tier_bonus', 'credit', 'debit'. Optional.
   *    * [modifyDateMax] Filters out all events modified later than given date. Optional. Defaults to 24 hours after
   *        modifyDateMin, if modifyDateMin is explicitly set.
   *    * [status] Filters out all events that do not have the given status. Valid values: 'active', 'canceled'.
   *        Optional.
   *    * [publisherId] Caret(^) delimited list of publisher IDs. Filters out all events that do not reference one of the
   *        given publishers IDs. Only used when under advertiser role. Optional.
   */
  core.Future<Events> list(EventsResourceListRole role, core.String roleId, [core.String orderId = UNSPECIFIED, core.String sku = UNSPECIFIED, core.String eventDateMax = UNSPECIFIED, EventsResourceListType type = UNSPECIFIED, core.String linkId = UNSPECIFIED, core.String modifyDateMin = UNSPECIFIED, core.String eventDateMin = UNSPECIFIED, core.String memberId = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String advertiserId = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.String productCategory = UNSPECIFIED, EventsResourceListChargeType chargeType = UNSPECIFIED, core.String modifyDateMax = UNSPECIFIED, EventsResourceListStatus status = UNSPECIFIED, core.String publisherId = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (UNSPECIFIED != orderId) $queryParams["orderId"] = orderId;
    if (UNSPECIFIED != sku) $queryParams["sku"] = sku;
    if (UNSPECIFIED != eventDateMax) $queryParams["eventDateMax"] = eventDateMax;
    if (UNSPECIFIED != type) $queryParams["type"] = type;
    if (UNSPECIFIED != linkId) $queryParams["linkId"] = linkId;
    if (UNSPECIFIED != modifyDateMin) $queryParams["modifyDateMin"] = modifyDateMin;
    if (UNSPECIFIED != eventDateMin) $queryParams["eventDateMin"] = eventDateMin;
    if (UNSPECIFIED != memberId) $queryParams["memberId"] = memberId;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != advertiserId) $queryParams["advertiserId"] = advertiserId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != productCategory) $queryParams["productCategory"] = productCategory;
    if (UNSPECIFIED != chargeType) $queryParams["chargeType"] = chargeType;
    if (UNSPECIFIED != modifyDateMax) $queryParams["modifyDateMax"] = modifyDateMax;
    if (UNSPECIFIED != status) $queryParams["status"] = status;
    if (UNSPECIFIED != publisherId) $queryParams["publisherId"] = publisherId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/events";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Events.parse(JSON.parse($text)));
  }
}

// Enum EventsResource.List.Role
class EventsResourceListRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final EventsResourceListRole ADVERTISERS = const EventsResourceListRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final EventsResourceListRole PUBLISHERS = const EventsResourceListRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<EventsResourceListRole> values = const <EventsResourceListRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <EventsResourceListRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static EventsResourceListRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const EventsResourceListRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Enum EventsResource.List.Type
class EventsResourceListType extends core.Object implements core.Hashable {
  /**
 * The completion of an application, sign-up, or other process. For example, an action occurs if a
 * user clicks an ad for a credit card and completes an application for that card.
 */
  static final EventsResourceListType ACTION = const EventsResourceListType._internal("action", 0);
  /** A charge event is typically a payment between an advertiser, publisher or Google. */
  static final EventsResourceListType CHARGE = const EventsResourceListType._internal("charge", 1);
  /**
 * A conversion event, typically an e-commerce transaction. Some advertisers use a transaction to
 * record other types of events, such as magazine subscriptions.
 */
  static final EventsResourceListType TRANSACTION = const EventsResourceListType._internal("transaction", 2);

  /** All values of this enumeration */
  static final core.List<EventsResourceListType> values = const <EventsResourceListType>[
    ACTION,
    CHARGE,
    TRANSACTION,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <EventsResourceListType>{ 
    "action": ACTION,
    "charge": CHARGE,
    "transaction": TRANSACTION,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static EventsResourceListType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const EventsResourceListType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Type".hashCode();
}

// Enum EventsResource.List.ChargeType
class EventsResourceListChargeType extends core.Object implements core.Hashable {
  /**
 * A credit increases the publisher's payout amount and decreases the advertiser's invoice amount.
 */
  static final EventsResourceListChargeType CREDIT = const EventsResourceListChargeType._internal("credit", 0);
  /** A debit reduces the publisher's payout and increases the advertiser's invoice amount. */
  static final EventsResourceListChargeType DEBIT = const EventsResourceListChargeType._internal("debit", 1);
  /** A payment made to Google by an advertiser as a minimum monthly network fee. */
  static final EventsResourceListChargeType MONTHLY_MINIMUM = const EventsResourceListChargeType._internal("monthly_minimum", 2);
  /** Catch all. Default if unset */
  static final EventsResourceListChargeType OTHER = const EventsResourceListChargeType._internal("other", 3);
  /** A one time payment made from an advertiser to a publisher. */
  static final EventsResourceListChargeType SLOTTING_FEE = const EventsResourceListChargeType._internal("slotting_fee", 4);
  /** A payment from an advertiser to a publisher for the publisher maintaining a high tier level */
  static final EventsResourceListChargeType TIER_BONUS = const EventsResourceListChargeType._internal("tier_bonus", 5);

  /** All values of this enumeration */
  static final core.List<EventsResourceListChargeType> values = const <EventsResourceListChargeType>[
    CREDIT,
    DEBIT,
    MONTHLY_MINIMUM,
    OTHER,
    SLOTTING_FEE,
    TIER_BONUS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <EventsResourceListChargeType>{ 
    "credit": CREDIT,
    "debit": DEBIT,
    "monthly_minimum": MONTHLY_MINIMUM,
    "other": OTHER,
    "slotting_fee": SLOTTING_FEE,
    "tier_bonus": TIER_BONUS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static EventsResourceListChargeType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const EventsResourceListChargeType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "ChargeType".hashCode();
}

// Enum EventsResource.List.Status
class EventsResourceListStatus extends core.Object implements core.Hashable {
  /** Event is currently active. */
  static final EventsResourceListStatus ACTIVE = const EventsResourceListStatus._internal("active", 0);
  /** Event is currently canceled. */
  static final EventsResourceListStatus CANCELED = const EventsResourceListStatus._internal("canceled", 1);

  /** All values of this enumeration */
  static final core.List<EventsResourceListStatus> values = const <EventsResourceListStatus>[
    ACTIVE,
    CANCELED,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <EventsResourceListStatus>{ 
    "active": ACTIVE,
    "canceled": CANCELED,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static EventsResourceListStatus valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const EventsResourceListStatus._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Status".hashCode();
}

// Resource .LinksResource
class LinksResource extends core.Object {
  final GanApi _$service;
  
  LinksResource._internal(GanApi $service) : _$service = $service;

  // Method LinksResource.Insert
  /**
   * Inserts a new link.
   *
   *    * [content] the Link
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   */
  core.Future<Link> insert(LinksResourceInsertRole role, core.String roleId, Link content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Link.serialize(content));
    final $path = "{role}/{roleId}/link";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Link.parse(JSON.parse($text)));
  }

  // Method LinksResource.List
  /**
   * Retrieves all links that match the query parameters.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [linkType] The type of the link.
   *    * [startDateMin] The beginning of the start date range.
   *    * [assetSize] The size of the given asset.
   *    * [relationshipStatus] The status of the relationship.
   *    * [advertiserCategory] The advertiser's primary vertical.
   *    * [maxResults] Max number of items to return in this page. Optional. Defaults to 20.

  Minimum: 0.
  Maximum: 100.
   *    * [advertiserId] Limits the resulting links to the ones belonging to the listed advertisers.
   *    * [pageToken] The value of 'nextPageToken' from the previous page. Optional.
   *    * [startDateMax] The end of the start date range.
   *    * [promotionType] The promotion type.
   *    * [authorship] The role of the author of the link.
   */
  core.Future<Links> list(LinksResourceListRole role, core.String roleId, [LinksResourceListLinkType linkType = UNSPECIFIED, core.String startDateMin = UNSPECIFIED, core.List<core.String> assetSize = UNSPECIFIED, LinksResourceListRelationshipStatus relationshipStatus = UNSPECIFIED, LinksResourceListAdvertiserCategory advertiserCategory = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.List<core.String> advertiserId = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.String startDateMax = UNSPECIFIED, LinksResourceListPromotionType promotionType = UNSPECIFIED, LinksResourceListAuthorship authorship = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (UNSPECIFIED != linkType) $queryParams["linkType"] = linkType;
    if (UNSPECIFIED != startDateMin) $queryParams["startDateMin"] = startDateMin;
    if (UNSPECIFIED != assetSize) $queryParams["assetSize"] = assetSize;
    if (UNSPECIFIED != relationshipStatus) $queryParams["relationshipStatus"] = relationshipStatus;
    if (UNSPECIFIED != advertiserCategory) $queryParams["advertiserCategory"] = advertiserCategory;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != advertiserId) $queryParams["advertiserId"] = advertiserId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != startDateMax) $queryParams["startDateMax"] = startDateMax;
    if (UNSPECIFIED != promotionType) $queryParams["promotionType"] = promotionType;
    if (UNSPECIFIED != authorship) $queryParams["authorship"] = authorship;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/links";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Links.parse(JSON.parse($text)));
  }

  // Method LinksResource.Get
  /**
   * Retrieves data about a single link if the requesting advertiser/publisher has access to it.
   * Advertisers can look up their own links. Publishers can look up visible links or links belonging
   * to advertisers they are in a relationship with.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [linkId] The ID of the link to look up.
   */
  core.Future<Link> get(LinksResourceGetRole role, core.String roleId, core.String linkId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    $pathParams["linkId"] = linkId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/link/{linkId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Link.parse(JSON.parse($text)));
  }
}

// Enum LinksResource.Insert.Role
class LinksResourceInsertRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final LinksResourceInsertRole ADVERTISERS = const LinksResourceInsertRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final LinksResourceInsertRole PUBLISHERS = const LinksResourceInsertRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<LinksResourceInsertRole> values = const <LinksResourceInsertRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceInsertRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceInsertRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceInsertRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Enum LinksResource.List.Role
class LinksResourceListRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final LinksResourceListRole ADVERTISERS = const LinksResourceListRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final LinksResourceListRole PUBLISHERS = const LinksResourceListRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<LinksResourceListRole> values = const <LinksResourceListRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceListRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceListRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceListRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Enum LinksResource.List.LinkType
class LinksResourceListLinkType extends core.Object implements core.Hashable {
  
  static final LinksResourceListLinkType BANNER = const LinksResourceListLinkType._internal("banner", 0);
  
  static final LinksResourceListLinkType TEXT = const LinksResourceListLinkType._internal("text", 1);

  /** All values of this enumeration */
  static final core.List<LinksResourceListLinkType> values = const <LinksResourceListLinkType>[
    BANNER,
    TEXT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceListLinkType>{ 
    "banner": BANNER,
    "text": TEXT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceListLinkType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceListLinkType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "LinkType".hashCode();
}

// Enum LinksResource.List.RelationshipStatus
class LinksResourceListRelationshipStatus extends core.Object implements core.Hashable {
  
  static final LinksResourceListRelationshipStatus APPROVED = const LinksResourceListRelationshipStatus._internal("approved", 0);
  
  static final LinksResourceListRelationshipStatus AVAILABLE = const LinksResourceListRelationshipStatus._internal("available", 1);

  /** All values of this enumeration */
  static final core.List<LinksResourceListRelationshipStatus> values = const <LinksResourceListRelationshipStatus>[
    APPROVED,
    AVAILABLE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceListRelationshipStatus>{ 
    "approved": APPROVED,
    "available": AVAILABLE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceListRelationshipStatus valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceListRelationshipStatus._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "RelationshipStatus".hashCode();
}

// Enum LinksResource.List.AdvertiserCategory
class LinksResourceListAdvertiserCategory extends core.Object implements core.Hashable {
  
  static final LinksResourceListAdvertiserCategory APPAREL_ACCESSORIES = const LinksResourceListAdvertiserCategory._internal("apparel_accessories", 0);
  
  static final LinksResourceListAdvertiserCategory APPLIANCES_ELECTRONICS = const LinksResourceListAdvertiserCategory._internal("appliances_electronics", 1);
  
  static final LinksResourceListAdvertiserCategory AUTO_DEALER = const LinksResourceListAdvertiserCategory._internal("auto_dealer", 2);
  
  static final LinksResourceListAdvertiserCategory AUTOMOTIVE = const LinksResourceListAdvertiserCategory._internal("automotive", 3);
  
  static final LinksResourceListAdvertiserCategory BABIES_KIDS = const LinksResourceListAdvertiserCategory._internal("babies_kids", 4);
  
  static final LinksResourceListAdvertiserCategory BLOGS_PERSONAL_SITES = const LinksResourceListAdvertiserCategory._internal("blogs_personal_sites", 5);
  
  static final LinksResourceListAdvertiserCategory BOOKS_MAGAZINES = const LinksResourceListAdvertiserCategory._internal("books_magazines", 6);
  
  static final LinksResourceListAdvertiserCategory COMPUTERS = const LinksResourceListAdvertiserCategory._internal("computers", 7);
  
  static final LinksResourceListAdvertiserCategory DATING = const LinksResourceListAdvertiserCategory._internal("dating", 8);
  
  static final LinksResourceListAdvertiserCategory DEPARTMENT_STORES = const LinksResourceListAdvertiserCategory._internal("department_stores", 9);
  
  static final LinksResourceListAdvertiserCategory EDUCATION = const LinksResourceListAdvertiserCategory._internal("education", 10);
  
  static final LinksResourceListAdvertiserCategory EMPLOYMENT = const LinksResourceListAdvertiserCategory._internal("employment", 11);
  
  static final LinksResourceListAdvertiserCategory FINANCIAL_CREDIT_CARDS = const LinksResourceListAdvertiserCategory._internal("financial_credit_cards", 12);
  
  static final LinksResourceListAdvertiserCategory FINANCIAL_OTHER = const LinksResourceListAdvertiserCategory._internal("financial_other", 13);
  
  static final LinksResourceListAdvertiserCategory FLOWERS_GIFTS = const LinksResourceListAdvertiserCategory._internal("flowers_gifts", 14);
  
  static final LinksResourceListAdvertiserCategory GROCERY = const LinksResourceListAdvertiserCategory._internal("grocery", 15);
  
  static final LinksResourceListAdvertiserCategory HEALTH_BEAUTY = const LinksResourceListAdvertiserCategory._internal("health_beauty", 16);
  
  static final LinksResourceListAdvertiserCategory HOME_GARDEN = const LinksResourceListAdvertiserCategory._internal("home_garden", 17);
  
  static final LinksResourceListAdvertiserCategory HOSTING_DOMAIN = const LinksResourceListAdvertiserCategory._internal("hosting_domain", 18);
  
  static final LinksResourceListAdvertiserCategory INTERNET_PROVIDERS = const LinksResourceListAdvertiserCategory._internal("internet_providers", 19);
  
  static final LinksResourceListAdvertiserCategory LEGAL = const LinksResourceListAdvertiserCategory._internal("legal", 20);
  
  static final LinksResourceListAdvertiserCategory MEDIA_ENTERTAINMENT = const LinksResourceListAdvertiserCategory._internal("media_entertainment", 21);
  
  static final LinksResourceListAdvertiserCategory MEDICAL = const LinksResourceListAdvertiserCategory._internal("medical", 22);
  
  static final LinksResourceListAdvertiserCategory MOVIES_GAMES = const LinksResourceListAdvertiserCategory._internal("movies_games", 23);
  
  static final LinksResourceListAdvertiserCategory MUSIC = const LinksResourceListAdvertiserCategory._internal("music", 24);
  
  static final LinksResourceListAdvertiserCategory NONPROFIT = const LinksResourceListAdvertiserCategory._internal("nonprofit", 25);
  
  static final LinksResourceListAdvertiserCategory OFFICE_SUPPLIES = const LinksResourceListAdvertiserCategory._internal("office_supplies", 26);
  
  static final LinksResourceListAdvertiserCategory ONLINE_GAMES = const LinksResourceListAdvertiserCategory._internal("online_games", 27);
  
  static final LinksResourceListAdvertiserCategory OUTDOOR = const LinksResourceListAdvertiserCategory._internal("outdoor", 28);
  
  static final LinksResourceListAdvertiserCategory PETS = const LinksResourceListAdvertiserCategory._internal("pets", 29);
  
  static final LinksResourceListAdvertiserCategory REAL_ESTATE = const LinksResourceListAdvertiserCategory._internal("real_estate", 30);
  
  static final LinksResourceListAdvertiserCategory RESTAURANTS = const LinksResourceListAdvertiserCategory._internal("restaurants", 31);
  
  static final LinksResourceListAdvertiserCategory SPORT_FITNESS = const LinksResourceListAdvertiserCategory._internal("sport_fitness", 32);
  
  static final LinksResourceListAdvertiserCategory TELECOM = const LinksResourceListAdvertiserCategory._internal("telecom", 33);
  
  static final LinksResourceListAdvertiserCategory TICKETING = const LinksResourceListAdvertiserCategory._internal("ticketing", 34);
  
  static final LinksResourceListAdvertiserCategory TOYS_HOBBIES = const LinksResourceListAdvertiserCategory._internal("toys_hobbies", 35);
  
  static final LinksResourceListAdvertiserCategory TRAVEL = const LinksResourceListAdvertiserCategory._internal("travel", 36);
  
  static final LinksResourceListAdvertiserCategory UTILITIES = const LinksResourceListAdvertiserCategory._internal("utilities", 37);
  
  static final LinksResourceListAdvertiserCategory WHOLESALE_RELATIONSHIP = const LinksResourceListAdvertiserCategory._internal("wholesale_relationship", 38);
  
  static final LinksResourceListAdvertiserCategory WINE_SPIRITS = const LinksResourceListAdvertiserCategory._internal("wine_spirits", 39);

  /** All values of this enumeration */
  static final core.List<LinksResourceListAdvertiserCategory> values = const <LinksResourceListAdvertiserCategory>[
    APPAREL_ACCESSORIES,
    APPLIANCES_ELECTRONICS,
    AUTO_DEALER,
    AUTOMOTIVE,
    BABIES_KIDS,
    BLOGS_PERSONAL_SITES,
    BOOKS_MAGAZINES,
    COMPUTERS,
    DATING,
    DEPARTMENT_STORES,
    EDUCATION,
    EMPLOYMENT,
    FINANCIAL_CREDIT_CARDS,
    FINANCIAL_OTHER,
    FLOWERS_GIFTS,
    GROCERY,
    HEALTH_BEAUTY,
    HOME_GARDEN,
    HOSTING_DOMAIN,
    INTERNET_PROVIDERS,
    LEGAL,
    MEDIA_ENTERTAINMENT,
    MEDICAL,
    MOVIES_GAMES,
    MUSIC,
    NONPROFIT,
    OFFICE_SUPPLIES,
    ONLINE_GAMES,
    OUTDOOR,
    PETS,
    REAL_ESTATE,
    RESTAURANTS,
    SPORT_FITNESS,
    TELECOM,
    TICKETING,
    TOYS_HOBBIES,
    TRAVEL,
    UTILITIES,
    WHOLESALE_RELATIONSHIP,
    WINE_SPIRITS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceListAdvertiserCategory>{ 
    "apparel_accessories": APPAREL_ACCESSORIES,
    "appliances_electronics": APPLIANCES_ELECTRONICS,
    "auto_dealer": AUTO_DEALER,
    "automotive": AUTOMOTIVE,
    "babies_kids": BABIES_KIDS,
    "blogs_personal_sites": BLOGS_PERSONAL_SITES,
    "books_magazines": BOOKS_MAGAZINES,
    "computers": COMPUTERS,
    "dating": DATING,
    "department_stores": DEPARTMENT_STORES,
    "education": EDUCATION,
    "employment": EMPLOYMENT,
    "financial_credit_cards": FINANCIAL_CREDIT_CARDS,
    "financial_other": FINANCIAL_OTHER,
    "flowers_gifts": FLOWERS_GIFTS,
    "grocery": GROCERY,
    "health_beauty": HEALTH_BEAUTY,
    "home_garden": HOME_GARDEN,
    "hosting_domain": HOSTING_DOMAIN,
    "internet_providers": INTERNET_PROVIDERS,
    "legal": LEGAL,
    "media_entertainment": MEDIA_ENTERTAINMENT,
    "medical": MEDICAL,
    "movies_games": MOVIES_GAMES,
    "music": MUSIC,
    "nonprofit": NONPROFIT,
    "office_supplies": OFFICE_SUPPLIES,
    "online_games": ONLINE_GAMES,
    "outdoor": OUTDOOR,
    "pets": PETS,
    "real_estate": REAL_ESTATE,
    "restaurants": RESTAURANTS,
    "sport_fitness": SPORT_FITNESS,
    "telecom": TELECOM,
    "ticketing": TICKETING,
    "toys_hobbies": TOYS_HOBBIES,
    "travel": TRAVEL,
    "utilities": UTILITIES,
    "wholesale_relationship": WHOLESALE_RELATIONSHIP,
    "wine_spirits": WINE_SPIRITS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceListAdvertiserCategory valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceListAdvertiserCategory._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "AdvertiserCategory".hashCode();
}

// Enum LinksResource.List.PromotionType
class LinksResourceListPromotionType extends core.Object implements core.Hashable {
  
  static final LinksResourceListPromotionType BUY_GET = const LinksResourceListPromotionType._internal("buy_get", 0);
  
  static final LinksResourceListPromotionType COUPON = const LinksResourceListPromotionType._internal("coupon", 1);
  
  static final LinksResourceListPromotionType FREE_GIFT = const LinksResourceListPromotionType._internal("free_gift", 2);
  
  static final LinksResourceListPromotionType FREE_GIFT_WRAP = const LinksResourceListPromotionType._internal("free_gift_wrap", 3);
  
  static final LinksResourceListPromotionType FREE_SHIPPING = const LinksResourceListPromotionType._internal("free_shipping", 4);
  
  static final LinksResourceListPromotionType NONE = const LinksResourceListPromotionType._internal("none", 5);
  
  static final LinksResourceListPromotionType ONGOING = const LinksResourceListPromotionType._internal("ongoing", 6);
  
  static final LinksResourceListPromotionType PERCENT_OFF = const LinksResourceListPromotionType._internal("percent_off", 7);
  
  static final LinksResourceListPromotionType PRICE_CUT = const LinksResourceListPromotionType._internal("price_cut", 8);
  
  static final LinksResourceListPromotionType PRODUCT_PROMOTION = const LinksResourceListPromotionType._internal("product_promotion", 9);
  
  static final LinksResourceListPromotionType SALE = const LinksResourceListPromotionType._internal("sale", 10);
  
  static final LinksResourceListPromotionType SWEEPSTAKES = const LinksResourceListPromotionType._internal("sweepstakes", 11);

  /** All values of this enumeration */
  static final core.List<LinksResourceListPromotionType> values = const <LinksResourceListPromotionType>[
    BUY_GET,
    COUPON,
    FREE_GIFT,
    FREE_GIFT_WRAP,
    FREE_SHIPPING,
    NONE,
    ONGOING,
    PERCENT_OFF,
    PRICE_CUT,
    PRODUCT_PROMOTION,
    SALE,
    SWEEPSTAKES,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceListPromotionType>{ 
    "buy_get": BUY_GET,
    "coupon": COUPON,
    "free_gift": FREE_GIFT,
    "free_gift_wrap": FREE_GIFT_WRAP,
    "free_shipping": FREE_SHIPPING,
    "none": NONE,
    "ongoing": ONGOING,
    "percent_off": PERCENT_OFF,
    "price_cut": PRICE_CUT,
    "product_promotion": PRODUCT_PROMOTION,
    "sale": SALE,
    "sweepstakes": SWEEPSTAKES,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceListPromotionType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceListPromotionType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "PromotionType".hashCode();
}

// Enum LinksResource.List.Authorship
class LinksResourceListAuthorship extends core.Object implements core.Hashable {
  
  static final LinksResourceListAuthorship ADVERTISER = const LinksResourceListAuthorship._internal("advertiser", 0);
  
  static final LinksResourceListAuthorship PUBLISHER = const LinksResourceListAuthorship._internal("publisher", 1);

  /** All values of this enumeration */
  static final core.List<LinksResourceListAuthorship> values = const <LinksResourceListAuthorship>[
    ADVERTISER,
    PUBLISHER,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceListAuthorship>{ 
    "advertiser": ADVERTISER,
    "publisher": PUBLISHER,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceListAuthorship valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceListAuthorship._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Authorship".hashCode();
}

// Enum LinksResource.Get.Role
class LinksResourceGetRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final LinksResourceGetRole ADVERTISERS = const LinksResourceGetRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final LinksResourceGetRole PUBLISHERS = const LinksResourceGetRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<LinksResourceGetRole> values = const <LinksResourceGetRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <LinksResourceGetRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static LinksResourceGetRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const LinksResourceGetRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Resource .PublishersResource
class PublishersResource extends core.Object {
  final GanApi _$service;
  
  PublishersResource._internal(GanApi $service) : _$service = $service;

  // Method PublishersResource.List
  /**
   * Retrieves data about all publishers that the requesting advertiser/publisher has access to.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [publisherCategory] Caret(^) delimted list of publisher categories. Valid categories: (unclassified|community_and_conten
   *        t|shopping_and_promotion|loyalty_and_rewards|network|search_specialist|comparison_shopping
   *        |email). Filters out all publishers not in one of the given advertiser categories.
   *        Optional.
   *    * [relationshipStatus] Filters out all publishers for which do not have the given relationship status with the requesting
   *        publisher.
   *    * [minSevenDayEpc] Filters out all publishers that have a seven day EPC average lower than the given value (inclusive).
   *        Min value 0.0. Optional.
   *    * [minNinetyDayEpc] Filters out all publishers that have a ninety day EPC average lower than the given value
   *        (inclusive). Min value: 0.0. Optional.
   *    * [pageToken] The value of 'nextPageToken' from the previous page. Optional.
   *    * [maxResults] Max number of items to return in this page. Optional. Defaults to 20.

  Minimum: 0.
  Maximum: 100.
   *    * [minPayoutRank] A value between 1 and 4, where 1 represents the quartile of publishers with the lowest ranks and 4
   *        represents the quartile of publishers with the highest ranks. Filters out all publishers
   *        with a lower rank than the given quartile. For example if a 2 was given only publishers
   *        with a payout rank of 25 or higher would be included. Optional.

  Minimum: 1.
  Maximum: 4.
   */
  core.Future<Publishers> list(PublishersResourceListRole role, core.String roleId, [core.String publisherCategory = UNSPECIFIED, PublishersResourceListRelationshipStatus relationshipStatus = UNSPECIFIED, core.double minSevenDayEpc = UNSPECIFIED, core.double minNinetyDayEpc = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.int minPayoutRank = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (UNSPECIFIED != publisherCategory) $queryParams["publisherCategory"] = publisherCategory;
    if (UNSPECIFIED != relationshipStatus) $queryParams["relationshipStatus"] = relationshipStatus;
    if (UNSPECIFIED != minSevenDayEpc) $queryParams["minSevenDayEpc"] = minSevenDayEpc;
    if (UNSPECIFIED != minNinetyDayEpc) $queryParams["minNinetyDayEpc"] = minNinetyDayEpc;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != minPayoutRank) $queryParams["minPayoutRank"] = minPayoutRank;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/publishers";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Publishers.parse(JSON.parse($text)));
  }

  // Method PublishersResource.Get
  /**
   * Retrieves data about a single advertiser if that the requesting advertiser/publisher has access
   * to it. Only advertisers can look up publishers. Publishers can request information about
   * themselves by omitting the publisherId query parameter.
   *
   *    * [role] The role of the requester. Valid values: 'advertisers' or 'publishers'.
   *    * [roleId] The ID of the requesting advertiser or publisher.
   *    * [publisherId] The ID of the publisher to look up. Optional.
   */
  core.Future<Publisher> get(PublishersResourceGetRole role, core.String roleId, [core.String publisherId = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["role"] = role;
    $pathParams["roleId"] = roleId;
    if (UNSPECIFIED != publisherId) $queryParams["publisherId"] = publisherId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{role}/{roleId}/publisher";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Publisher.parse(JSON.parse($text)));
  }
}

// Enum PublishersResource.List.Role
class PublishersResourceListRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final PublishersResourceListRole ADVERTISERS = const PublishersResourceListRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final PublishersResourceListRole PUBLISHERS = const PublishersResourceListRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<PublishersResourceListRole> values = const <PublishersResourceListRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PublishersResourceListRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PublishersResourceListRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const PublishersResourceListRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Enum PublishersResource.List.RelationshipStatus
class PublishersResourceListRelationshipStatus extends core.Object implements core.Hashable {
  /** Publishers you've approved to your program. */
  static final PublishersResourceListRelationshipStatus APPROVED = const PublishersResourceListRelationshipStatus._internal("approved", 0);
  /** Publishers available for you to recruit. */
  static final PublishersResourceListRelationshipStatus AVAILABLE = const PublishersResourceListRelationshipStatus._internal("available", 1);
  /**
 * A publisher that you terminated from your program. Publishers also have the ability to remove
 * themselves from your program.
 */
  static final PublishersResourceListRelationshipStatus DEACTIVATED = const PublishersResourceListRelationshipStatus._internal("deactivated", 2);
  /** A publisher that you did not approve to your program. */
  static final PublishersResourceListRelationshipStatus DECLINED = const PublishersResourceListRelationshipStatus._internal("declined", 3);
  /**
 * Publishers that have applied to your program. We recommend reviewing and deciding on pending
 * publishers on a weekly basis.
 */
  static final PublishersResourceListRelationshipStatus PENDING = const PublishersResourceListRelationshipStatus._internal("pending", 4);

  /** All values of this enumeration */
  static final core.List<PublishersResourceListRelationshipStatus> values = const <PublishersResourceListRelationshipStatus>[
    APPROVED,
    AVAILABLE,
    DEACTIVATED,
    DECLINED,
    PENDING,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PublishersResourceListRelationshipStatus>{ 
    "approved": APPROVED,
    "available": AVAILABLE,
    "deactivated": DEACTIVATED,
    "declined": DECLINED,
    "pending": PENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PublishersResourceListRelationshipStatus valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const PublishersResourceListRelationshipStatus._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "RelationshipStatus".hashCode();
}

// Enum PublishersResource.Get.Role
class PublishersResourceGetRole extends core.Object implements core.Hashable {
  /** The requester is requesting as an advertiser. */
  static final PublishersResourceGetRole ADVERTISERS = const PublishersResourceGetRole._internal("advertisers", 0);
  /** The requester is requesting as a publisher. */
  static final PublishersResourceGetRole PUBLISHERS = const PublishersResourceGetRole._internal("publishers", 1);

  /** All values of this enumeration */
  static final core.List<PublishersResourceGetRole> values = const <PublishersResourceGetRole>[
    ADVERTISERS,
    PUBLISHERS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PublishersResourceGetRole>{ 
    "advertisers": ADVERTISERS,
    "publishers": PUBLISHERS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PublishersResourceGetRole valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const PublishersResourceGetRole._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Role".hashCode();
}

// Schema .Advertiser
class Advertiser extends IdentityHash {
  /**
 * Category that this advertiser belongs to. A valid list of categories can be found here:
 * http://www.google.com/support/affiliatenetwork/advertiser/bin/answer.py?hl=en=107581
 */
  core.String category;

  /** Email that this advertiser would like publishers to contact them with. */
  core.String contactEmail;

  /** The kind for an advertiser. */
  core.String kind;

  /** URL of the website this advertiser advertises from. */
  core.String siteUrl;

  /** Phone that this advertiser would like publishers to contact them with. */
  core.String contactPhone;

  /** Description of the website the advertiser advertises from. */
  core.String description;

  /**
 * A rank based on commissions paid to publishers over the past 90 days. A number between 1 and 4
 * where 4 means the top quartile (most money paid) and 1 means the bottom quartile (least money
 * paid).
 */
  core.String payoutRank;

  /** The default link id for this advertiser. */
  core.String defaultLinkId;

  /**
 * The sum of fees paid to publishers divided by the total number of clicks over the past seven
 * days. Values are multiplied by 100 for display purposes.
 */
  Money epcSevenDayAverage;

  /**
 * The longest possible length of a commission (how long the cookies on the customer's browser last
 * before they expire).
 */
  core.int commissionDuration;

  /** The status of the requesting publisher's relationship this advertiser. */
  core.String status;

  /**
 * The sum of fees paid to publishers divided by the total number of clicks over the past three
 * months. Values are multiplied by 100 for display purposes.
 */
  Money epcNinetyDayAverage;

  /** True if the advertiser allows publisher created links, otherwise false. */
  core.bool allowPublisherCreatedLinks;

  /** The requested advertiser. */
  Advertiser item;

  /** Date that this advertiser was approved as a Google Affiliate Network advertiser. */
  core.String joinDate;

  /** URL to the logo this advertiser uses on the Google Affiliate Network. */
  core.String logoUrl;

  /** The ID of this advertiser. */
  core.String id;

  /** Allows advertisers to submit product listings to Google Product Search. */
  core.bool productFeedsEnabled;

  /** The name of this advertiser. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Advertiser parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Advertiser();
    result.category = identity(json["category"]);
    result.contactEmail = identity(json["contactEmail"]);
    result.kind = identity(json["kind"]);
    result.siteUrl = identity(json["siteUrl"]);
    result.contactPhone = identity(json["contactPhone"]);
    result.description = identity(json["description"]);
    result.payoutRank = identity(json["payoutRank"]);
    result.defaultLinkId = identity(json["defaultLinkId"]);
    result.epcSevenDayAverage = Money.parse(json["epcSevenDayAverage"]);
    result.commissionDuration = identity(json["commissionDuration"]);
    result.status = identity(json["status"]);
    result.epcNinetyDayAverage = Money.parse(json["epcNinetyDayAverage"]);
    result.allowPublisherCreatedLinks = identity(json["allowPublisherCreatedLinks"]);
    result.item = Advertiser.parse(json["item"]);
    result.joinDate = identity(json["joinDate"]);
    result.logoUrl = identity(json["logoUrl"]);
    result.id = identity(json["id"]);
    result.productFeedsEnabled = identity(json["productFeedsEnabled"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Advertiser value) {
    if (value == null) return null;
    final result = {};
    result["category"] = identity(value.category);
    result["contactEmail"] = identity(value.contactEmail);
    result["kind"] = identity(value.kind);
    result["siteUrl"] = identity(value.siteUrl);
    result["contactPhone"] = identity(value.contactPhone);
    result["description"] = identity(value.description);
    result["payoutRank"] = identity(value.payoutRank);
    result["defaultLinkId"] = identity(value.defaultLinkId);
    result["epcSevenDayAverage"] = Money.serialize(value.epcSevenDayAverage);
    result["commissionDuration"] = identity(value.commissionDuration);
    result["status"] = identity(value.status);
    result["epcNinetyDayAverage"] = Money.serialize(value.epcNinetyDayAverage);
    result["allowPublisherCreatedLinks"] = identity(value.allowPublisherCreatedLinks);
    result["item"] = Advertiser.serialize(value.item);
    result["joinDate"] = identity(value.joinDate);
    result["logoUrl"] = identity(value.logoUrl);
    result["id"] = identity(value.id);
    result["productFeedsEnabled"] = identity(value.productFeedsEnabled);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Advertisers
class Advertisers extends IdentityHash {
  /**
 * The 'pageToken' to pass to the next request to get the next page, if there are more to retrieve.
 */
  core.String nextPageToken;

  /** The advertiser list. */
  core.List<Advertiser> items;

  /** The kind for a page of advertisers. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Advertisers parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Advertisers();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Advertiser.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Advertisers value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Advertiser.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CcOffer
class CcOffer extends IdentityHash {
  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String luggageInsurance;

  /** The low end for credit limits the issuer imposes on recipients of this card. */
  core.double creditLimitMin;

  /**
 * The issuer's name for the card, including any trademark or service mark designators. A summary
 * field.
 */
  core.String cardName;

  /** The high end for credit limits the issuer imposes on recipients of this card. */
  core.double creditLimitMax;

  /** Text describing the grace period before finance charges apply. A summary field. */
  core.String gracePeriodDisplay;

  /** This offer's ID. A summary field. */
  core.String offerId;

  /** For cards with rewards programs, the unit of reward. For example, miles, cash back, points. */
  core.String rewardUnit;

  /**
 * The lowest interest rate the issuer charges on this card. Expressed as an absolute number, not as
 * a percentage.
 */
  core.double minPurchaseRate;

  /**
 * A list of what the issuer thinks are the most important benefits of the card. Usually summarizes
 * the rewards program, if there is one. A summary field.
 */
  core.List<core.String> cardBenefits;

  /** For cards with rewards programs, detailed rules about how the program works. */
  core.List<CcOfferRewards> rewards;

  /**
 * Whether a cash reward program lets you get cash back sooner than end of year or other longish
 * period.
 */
  core.bool offersImmediateCashReward;

  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String travelInsurance;

  /** Text describing the fee for a payment that doesn't clear. A summary field. */
  core.String returnedPaymentFee;

  /** The kind for one credit card offer. A summary field. */
  core.String kind;

  /** Name of card issuer. A summary field. */
  core.String issuer;

  /**
 * The highest interest rate the issuer charges on this card. Expressed as an absolute number, not
 * as a percentage.
 */
  core.double maxPurchaseRate;

  /** Text describing how much missing the grace period will cost. */
  core.String minimumFinanceCharge;

  /** Whether this card is only available to existing customers of the issuer. */
  core.bool existingCustomerOnly;

  /**
 * Text describing the annual fee, including any difference for the first year. A summary field.
 */
  core.String annualFeeDisplay;

  /** Fee for setting up the card. */
  core.String initialSetupAndProcessingFee;

  /** The Google Affiliate Network ID of the advertiser making this offer. */
  core.String issuerId;

  /** Text describing any additional details for the purchase rate. A summary field. */
  core.String purchaseRateAdditionalDetails;

  /** Categories in which the issuer does not wish the card to be displayed. A summary field. */
  core.List<core.String> prohibitedCategories;

  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String fraudLiability;

  /** Text describing the terms for cash advances. A summary field. */
  core.String cashAdvanceTerms;

  /** The link to the issuer's page for this card. A summary field. */
  core.String landingPageUrl;

  /** Text describing the terms for introductory period cash advances. A summary field. */
  core.String introCashAdvanceTerms;

  /** Whether accumulated rewards ever expire. */
  core.bool rewardsExpire;

  /** Text describing the terms for introductory period purchases. A summary field. */
  core.String introPurchaseTerms;

  /** Fees for defaulting on your payments. */
  core.List<CcOfferDefaultFees> defaultFees;

  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String extendedWarranty;

  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String emergencyInsurance;

  /** The annual fee for the first year, if different from the ongoing fee. Optional. */
  core.double firstYearAnnualFee;

  /** The link to ping to register a click on this offer. A summary field. */
  core.String trackingUrl;

  /** Text describing how much a late payment will cost, eg "up to $35." A summary field. */
  core.String latePaymentFee;

  /** Fee for exceeding the card's charge limit. */
  core.String overLimitFee;

  /** What kind of credit card this is, for example secured or unsecured. */
  core.String cardType;

  /** Possible categories for this card, eg "Low Interest" or "Good." A summary field. */
  core.List<core.String> approvedCategories;

  /** The company that redeems the rewards, if different from the issuer. */
  core.String rewardPartner;

  /** Text describing the terms for introductory period balance transfers. A summary field. */
  core.String introBalanceTransferTerms;

  /** Fee for each transaction involving a foreign currency. */
  core.String foreignCurrencyTransactionFee;

  /** The ongoing annual fee, in dollars. */
  core.double annualFee;

  /** The generic link to the issuer's site. */
  core.String issuerWebsite;

  /** How often variable rates are updated. */
  core.String variableRatesUpdateFrequency;

  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String carRentalInsurance;

  /** More marketing copy about the card's benefits. A summary field. */
  core.List<core.String> additionalCardBenefits;

  /** The youngest a recipient of this card may be. */
  core.double ageMinimum;

  /** Text describing how the balance is computed. A summary field. */
  core.String balanceComputationMethod;

  /** Text describing the purchase APR. A summary field. */
  core.String aprDisplay;

  /** Any extra fees levied on card holders. */
  core.String additionalCardHolderFee;

  /** When variable rates were last updated. */
  core.String variableRatesLastUpdated;

  /** Which network (eg Visa) the card belongs to. A summary field. */
  core.String network;

  /** Fixed or variable. */
  core.String purchaseRateType;

  /** Fee for requesting a copy of your statement. */
  core.String statementCopyFee;

  /** For airline miles rewards, tells whether blackout dates apply to the miles. */
  core.bool rewardsHaveBlackoutDates;

  /**
 * Text describing the credit ratings required for recipients of this card, for example
 * "Excellent/Good." A summary field.
 */
  core.String creditRatingDisplay;

  /** If you get coverage when you use the card for the given activity, this field describes it. */
  core.String flightAccidentInsurance;

  /** The largest number of units you may accumulate in a year. */
  core.double annualRewardMaximum;

  /** Text describing the terms for balance transfers. A summary field. */
  core.String balanceTransferTerms;

  /**
 * For cards with rewards programs, extra circumstances whereby additional rewards may be granted.
 */
  core.List<CcOfferBonusRewards> bonusRewards;

  /** The link to the image of the card that is shown on Connect Commerce. A summary field. */
  core.String imageUrl;

  /** Text describing the details of the age minimum restriction. */
  core.String ageMinimumDetails;

  /**
 * A notice that, if present, is referenced via an asterisk by many of the other summary fields. If
 * this field is present, it will always start with an asterisk ("*"), and must be prominently
 * displayed with the offer. A summary field.
 */
  core.String disclaimer;

  /** Parses an instance from its JSON representation. */
  static CcOffer parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CcOffer();
    result.luggageInsurance = identity(json["luggageInsurance"]);
    result.creditLimitMin = identity(json["creditLimitMin"]);
    result.cardName = identity(json["cardName"]);
    result.creditLimitMax = identity(json["creditLimitMax"]);
    result.gracePeriodDisplay = identity(json["gracePeriodDisplay"]);
    result.offerId = identity(json["offerId"]);
    result.rewardUnit = identity(json["rewardUnit"]);
    result.minPurchaseRate = identity(json["minPurchaseRate"]);
    result.cardBenefits = map(identity)(json["cardBenefits"]);
    result.rewards = map(CcOfferRewards.parse)(json["rewards"]);
    result.offersImmediateCashReward = identity(json["offersImmediateCashReward"]);
    result.travelInsurance = identity(json["travelInsurance"]);
    result.returnedPaymentFee = identity(json["returnedPaymentFee"]);
    result.kind = identity(json["kind"]);
    result.issuer = identity(json["issuer"]);
    result.maxPurchaseRate = identity(json["maxPurchaseRate"]);
    result.minimumFinanceCharge = identity(json["minimumFinanceCharge"]);
    result.existingCustomerOnly = identity(json["existingCustomerOnly"]);
    result.annualFeeDisplay = identity(json["annualFeeDisplay"]);
    result.initialSetupAndProcessingFee = identity(json["initialSetupAndProcessingFee"]);
    result.issuerId = identity(json["issuerId"]);
    result.purchaseRateAdditionalDetails = identity(json["purchaseRateAdditionalDetails"]);
    result.prohibitedCategories = map(identity)(json["prohibitedCategories"]);
    result.fraudLiability = identity(json["fraudLiability"]);
    result.cashAdvanceTerms = identity(json["cashAdvanceTerms"]);
    result.landingPageUrl = identity(json["landingPageUrl"]);
    result.introCashAdvanceTerms = identity(json["introCashAdvanceTerms"]);
    result.rewardsExpire = identity(json["rewardsExpire"]);
    result.introPurchaseTerms = identity(json["introPurchaseTerms"]);
    result.defaultFees = map(CcOfferDefaultFees.parse)(json["defaultFees"]);
    result.extendedWarranty = identity(json["extendedWarranty"]);
    result.emergencyInsurance = identity(json["emergencyInsurance"]);
    result.firstYearAnnualFee = identity(json["firstYearAnnualFee"]);
    result.trackingUrl = identity(json["trackingUrl"]);
    result.latePaymentFee = identity(json["latePaymentFee"]);
    result.overLimitFee = identity(json["overLimitFee"]);
    result.cardType = identity(json["cardType"]);
    result.approvedCategories = map(identity)(json["approvedCategories"]);
    result.rewardPartner = identity(json["rewardPartner"]);
    result.introBalanceTransferTerms = identity(json["introBalanceTransferTerms"]);
    result.foreignCurrencyTransactionFee = identity(json["foreignCurrencyTransactionFee"]);
    result.annualFee = identity(json["annualFee"]);
    result.issuerWebsite = identity(json["issuerWebsite"]);
    result.variableRatesUpdateFrequency = identity(json["variableRatesUpdateFrequency"]);
    result.carRentalInsurance = identity(json["carRentalInsurance"]);
    result.additionalCardBenefits = map(identity)(json["additionalCardBenefits"]);
    result.ageMinimum = identity(json["ageMinimum"]);
    result.balanceComputationMethod = identity(json["balanceComputationMethod"]);
    result.aprDisplay = identity(json["aprDisplay"]);
    result.additionalCardHolderFee = identity(json["additionalCardHolderFee"]);
    result.variableRatesLastUpdated = identity(json["variableRatesLastUpdated"]);
    result.network = identity(json["network"]);
    result.purchaseRateType = identity(json["purchaseRateType"]);
    result.statementCopyFee = identity(json["statementCopyFee"]);
    result.rewardsHaveBlackoutDates = identity(json["rewardsHaveBlackoutDates"]);
    result.creditRatingDisplay = identity(json["creditRatingDisplay"]);
    result.flightAccidentInsurance = identity(json["flightAccidentInsurance"]);
    result.annualRewardMaximum = identity(json["annualRewardMaximum"]);
    result.balanceTransferTerms = identity(json["balanceTransferTerms"]);
    result.bonusRewards = map(CcOfferBonusRewards.parse)(json["bonusRewards"]);
    result.imageUrl = identity(json["imageUrl"]);
    result.ageMinimumDetails = identity(json["ageMinimumDetails"]);
    result.disclaimer = identity(json["disclaimer"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CcOffer value) {
    if (value == null) return null;
    final result = {};
    result["luggageInsurance"] = identity(value.luggageInsurance);
    result["creditLimitMin"] = identity(value.creditLimitMin);
    result["cardName"] = identity(value.cardName);
    result["creditLimitMax"] = identity(value.creditLimitMax);
    result["gracePeriodDisplay"] = identity(value.gracePeriodDisplay);
    result["offerId"] = identity(value.offerId);
    result["rewardUnit"] = identity(value.rewardUnit);
    result["minPurchaseRate"] = identity(value.minPurchaseRate);
    result["cardBenefits"] = map(identity)(value.cardBenefits);
    result["rewards"] = map(CcOfferRewards.serialize)(value.rewards);
    result["offersImmediateCashReward"] = identity(value.offersImmediateCashReward);
    result["travelInsurance"] = identity(value.travelInsurance);
    result["returnedPaymentFee"] = identity(value.returnedPaymentFee);
    result["kind"] = identity(value.kind);
    result["issuer"] = identity(value.issuer);
    result["maxPurchaseRate"] = identity(value.maxPurchaseRate);
    result["minimumFinanceCharge"] = identity(value.minimumFinanceCharge);
    result["existingCustomerOnly"] = identity(value.existingCustomerOnly);
    result["annualFeeDisplay"] = identity(value.annualFeeDisplay);
    result["initialSetupAndProcessingFee"] = identity(value.initialSetupAndProcessingFee);
    result["issuerId"] = identity(value.issuerId);
    result["purchaseRateAdditionalDetails"] = identity(value.purchaseRateAdditionalDetails);
    result["prohibitedCategories"] = map(identity)(value.prohibitedCategories);
    result["fraudLiability"] = identity(value.fraudLiability);
    result["cashAdvanceTerms"] = identity(value.cashAdvanceTerms);
    result["landingPageUrl"] = identity(value.landingPageUrl);
    result["introCashAdvanceTerms"] = identity(value.introCashAdvanceTerms);
    result["rewardsExpire"] = identity(value.rewardsExpire);
    result["introPurchaseTerms"] = identity(value.introPurchaseTerms);
    result["defaultFees"] = map(CcOfferDefaultFees.serialize)(value.defaultFees);
    result["extendedWarranty"] = identity(value.extendedWarranty);
    result["emergencyInsurance"] = identity(value.emergencyInsurance);
    result["firstYearAnnualFee"] = identity(value.firstYearAnnualFee);
    result["trackingUrl"] = identity(value.trackingUrl);
    result["latePaymentFee"] = identity(value.latePaymentFee);
    result["overLimitFee"] = identity(value.overLimitFee);
    result["cardType"] = identity(value.cardType);
    result["approvedCategories"] = map(identity)(value.approvedCategories);
    result["rewardPartner"] = identity(value.rewardPartner);
    result["introBalanceTransferTerms"] = identity(value.introBalanceTransferTerms);
    result["foreignCurrencyTransactionFee"] = identity(value.foreignCurrencyTransactionFee);
    result["annualFee"] = identity(value.annualFee);
    result["issuerWebsite"] = identity(value.issuerWebsite);
    result["variableRatesUpdateFrequency"] = identity(value.variableRatesUpdateFrequency);
    result["carRentalInsurance"] = identity(value.carRentalInsurance);
    result["additionalCardBenefits"] = map(identity)(value.additionalCardBenefits);
    result["ageMinimum"] = identity(value.ageMinimum);
    result["balanceComputationMethod"] = identity(value.balanceComputationMethod);
    result["aprDisplay"] = identity(value.aprDisplay);
    result["additionalCardHolderFee"] = identity(value.additionalCardHolderFee);
    result["variableRatesLastUpdated"] = identity(value.variableRatesLastUpdated);
    result["network"] = identity(value.network);
    result["purchaseRateType"] = identity(value.purchaseRateType);
    result["statementCopyFee"] = identity(value.statementCopyFee);
    result["rewardsHaveBlackoutDates"] = identity(value.rewardsHaveBlackoutDates);
    result["creditRatingDisplay"] = identity(value.creditRatingDisplay);
    result["flightAccidentInsurance"] = identity(value.flightAccidentInsurance);
    result["annualRewardMaximum"] = identity(value.annualRewardMaximum);
    result["balanceTransferTerms"] = identity(value.balanceTransferTerms);
    result["bonusRewards"] = map(CcOfferBonusRewards.serialize)(value.bonusRewards);
    result["imageUrl"] = identity(value.imageUrl);
    result["ageMinimumDetails"] = identity(value.ageMinimumDetails);
    result["disclaimer"] = identity(value.disclaimer);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema CcOffer.CcOfferBonusRewards
class CcOfferBonusRewards extends IdentityHash {
  /** How many units of reward will be granted. */
  core.double amount;

  /** The circumstances under which this rule applies, for example, booking a flight via Orbitz. */
  core.String details;

  /** Parses an instance from its JSON representation. */
  static CcOfferBonusRewards parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CcOfferBonusRewards();
    result.amount = identity(json["amount"]);
    result.details = identity(json["details"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CcOfferBonusRewards value) {
    if (value == null) return null;
    final result = {};
    result["amount"] = identity(value.amount);
    result["details"] = identity(value.details);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema CcOffer.CcOfferDefaultFees
class CcOfferDefaultFees extends IdentityHash {
  /** The type of charge, for example Purchases. */
  core.String category;

  /**
 * The highest rate the issuer may charge for defaulting on debt in this category. Expressed as an
 * absolute number, not as a percentage.
 */
  core.double maxRate;

  /**
 * The lowest rate the issuer may charge for defaulting on debt in this category. Expressed as an
 * absolute number, not as a percentage.
 */
  core.double minRate;

  /** Fixed or variable. */
  core.String rateType;

  /** Parses an instance from its JSON representation. */
  static CcOfferDefaultFees parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CcOfferDefaultFees();
    result.category = identity(json["category"]);
    result.maxRate = identity(json["maxRate"]);
    result.minRate = identity(json["minRate"]);
    result.rateType = identity(json["rateType"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CcOfferDefaultFees value) {
    if (value == null) return null;
    final result = {};
    result["category"] = identity(value.category);
    result["maxRate"] = identity(value.maxRate);
    result["minRate"] = identity(value.minRate);
    result["rateType"] = identity(value.rateType);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema CcOffer.CcOfferRewards
class CcOfferRewards extends IdentityHash {
  /** The kind of purchases covered by this rule. */
  core.String category;

  /** The minimum purchase amount in the given category before this rule applies. */
  core.double minRewardTier;

  /** The maximum purchase amount in the given category for this rule to apply. */
  core.double maxRewardTier;

  /** How long rewards granted by this rule last. */
  core.double expirationMonths;

  /** The number of units rewarded per purchase dollar. */
  core.double amount;

  /** Other limits, for example, if this rule only applies during an introductory period. */
  core.String additionalDetails;

  /** Parses an instance from its JSON representation. */
  static CcOfferRewards parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CcOfferRewards();
    result.category = identity(json["category"]);
    result.minRewardTier = identity(json["minRewardTier"]);
    result.maxRewardTier = identity(json["maxRewardTier"]);
    result.expirationMonths = identity(json["expirationMonths"]);
    result.amount = identity(json["amount"]);
    result.additionalDetails = identity(json["additionalDetails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CcOfferRewards value) {
    if (value == null) return null;
    final result = {};
    result["category"] = identity(value.category);
    result["minRewardTier"] = identity(value.minRewardTier);
    result["maxRewardTier"] = identity(value.maxRewardTier);
    result["expirationMonths"] = identity(value.expirationMonths);
    result["amount"] = identity(value.amount);
    result["additionalDetails"] = identity(value.additionalDetails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CcOffers
class CcOffers extends IdentityHash {
  /** The credit card offers. */
  core.List<CcOffer> items;

  /** The kind for a page of credit card offers. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static CcOffers parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CcOffers();
    result.items = map(CcOffer.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CcOffers value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(CcOffer.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Event
class Event extends IdentityHash {
  /** Fee that the advertiser paid to the Google Affiliate Network. */
  Money networkFee;

  /** The name of the advertiser for this event. */
  core.String advertiserName;

  /** The kind for one event. */
  core.String kind;

  /** The date-time this event was last modified as a RFC 3339 date-time value. */
  core.String modifyDate;

  /** Type of the event (action|transaction|charge). */
  core.String type;

  /** The order ID for this event. Only returned for conversion events. */
  core.String orderId;

  /** The name of the publisher for this event. */
  core.String publisherName;

  /** The ID of the member attached to this event. Only returned for conversion events. */
  core.String memberId;

  /** The ID of advertiser for this event. */
  core.String advertiserId;

  /** Status of the event (active|canceled). Only returned for charge and conversion events. */
  core.String status;

  /** The charge ID for this event. Only returned for charge events. */
  core.String chargeId;

  /** Products associated with the event. */
  core.List<EventProducts> products;

  /** Earnings by the publisher. */
  Money earnings;

  /**
 * Charge type of the event (other|slotting_fee|monthly_minimum|tier_bonus|debit|credit). Only
 * returned for charge events.
 */
  core.String chargeType;

  /** Fee that the advertiser paid to the publisher. */
  Money publisherFee;

  /**
 * Amount of money exchanged during the transaction. Only returned for charge and conversion events.
 */
  Money commissionableSales;

  /** The ID of the publisher for this event. */
  core.String publisherId;

  /** The date-time this event was initiated as a RFC 3339 date-time value. */
  core.String eventDate;

  /** Parses an instance from its JSON representation. */
  static Event parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Event();
    result.networkFee = Money.parse(json["networkFee"]);
    result.advertiserName = identity(json["advertiserName"]);
    result.kind = identity(json["kind"]);
    result.modifyDate = identity(json["modifyDate"]);
    result.type = identity(json["type"]);
    result.orderId = identity(json["orderId"]);
    result.publisherName = identity(json["publisherName"]);
    result.memberId = identity(json["memberId"]);
    result.advertiserId = identity(json["advertiserId"]);
    result.status = identity(json["status"]);
    result.chargeId = identity(json["chargeId"]);
    result.products = map(EventProducts.parse)(json["products"]);
    result.earnings = Money.parse(json["earnings"]);
    result.chargeType = identity(json["chargeType"]);
    result.publisherFee = Money.parse(json["publisherFee"]);
    result.commissionableSales = Money.parse(json["commissionableSales"]);
    result.publisherId = identity(json["publisherId"]);
    result.eventDate = identity(json["eventDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Event value) {
    if (value == null) return null;
    final result = {};
    result["networkFee"] = Money.serialize(value.networkFee);
    result["advertiserName"] = identity(value.advertiserName);
    result["kind"] = identity(value.kind);
    result["modifyDate"] = identity(value.modifyDate);
    result["type"] = identity(value.type);
    result["orderId"] = identity(value.orderId);
    result["publisherName"] = identity(value.publisherName);
    result["memberId"] = identity(value.memberId);
    result["advertiserId"] = identity(value.advertiserId);
    result["status"] = identity(value.status);
    result["chargeId"] = identity(value.chargeId);
    result["products"] = map(EventProducts.serialize)(value.products);
    result["earnings"] = Money.serialize(value.earnings);
    result["chargeType"] = identity(value.chargeType);
    result["publisherFee"] = Money.serialize(value.publisherFee);
    result["commissionableSales"] = Money.serialize(value.commissionableSales);
    result["publisherId"] = identity(value.publisherId);
    result["eventDate"] = identity(value.eventDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Event.EventProducts
class EventProducts extends IdentityHash {
  /** Fee that the advertiser paid to the Google Affiliate Network for this product. */
  Money networkFee;

  /** Sku of this product. */
  core.String sku;

  /** Name of the category this product belongs to. */
  core.String categoryName;

  /** Sku name of this product. */
  core.String skuName;

  /** Fee that the advertiser paid to the publisehr for this product. */
  Money publisherFee;

  /** Amount earned by the publisher on this product. */
  Money earnings;

  /** Price per unit of this product. */
  Money unitPrice;

  /** Id of the category this product belongs to. */
  core.String categoryId;

  /** Quantity of this product bought/exchanged. */
  core.String quantity;

  /** Parses an instance from its JSON representation. */
  static EventProducts parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new EventProducts();
    result.networkFee = Money.parse(json["networkFee"]);
    result.sku = identity(json["sku"]);
    result.categoryName = identity(json["categoryName"]);
    result.skuName = identity(json["skuName"]);
    result.publisherFee = Money.parse(json["publisherFee"]);
    result.earnings = Money.parse(json["earnings"]);
    result.unitPrice = Money.parse(json["unitPrice"]);
    result.categoryId = identity(json["categoryId"]);
    result.quantity = identity(json["quantity"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(EventProducts value) {
    if (value == null) return null;
    final result = {};
    result["networkFee"] = Money.serialize(value.networkFee);
    result["sku"] = identity(value.sku);
    result["categoryName"] = identity(value.categoryName);
    result["skuName"] = identity(value.skuName);
    result["publisherFee"] = Money.serialize(value.publisherFee);
    result["earnings"] = Money.serialize(value.earnings);
    result["unitPrice"] = Money.serialize(value.unitPrice);
    result["categoryId"] = identity(value.categoryId);
    result["quantity"] = identity(value.quantity);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Events
class Events extends IdentityHash {
  /**
 * The 'pageToken' to pass to the next request to get the next page, if there are more to retrieve.
 */
  core.String nextPageToken;

  /** The event list. */
  core.List<Event> items;

  /** The kind for a page of events. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Events parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Events();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Event.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Events value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Event.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Link
class Link extends IdentityHash {
  /** Flag for if this link is active. */
  core.bool isActive;

  /** The link type. */
  core.String linkType;

  /** The kind for one entity. */
  core.String kind;

  /** Date that this link becomes inactive. */
  core.String endDate;

  /** Description. */
  core.String description;

  /** The logical name for this link. */
  core.String name;

  /** Date that this link becomes active. */
  core.String startDate;

  /** Date that this link was created. */
  core.String createDate;

  /** image alt text. */
  core.String imageAltText;

  /** The ID of this link. */
  core.String id;

  /** The advertiser id for the advertiser who owns this link. */
  core.String advertiserId;

  /** Tracking url for impressions. */
  core.String impressionTrackingUrl;

  /** Promotion Type */
  core.String promotionType;

  /** Duration */
  core.String duration;

  /** Authorship */
  core.String authorship;

  /** Availability. */
  core.String availability;

  /** Tracking url for clicks. */
  core.String clickTrackingUrl;

  /** The destination URL for the link. */
  core.String destinationUrl;

  /** Parses an instance from its JSON representation. */
  static Link parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Link();
    result.isActive = identity(json["isActive"]);
    result.linkType = identity(json["linkType"]);
    result.kind = identity(json["kind"]);
    result.endDate = identity(json["endDate"]);
    result.description = identity(json["description"]);
    result.name = identity(json["name"]);
    result.startDate = identity(json["startDate"]);
    result.createDate = identity(json["createDate"]);
    result.imageAltText = identity(json["imageAltText"]);
    result.id = identity(json["id"]);
    result.advertiserId = identity(json["advertiserId"]);
    result.impressionTrackingUrl = identity(json["impressionTrackingUrl"]);
    result.promotionType = identity(json["promotionType"]);
    result.duration = identity(json["duration"]);
    result.authorship = identity(json["authorship"]);
    result.availability = identity(json["availability"]);
    result.clickTrackingUrl = identity(json["clickTrackingUrl"]);
    result.destinationUrl = identity(json["destinationUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Link value) {
    if (value == null) return null;
    final result = {};
    result["isActive"] = identity(value.isActive);
    result["linkType"] = identity(value.linkType);
    result["kind"] = identity(value.kind);
    result["endDate"] = identity(value.endDate);
    result["description"] = identity(value.description);
    result["name"] = identity(value.name);
    result["startDate"] = identity(value.startDate);
    result["createDate"] = identity(value.createDate);
    result["imageAltText"] = identity(value.imageAltText);
    result["id"] = identity(value.id);
    result["advertiserId"] = identity(value.advertiserId);
    result["impressionTrackingUrl"] = identity(value.impressionTrackingUrl);
    result["promotionType"] = identity(value.promotionType);
    result["duration"] = identity(value.duration);
    result["authorship"] = identity(value.authorship);
    result["availability"] = identity(value.availability);
    result["clickTrackingUrl"] = identity(value.clickTrackingUrl);
    result["destinationUrl"] = identity(value.destinationUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Links
class Links extends IdentityHash {
  /** The next page token. */
  core.String nextPageToken;

  /** The links. */
  core.List<Link> items;

  /** The kind for a page of links. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Links parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Links();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Link.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Links value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Link.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Money
class Money extends IdentityHash {
  /** The amount of money. */
  core.double amount;

  /** The 3-letter code of the currency in question. */
  core.String currencyCode;

  /** Parses an instance from its JSON representation. */
  static Money parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Money();
    result.amount = identity(json["amount"]);
    result.currencyCode = identity(json["currencyCode"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Money value) {
    if (value == null) return null;
    final result = {};
    result["amount"] = identity(value.amount);
    result["currencyCode"] = identity(value.currencyCode);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Publisher
class Publisher extends IdentityHash {
  /** The status of the requesting advertiser's relationship with this publisher. */
  core.String status;

  /** The kind for a publisher. */
  core.String kind;

  /** The name of this publisher. */
  core.String name;

  /**
 * Classification that this publisher belongs to. See this link for all publisher classifications: h
 * ttp://www.google.com/support/affiliatenetwork/advertiser/bin/answer.py?hl=en=107625=cb=cb=-k5fihz
 * thfaik=4
 */
  core.String classification;

  /**
 * The sum of fees paid to this publisher divided by the total number of clicks over the past seven
 * days. Values are multiplied by 100 for display purposes.
 */
  Money epcSevenDayAverage;

  /**
 * A rank based on commissions paid to this publisher over the past 90 days. A number between 1 and
 * 4 where 4 means the top quartile (most money paid) and 1 means the bottom quartile (least money
 * paid).
 */
  core.String payoutRank;

  /**
 * The sum of fees paid to this publisher divided by the total number of clicks over the past three
 * months. Values are multiplied by 100 for display purposes.
 */
  Money epcNinetyDayAverage;

  /** The requested publisher. */
  Publisher item;

  /** Date that this publisher was approved as a Google Affiliate Network publisher. */
  core.String joinDate;

  /** Websites that this publisher uses to advertise. */
  core.List<core.String> sites;

  /** The ID of this publisher. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Publisher parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Publisher();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.classification = identity(json["classification"]);
    result.epcSevenDayAverage = Money.parse(json["epcSevenDayAverage"]);
    result.payoutRank = identity(json["payoutRank"]);
    result.epcNinetyDayAverage = Money.parse(json["epcNinetyDayAverage"]);
    result.item = Publisher.parse(json["item"]);
    result.joinDate = identity(json["joinDate"]);
    result.sites = map(identity)(json["sites"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Publisher value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["classification"] = identity(value.classification);
    result["epcSevenDayAverage"] = Money.serialize(value.epcSevenDayAverage);
    result["payoutRank"] = identity(value.payoutRank);
    result["epcNinetyDayAverage"] = Money.serialize(value.epcNinetyDayAverage);
    result["item"] = Publisher.serialize(value.item);
    result["joinDate"] = identity(value.joinDate);
    result["sites"] = map(identity)(value.sites);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Publishers
class Publishers extends IdentityHash {
  /**
 * The 'pageToken' to pass to the next request to get the next page, if there are more to retrieve.
 */
  core.String nextPageToken;

  /** The entity list. */
  core.List<Publisher> items;

  /** The kind for a page of entities. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static Publishers parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Publishers();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Publisher.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Publishers value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Publisher.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum GanApi.Alt
class GanApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final GanApiAlt JSON = const GanApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<GanApiAlt> values = const <GanApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <GanApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static GanApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const GanApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

