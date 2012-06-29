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

#library('groupssettings-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API GroupssettingsApi
/**
 * Lets you manage permission levels and related settings of a group
 */
class GroupssettingsApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  GroupssettingsApi get _$service() => this;
  GroupsResource _groups;
  GroupsResource get groups() => _groups;
  
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
  GroupssettingsApiAlt alt;


  GroupssettingsApi([this.baseUrl = "https://www.googleapis.com/groups/v1/groups/", this.applicationName, this.authenticator]) { 
    _groups = new GroupsResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}groupssettings/v1/20120516 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage the settings of a Google Apps Group */
  static final core.String APPS_GROUPS_SETTINGS_SCOPE = "https://www.googleapis.com/auth/apps.groups.settings";
}

// Resource .GroupsResource
class GroupsResource extends core.Object {
  final GroupssettingsApi _$service;
  
  GroupsResource._internal(GroupssettingsApi $service) : _$service = $service;

  // Method GroupsResource.Patch
  /**
   * Updates an existing resource. This method supports patch semantics.
   *
   *    * [content] the Groups
   *    * [groupUniqueId] The resource ID
   */
  core.Future<Groups> patch(core.String groupUniqueId, Groups content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["groupUniqueId"] = groupUniqueId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Groups.serialize(content));
    final $path = "{groupUniqueId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Groups.parse(JSON.parse($text)));
  }

  // Method GroupsResource.Update
  /**
   * Updates an existing resource.
   *
   *    * [content] the Groups
   *    * [groupUniqueId] The resource ID
   */
  core.Future<Groups> update(core.String groupUniqueId, Groups content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["groupUniqueId"] = groupUniqueId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Groups.serialize(content));
    final $path = "{groupUniqueId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Groups.parse(JSON.parse($text)));
  }

  // Method GroupsResource.Get
  /**
   * Gets one resource by id.
   *
   *    * [groupUniqueId] The resource ID
   */
  core.Future<Groups> get(core.String groupUniqueId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["groupUniqueId"] = groupUniqueId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "{groupUniqueId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Groups.parse(JSON.parse($text)));
  }
}

// Schema .Groups
class Groups extends IdentityHash {
  /** Are external members allowed to join the group. */
  core.String allowExternalMembers;

  /**
 * Permissions to join the group. Possible values are: ANYONE_CAN_JOIN ALL_IN_DOMAIN_CAN_JOIN
 * INVITED_CAN_JOIN CAN_REQUEST_TO_JOIN
 */
  core.String whoCanJoin;

  /** Primary language for the group. */
  core.String primaryLanguage;

  /**
 * Permissions to view membership. Possbile values are: ALL_IN_DOMAIN_CAN_VIEW ALL_MEMBERS_CAN_VIEW
 * ALL_MANAGERS_CAN_VIEW
 */
  core.String whoCanViewMembership;

  /** Default message deny notification message */
  core.String defaultMessageDenyNotificationText;

  /** If the group is archive only */
  core.String archiveOnly;

  /** If the contents of the group are archived. */
  core.String isArchived;

  /** Can members post using the group email address. */
  core.String membersCanPostAsTheGroup;

  /** If posting from web is allowed. */
  core.String allowWebPosting;

  /** Email id of the group */
  core.String email;

  /**
 * Moderation level for messages. Possible values are: MODERATE_ALL_MESSAGES MODERATE_NON_MEMBERS
 * MODERATE_NEW_MEMBERS MODERATE_NONE
 */
  core.String messageModerationLevel;

  /** Description of the group */
  core.String description;

  /**
 * Whome should the default reply to a message go to. Possible values are: REPLY_TO_CUSTOM
 * REPLY_TO_SENDER REPLY_TO_LIST REPLY_TO_OWNER REPLY_TO_IGNORE REPLY_TO_MANAGERS
 */
  core.String replyTo;

  /** Default email to which reply to any message should go. */
  core.String customReplyTo;

  /** Should the member be notified if his message is denied by owner. */
  core.String sendMessageDenyNotification;

  /** Default message display font. Possible values are: DEFAULT_FONT FIXED_WIDTH_FONT */
  core.String messageDisplayFont;

  /**
 * Permissions to post messages to the group. Possible values are: NONE_CAN_POST
 * ALL_MANAGERS_CAN_POST ALL_MEMBERS_CAN_POST ALL_IN_DOMAIN_CAN_POST ANYONE_CAN_POST
 */
  core.String whoCanPostMessage;

  /** Name of the Group */
  core.String name;

  /** The type of the resource. */
  core.String kind;

  /**
 * Permissions to invite members. Possbile values are: ALL_MEMBERS_CAN_INVITE
 * ALL_MANAGERS_CAN_INVITE
 */
  core.String whoCanInvite;

  /**
 * Permissions to view group. Possbile values are: ANYONE_CAN_VIEW ALL_IN_DOMAIN_CAN_VIEW
 * ALL_MEMBERS_CAN_VIEW ALL_MANAGERS_CAN_VIEW
 */
  core.String whoCanViewGroup;

  /** Is the group listed in groups directory */
  core.String showInGroupDirectory;

  /** Maximum message size allowed. */
  core.int maxMessageBytes;

  /** Is google allowed to contact admins. */
  core.String allowGoogleCommunication;

  /** Parses an instance from its JSON representation. */
  static Groups parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Groups();
    result.allowExternalMembers = identity(json["allowExternalMembers"]);
    result.whoCanJoin = identity(json["whoCanJoin"]);
    result.primaryLanguage = identity(json["primaryLanguage"]);
    result.whoCanViewMembership = identity(json["whoCanViewMembership"]);
    result.defaultMessageDenyNotificationText = identity(json["defaultMessageDenyNotificationText"]);
    result.archiveOnly = identity(json["archiveOnly"]);
    result.isArchived = identity(json["isArchived"]);
    result.membersCanPostAsTheGroup = identity(json["membersCanPostAsTheGroup"]);
    result.allowWebPosting = identity(json["allowWebPosting"]);
    result.email = identity(json["email"]);
    result.messageModerationLevel = identity(json["messageModerationLevel"]);
    result.description = identity(json["description"]);
    result.replyTo = identity(json["replyTo"]);
    result.customReplyTo = identity(json["customReplyTo"]);
    result.sendMessageDenyNotification = identity(json["sendMessageDenyNotification"]);
    result.messageDisplayFont = identity(json["messageDisplayFont"]);
    result.whoCanPostMessage = identity(json["whoCanPostMessage"]);
    result.name = identity(json["name"]);
    result.kind = identity(json["kind"]);
    result.whoCanInvite = identity(json["whoCanInvite"]);
    result.whoCanViewGroup = identity(json["whoCanViewGroup"]);
    result.showInGroupDirectory = identity(json["showInGroupDirectory"]);
    result.maxMessageBytes = identity(json["maxMessageBytes"]);
    result.allowGoogleCommunication = identity(json["allowGoogleCommunication"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Groups value) {
    if (value == null) return null;
    final result = {};
    result["allowExternalMembers"] = identity(value.allowExternalMembers);
    result["whoCanJoin"] = identity(value.whoCanJoin);
    result["primaryLanguage"] = identity(value.primaryLanguage);
    result["whoCanViewMembership"] = identity(value.whoCanViewMembership);
    result["defaultMessageDenyNotificationText"] = identity(value.defaultMessageDenyNotificationText);
    result["archiveOnly"] = identity(value.archiveOnly);
    result["isArchived"] = identity(value.isArchived);
    result["membersCanPostAsTheGroup"] = identity(value.membersCanPostAsTheGroup);
    result["allowWebPosting"] = identity(value.allowWebPosting);
    result["email"] = identity(value.email);
    result["messageModerationLevel"] = identity(value.messageModerationLevel);
    result["description"] = identity(value.description);
    result["replyTo"] = identity(value.replyTo);
    result["customReplyTo"] = identity(value.customReplyTo);
    result["sendMessageDenyNotification"] = identity(value.sendMessageDenyNotification);
    result["messageDisplayFont"] = identity(value.messageDisplayFont);
    result["whoCanPostMessage"] = identity(value.whoCanPostMessage);
    result["name"] = identity(value.name);
    result["kind"] = identity(value.kind);
    result["whoCanInvite"] = identity(value.whoCanInvite);
    result["whoCanViewGroup"] = identity(value.whoCanViewGroup);
    result["showInGroupDirectory"] = identity(value.showInGroupDirectory);
    result["maxMessageBytes"] = identity(value.maxMessageBytes);
    result["allowGoogleCommunication"] = identity(value.allowGoogleCommunication);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum GroupssettingsApi.Alt
class GroupssettingsApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final GroupssettingsApiAlt ATOM = const GroupssettingsApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final GroupssettingsApiAlt JSON = const GroupssettingsApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final core.List<GroupssettingsApiAlt> values = const <GroupssettingsApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <GroupssettingsApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static GroupssettingsApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const GroupssettingsApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

