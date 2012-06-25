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

#library('freebase-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API FreebaseApi
/**
 * Lets you access the Freebase repository of open data.
 */
class FreebaseApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  FreebaseApi get _$service() => this;
  TextResource _text;
  TextResource get text() => _text;
  
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
  FreebaseApiAlt alt;


  FreebaseApi([this.baseUrl = "https://www.googleapis.com/freebase/v1/", this.applicationName, this.authenticator]) { 
    _text = new TextResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}freebase/v1/20120421 google-api-dart-client/${clientVersion}";
  }
  // Method .Mqlread
  /**
   * Performs MQL Queries.
   * [query] An envelope containing a single MQL query.
   */
  core.Future mqlread(core.String query, [core.String lang = UNSPECIFIED, core.bool htmlEscape = UNSPECIFIED, core.int indent = UNSPECIFIED, MqlreadUniquenessFailure uniquenessFailure = UNSPECIFIED, core.String dateline = UNSPECIFIED, core.String cursor = UNSPECIFIED, core.String callback = UNSPECIFIED, core.bool cost = UNSPECIFIED, core.String asOfTime = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["query"] = query;
    if (UNSPECIFIED != lang) $queryParams["lang"] = lang;
    if (UNSPECIFIED != htmlEscape) $queryParams["html_escape"] = htmlEscape;
    if (UNSPECIFIED != indent) $queryParams["indent"] = indent;
    if (UNSPECIFIED != uniquenessFailure) $queryParams["uniqueness_failure"] = uniquenessFailure;
    if (UNSPECIFIED != dateline) $queryParams["dateline"] = dateline;
    if (UNSPECIFIED != cursor) $queryParams["cursor"] = cursor;
    if (UNSPECIFIED != callback) $queryParams["callback"] = callback;
    if (UNSPECIFIED != cost) $queryParams["cost"] = cost;
    if (UNSPECIFIED != asOfTime) $queryParams["as_of_time"] = asOfTime;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "mqlread";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }  // Method .Image
  /**
   * Returns the scaled/cropped image attached to a freebase node.
   * [id] Freebase entity or content id, mid, or guid.
   */
  core.Future image(core.List<core.String> id, [core.int maxwidth = UNSPECIFIED, core.int maxheight = UNSPECIFIED, core.String fallbackid = UNSPECIFIED, core.bool pad = UNSPECIFIED, ImageMode mode = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != maxwidth) $queryParams["maxwidth"] = maxwidth;
    if (UNSPECIFIED != maxheight) $queryParams["maxheight"] = maxheight;
    if (UNSPECIFIED != fallbackid) $queryParams["fallbackid"] = fallbackid;
    if (UNSPECIFIED != pad) $queryParams["pad"] = pad;
    if (UNSPECIFIED != mode) $queryParams["mode"] = mode;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "image{/id*}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Resource .TextResource
class TextResource extends core.Object {
  final FreebaseApi _$service;
  
  TextResource._internal(FreebaseApi $service) : _$service = $service;

  // Method TextResource.Get
  /**
   * Returns blob attached to node at specified id as HTML
   * [id] The id of the item that you want data about
   */
  core.Future<ContentserviceGet> get(core.List<core.String> id, [core.int maxlength = UNSPECIFIED, TextResourceGetFormat format = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (UNSPECIFIED != maxlength) $queryParams["maxlength"] = maxlength;
    if (UNSPECIFIED != format) $queryParams["format"] = format;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "text{/id*}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ContentserviceGet.parse(JSON.parse($text)));
  }
}

// Enum TextResource.Get.Format
class TextResourceGetFormat extends core.Object implements core.Hashable {
  /** Return valid, sanitized html. */
  static final TextResourceGetFormat HTML = const TextResourceGetFormat._internal("html", 0);
  /** Return plain text - strip html tags. */
  static final TextResourceGetFormat PLAIN = const TextResourceGetFormat._internal("plain", 1);
  /** Return the entire content as-is. */
  static final TextResourceGetFormat RAW = const TextResourceGetFormat._internal("raw", 2);

  /** All values of this enumeration */
  static final core.List<TextResourceGetFormat> values = const <TextResourceGetFormat>[
    HTML,
    PLAIN,
    RAW,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <TextResourceGetFormat>{ 
    "html": HTML,
    "plain": PLAIN,
    "raw": RAW,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static TextResourceGetFormat valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const TextResourceGetFormat._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Format".hashCode();
}

// Schema .ContentserviceGet
class ContentserviceGet extends IdentityHash {
  /** The text requested. */
  core.String result;

  /** Parses an instance from its JSON representation. */
  static ContentserviceGet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ContentserviceGet();
    result.result = identity(json["result"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ContentserviceGet value) {
    if (value == null) return null;
    final result = {};
    result["result"] = identity(value.result);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum FreebaseApi.Alt
class FreebaseApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final FreebaseApiAlt JSON = const FreebaseApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<FreebaseApiAlt> values = const <FreebaseApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <FreebaseApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FreebaseApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FreebaseApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

// Enum Mqlread.UniquenessFailure
class MqlreadUniquenessFailure extends core.Object implements core.Hashable {
  /** Be strict - throw an error. */
  static final MqlreadUniquenessFailure HARD = const MqlreadUniquenessFailure._internal("hard", 0);
  /** Just return the first encountered object. */
  static final MqlreadUniquenessFailure SOFT = const MqlreadUniquenessFailure._internal("soft", 1);

  /** All values of this enumeration */
  static final core.List<MqlreadUniquenessFailure> values = const <MqlreadUniquenessFailure>[
    HARD,
    SOFT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <MqlreadUniquenessFailure>{ 
    "hard": HARD,
    "soft": SOFT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static MqlreadUniquenessFailure valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const MqlreadUniquenessFailure._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "UniquenessFailure".hashCode();
}

// Enum Image.Mode
class ImageMode extends core.Object implements core.Hashable {
  /** TODO(bendrees) */
  static final ImageMode FILL = const ImageMode._internal("fill", 0);
  /** TODO(bendrees) */
  static final ImageMode FILLCROP = const ImageMode._internal("fillcrop", 1);
  /** TODO(bendrees) */
  static final ImageMode FILLCROPMID = const ImageMode._internal("fillcropmid", 2);
  /** TODO(bendrees) */
  static final ImageMode FIT = const ImageMode._internal("fit", 3);

  /** All values of this enumeration */
  static final core.List<ImageMode> values = const <ImageMode>[
    FILL,
    FILLCROP,
    FILLCROPMID,
    FIT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ImageMode>{ 
    "fill": FILL,
    "fillcrop": FILLCROP,
    "fillcropmid": FILLCROPMID,
    "fit": FIT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ImageMode valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ImageMode._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Mode".hashCode();
}

