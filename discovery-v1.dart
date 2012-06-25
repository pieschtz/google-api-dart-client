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

#library('discovery-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API DiscoveryApi
/**
 * Lets you discover information about other Google APIs, such as what APIs are available, the
 * resource and method details for each API
 */
class DiscoveryApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  DiscoveryApi get _$service() => this;
  ApisResource _apis;
  ApisResource get apis() => _apis;
  
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
  DiscoveryApiAlt alt;


  DiscoveryApi([this.baseUrl = "https://www.googleapis.com/discovery/v1/", this.applicationName, this.authenticator]) { 
    _apis = new ApisResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}discovery/v1/snapshot google-api-dart-client/${clientVersion}";
  }

}

// Resource .ApisResource
class ApisResource extends core.Object {
  final DiscoveryApi _$service;
  
  ApisResource._internal(DiscoveryApi $service) : _$service = $service;

  // Method ApisResource.GetRest
  /**
   * Retrieve the description of a particular version of an api.
   * [api] The name of the API.
   * [version] The version of the API.
   */
  core.Future<RestDescription> getRest(core.String api, core.String version) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["api"] = api;
    $pathParams["version"] = version;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "apis/{api}/{version}/rest";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => RestDescription.parse(JSON.parse($text)));
  }

  // Method ApisResource.List
  /**
   * Retrieve the list of APIs supported at this endpoint.
   */
  core.Future<DirectoryList> list([core.String name = UNSPECIFIED, core.bool preferred = UNSPECIFIED, ApisResourceListLabel label = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != name) $queryParams["name"] = name;
    if (UNSPECIFIED != preferred) $queryParams["preferred"] = preferred;
    if (UNSPECIFIED != label) $queryParams["label"] = label;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "apis";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => DirectoryList.parse(JSON.parse($text)));
  }
}

// Enum ApisResource.List.Label
class ApisResourceListLabel extends core.Object implements core.Hashable {
  /** APIs that have been deprecated. */
  static final ApisResourceListLabel DEPRECATED = const ApisResourceListLabel._internal("deprecated", 0);
  /** Supported APIs that have graduated from labs. */
  static final ApisResourceListLabel GRADUATED = const ApisResourceListLabel._internal("graduated", 1);
  /** APIs that are experimental */
  static final ApisResourceListLabel LABS = const ApisResourceListLabel._internal("labs", 2);

  /** All values of this enumeration */
  static final core.List<ApisResourceListLabel> values = const <ApisResourceListLabel>[
    DEPRECATED,
    GRADUATED,
    LABS,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ApisResourceListLabel>{ 
    "deprecated": DEPRECATED,
    "graduated": GRADUATED,
    "labs": LABS,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ApisResourceListLabel valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ApisResourceListLabel._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Label".hashCode();
}

// Schema .DirectoryList
class DirectoryList extends IdentityHash {
  /** The individual directory entries. One entry per api/version pair. */
  core.List<DirectoryListItems> items;

  /** Indicate the version of the Discovery API used to generate this doc. */
  core.String discoveryVersion;

  /** The kind for this response. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static DirectoryList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DirectoryList();
    result.items = map(DirectoryListItems.parse)(json["items"]);
    result.discoveryVersion = identity(json["discoveryVersion"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DirectoryList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(DirectoryListItems.serialize)(value.items);
    result["discoveryVersion"] = identity(value.discoveryVersion);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema DirectoryList.DirectoryListItems
class DirectoryListItems extends IdentityHash {
  /** The kind for this response. */
  core.String kind;

  /** Labels for the status of this API, such as labs or deprecated. */
  core.List<core.String> labels;

  /** The description of this API. */
  core.String description;

  /** Links to 16x16 and 32x32 icons representing the API. */
  DirectoryListItemsIcons icons;

  /** The url for the discovery REST document. */
  core.String discoveryRestUrl;

  /** True if this version is the preferred version to use. */
  core.bool preferred;

  /** The name of the API. */
  core.String name;

  /** A link to the discovery document. */
  core.String discoveryLink;

  /** The version of the API. */
  core.String version;

  /** The title of this API. */
  core.String title;

  /** The id of this API. */
  core.String id;

  /** A link to human readable documentation for the API. */
  core.String documentationLink;

  /** Parses an instance from its JSON representation. */
  static DirectoryListItems parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DirectoryListItems();
    result.kind = identity(json["kind"]);
    result.labels = map(identity)(json["labels"]);
    result.description = identity(json["description"]);
    result.icons = DirectoryListItemsIcons.parse(json["icons"]);
    result.discoveryRestUrl = identity(json["discoveryRestUrl"]);
    result.preferred = identity(json["preferred"]);
    result.name = identity(json["name"]);
    result.discoveryLink = identity(json["discoveryLink"]);
    result.version = identity(json["version"]);
    result.title = identity(json["title"]);
    result.id = identity(json["id"]);
    result.documentationLink = identity(json["documentationLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DirectoryListItems value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["labels"] = map(identity)(value.labels);
    result["description"] = identity(value.description);
    result["icons"] = DirectoryListItemsIcons.serialize(value.icons);
    result["discoveryRestUrl"] = identity(value.discoveryRestUrl);
    result["preferred"] = identity(value.preferred);
    result["name"] = identity(value.name);
    result["discoveryLink"] = identity(value.discoveryLink);
    result["version"] = identity(value.version);
    result["title"] = identity(value.title);
    result["id"] = identity(value.id);
    result["documentationLink"] = identity(value.documentationLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema DirectoryList.DirectoryListItems.DirectoryListItemsIcons
class DirectoryListItemsIcons extends IdentityHash {
  /** The url of the 32x32 icon. */
  core.String x32;

  /** The url of the 16x16 icon. */
  core.String x16;

  /** Parses an instance from its JSON representation. */
  static DirectoryListItemsIcons parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DirectoryListItemsIcons();
    result.x32 = identity(json["x32"]);
    result.x16 = identity(json["x16"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DirectoryListItemsIcons value) {
    if (value == null) return null;
    final result = {};
    result["x32"] = identity(value.x32);
    result["x16"] = identity(value.x16);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .JsonSchema
class JsonSchema extends IdentityHash {
  /** If this is a schema for an object, list the schema for each property of this object. */
  core.Map<core.String, JsonSchema> properties;

  /** Whether the parameter is required. */
  core.bool required;

  /**
 * The value type for this schema. A list of values can be found here: http://tools.ietf.org/html
 * /draft-zyp-json-schema-03#section-5.1
 */
  core.String type;

  /** A description of this object. */
  core.String description;

  /**
 * An additional regular expression or key that helps constrain the value. For more details see:
 * http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.23
 */
  core.String format;

  /** The default value of this property (if one exists). */
  core.String default_;

  /** If this is a schema for an array, this property is the schema for each element in the array. */
  JsonSchema items;

  /** Values this parameter may take (if it is an enum). */
  core.List<core.String> enum;

  /** The maximum value of this parameter. */
  core.String maximum;

  /** Unique identifier for this schema. */
  core.String id;

  /**
 * The descriptions for the enums. Each position maps to the corresponding value in the "enum"
 * array.
 */
  core.List<core.String> enumDescriptions;

  /** The minimum value of this parameter. */
  core.String minimum;

  /** Whether this parameter goes in the query or the path for REST requests. */
  core.String location;

  /** The regular expression this parameter must conform to. */
  core.String pattern;

  /**
 * If this is a schema for an object, this property is the schema for any additional properties with
 * dynamic keys on this object.
 */
  JsonSchema additionalProperties;

  /** Whether this parameter may appear multiple times. */
  core.bool repeated;

  /** Additional information about this property. */
  JsonSchemaAnnotations annotations;

  /** A reference to another schema. The value of this property is the "id" of another schema. */
  core.String $ref;

  /** Parses an instance from its JSON representation. */
  static JsonSchema parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new JsonSchema();
    result.properties = mapValues(JsonSchema.parse)(json["properties"]);
    result.required = identity(json["required"]);
    result.type = identity(json["type"]);
    result.description = identity(json["description"]);
    result.format = identity(json["format"]);
    result.default_ = identity(json["default"]);
    result.items = JsonSchema.parse(json["items"]);
    result.enum = map(identity)(json["enum"]);
    result.maximum = identity(json["maximum"]);
    result.id = identity(json["id"]);
    result.enumDescriptions = map(identity)(json["enumDescriptions"]);
    result.minimum = identity(json["minimum"]);
    result.location = identity(json["location"]);
    result.pattern = identity(json["pattern"]);
    result.additionalProperties = JsonSchema.parse(json["additionalProperties"]);
    result.repeated = identity(json["repeated"]);
    result.annotations = JsonSchemaAnnotations.parse(json["annotations"]);
    result.$ref = identity(json["\$ref"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(JsonSchema value) {
    if (value == null) return null;
    final result = {};
    result["properties"] = mapValues(JsonSchema.serialize)(value.properties);
    result["required"] = identity(value.required);
    result["type"] = identity(value.type);
    result["description"] = identity(value.description);
    result["format"] = identity(value.format);
    result["default"] = identity(value.default_);
    result["items"] = JsonSchema.serialize(value.items);
    result["enum"] = map(identity)(value.enum);
    result["maximum"] = identity(value.maximum);
    result["id"] = identity(value.id);
    result["enumDescriptions"] = map(identity)(value.enumDescriptions);
    result["minimum"] = identity(value.minimum);
    result["location"] = identity(value.location);
    result["pattern"] = identity(value.pattern);
    result["additionalProperties"] = JsonSchema.serialize(value.additionalProperties);
    result["repeated"] = identity(value.repeated);
    result["annotations"] = JsonSchemaAnnotations.serialize(value.annotations);
    result["\$ref"] = identity(value.$ref);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema JsonSchema.JsonSchemaAnnotations
class JsonSchemaAnnotations extends IdentityHash {
  /** A list of methods for which this property is required on requests. */
  core.List<core.String> required;

  /** Parses an instance from its JSON representation. */
  static JsonSchemaAnnotations parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new JsonSchemaAnnotations();
    result.required = map(identity)(json["required"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(JsonSchemaAnnotations value) {
    if (value == null) return null;
    final result = {};
    result["required"] = map(identity)(value.required);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .RestDescription
class RestDescription extends IdentityHash {
  /** The protocol described by this document. */
  core.String protocol;

  /** API-level methods for this API. */
  core.Map<core.String, RestMethod> methods;

  /** Labels for the status of this API, such as labs or deprecated. */
  core.List<core.String> labels;

  /** The path for REST batch requests. */
  core.String batchPath;

  /** The id of this API. */
  core.String id;

  /** The schemas for this API. */
  core.Map<core.String, JsonSchema> schemas;

  /** The root url under which all API services live. */
  core.String rootUrl;

  /** Common parameters that apply across all apis. */
  core.Map<core.String, JsonSchema> parameters;

  /** Links to 16x16 and 32x32 icons representing the API. */
  RestDescriptionIcons icons;

  /** [DEPRECATED] The base URL for REST requests. */
  core.String baseUrl;

  /** The version of this API. */
  core.String version;

  /** A list of supported features for this API. */
  core.List<core.String> features;

  /** The base path for all REST requests. */
  core.String servicePath;

  /** The resources in this API. */
  core.Map<core.String, RestResource> resources;

  /** The version of this API. */
  core.String revision;

  /** The description of this API. */
  core.String description;

  /** Authentication information. */
  RestDescriptionAuth auth;

  /** The kind for this response. */
  core.String kind;

  /** The name of this API. */
  core.String name;

  /** [DEPRECATED] The base path for REST requests. */
  core.String basePath;

  /** The title of this API. */
  core.String title;

  /** Indicate the version of the Discovery API used to generate this doc. */
  core.String discoveryVersion;

  /** A link to human readable documentation for the API. */
  core.String documentationLink;

  /** Parses an instance from its JSON representation. */
  static RestDescription parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestDescription();
    result.protocol = identity(json["protocol"]);
    result.methods = mapValues(RestMethod.parse)(json["methods"]);
    result.labels = map(identity)(json["labels"]);
    result.batchPath = identity(json["batchPath"]);
    result.id = identity(json["id"]);
    result.schemas = mapValues(JsonSchema.parse)(json["schemas"]);
    result.rootUrl = identity(json["rootUrl"]);
    result.parameters = mapValues(JsonSchema.parse)(json["parameters"]);
    result.icons = RestDescriptionIcons.parse(json["icons"]);
    result.baseUrl = identity(json["baseUrl"]);
    result.version = identity(json["version"]);
    result.features = map(identity)(json["features"]);
    result.servicePath = identity(json["servicePath"]);
    result.resources = mapValues(RestResource.parse)(json["resources"]);
    result.revision = identity(json["revision"]);
    result.description = identity(json["description"]);
    result.auth = RestDescriptionAuth.parse(json["auth"]);
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.basePath = identity(json["basePath"]);
    result.title = identity(json["title"]);
    result.discoveryVersion = identity(json["discoveryVersion"]);
    result.documentationLink = identity(json["documentationLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestDescription value) {
    if (value == null) return null;
    final result = {};
    result["protocol"] = identity(value.protocol);
    result["methods"] = mapValues(RestMethod.serialize)(value.methods);
    result["labels"] = map(identity)(value.labels);
    result["batchPath"] = identity(value.batchPath);
    result["id"] = identity(value.id);
    result["schemas"] = mapValues(JsonSchema.serialize)(value.schemas);
    result["rootUrl"] = identity(value.rootUrl);
    result["parameters"] = mapValues(JsonSchema.serialize)(value.parameters);
    result["icons"] = RestDescriptionIcons.serialize(value.icons);
    result["baseUrl"] = identity(value.baseUrl);
    result["version"] = identity(value.version);
    result["features"] = map(identity)(value.features);
    result["servicePath"] = identity(value.servicePath);
    result["resources"] = mapValues(RestResource.serialize)(value.resources);
    result["revision"] = identity(value.revision);
    result["description"] = identity(value.description);
    result["auth"] = RestDescriptionAuth.serialize(value.auth);
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["basePath"] = identity(value.basePath);
    result["title"] = identity(value.title);
    result["discoveryVersion"] = identity(value.discoveryVersion);
    result["documentationLink"] = identity(value.documentationLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestDescription.RestDescriptionAuth
class RestDescriptionAuth extends IdentityHash {
  /** OAuth 2.0 authentication information. */
  RestDescriptionAuthOauth2 oauth2;

  /** Parses an instance from its JSON representation. */
  static RestDescriptionAuth parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestDescriptionAuth();
    result.oauth2 = RestDescriptionAuthOauth2.parse(json["oauth2"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestDescriptionAuth value) {
    if (value == null) return null;
    final result = {};
    result["oauth2"] = RestDescriptionAuthOauth2.serialize(value.oauth2);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestDescription.RestDescriptionAuth.RestDescriptionAuthOauth2
class RestDescriptionAuthOauth2 extends IdentityHash {
  /** Available OAuth 2.0 scopes. */
  core.Map<core.String, RestDescriptionAuthOauth2Scopes> scopes;

  /** Parses an instance from its JSON representation. */
  static RestDescriptionAuthOauth2 parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestDescriptionAuthOauth2();
    result.scopes = mapValues(RestDescriptionAuthOauth2Scopes.parse)(json["scopes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestDescriptionAuthOauth2 value) {
    if (value == null) return null;
    final result = {};
    result["scopes"] = mapValues(RestDescriptionAuthOauth2Scopes.serialize)(value.scopes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestDescription.RestDescriptionAuth.RestDescriptionAuthOauth2.RestDescriptionAuthOauth2Scopes
class RestDescriptionAuthOauth2Scopes extends IdentityHash {
  /** Description of scope. */
  core.String description;

  /** Parses an instance from its JSON representation. */
  static RestDescriptionAuthOauth2Scopes parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestDescriptionAuthOauth2Scopes();
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestDescriptionAuthOauth2Scopes value) {
    if (value == null) return null;
    final result = {};
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestDescription.RestDescriptionIcons
class RestDescriptionIcons extends IdentityHash {
  /** The url of the 32x32 icon. */
  core.String x32;

  /** The url of the 16x16 icon. */
  core.String x16;

  /** Parses an instance from its JSON representation. */
  static RestDescriptionIcons parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestDescriptionIcons();
    result.x32 = identity(json["x32"]);
    result.x16 = identity(json["x16"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestDescriptionIcons value) {
    if (value == null) return null;
    final result = {};
    result["x32"] = identity(value.x32);
    result["x16"] = identity(value.x16);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .RestMethod
class RestMethod extends IdentityHash {
  /** OAuth 2.0 scopes applicable to this method. */
  core.List<core.Object> scopes;

  /** Description of this method. */
  core.String description;

  /** Details for all parameters in this method. */
  core.Map<core.String, JsonSchema> parameters;

  /** Whether this method supports media uploads. */
  core.bool supportsMediaUpload;

  /** The schema for the request. */
  RestMethodRequest request;

  /** Media upload parameters. */
  RestMethodMediaUpload mediaUpload;

  /** The schema for the response. */
  RestMethodResponse response;

  /** HTTP method used by this method. */
  core.String httpMethod;

  /** Whether this method supports subscriptions. */
  core.bool supportsSubscription;

  /**
 * Ordered list of required parameters, serves as a hint to clients on how to structure their method
 * signatures. The array is ordered such that the "most-significant" parameter appears first.
 */
  core.List<core.String> parameterOrder;

  /**
 * The URI path of this REST method. Should be used in conjunction with the basePath property at the
 * api-level.
 */
  core.String path;

  /**
 * A unique ID for this method. This property can be used to match methods between different
 * versions of Discovery.
 */
  core.String id;

  /** Whether this method supports media downloads. */
  core.bool supportsMediaDownload;

  /** Parses an instance from its JSON representation. */
  static RestMethod parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethod();
    result.scopes = map(identity)(json["scopes"]);
    result.description = identity(json["description"]);
    result.parameters = mapValues(JsonSchema.parse)(json["parameters"]);
    result.supportsMediaUpload = identity(json["supportsMediaUpload"]);
    result.request = RestMethodRequest.parse(json["request"]);
    result.mediaUpload = RestMethodMediaUpload.parse(json["mediaUpload"]);
    result.response = RestMethodResponse.parse(json["response"]);
    result.httpMethod = identity(json["httpMethod"]);
    result.supportsSubscription = identity(json["supportsSubscription"]);
    result.parameterOrder = map(identity)(json["parameterOrder"]);
    result.path = identity(json["path"]);
    result.id = identity(json["id"]);
    result.supportsMediaDownload = identity(json["supportsMediaDownload"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethod value) {
    if (value == null) return null;
    final result = {};
    result["scopes"] = map(identity)(value.scopes);
    result["description"] = identity(value.description);
    result["parameters"] = mapValues(JsonSchema.serialize)(value.parameters);
    result["supportsMediaUpload"] = identity(value.supportsMediaUpload);
    result["request"] = RestMethodRequest.serialize(value.request);
    result["mediaUpload"] = RestMethodMediaUpload.serialize(value.mediaUpload);
    result["response"] = RestMethodResponse.serialize(value.response);
    result["httpMethod"] = identity(value.httpMethod);
    result["supportsSubscription"] = identity(value.supportsSubscription);
    result["parameterOrder"] = map(identity)(value.parameterOrder);
    result["path"] = identity(value.path);
    result["id"] = identity(value.id);
    result["supportsMediaDownload"] = identity(value.supportsMediaDownload);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestMethod.RestMethodMediaUpload
class RestMethodMediaUpload extends IdentityHash {
  /** Maximum size of a media upload, such as "1MB", "2GB" or "3TB". */
  core.String maxSize;

  /** Supported upload protocols. */
  RestMethodMediaUploadProtocols protocols;

  /** MIME Media Ranges for acceptable media uploads to this method. */
  core.List<core.String> accept;

  /** Parses an instance from its JSON representation. */
  static RestMethodMediaUpload parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethodMediaUpload();
    result.maxSize = identity(json["maxSize"]);
    result.protocols = RestMethodMediaUploadProtocols.parse(json["protocols"]);
    result.accept = map(identity)(json["accept"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethodMediaUpload value) {
    if (value == null) return null;
    final result = {};
    result["maxSize"] = identity(value.maxSize);
    result["protocols"] = RestMethodMediaUploadProtocols.serialize(value.protocols);
    result["accept"] = map(identity)(value.accept);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestMethod.RestMethodMediaUpload.RestMethodMediaUploadProtocols
class RestMethodMediaUploadProtocols extends IdentityHash {
  /** Supports uploading as a single HTTP request. */
  RestMethodMediaUploadProtocolsSimple simple;

  /** Supports the Resumable Media Upload protocol. */
  RestMethodMediaUploadProtocolsResumable resumable;

  /** Parses an instance from its JSON representation. */
  static RestMethodMediaUploadProtocols parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethodMediaUploadProtocols();
    result.simple = RestMethodMediaUploadProtocolsSimple.parse(json["simple"]);
    result.resumable = RestMethodMediaUploadProtocolsResumable.parse(json["resumable"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethodMediaUploadProtocols value) {
    if (value == null) return null;
    final result = {};
    result["simple"] = RestMethodMediaUploadProtocolsSimple.serialize(value.simple);
    result["resumable"] = RestMethodMediaUploadProtocolsResumable.serialize(value.resumable);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestMethod.RestMethodMediaUpload.RestMethodMediaUploadProtocols.RestMethodMediaUploadProtocolsResumable
class RestMethodMediaUploadProtocolsResumable extends IdentityHash {
  /**
 * The URI path to be used for upload. Should be used in conjunction with the basePath property at
 * the api-level.
 */
  core.String path;

  /** True if this endpoint supports uploading multipart media. */
  core.bool multipart;

  /** Parses an instance from its JSON representation. */
  static RestMethodMediaUploadProtocolsResumable parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethodMediaUploadProtocolsResumable();
    result.path = identity(json["path"]);
    result.multipart = identity(json["multipart"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethodMediaUploadProtocolsResumable value) {
    if (value == null) return null;
    final result = {};
    result["path"] = identity(value.path);
    result["multipart"] = identity(value.multipart);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestMethod.RestMethodMediaUpload.RestMethodMediaUploadProtocols.RestMethodMediaUploadProtocolsSimple
class RestMethodMediaUploadProtocolsSimple extends IdentityHash {
  /**
 * The URI path to be used for upload. Should be used in conjunction with the basePath property at
 * the api-level.
 */
  core.String path;

  /** True if this endpoint supports upload multipart media. */
  core.bool multipart;

  /** Parses an instance from its JSON representation. */
  static RestMethodMediaUploadProtocolsSimple parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethodMediaUploadProtocolsSimple();
    result.path = identity(json["path"]);
    result.multipart = identity(json["multipart"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethodMediaUploadProtocolsSimple value) {
    if (value == null) return null;
    final result = {};
    result["path"] = identity(value.path);
    result["multipart"] = identity(value.multipart);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestMethod.RestMethodRequest
class RestMethodRequest extends IdentityHash {
  /** Schema ID for the request schema. */
  core.String $ref;

  /** Parses an instance from its JSON representation. */
  static RestMethodRequest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethodRequest();
    result.$ref = identity(json["\$ref"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethodRequest value) {
    if (value == null) return null;
    final result = {};
    result["\$ref"] = identity(value.$ref);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema RestMethod.RestMethodResponse
class RestMethodResponse extends IdentityHash {
  /** Schema ID for the response schema. */
  core.String $ref;

  /** Parses an instance from its JSON representation. */
  static RestMethodResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestMethodResponse();
    result.$ref = identity(json["\$ref"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestMethodResponse value) {
    if (value == null) return null;
    final result = {};
    result["\$ref"] = identity(value.$ref);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .RestResource
class RestResource extends IdentityHash {
  /** Methods on this resource. */
  core.Map<core.String, RestMethod> methods;

  /** Sub-resources on this resource. */
  core.Map<core.String, RestResource> resources;

  /** Parses an instance from its JSON representation. */
  static RestResource parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new RestResource();
    result.methods = mapValues(RestMethod.parse)(json["methods"]);
    result.resources = mapValues(RestResource.parse)(json["resources"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(RestResource value) {
    if (value == null) return null;
    final result = {};
    result["methods"] = mapValues(RestMethod.serialize)(value.methods);
    result["resources"] = mapValues(RestResource.serialize)(value.resources);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum DiscoveryApi.Alt
class DiscoveryApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final DiscoveryApiAlt JSON = const DiscoveryApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<DiscoveryApiAlt> values = const <DiscoveryApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <DiscoveryApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static DiscoveryApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const DiscoveryApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

