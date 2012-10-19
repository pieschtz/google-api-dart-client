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

#library('webfonts-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API WebfontsApi
/**
 * The Google Web Fonts Developer API.
 */
class WebfontsApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  WebfontsApi get _$service => this;
  WebfontsResource _webfonts;
  WebfontsResource get webfonts => _webfonts;
  
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
  WebfontsApiAlt alt;


  WebfontsApi({this.baseUrl:"https://www.googleapis.com/webfonts/v1/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _webfonts = new WebfontsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}webfonts/v1/20120614 google-api-dart-client/${clientVersion}";
  }

}

// Resource .WebfontsResource
class WebfontsResource extends core.Object {
  final WebfontsApi _$service;
  
  WebfontsResource._internal(WebfontsApi $service) : _$service = $service;

  // Method WebfontsResource.List
  /**
   * Retrieves the list of fonts currently served by the Google Web Fonts Developer API
   *
   *    * [sort] Enables sorting of the list
   */
  core.Future<WebfontList> list({WebfontsResourceListSort sort}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?sort) $queryParams["sort"] = sort;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "webfonts";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => WebfontList.parse(JSON.parse($text)));
  }
}

// Enum WebfontsResource.List.Sort
class WebfontsResourceListSort extends core.Object implements core.Hashable {
  /** Sort alphabetically */
  const WebfontsResourceListSort ALPHA = const WebfontsResourceListSort._internal("alpha", 0);
  /** Sort by date added */
  const WebfontsResourceListSort DATE = const WebfontsResourceListSort._internal("date", 1);
  /** Sort by popularity */
  const WebfontsResourceListSort POPULARITY = const WebfontsResourceListSort._internal("popularity", 2);
  /** Sort by number of styles */
  const WebfontsResourceListSort STYLE = const WebfontsResourceListSort._internal("style", 3);
  /** Sort by trending */
  const WebfontsResourceListSort TRENDING = const WebfontsResourceListSort._internal("trending", 4);

  /** All values of this enumeration */
  const core.List<WebfontsResourceListSort> values = const <WebfontsResourceListSort>[
    ALPHA,
    DATE,
    POPULARITY,
    STYLE,
    TRENDING,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <WebfontsResourceListSort>{ 
    "alpha": ALPHA,
    "date": DATE,
    "popularity": POPULARITY,
    "style": STYLE,
    "trending": TRENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static WebfontsResourceListSort valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const WebfontsResourceListSort._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Sort".hashCode();
}

// Schema .Webfont
class Webfont extends IdentityHash {
  /** This kind represents a webfont object in the webfonts service. */
  core.String kind;

  /** The available variants for the font. */
  core.Object variants;

  /** The scripts supported by the font. */
  core.Object subsets;

  /** The name of the font. */
  core.Object family;

  /** Parses an instance from its JSON representation. */
  static Webfont parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Webfont();
    result.kind = identity(json["kind"]);
    result.variants = identity(json["variants"]);
    result.subsets = identity(json["subsets"]);
    result.family = identity(json["family"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Webfont value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["variants"] = identity(value.variants);
    result["subsets"] = identity(value.subsets);
    result["family"] = identity(value.family);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .WebfontList
class WebfontList extends IdentityHash {
  /** The list of fonts currently served by the Google Fonts API. */
  core.List<Webfont> items;

  /** This kind represents a list of webfont objects in the webfonts service. */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static WebfontList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new WebfontList();
    result.items = map(Webfont.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(WebfontList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Webfont.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum WebfontsApi.Alt
class WebfontsApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const WebfontsApiAlt JSON = const WebfontsApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<WebfontsApiAlt> values = const <WebfontsApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <WebfontsApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static WebfontsApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const WebfontsApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

