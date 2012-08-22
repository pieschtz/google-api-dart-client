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

#library('pagespeedonline-v1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API PagespeedonlineApi
/**
 * Lets you analyze the performance of a web page and get tailored suggestions to make that page
 * faster.
 */
class PagespeedonlineApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  PagespeedonlineApi get _$service() => this;
  PagespeedapiResource _pagespeedapi;
  PagespeedapiResource get pagespeedapi() => _pagespeedapi;
  
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
  PagespeedonlineApiAlt alt;


  PagespeedonlineApi([this.baseUrl = "https://www.googleapis.com/pagespeedonline/v1/", applicationName, this.authenticator]) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _pagespeedapi = new PagespeedapiResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}pagespeedonline/v1/20120813 google-api-dart-client/${clientVersion}";
  }

}

// Resource .PagespeedapiResource
class PagespeedapiResource extends core.Object {
  final PagespeedonlineApi _$service;
  
  PagespeedapiResource._internal(PagespeedonlineApi $service) : _$service = $service;

  // Method PagespeedapiResource.Runpagespeed
  /**
   * Runs Page Speed analysis on the page at the specified URL, and returns a Page Speed score, a list
   * of suggestions to make that page faster, and other information.
   *
   *    * [url] The URL to fetch and analyze
   *    * [locale] The locale used to localize formatted results
   *    * [rule] A Page Speed rule to run; if none are given, all rules are run
   *    * [strategy] The analysis strategy to use
   */
  core.Future<Result> runpagespeed(core.String url, [core.String locale = UNSPECIFIED, core.List<core.String> rule = UNSPECIFIED, PagespeedapiResourceRunpagespeedStrategy strategy = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != url) $queryParams["url"] = url;
    if (UNSPECIFIED != locale) $queryParams["locale"] = locale;
    if (UNSPECIFIED != rule) $queryParams["rule"] = rule;
    if (UNSPECIFIED != strategy) $queryParams["strategy"] = strategy;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "runPagespeed";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Result.parse(JSON.parse($text)));
  }
}

// Enum PagespeedapiResource.Runpagespeed.Strategy
class PagespeedapiResourceRunpagespeedStrategy extends core.Object implements core.Hashable {
  /** Fetch and analyze the URL for desktop browsers */
  static final PagespeedapiResourceRunpagespeedStrategy DESKTOP = const PagespeedapiResourceRunpagespeedStrategy._internal("desktop", 0);
  /** Fetch and analyze the URL for mobile devices */
  static final PagespeedapiResourceRunpagespeedStrategy MOBILE = const PagespeedapiResourceRunpagespeedStrategy._internal("mobile", 1);

  /** All values of this enumeration */
  static final core.List<PagespeedapiResourceRunpagespeedStrategy> values = const <PagespeedapiResourceRunpagespeedStrategy>[
    DESKTOP,
    MOBILE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PagespeedapiResourceRunpagespeedStrategy>{ 
    "desktop": DESKTOP,
    "mobile": MOBILE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PagespeedapiResourceRunpagespeedStrategy valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const PagespeedapiResourceRunpagespeedStrategy._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Strategy".hashCode();
}

// Schema .Result
class Result extends IdentityHash {
  /** Kind of result. */
  core.String kind;

  /**
 * Localized Page Speed results. Contains a ruleResults entry for each Page Speed rule instantiated
 * and run by the server.
 */
  ResultFormattedResults formattedResults;

  /** Title of the page, as displayed in the browser's title bar. */
  core.String title;

  /** The version of the Page Speed SDK used to generate these results. */
  ResultVersion version;

  /**
 * The Page Speed Score (0-100), which indicates how much faster a page could be. A high score
 * indicates little room for improvement, while a lower score indicates more room for improvement.
 */
  core.int score;

  /**
 * Response code for the document. 200 indicates a normal page load. 4xx/5xx indicates an error.
 */
  core.int responseCode;

  /**
 * List of rules that were specified in the request, but which the server did not know how to
 * instantiate.
 */
  core.List<core.String> invalidRules;

  /**
 * Summary statistics for the page, such as number of JavaScript bytes, number of HTML bytes, etc.
 */
  ResultPageStats pageStats;

  /** Canonicalized and final URL for the document, after following page redirects (if any). */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Result parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Result();
    result.kind = identity(json["kind"]);
    result.formattedResults = ResultFormattedResults.parse(json["formattedResults"]);
    result.title = identity(json["title"]);
    result.version = ResultVersion.parse(json["version"]);
    result.score = identity(json["score"]);
    result.responseCode = identity(json["responseCode"]);
    result.invalidRules = map(identity)(json["invalidRules"]);
    result.pageStats = ResultPageStats.parse(json["pageStats"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Result value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["formattedResults"] = ResultFormattedResults.serialize(value.formattedResults);
    result["title"] = identity(value.title);
    result["version"] = ResultVersion.serialize(value.version);
    result["score"] = identity(value.score);
    result["responseCode"] = identity(value.responseCode);
    result["invalidRules"] = map(identity)(value.invalidRules);
    result["pageStats"] = ResultPageStats.serialize(value.pageStats);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults
class ResultFormattedResults extends IdentityHash {
  /** The locale of the formattedResults, e.g. "en_US". */
  core.String locale;

  /**
 * Dictionary of formatted rule results, with one entry for each Page Speed rule instantiated and
 * run by the server.
 */
  core.Map<core.String, ResultFormattedResultsRuleResults> ruleResults;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResults parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResults();
    result.locale = identity(json["locale"]);
    result.ruleResults = mapValues(ResultFormattedResultsRuleResults.parse)(json["ruleResults"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResults value) {
    if (value == null) return null;
    final result = {};
    result["locale"] = identity(value.locale);
    result["ruleResults"] = mapValues(ResultFormattedResultsRuleResults.serialize)(value.ruleResults);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults
class ResultFormattedResultsRuleResults extends IdentityHash {
  /** Localized name of the rule, intended for presentation to a user. */
  core.String localizedRuleName;

  /**
 * List of blocks of URLs. Each block may contain a heading and a list of URLs. Each URL may
 * optionally include additional details.
 */
  core.List<ResultFormattedResultsRuleResultsUrlBlocks> urlBlocks;

  /**
 * The score (0-100) for this rule. The rule score indicates how well a page implements the
 * recommendations for the given rule. For instance, if none of the compressible resources on a page
 * are compressed, the rule score would be 0, while if all of the compressible resources on a page
 * are compressed, the rule score would be 100.
 */
  core.int ruleScore;

  /**
 * The impact (unbounded floating point value) that implementing the suggestions for this rule would
 * have on making the page faster. Impact is comparable between rules to determine which rule's
 * suggestions would have a higher or lower impact on making a page faster. For instance, if
 * enabling compression would save 1MB, while optimizing images would save 500kB, the enable
 * compression rule would have 2x the impact of the image optimization rule, all other things being
 * equal.
 */
  core.double ruleImpact;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResults parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResults();
    result.localizedRuleName = identity(json["localizedRuleName"]);
    result.urlBlocks = map(ResultFormattedResultsRuleResultsUrlBlocks.parse)(json["urlBlocks"]);
    result.ruleScore = identity(json["ruleScore"]);
    result.ruleImpact = identity(json["ruleImpact"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResults value) {
    if (value == null) return null;
    final result = {};
    result["localizedRuleName"] = identity(value.localizedRuleName);
    result["urlBlocks"] = map(ResultFormattedResultsRuleResultsUrlBlocks.serialize)(value.urlBlocks);
    result["ruleScore"] = identity(value.ruleScore);
    result["ruleImpact"] = identity(value.ruleImpact);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks
class ResultFormattedResultsRuleResultsUrlBlocks extends IdentityHash {
  /** Heading to be displayed with the list of URLs. */
  ResultFormattedResultsRuleResultsUrlBlocksHeader header;

  /** List of entries that provide information about URLs in the url block. Optional. */
  core.List<ResultFormattedResultsRuleResultsUrlBlocksUrls> urls;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocks parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocks();
    result.header = ResultFormattedResultsRuleResultsUrlBlocksHeader.parse(json["header"]);
    result.urls = map(ResultFormattedResultsRuleResultsUrlBlocksUrls.parse)(json["urls"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocks value) {
    if (value == null) return null;
    final result = {};
    result["header"] = ResultFormattedResultsRuleResultsUrlBlocksHeader.serialize(value.header);
    result["urls"] = map(ResultFormattedResultsRuleResultsUrlBlocksUrls.serialize)(value.urls);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksHeader
class ResultFormattedResultsRuleResultsUrlBlocksHeader extends IdentityHash {
  /** List of arguments for the format string. */
  core.List<ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs> args;

  /**
 * A localized format string with $N placeholders, where N is the 1-indexed argument number, e.g.
 * 'Minifying the following $1 resources would save a total of $2 bytes'.
 */
  core.String format;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksHeader parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksHeader();
    result.args = map(ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs.parse)(json["args"]);
    result.format = identity(json["format"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksHeader value) {
    if (value == null) return null;
    final result = {};
    result["args"] = map(ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs.serialize)(value.args);
    result["format"] = identity(value.format);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksHeader.ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs
class ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs extends IdentityHash {
  /** Type of argument. One of URL, STRING_LITERAL, INT_LITERAL, BYTES, or DURATION. */
  core.String type;

  /** Argument value, as a localized string. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs();
    result.type = identity(json["type"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksHeaderArgs value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksUrls
class ResultFormattedResultsRuleResultsUrlBlocksUrls extends IdentityHash {
  /** List of entries that provide additional details about a single URL. Optional. */
  core.List<ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails> details;

  /**
 * A format string that gives information about the URL, and a list of arguments for that format
 * string.
 */
  ResultFormattedResultsRuleResultsUrlBlocksUrlsResult result;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksUrls parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksUrls();
    result.details = map(ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails.parse)(json["details"]);
    result.result = ResultFormattedResultsRuleResultsUrlBlocksUrlsResult.parse(json["result"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksUrls value) {
    if (value == null) return null;
    final result = {};
    result["details"] = map(ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails.serialize)(value.details);
    result["result"] = ResultFormattedResultsRuleResultsUrlBlocksUrlsResult.serialize(value.result);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksUrls.ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails
class ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails extends IdentityHash {
  /** List of arguments for the format string. */
  core.List<ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs> args;

  /**
 * A localized format string with $N placeholders, where N is the 1-indexed argument number, e.g.
 * 'Unnecessary metadata for this resource adds an additional $1 bytes to its download size'.
 */
  core.String format;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails();
    result.args = map(ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs.parse)(json["args"]);
    result.format = identity(json["format"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails value) {
    if (value == null) return null;
    final result = {};
    result["args"] = map(ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs.serialize)(value.args);
    result["format"] = identity(value.format);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksUrls.ResultFormattedResultsRuleResultsUrlBlocksUrlsDetails.ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs
class ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs extends IdentityHash {
  /** Type of argument. One of URL, STRING_LITERAL, INT_LITERAL, BYTES, or DURATION. */
  core.String type;

  /** Argument value, as a localized string. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs();
    result.type = identity(json["type"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksUrlsDetailsArgs value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksUrls.ResultFormattedResultsRuleResultsUrlBlocksUrlsResult
class ResultFormattedResultsRuleResultsUrlBlocksUrlsResult extends IdentityHash {
  /** List of arguments for the format string. */
  core.List<ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs> args;

  /**
 * A localized format string with $N placeholders, where N is the 1-indexed argument number, e.g.
 * 'Minifying the resource at URL $1 can save $2 bytes'.
 */
  core.String format;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksUrlsResult parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksUrlsResult();
    result.args = map(ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs.parse)(json["args"]);
    result.format = identity(json["format"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksUrlsResult value) {
    if (value == null) return null;
    final result = {};
    result["args"] = map(ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs.serialize)(value.args);
    result["format"] = identity(value.format);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultFormattedResults.ResultFormattedResultsRuleResults.ResultFormattedResultsRuleResultsUrlBlocks.ResultFormattedResultsRuleResultsUrlBlocksUrls.ResultFormattedResultsRuleResultsUrlBlocksUrlsResult.ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs
class ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs extends IdentityHash {
  /** Type of argument. One of URL, STRING_LITERAL, INT_LITERAL, BYTES, or DURATION. */
  core.String type;

  /** Argument value, as a localized string. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs();
    result.type = identity(json["type"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultFormattedResultsRuleResultsUrlBlocksUrlsResultArgs value) {
    if (value == null) return null;
    final result = {};
    result["type"] = identity(value.type);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultPageStats
class ResultPageStats extends IdentityHash {
  /** Number of response bytes for other resources on the page. */
  core.String otherResponseBytes;

  /** Number of response bytes for flash resources on the page. */
  core.String flashResponseBytes;

  /** Total size of all request bytes sent by the page. */
  core.String totalRequestBytes;

  /** Number of CSS resources referenced by the page. */
  core.int numberCssResources;

  /** Number of HTTP resources loaded by the page. */
  core.int numberResources;

  /** Number of uncompressed response bytes for CSS resources on the page. */
  core.String cssResponseBytes;

  /** Number of uncompressed response bytes for JS resources on the page. */
  core.String javascriptResponseBytes;

  /** Number of response bytes for image resources on the page. */
  core.String imageResponseBytes;

  /** Number of unique hosts referenced by the page. */
  core.int numberHosts;

  /** Number of static (i.e. cacheable) resources on the page. */
  core.int numberStaticResources;

  /**
 * Number of uncompressed response bytes for the main HTML document and all iframes on the page.
 */
  core.String htmlResponseBytes;

  /** Number of JavaScript resources referenced by the page. */
  core.int numberJsResources;

  /**
 * Number of uncompressed response bytes for text resources not covered by other statistics (i.e
 * non-HTML, non-script, non-CSS resources) on the page.
 */
  core.String textResponseBytes;

  /** Parses an instance from its JSON representation. */
  static ResultPageStats parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultPageStats();
    result.otherResponseBytes = identity(json["otherResponseBytes"]);
    result.flashResponseBytes = identity(json["flashResponseBytes"]);
    result.totalRequestBytes = identity(json["totalRequestBytes"]);
    result.numberCssResources = identity(json["numberCssResources"]);
    result.numberResources = identity(json["numberResources"]);
    result.cssResponseBytes = identity(json["cssResponseBytes"]);
    result.javascriptResponseBytes = identity(json["javascriptResponseBytes"]);
    result.imageResponseBytes = identity(json["imageResponseBytes"]);
    result.numberHosts = identity(json["numberHosts"]);
    result.numberStaticResources = identity(json["numberStaticResources"]);
    result.htmlResponseBytes = identity(json["htmlResponseBytes"]);
    result.numberJsResources = identity(json["numberJsResources"]);
    result.textResponseBytes = identity(json["textResponseBytes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultPageStats value) {
    if (value == null) return null;
    final result = {};
    result["otherResponseBytes"] = identity(value.otherResponseBytes);
    result["flashResponseBytes"] = identity(value.flashResponseBytes);
    result["totalRequestBytes"] = identity(value.totalRequestBytes);
    result["numberCssResources"] = identity(value.numberCssResources);
    result["numberResources"] = identity(value.numberResources);
    result["cssResponseBytes"] = identity(value.cssResponseBytes);
    result["javascriptResponseBytes"] = identity(value.javascriptResponseBytes);
    result["imageResponseBytes"] = identity(value.imageResponseBytes);
    result["numberHosts"] = identity(value.numberHosts);
    result["numberStaticResources"] = identity(value.numberStaticResources);
    result["htmlResponseBytes"] = identity(value.htmlResponseBytes);
    result["numberJsResources"] = identity(value.numberJsResources);
    result["textResponseBytes"] = identity(value.textResponseBytes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultVersion
class ResultVersion extends IdentityHash {
  /** The major version number of the Page Speed SDK used to generate these results. */
  core.int major;

  /** The minor version number of the Page Speed SDK used to generate these results. */
  core.int minor;

  /** Parses an instance from its JSON representation. */
  static ResultVersion parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResultVersion();
    result.major = identity(json["major"]);
    result.minor = identity(json["minor"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResultVersion value) {
    if (value == null) return null;
    final result = {};
    result["major"] = identity(value.major);
    result["minor"] = identity(value.minor);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum PagespeedonlineApi.Alt
class PagespeedonlineApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final PagespeedonlineApiAlt JSON = const PagespeedonlineApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<PagespeedonlineApiAlt> values = const <PagespeedonlineApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PagespeedonlineApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PagespeedonlineApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const PagespeedonlineApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

