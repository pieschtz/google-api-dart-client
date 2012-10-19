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

#library('civicinfo-us_v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API CivicInfoApi
/**
 * An API for accessing civic information.
 */
class CivicInfoApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  CivicInfoApi get _$service => this;
  ElectionsResource _elections;
  ElectionsResource get elections => _elections;
  
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
  CivicInfoApiAlt alt;


  CivicInfoApi({this.baseUrl:"https://www.googleapis.com/civicinfo/us_v1/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _elections = new ElectionsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}civicinfo/us_v1/20121013 google-api-dart-client/${clientVersion}";
  }

}

// Resource .ElectionsResource
class ElectionsResource extends core.Object {
  final CivicInfoApi _$service;
  
  ElectionsResource._internal(CivicInfoApi $service) : _$service = $service;

  // Method ElectionsResource.ElectionQuery
  /**
   * List of available elections to query.
   *
   */
  core.Future<ElectionsQueryResponse> electionQuery() {
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
    final $path = "elections";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ElectionsQueryResponse.parse(JSON.parse($text)));
  }

  // Method ElectionsResource.VoterInfoQuery
  /**
   * Looks up information relevant to a voter based on the voter's registered address.
   *
   *    * [content] the VoterInfoRequest
   *    * [electionId] The unique ID of the election to look up. A list of election IDs can be obtained
   *        at.https://www.googleapis.com/civicinfo/{version}/elections
   *    * [officialOnly] If set to true, only data from official state sources will be returned.
   */
  core.Future<VoterInfoResponse> voterInfoQuery(core.String electionId, VoterInfoRequest content, {core.bool officialOnly}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["electionId"] = electionId;
    if (?officialOnly) $queryParams["officialOnly"] = officialOnly;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(VoterInfoRequest.serialize(content));
    final $path = "voterinfo/{electionId}/lookup";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => VoterInfoResponse.parse(JSON.parse($text)));
  }
}

// Schema .AdministrationRegion
class AdministrationRegion extends IdentityHash {
  /**
 * The city or county that provides election information for this voter. This object can have the
 * same elements as state.
 */
  AdministrationRegion localJurisdiction;

  /**
 * A list of sources for this area. If multiple sources are listed the data has been aggregated from
 * those sources.
 */
  core.List<Source> sources;

  /** The election administration body for this area. */
  AdministrativeBody electionAdministrationBody;

  /** The name of the jurisdiction. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static AdministrationRegion parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdministrationRegion();
    result.localJurisdiction = AdministrationRegion.parse(json["local_jurisdiction"]);
    result.sources = map(Source.parse)(json["sources"]);
    result.electionAdministrationBody = AdministrativeBody.parse(json["electionAdministrationBody"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdministrationRegion value) {
    if (value == null) return null;
    final result = {};
    result["local_jurisdiction"] = AdministrationRegion.serialize(value.localJurisdiction);
    result["sources"] = map(Source.serialize)(value.sources);
    result["electionAdministrationBody"] = AdministrativeBody.serialize(value.electionAdministrationBody);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .AdministrativeBody
class AdministrativeBody extends IdentityHash {
  /** A URL provided by this administrative body for information on absentee voting. */
  core.String absenteeVotingInfoUrl;

  /** A URL provided by this administrative body for looking up where to vote. */
  core.String votingLocationFinderUrl;

  /** The name of this election administrative body. */
  core.String name;

  /**
 * A URL provided by this administrative body for confirming that the voter is registered to vote.
 */
  core.String electionRegistrationConfirmationUrl;

  /** The mailing address of this administrative body. */
  SimpleAddressType correspondenceAddress;

  /** A URL provided by this administrative body for looking up how to register to vote. */
  core.String electionRegistrationUrl;

  /** The election officials for this election administrative body. */
  core.List<ElectionOfficial> electionOfficials;

  /** A URL provided by this administrative body for looking up general election information. */
  core.String electionInfoUrl;

  /** A URL provided by this administrative body describing election rules to the voter. */
  core.String electionRulesUrl;

  /** A description of the services this administrative body may provide. */
  core.List<core.String> voterServices;

  /** A URL provided by this administrative body to give contest information to the voter. */
  core.String ballotInfoUrl;

  /** A description of the hours of operation for this administrative body. */
  core.String hoursOfOperation;

  /** The physical address of this administrative body. */
  SimpleAddressType physicalAddress;

  /** Parses an instance from its JSON representation. */
  static AdministrativeBody parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AdministrativeBody();
    result.absenteeVotingInfoUrl = identity(json["absenteeVotingInfoUrl"]);
    result.votingLocationFinderUrl = identity(json["votingLocationFinderUrl"]);
    result.name = identity(json["name"]);
    result.electionRegistrationConfirmationUrl = identity(json["electionRegistrationConfirmationUrl"]);
    result.correspondenceAddress = SimpleAddressType.parse(json["correspondenceAddress"]);
    result.electionRegistrationUrl = identity(json["electionRegistrationUrl"]);
    result.electionOfficials = map(ElectionOfficial.parse)(json["electionOfficials"]);
    result.electionInfoUrl = identity(json["electionInfoUrl"]);
    result.electionRulesUrl = identity(json["electionRulesUrl"]);
    result.voterServices = map(identity)(json["voter_services"]);
    result.ballotInfoUrl = identity(json["ballotInfoUrl"]);
    result.hoursOfOperation = identity(json["hoursOfOperation"]);
    result.physicalAddress = SimpleAddressType.parse(json["physicalAddress"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AdministrativeBody value) {
    if (value == null) return null;
    final result = {};
    result["absenteeVotingInfoUrl"] = identity(value.absenteeVotingInfoUrl);
    result["votingLocationFinderUrl"] = identity(value.votingLocationFinderUrl);
    result["name"] = identity(value.name);
    result["electionRegistrationConfirmationUrl"] = identity(value.electionRegistrationConfirmationUrl);
    result["correspondenceAddress"] = SimpleAddressType.serialize(value.correspondenceAddress);
    result["electionRegistrationUrl"] = identity(value.electionRegistrationUrl);
    result["electionOfficials"] = map(ElectionOfficial.serialize)(value.electionOfficials);
    result["electionInfoUrl"] = identity(value.electionInfoUrl);
    result["electionRulesUrl"] = identity(value.electionRulesUrl);
    result["voter_services"] = map(identity)(value.voterServices);
    result["ballotInfoUrl"] = identity(value.ballotInfoUrl);
    result["hoursOfOperation"] = identity(value.hoursOfOperation);
    result["physicalAddress"] = SimpleAddressType.serialize(value.physicalAddress);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Candidate
class Candidate extends IdentityHash {
  /** The candidate's name. */
  core.String name;

  /** A URL for a photo of the candidate. */
  core.String photoUrl;

  /** The URL for the candidate's campaign web site. */
  core.String candidateUrl;

  /** A list of known (social) media channels for this candidate. */
  core.List<Channel> channels;

  /** The voice phone number for the candidate's campaign office. */
  core.String phone;

  /** The order the candidate appears on the ballot for this contest. */
  core.String orderOnBallot;

  /** The full name of the party the candidate is a member of. */
  core.String party;

  /** The email address for the candidate's campaign. */
  core.String email;

  /** Parses an instance from its JSON representation. */
  static Candidate parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Candidate();
    result.name = identity(json["name"]);
    result.photoUrl = identity(json["photoUrl"]);
    result.candidateUrl = identity(json["candidateUrl"]);
    result.channels = map(Channel.parse)(json["channels"]);
    result.phone = identity(json["phone"]);
    result.orderOnBallot = identity(json["orderOnBallot"]);
    result.party = identity(json["party"]);
    result.email = identity(json["email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Candidate value) {
    if (value == null) return null;
    final result = {};
    result["name"] = identity(value.name);
    result["photoUrl"] = identity(value.photoUrl);
    result["candidateUrl"] = identity(value.candidateUrl);
    result["channels"] = map(Channel.serialize)(value.channels);
    result["phone"] = identity(value.phone);
    result["orderOnBallot"] = identity(value.orderOnBallot);
    result["party"] = identity(value.party);
    result["email"] = identity(value.email);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Channel
class Channel extends IdentityHash {
  /**
 * The type of channel. The following is a list of types of channels, but is not exhaustive. More
 * channel types may be added at a later time. One of: GooglePlus, YouTube, Facebook, Twitter
 */
  core.String type;

  /** The unique public identifier for the candidate's channel. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Channel parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Channel();
    result.type = identity(json["type"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Channel value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Contest
class Contest extends IdentityHash {
  /** The number of candidates that a voter may vote for in this contest. */
  core.String numberVotingFor;

  /** The name of the office for this contest. */
  core.String office;

  /** Information about the electoral district that this contest is in. */
  ElectoralDistrict district;

  /** The level of office for this contest. One of: federal, state, county, city, other */
  core.String level;

  /**
 * The type of contest. Usually this will be 'General', 'Primary', or 'Run-off' for contests with
 * candidates. For referenda this will be 'Referendum'.
 */
  core.String type;

  /** A number specifying the position of this contest on the voter's ballot. */
  core.String ballotPlacement;

  /**
 * A list of sources for this contest. If multiple sources are listed, the data has been aggregated
 * from those sources.
 */
  core.List<Source> sources;

  /**
 * A brief description of the referendum. This field is only populated for contests of type
 * 'Referendum'.
 */
  core.String referendumSubtitle;

  /** If this is a partisan election, the name of the party it is for. */
  core.String primaryParty;

  /** The candidate choices for this contest. */
  core.List<Candidate> candidates;

  /** The number of candidates that will be elected to office in this contest. */
  core.String numberElected;

  /** A link the referendum. This field is only populated for contests of type 'Referendum'. */
  core.String referendumUrl;

  /** A description of any additional eligibility requirements for voting in this contest. */
  core.String electorateSpecifications;

  /**
 * The title of the referendum. (e.g. 'Proposition 42') This field is only populated for contests of
 * type 'Referendum'.
 */
  core.String referendumTitle;

  /**
 * "Yes" or "No" depending on whether this a contest being held outside the normal election cycle.
 */
  core.String special;

  /** Parses an instance from its JSON representation. */
  static Contest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Contest();
    result.numberVotingFor = identity(json["numberVotingFor"]);
    result.office = identity(json["office"]);
    result.district = ElectoralDistrict.parse(json["district"]);
    result.level = identity(json["level"]);
    result.type = identity(json["type"]);
    result.ballotPlacement = identity(json["ballotPlacement"]);
    result.sources = map(Source.parse)(json["sources"]);
    result.referendumSubtitle = identity(json["referendumSubtitle"]);
    result.primaryParty = identity(json["primaryParty"]);
    result.candidates = map(Candidate.parse)(json["candidates"]);
    result.numberElected = identity(json["numberElected"]);
    result.referendumUrl = identity(json["referendumUrl"]);
    result.electorateSpecifications = identity(json["electorateSpecifications"]);
    result.referendumTitle = identity(json["referendumTitle"]);
    result.special = identity(json["special"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Contest value) {
    if (value == null) return null;
    final result = {};
    result["numberVotingFor"] = identity(value.numberVotingFor);
    result["office"] = identity(value.office);
    result["district"] = ElectoralDistrict.serialize(value.district);
    result["level"] = identity(value.level);
    result["type"] = identity(value.type);
    result["ballotPlacement"] = identity(value.ballotPlacement);
    result["sources"] = map(Source.serialize)(value.sources);
    result["referendumSubtitle"] = identity(value.referendumSubtitle);
    result["primaryParty"] = identity(value.primaryParty);
    result["candidates"] = map(Candidate.serialize)(value.candidates);
    result["numberElected"] = identity(value.numberElected);
    result["referendumUrl"] = identity(value.referendumUrl);
    result["electorateSpecifications"] = identity(value.electorateSpecifications);
    result["referendumTitle"] = identity(value.referendumTitle);
    result["special"] = identity(value.special);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Election
class Election extends IdentityHash {
  /** Day of the election in YYYY-MM-DD format. */
  core.String electionDay;

  /** The unique ID of this election. */
  core.String id;

  /** A displayable name for the election. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Election parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Election();
    result.electionDay = identity(json["electionDay"]);
    result.id = identity(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Election value) {
    if (value == null) return null;
    final result = {};
    result["electionDay"] = identity(value.electionDay);
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ElectionOfficial
class ElectionOfficial extends IdentityHash {
  /** The title of the election official. */
  core.String title;

  /** The email address of the election official. */
  core.String emailAddress;

  /** The full name of the election official. */
  core.String name;

  /** The office phone number of the election official. */
  core.String officePhoneNumber;

  /** The fax number of the election official. */
  core.String faxNumber;

  /** Parses an instance from its JSON representation. */
  static ElectionOfficial parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ElectionOfficial();
    result.title = identity(json["title"]);
    result.emailAddress = identity(json["emailAddress"]);
    result.name = identity(json["name"]);
    result.officePhoneNumber = identity(json["officePhoneNumber"]);
    result.faxNumber = identity(json["faxNumber"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ElectionOfficial value) {
    if (value == null) return null;
    final result = {};
    result["title"] = identity(value.title);
    result["emailAddress"] = identity(value.emailAddress);
    result["name"] = identity(value.name);
    result["officePhoneNumber"] = identity(value.officePhoneNumber);
    result["faxNumber"] = identity(value.faxNumber);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ElectionsQueryResponse
class ElectionsQueryResponse extends IdentityHash {
  /** The kind, fixed to "civicinfo#electionsQueryResponse". */
  core.String kind;

  /** A list of available elections */
  core.List<Election> elections;

  /** Parses an instance from its JSON representation. */
  static ElectionsQueryResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ElectionsQueryResponse();
    result.kind = identity(json["kind"]);
    result.elections = map(Election.parse)(json["elections"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ElectionsQueryResponse value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["elections"] = map(Election.serialize)(value.elections);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ElectoralDistrict
class ElectoralDistrict extends IdentityHash {
  /**
 * The geographic scope of this district. If unspecified the district's geography is not known. One
 * of: statewide, congressional, stateUpper, stateLower, countywide, judicial, schoolBoard,
 * cityWide, special
 */
  core.String scope;

  /**
 * An identifier for this district, relative to its scope. For example, the 34th State Senate
 * district would have id "34" and a scope of stateUpper.
 */
  core.String id;

  /** The name of the district. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static ElectoralDistrict parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ElectoralDistrict();
    result.scope = identity(json["scope"]);
    result.id = identity(json["id"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ElectoralDistrict value) {
    if (value == null) return null;
    final result = {};
    result["scope"] = identity(value.scope);
    result["id"] = identity(value.id);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PollingLocation
class PollingLocation extends IdentityHash {
  /**
 * The first date that this early vote site may be used. This field is not populated for polling
 * locations.
 */
  core.String startDate;

  /** A description of when this location is open. */
  core.String pollingHours;

  /**
 * The last date that this early vote site may be used. This field is not populated for polling
 * locations.
 */
  core.String endDate;

  /** The name of the early vote site. This field is not populated for polling locations. */
  core.String name;

  /** Notes about this location (e.g. accessibility ramp or entrance to use) */
  core.String notes;

  /**
 * The services provided by this early vote site. This field is not populated for polling locations.
 */
  core.String voterServices;

  /**
 * A list of sources for this location. If multiple sources are listed the data has been aggregated
 * from those sources.
 */
  core.List<Source> sources;

  /** The address of the location */
  SimpleAddressType address;

  /** Parses an instance from its JSON representation. */
  static PollingLocation parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PollingLocation();
    result.startDate = identity(json["startDate"]);
    result.pollingHours = identity(json["pollingHours"]);
    result.endDate = identity(json["endDate"]);
    result.name = identity(json["name"]);
    result.notes = identity(json["notes"]);
    result.voterServices = identity(json["voterServices"]);
    result.sources = map(Source.parse)(json["sources"]);
    result.address = SimpleAddressType.parse(json["address"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PollingLocation value) {
    if (value == null) return null;
    final result = {};
    result["startDate"] = identity(value.startDate);
    result["pollingHours"] = identity(value.pollingHours);
    result["endDate"] = identity(value.endDate);
    result["name"] = identity(value.name);
    result["notes"] = identity(value.notes);
    result["voterServices"] = identity(value.voterServices);
    result["sources"] = map(Source.serialize)(value.sources);
    result["address"] = SimpleAddressType.serialize(value.address);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SimpleAddressType
class SimpleAddressType extends IdentityHash {
  /** The city or town for the address. */
  core.String city;

  /** The US Postal Zip Code of the address. */
  core.String zip;

  /** The third line of the address, if needed. */
  core.String line3;

  /** The second line the address, if needed. */
  core.String line2;

  /** The street name and number of this address. */
  core.String line1;

  /** The name of the location. */
  core.String locationName;

  /** The US two letter state abbreviation of the address. */
  core.String state;

  /** Parses an instance from its JSON representation. */
  static SimpleAddressType parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SimpleAddressType();
    result.city = identity(json["city"]);
    result.zip = identity(json["zip"]);
    result.line3 = identity(json["line3"]);
    result.line2 = identity(json["line2"]);
    result.line1 = identity(json["line1"]);
    result.locationName = identity(json["locationName"]);
    result.state = identity(json["state"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SimpleAddressType value) {
    if (value == null) return null;
    final result = {};
    result["city"] = identity(value.city);
    result["zip"] = identity(value.zip);
    result["line3"] = identity(value.line3);
    result["line2"] = identity(value.line2);
    result["line1"] = identity(value.line1);
    result["locationName"] = identity(value.locationName);
    result["state"] = identity(value.state);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Source
class Source extends IdentityHash {
  /** Whether this data comes from an official government source. */
  core.bool official;

  /** The name of the data source. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Source parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Source();
    result.official = identity(json["official"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Source value) {
    if (value == null) return null;
    final result = {};
    result["official"] = identity(value.official);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VoterInfoRequest
class VoterInfoRequest extends IdentityHash {
  /** The registered address of the voter to look up. */
  core.String address;

  /** Parses an instance from its JSON representation. */
  static VoterInfoRequest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VoterInfoRequest();
    result.address = identity(json["address"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VoterInfoRequest value) {
    if (value == null) return null;
    final result = {};
    result["address"] = identity(value.address);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VoterInfoResponse
class VoterInfoResponse extends IdentityHash {
  /**
 * The result of the request. One of: success, noStreetSegmentFound, addressUnparseable,
 * noAddressParameter, multipleStreetSegmentsFound, electionOver, electionUnknown,
 * internalLookupFailure
 */
  core.String status;

  /** Locations where the voter is eligible to vote early, prior to election day */
  core.List<PollingLocation> earlyVoteSites;

  /** The kind, fixed to "civicinfo#voterInfoResponse". */
  core.String kind;

  /** The normalized version of the requested address */
  SimpleAddressType normalizedInput;

  /**
 * Local Election Information for the state that the voter votes in. For the US, there will only be
 * one element in this array.
 */
  core.List<AdministrationRegion> state;

  /** The election that was queried. */
  Election election;

  /**
 * Locations where the voter is eligible to vote on election day. For states with mail-in voting
 * only, these locations will be nearby drop box locations. Drop box locations are free to the voter
 * and may be used instead of placing the ballot in the mail.
 */
  core.List<PollingLocation> pollingLocations;

  /** Contests that will appear on the voter's ballot */
  core.List<Contest> contests;

  /** Parses an instance from its JSON representation. */
  static VoterInfoResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VoterInfoResponse();
    result.status = identity(json["status"]);
    result.earlyVoteSites = map(PollingLocation.parse)(json["earlyVoteSites"]);
    result.kind = identity(json["kind"]);
    result.normalizedInput = SimpleAddressType.parse(json["normalizedInput"]);
    result.state = map(AdministrationRegion.parse)(json["state"]);
    result.election = Election.parse(json["election"]);
    result.pollingLocations = map(PollingLocation.parse)(json["pollingLocations"]);
    result.contests = map(Contest.parse)(json["contests"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VoterInfoResponse value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["earlyVoteSites"] = map(PollingLocation.serialize)(value.earlyVoteSites);
    result["kind"] = identity(value.kind);
    result["normalizedInput"] = SimpleAddressType.serialize(value.normalizedInput);
    result["state"] = map(AdministrationRegion.serialize)(value.state);
    result["election"] = Election.serialize(value.election);
    result["pollingLocations"] = map(PollingLocation.serialize)(value.pollingLocations);
    result["contests"] = map(Contest.serialize)(value.contests);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum CivicInfoApi.Alt
class CivicInfoApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const CivicInfoApiAlt JSON = const CivicInfoApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<CivicInfoApiAlt> values = const <CivicInfoApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <CivicInfoApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CivicInfoApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const CivicInfoApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

