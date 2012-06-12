#library("customsearch");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API CustomsearchApi
/**
 * Lets you search over a website or collection of websites
 */
class CustomsearchApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  CustomsearchApi get _$service() => this;
  CseResource _cse;
  CseResource get cse() => _cse;
  
  /** Returns response with indentations and line breaks. */
  bool prettyPrint;

  /** Selector specifying which fields to include in a partial response. */
  String fields;

  /**
   * Available to use for quota purposes for server-side applications. Can be any arbitrary string
   * assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
   */
  String quotaUser;

  /** OAuth 2.0 token for the current user. */
  String oauthToken;

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  String key;

  /**
   * IP address of the site where the request originates. Use this if you want to enforce per-user
   * limits.
   */
  String userIp;

  /** Data format for the response. */
  CustomsearchApiAlt alt;


  CustomsearchApi([this.baseUrl = "https://www.googleapis.com/customsearch/", this.applicationName]) { 
    _cse = new CseResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}customsearch/v1/20120511 google-api-dart-client/${clientVersion}";
  }
}

// Resource .CseResource
class CseResource {
  final CustomsearchApi _$service;
  
  CseResource._internal(CustomsearchApi $service) : _$service = $service;

  // Method CseResource.List
  /**
   * Returns metadata about the search performed, metadata about the custom search engine used for the
   * search, and the search results.
   * [q] Query
   */
  Future<Search> list(String q, [String sort = UNSPECIFIED, String orTerms = UNSPECIFIED, String highRange = UNSPECIFIED, int num = UNSPECIFIED, String cr = UNSPECIFIED, CseResourceListImgType imgType = UNSPECIFIED, String gl = UNSPECIFIED, String relatedSite = UNSPECIFIED, CseResourceListSearchType searchType = UNSPECIFIED, String fileType = UNSPECIFIED, int start = UNSPECIFIED, CseResourceListImgDominantColor imgDominantColor = UNSPECIFIED, CseResourceListLr lr = UNSPECIFIED, String siteSearch = UNSPECIFIED, String cref = UNSPECIFIED, String dateRestrict = UNSPECIFIED, CseResourceListSafe safe = UNSPECIFIED, String c2coff = UNSPECIFIED, String googlehost = UNSPECIFIED, String hq = UNSPECIFIED, String exactTerms = UNSPECIFIED, String hl = UNSPECIFIED, String lowRange = UNSPECIFIED, CseResourceListImgSize imgSize = UNSPECIFIED, CseResourceListImgColorType imgColorType = UNSPECIFIED, String rights = UNSPECIFIED, String excludeTerms = UNSPECIFIED, CseResourceListFilter filter = UNSPECIFIED, String linkSite = UNSPECIFIED, String cx = UNSPECIFIED, CseResourceListSiteSearchFilter siteSearchFilter = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["q"] = q;
    if (UNSPECIFIED != sort) $queryParams["sort"] = sort;
    if (UNSPECIFIED != orTerms) $queryParams["orTerms"] = orTerms;
    if (UNSPECIFIED != highRange) $queryParams["highRange"] = highRange;
    if (UNSPECIFIED != num) $queryParams["num"] = num;
    if (UNSPECIFIED != cr) $queryParams["cr"] = cr;
    if (UNSPECIFIED != imgType) $queryParams["imgType"] = imgType;
    if (UNSPECIFIED != gl) $queryParams["gl"] = gl;
    if (UNSPECIFIED != relatedSite) $queryParams["relatedSite"] = relatedSite;
    if (UNSPECIFIED != searchType) $queryParams["searchType"] = searchType;
    if (UNSPECIFIED != fileType) $queryParams["fileType"] = fileType;
    if (UNSPECIFIED != start) $queryParams["start"] = start;
    if (UNSPECIFIED != imgDominantColor) $queryParams["imgDominantColor"] = imgDominantColor;
    if (UNSPECIFIED != lr) $queryParams["lr"] = lr;
    if (UNSPECIFIED != siteSearch) $queryParams["siteSearch"] = siteSearch;
    if (UNSPECIFIED != cref) $queryParams["cref"] = cref;
    if (UNSPECIFIED != dateRestrict) $queryParams["dateRestrict"] = dateRestrict;
    if (UNSPECIFIED != safe) $queryParams["safe"] = safe;
    if (UNSPECIFIED != c2coff) $queryParams["c2coff"] = c2coff;
    if (UNSPECIFIED != googlehost) $queryParams["googlehost"] = googlehost;
    if (UNSPECIFIED != hq) $queryParams["hq"] = hq;
    if (UNSPECIFIED != exactTerms) $queryParams["exactTerms"] = exactTerms;
    if (UNSPECIFIED != hl) $queryParams["hl"] = hl;
    if (UNSPECIFIED != lowRange) $queryParams["lowRange"] = lowRange;
    if (UNSPECIFIED != imgSize) $queryParams["imgSize"] = imgSize;
    if (UNSPECIFIED != imgColorType) $queryParams["imgColorType"] = imgColorType;
    if (UNSPECIFIED != rights) $queryParams["rights"] = rights;
    if (UNSPECIFIED != excludeTerms) $queryParams["excludeTerms"] = excludeTerms;
    if (UNSPECIFIED != filter) $queryParams["filter"] = filter;
    if (UNSPECIFIED != linkSite) $queryParams["linkSite"] = linkSite;
    if (UNSPECIFIED != cx) $queryParams["cx"] = cx;
    if (UNSPECIFIED != siteSearchFilter) $queryParams["siteSearchFilter"] = siteSearchFilter;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "v1").generate($pathParams, $queryParams);
    final $completer = new Completer<Search>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Search.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Enum CseResource.List.ImgType
class CseResourceListImgType implements Hashable {
  /** clipart */
  static final CseResourceListImgType CLIPART = const CseResourceListImgType._internal("clipart", 0);
  /** face */
  static final CseResourceListImgType FACE = const CseResourceListImgType._internal("face", 1);
  /** lineart */
  static final CseResourceListImgType LINEART = const CseResourceListImgType._internal("lineart", 2);
  /** news */
  static final CseResourceListImgType NEWS = const CseResourceListImgType._internal("news", 3);
  /** photo */
  static final CseResourceListImgType PHOTO = const CseResourceListImgType._internal("photo", 4);

  /** All values of this enumeration */
  static final List<CseResourceListImgType> values = const <CseResourceListImgType>[
    CLIPART,
    FACE,
    LINEART,
    NEWS,
    PHOTO,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListImgType>{ 
    "clipart": CLIPART,
    "face": FACE,
    "lineart": LINEART,
    "news": NEWS,
    "photo": PHOTO,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListImgType valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListImgType._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "ImgType".hashCode();
}

// Enum CseResource.List.SearchType
class CseResourceListSearchType implements Hashable {
  /** custom image search */
  static final CseResourceListSearchType IMAGE = const CseResourceListSearchType._internal("image", 0);

  /** All values of this enumeration */
  static final List<CseResourceListSearchType> values = const <CseResourceListSearchType>[
    IMAGE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListSearchType>{ 
    "image": IMAGE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListSearchType valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListSearchType._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "SearchType".hashCode();
}

// Enum CseResource.List.ImgDominantColor
class CseResourceListImgDominantColor implements Hashable {
  /** black */
  static final CseResourceListImgDominantColor BLACK = const CseResourceListImgDominantColor._internal("black", 0);
  /** blue */
  static final CseResourceListImgDominantColor BLUE = const CseResourceListImgDominantColor._internal("blue", 1);
  /** brown */
  static final CseResourceListImgDominantColor BROWN = const CseResourceListImgDominantColor._internal("brown", 2);
  /** gray */
  static final CseResourceListImgDominantColor GRAY = const CseResourceListImgDominantColor._internal("gray", 3);
  /** green */
  static final CseResourceListImgDominantColor GREEN = const CseResourceListImgDominantColor._internal("green", 4);
  /** pink */
  static final CseResourceListImgDominantColor PINK = const CseResourceListImgDominantColor._internal("pink", 5);
  /** purple */
  static final CseResourceListImgDominantColor PURPLE = const CseResourceListImgDominantColor._internal("purple", 6);
  /** teal */
  static final CseResourceListImgDominantColor TEAL = const CseResourceListImgDominantColor._internal("teal", 7);
  /** white */
  static final CseResourceListImgDominantColor WHITE = const CseResourceListImgDominantColor._internal("white", 8);
  /** yellow */
  static final CseResourceListImgDominantColor YELLOW = const CseResourceListImgDominantColor._internal("yellow", 9);

  /** All values of this enumeration */
  static final List<CseResourceListImgDominantColor> values = const <CseResourceListImgDominantColor>[
    BLACK,
    BLUE,
    BROWN,
    GRAY,
    GREEN,
    PINK,
    PURPLE,
    TEAL,
    WHITE,
    YELLOW,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListImgDominantColor>{ 
    "black": BLACK,
    "blue": BLUE,
    "brown": BROWN,
    "gray": GRAY,
    "green": GREEN,
    "pink": PINK,
    "purple": PURPLE,
    "teal": TEAL,
    "white": WHITE,
    "yellow": YELLOW,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListImgDominantColor valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListImgDominantColor._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "ImgDominantColor".hashCode();
}

// Enum CseResource.List.Lr
class CseResourceListLr implements Hashable {
  /** Arabic */
  static final CseResourceListLr LANG_AR = const CseResourceListLr._internal("lang_ar", 0);
  /** Bulgarian */
  static final CseResourceListLr LANG_BG = const CseResourceListLr._internal("lang_bg", 1);
  /** Catalan */
  static final CseResourceListLr LANG_CA = const CseResourceListLr._internal("lang_ca", 2);
  /** Czech */
  static final CseResourceListLr LANG_CS = const CseResourceListLr._internal("lang_cs", 3);
  /** Danish */
  static final CseResourceListLr LANG_DA = const CseResourceListLr._internal("lang_da", 4);
  /** German */
  static final CseResourceListLr LANG_DE = const CseResourceListLr._internal("lang_de", 5);
  /** Greek */
  static final CseResourceListLr LANG_EL = const CseResourceListLr._internal("lang_el", 6);
  /** English */
  static final CseResourceListLr LANG_EN = const CseResourceListLr._internal("lang_en", 7);
  /** Spanish */
  static final CseResourceListLr LANG_ES = const CseResourceListLr._internal("lang_es", 8);
  /** Estonian */
  static final CseResourceListLr LANG_ET = const CseResourceListLr._internal("lang_et", 9);
  /** Finnish */
  static final CseResourceListLr LANG_FI = const CseResourceListLr._internal("lang_fi", 10);
  /** French */
  static final CseResourceListLr LANG_FR = const CseResourceListLr._internal("lang_fr", 11);
  /** Croatian */
  static final CseResourceListLr LANG_HR = const CseResourceListLr._internal("lang_hr", 12);
  /** Hungarian */
  static final CseResourceListLr LANG_HU = const CseResourceListLr._internal("lang_hu", 13);
  /** Indonesian */
  static final CseResourceListLr LANG_ID = const CseResourceListLr._internal("lang_id", 14);
  /** Icelandic */
  static final CseResourceListLr LANG_IS = const CseResourceListLr._internal("lang_is", 15);
  /** Italian */
  static final CseResourceListLr LANG_IT = const CseResourceListLr._internal("lang_it", 16);
  /** Hebrew */
  static final CseResourceListLr LANG_IW = const CseResourceListLr._internal("lang_iw", 17);
  /** Japanese */
  static final CseResourceListLr LANG_JA = const CseResourceListLr._internal("lang_ja", 18);
  /** Korean */
  static final CseResourceListLr LANG_KO = const CseResourceListLr._internal("lang_ko", 19);
  /** Lithuanian */
  static final CseResourceListLr LANG_LT = const CseResourceListLr._internal("lang_lt", 20);
  /** Latvian */
  static final CseResourceListLr LANG_LV = const CseResourceListLr._internal("lang_lv", 21);
  /** Dutch */
  static final CseResourceListLr LANG_NL = const CseResourceListLr._internal("lang_nl", 22);
  /** Norwegian */
  static final CseResourceListLr LANG_NO = const CseResourceListLr._internal("lang_no", 23);
  /** Polish */
  static final CseResourceListLr LANG_PL = const CseResourceListLr._internal("lang_pl", 24);
  /** Portuguese */
  static final CseResourceListLr LANG_PT = const CseResourceListLr._internal("lang_pt", 25);
  /** Romanian */
  static final CseResourceListLr LANG_RO = const CseResourceListLr._internal("lang_ro", 26);
  /** Russian */
  static final CseResourceListLr LANG_RU = const CseResourceListLr._internal("lang_ru", 27);
  /** Slovak */
  static final CseResourceListLr LANG_SK = const CseResourceListLr._internal("lang_sk", 28);
  /** Slovenian */
  static final CseResourceListLr LANG_SL = const CseResourceListLr._internal("lang_sl", 29);
  /** Serbian */
  static final CseResourceListLr LANG_SR = const CseResourceListLr._internal("lang_sr", 30);
  /** Swedish */
  static final CseResourceListLr LANG_SV = const CseResourceListLr._internal("lang_sv", 31);
  /** Turkish */
  static final CseResourceListLr LANG_TR = const CseResourceListLr._internal("lang_tr", 32);
  /** Chinese (Simplified) */
  static final CseResourceListLr LANG_ZH_CN = const CseResourceListLr._internal("lang_zh-CN", 33);
  /** Chinese (Traditional) */
  static final CseResourceListLr LANG_ZH_TW = const CseResourceListLr._internal("lang_zh-TW", 34);

  /** All values of this enumeration */
  static final List<CseResourceListLr> values = const <CseResourceListLr>[
    LANG_AR,
    LANG_BG,
    LANG_CA,
    LANG_CS,
    LANG_DA,
    LANG_DE,
    LANG_EL,
    LANG_EN,
    LANG_ES,
    LANG_ET,
    LANG_FI,
    LANG_FR,
    LANG_HR,
    LANG_HU,
    LANG_ID,
    LANG_IS,
    LANG_IT,
    LANG_IW,
    LANG_JA,
    LANG_KO,
    LANG_LT,
    LANG_LV,
    LANG_NL,
    LANG_NO,
    LANG_PL,
    LANG_PT,
    LANG_RO,
    LANG_RU,
    LANG_SK,
    LANG_SL,
    LANG_SR,
    LANG_SV,
    LANG_TR,
    LANG_ZH_CN,
    LANG_ZH_TW,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListLr>{ 
    "lang_ar": LANG_AR,
    "lang_bg": LANG_BG,
    "lang_ca": LANG_CA,
    "lang_cs": LANG_CS,
    "lang_da": LANG_DA,
    "lang_de": LANG_DE,
    "lang_el": LANG_EL,
    "lang_en": LANG_EN,
    "lang_es": LANG_ES,
    "lang_et": LANG_ET,
    "lang_fi": LANG_FI,
    "lang_fr": LANG_FR,
    "lang_hr": LANG_HR,
    "lang_hu": LANG_HU,
    "lang_id": LANG_ID,
    "lang_is": LANG_IS,
    "lang_it": LANG_IT,
    "lang_iw": LANG_IW,
    "lang_ja": LANG_JA,
    "lang_ko": LANG_KO,
    "lang_lt": LANG_LT,
    "lang_lv": LANG_LV,
    "lang_nl": LANG_NL,
    "lang_no": LANG_NO,
    "lang_pl": LANG_PL,
    "lang_pt": LANG_PT,
    "lang_ro": LANG_RO,
    "lang_ru": LANG_RU,
    "lang_sk": LANG_SK,
    "lang_sl": LANG_SL,
    "lang_sr": LANG_SR,
    "lang_sv": LANG_SV,
    "lang_tr": LANG_TR,
    "lang_zh-CN": LANG_ZH_CN,
    "lang_zh-TW": LANG_ZH_TW,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListLr valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListLr._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Lr".hashCode();
}

// Enum CseResource.List.Safe
class CseResourceListSafe implements Hashable {
  /** Enables highest level of safe search filtering. */
  static final CseResourceListSafe HIGH = const CseResourceListSafe._internal("high", 0);
  /** Enables moderate safe search filtering. */
  static final CseResourceListSafe MEDIUM = const CseResourceListSafe._internal("medium", 1);
  /** Disables safe search filtering. */
  static final CseResourceListSafe OFF = const CseResourceListSafe._internal("off", 2);

  /** All values of this enumeration */
  static final List<CseResourceListSafe> values = const <CseResourceListSafe>[
    HIGH,
    MEDIUM,
    OFF,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListSafe>{ 
    "high": HIGH,
    "medium": MEDIUM,
    "off": OFF,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListSafe valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListSafe._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Safe".hashCode();
}

// Enum CseResource.List.ImgSize
class CseResourceListImgSize implements Hashable {
  /** huge */
  static final CseResourceListImgSize HUGE = const CseResourceListImgSize._internal("huge", 0);
  /** icon */
  static final CseResourceListImgSize ICON = const CseResourceListImgSize._internal("icon", 1);
  /** large */
  static final CseResourceListImgSize LARGE = const CseResourceListImgSize._internal("large", 2);
  /** medium */
  static final CseResourceListImgSize MEDIUM = const CseResourceListImgSize._internal("medium", 3);
  /** small */
  static final CseResourceListImgSize SMALL = const CseResourceListImgSize._internal("small", 4);
  /** xlarge */
  static final CseResourceListImgSize XLARGE = const CseResourceListImgSize._internal("xlarge", 5);
  /** xxlarge */
  static final CseResourceListImgSize XXLARGE = const CseResourceListImgSize._internal("xxlarge", 6);

  /** All values of this enumeration */
  static final List<CseResourceListImgSize> values = const <CseResourceListImgSize>[
    HUGE,
    ICON,
    LARGE,
    MEDIUM,
    SMALL,
    XLARGE,
    XXLARGE,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListImgSize>{ 
    "huge": HUGE,
    "icon": ICON,
    "large": LARGE,
    "medium": MEDIUM,
    "small": SMALL,
    "xlarge": XLARGE,
    "xxlarge": XXLARGE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListImgSize valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListImgSize._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "ImgSize".hashCode();
}

// Enum CseResource.List.ImgColorType
class CseResourceListImgColorType implements Hashable {
  /** color */
  static final CseResourceListImgColorType COLOR = const CseResourceListImgColorType._internal("color", 0);
  /** gray */
  static final CseResourceListImgColorType GRAY = const CseResourceListImgColorType._internal("gray", 1);
  /** mono */
  static final CseResourceListImgColorType MONO = const CseResourceListImgColorType._internal("mono", 2);

  /** All values of this enumeration */
  static final List<CseResourceListImgColorType> values = const <CseResourceListImgColorType>[
    COLOR,
    GRAY,
    MONO,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListImgColorType>{ 
    "color": COLOR,
    "gray": GRAY,
    "mono": MONO,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListImgColorType valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListImgColorType._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "ImgColorType".hashCode();
}

// Enum CseResource.List.Filter
class CseResourceListFilter implements Hashable {
  /** Turns off duplicate content filter. */
  static final CseResourceListFilter VALUE_0 = const CseResourceListFilter._internal("0", 0);
  /** Turns on duplicate content filter. */
  static final CseResourceListFilter VALUE_1 = const CseResourceListFilter._internal("1", 1);

  /** All values of this enumeration */
  static final List<CseResourceListFilter> values = const <CseResourceListFilter>[
    VALUE_0,
    VALUE_1,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListFilter>{ 
    "0": VALUE_0,
    "1": VALUE_1,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListFilter valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListFilter._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Filter".hashCode();
}

// Enum CseResource.List.SiteSearchFilter
class CseResourceListSiteSearchFilter implements Hashable {
  /** exclude */
  static final CseResourceListSiteSearchFilter E = const CseResourceListSiteSearchFilter._internal("e", 0);
  /** include */
  static final CseResourceListSiteSearchFilter I = const CseResourceListSiteSearchFilter._internal("i", 1);

  /** All values of this enumeration */
  static final List<CseResourceListSiteSearchFilter> values = const <CseResourceListSiteSearchFilter>[
    E,
    I,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CseResourceListSiteSearchFilter>{ 
    "e": E,
    "i": I,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CseResourceListSiteSearchFilter valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CseResourceListSiteSearchFilter._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "SiteSearchFilter".hashCode();
}

// Schema .Context
class Context extends IdentityHash {
  
  List<List<ContextFacets>> facets;

  
  String title;

  /** Parses an instance from its JSON representation. */
  static Context parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Context();
    result.facets = map(map(ContextFacets.parse))(json["facets"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Context value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["facets"] = map(map(ContextFacets.serialize))(value.facets);
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Context.ContextFacets
class ContextFacets extends IdentityHash {
  
  String anchor;

  
  String label;

  /** Parses an instance from its JSON representation. */
  static ContextFacets parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ContextFacets();
    result.anchor = identity(json["anchor"]);
    result.label = identity(json["label"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ContextFacets value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["anchor"] = identity(value.anchor);
    result["label"] = identity(value.label);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Promotion
class Promotion extends IdentityHash {
  
  String title;

  
  String displayLink;

  
  String htmlTitle;

  
  String link;

  
  List<PromotionBodyLines> bodyLines;

  
  PromotionImage image;

  /** Parses an instance from its JSON representation. */
  static Promotion parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Promotion();
    result.title = identity(json["title"]);
    result.displayLink = identity(json["displayLink"]);
    result.htmlTitle = identity(json["htmlTitle"]);
    result.link = identity(json["link"]);
    result.bodyLines = map(PromotionBodyLines.parse)(json["bodyLines"]);
    result.image = PromotionImage.parse(json["image"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Promotion value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["title"] = identity(value.title);
    result["displayLink"] = identity(value.displayLink);
    result["htmlTitle"] = identity(value.htmlTitle);
    result["link"] = identity(value.link);
    result["bodyLines"] = map(PromotionBodyLines.serialize)(value.bodyLines);
    result["image"] = PromotionImage.serialize(value.image);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Promotion.PromotionBodyLines
class PromotionBodyLines extends IdentityHash {
  
  String url;

  
  String htmlTitle;

  
  String link;

  
  String title;

  /** Parses an instance from its JSON representation. */
  static PromotionBodyLines parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PromotionBodyLines();
    result.url = identity(json["url"]);
    result.htmlTitle = identity(json["htmlTitle"]);
    result.link = identity(json["link"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PromotionBodyLines value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["htmlTitle"] = identity(value.htmlTitle);
    result["link"] = identity(value.link);
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Promotion.PromotionImage
class PromotionImage extends IdentityHash {
  
  String source;

  
  int width;

  
  int height;

  /** Parses an instance from its JSON representation. */
  static PromotionImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PromotionImage();
    result.source = identity(json["source"]);
    result.width = identity(json["width"]);
    result.height = identity(json["height"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PromotionImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["source"] = identity(value.source);
    result["width"] = identity(value.width);
    result["height"] = identity(value.height);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Query
class Query extends IdentityHash {
  
  String sort;

  
  String inputEncoding;

  
  String orTerms;

  
  String highRange;

  
  String cx;

  
  int startPage;

  
  String disableCnTwTranslation;

  
  String cr;

  
  String imgType;

  
  String gl;

  
  String relatedSite;

  
  String searchType;

  
  String title;

  
  String googleHost;

  
  String fileType;

  
  String imgDominantColor;

  
  String siteSearch;

  
  String cref;

  
  String dateRestrict;

  
  String safe;

  
  String outputEncoding;

  
  String hq;

  
  String searchTerms;

  
  String exactTerms;

  
  String language;

  
  String hl;

  
  String totalResults;

  
  String lowRange;

  
  int count;

  
  String imgSize;

  
  String imgColorType;

  
  String rights;

  
  int startIndex;

  
  String excludeTerms;

  
  String filter;

  
  String linkSite;

  
  String siteSearchFilter;

  /** Parses an instance from its JSON representation. */
  static Query parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Query();
    result.sort = identity(json["sort"]);
    result.inputEncoding = identity(json["inputEncoding"]);
    result.orTerms = identity(json["orTerms"]);
    result.highRange = identity(json["highRange"]);
    result.cx = identity(json["cx"]);
    result.startPage = identity(json["startPage"]);
    result.disableCnTwTranslation = identity(json["disableCnTwTranslation"]);
    result.cr = identity(json["cr"]);
    result.imgType = identity(json["imgType"]);
    result.gl = identity(json["gl"]);
    result.relatedSite = identity(json["relatedSite"]);
    result.searchType = identity(json["searchType"]);
    result.title = identity(json["title"]);
    result.googleHost = identity(json["googleHost"]);
    result.fileType = identity(json["fileType"]);
    result.imgDominantColor = identity(json["imgDominantColor"]);
    result.siteSearch = identity(json["siteSearch"]);
    result.cref = identity(json["cref"]);
    result.dateRestrict = identity(json["dateRestrict"]);
    result.safe = identity(json["safe"]);
    result.outputEncoding = identity(json["outputEncoding"]);
    result.hq = identity(json["hq"]);
    result.searchTerms = identity(json["searchTerms"]);
    result.exactTerms = identity(json["exactTerms"]);
    result.language = identity(json["language"]);
    result.hl = identity(json["hl"]);
    result.totalResults = identity(json["totalResults"]);
    result.lowRange = identity(json["lowRange"]);
    result.count = identity(json["count"]);
    result.imgSize = identity(json["imgSize"]);
    result.imgColorType = identity(json["imgColorType"]);
    result.rights = identity(json["rights"]);
    result.startIndex = identity(json["startIndex"]);
    result.excludeTerms = identity(json["excludeTerms"]);
    result.filter = identity(json["filter"]);
    result.linkSite = identity(json["linkSite"]);
    result.siteSearchFilter = identity(json["siteSearchFilter"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Query value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["sort"] = identity(value.sort);
    result["inputEncoding"] = identity(value.inputEncoding);
    result["orTerms"] = identity(value.orTerms);
    result["highRange"] = identity(value.highRange);
    result["cx"] = identity(value.cx);
    result["startPage"] = identity(value.startPage);
    result["disableCnTwTranslation"] = identity(value.disableCnTwTranslation);
    result["cr"] = identity(value.cr);
    result["imgType"] = identity(value.imgType);
    result["gl"] = identity(value.gl);
    result["relatedSite"] = identity(value.relatedSite);
    result["searchType"] = identity(value.searchType);
    result["title"] = identity(value.title);
    result["googleHost"] = identity(value.googleHost);
    result["fileType"] = identity(value.fileType);
    result["imgDominantColor"] = identity(value.imgDominantColor);
    result["siteSearch"] = identity(value.siteSearch);
    result["cref"] = identity(value.cref);
    result["dateRestrict"] = identity(value.dateRestrict);
    result["safe"] = identity(value.safe);
    result["outputEncoding"] = identity(value.outputEncoding);
    result["hq"] = identity(value.hq);
    result["searchTerms"] = identity(value.searchTerms);
    result["exactTerms"] = identity(value.exactTerms);
    result["language"] = identity(value.language);
    result["hl"] = identity(value.hl);
    result["totalResults"] = identity(value.totalResults);
    result["lowRange"] = identity(value.lowRange);
    result["count"] = identity(value.count);
    result["imgSize"] = identity(value.imgSize);
    result["imgColorType"] = identity(value.imgColorType);
    result["rights"] = identity(value.rights);
    result["startIndex"] = identity(value.startIndex);
    result["excludeTerms"] = identity(value.excludeTerms);
    result["filter"] = identity(value.filter);
    result["linkSite"] = identity(value.linkSite);
    result["siteSearchFilter"] = identity(value.siteSearchFilter);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Result
class Result extends IdentityHash {
  
  String snippet;

  
  String kind;

  
  List<ResultLabels> labels;

  
  String title;

  
  String displayLink;

  
  String cacheId;

  
  String formattedUrl;

  
  String htmlFormattedUrl;

  
  Map<String, List<Map<String, Object>>> pagemap;

  
  String htmlTitle;

  
  String htmlSnippet;

  
  String link;

  
  ResultImage image;

  
  String mime;

  
  String fileFormat;

  /** Parses an instance from its JSON representation. */
  static Result parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Result();
    result.snippet = identity(json["snippet"]);
    result.kind = identity(json["kind"]);
    result.labels = map(ResultLabels.parse)(json["labels"]);
    result.title = identity(json["title"]);
    result.displayLink = identity(json["displayLink"]);
    result.cacheId = identity(json["cacheId"]);
    result.formattedUrl = identity(json["formattedUrl"]);
    result.htmlFormattedUrl = identity(json["htmlFormattedUrl"]);
    result.pagemap = mapValues(map(mapValues(identity)))(json["pagemap"]);
    result.htmlTitle = identity(json["htmlTitle"]);
    result.htmlSnippet = identity(json["htmlSnippet"]);
    result.link = identity(json["link"]);
    result.image = ResultImage.parse(json["image"]);
    result.mime = identity(json["mime"]);
    result.fileFormat = identity(json["fileFormat"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Result value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["snippet"] = identity(value.snippet);
    result["kind"] = identity(value.kind);
    result["labels"] = map(ResultLabels.serialize)(value.labels);
    result["title"] = identity(value.title);
    result["displayLink"] = identity(value.displayLink);
    result["cacheId"] = identity(value.cacheId);
    result["formattedUrl"] = identity(value.formattedUrl);
    result["htmlFormattedUrl"] = identity(value.htmlFormattedUrl);
    result["pagemap"] = mapValues(map(mapValues(identity)))(value.pagemap);
    result["htmlTitle"] = identity(value.htmlTitle);
    result["htmlSnippet"] = identity(value.htmlSnippet);
    result["link"] = identity(value.link);
    result["image"] = ResultImage.serialize(value.image);
    result["mime"] = identity(value.mime);
    result["fileFormat"] = identity(value.fileFormat);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultImage
class ResultImage extends IdentityHash {
  
  int thumbnailWidth;

  
  int byteSize;

  
  int height;

  
  int width;

  
  String contextLink;

  
  String thumbnailLink;

  
  int thumbnailHeight;

  /** Parses an instance from its JSON representation. */
  static ResultImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ResultImage();
    result.thumbnailWidth = identity(json["thumbnailWidth"]);
    result.byteSize = identity(json["byteSize"]);
    result.height = identity(json["height"]);
    result.width = identity(json["width"]);
    result.contextLink = identity(json["contextLink"]);
    result.thumbnailLink = identity(json["thumbnailLink"]);
    result.thumbnailHeight = identity(json["thumbnailHeight"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ResultImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["thumbnailWidth"] = identity(value.thumbnailWidth);
    result["byteSize"] = identity(value.byteSize);
    result["height"] = identity(value.height);
    result["width"] = identity(value.width);
    result["contextLink"] = identity(value.contextLink);
    result["thumbnailLink"] = identity(value.thumbnailLink);
    result["thumbnailHeight"] = identity(value.thumbnailHeight);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Result.ResultLabels
class ResultLabels extends IdentityHash {
  
  String displayName;

  
  String name;

  /** Parses an instance from its JSON representation. */
  static ResultLabels parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ResultLabels();
    result.displayName = identity(json["displayName"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ResultLabels value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["displayName"] = identity(value.displayName);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Search
class Search extends IdentityHash {
  
  List<Promotion> promotions;

  
  String kind;

  
  SearchUrl url;

  
  List<Result> items;

  
  Context context;

  
  Map<String, List<Query>> queries;

  
  SearchSpelling spelling;

  
  SearchSearchInformation searchInformation;

  /** Parses an instance from its JSON representation. */
  static Search parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Search();
    result.promotions = map(Promotion.parse)(json["promotions"]);
    result.kind = identity(json["kind"]);
    result.url = SearchUrl.parse(json["url"]);
    result.items = map(Result.parse)(json["items"]);
    result.context = Context.parse(json["context"]);
    result.queries = mapValues(map(Query.parse))(json["queries"]);
    result.spelling = SearchSpelling.parse(json["spelling"]);
    result.searchInformation = SearchSearchInformation.parse(json["searchInformation"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Search value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["promotions"] = map(Promotion.serialize)(value.promotions);
    result["kind"] = identity(value.kind);
    result["url"] = SearchUrl.serialize(value.url);
    result["items"] = map(Result.serialize)(value.items);
    result["context"] = Context.serialize(value.context);
    result["queries"] = mapValues(map(Query.serialize))(value.queries);
    result["spelling"] = SearchSpelling.serialize(value.spelling);
    result["searchInformation"] = SearchSearchInformation.serialize(value.searchInformation);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Search.SearchSearchInformation
class SearchSearchInformation extends IdentityHash {
  
  String formattedSearchTime;

  
  String formattedTotalResults;

  
  String totalResults;

  
  double searchTime;

  /** Parses an instance from its JSON representation. */
  static SearchSearchInformation parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SearchSearchInformation();
    result.formattedSearchTime = identity(json["formattedSearchTime"]);
    result.formattedTotalResults = identity(json["formattedTotalResults"]);
    result.totalResults = identity(json["totalResults"]);
    result.searchTime = identity(json["searchTime"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SearchSearchInformation value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["formattedSearchTime"] = identity(value.formattedSearchTime);
    result["formattedTotalResults"] = identity(value.formattedTotalResults);
    result["totalResults"] = identity(value.totalResults);
    result["searchTime"] = identity(value.searchTime);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Search.SearchSpelling
class SearchSpelling extends IdentityHash {
  
  String correctedQuery;

  
  String htmlCorrectedQuery;

  /** Parses an instance from its JSON representation. */
  static SearchSpelling parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SearchSpelling();
    result.correctedQuery = identity(json["correctedQuery"]);
    result.htmlCorrectedQuery = identity(json["htmlCorrectedQuery"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SearchSpelling value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["correctedQuery"] = identity(value.correctedQuery);
    result["htmlCorrectedQuery"] = identity(value.htmlCorrectedQuery);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Search.SearchUrl
class SearchUrl extends IdentityHash {
  
  String type;

  
  String template;

  /** Parses an instance from its JSON representation. */
  static SearchUrl parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new SearchUrl();
    result.type = identity(json["type"]);
    result.template = identity(json["template"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(SearchUrl value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["template"] = identity(value.template);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum CustomsearchApi.Alt
class CustomsearchApiAlt implements Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final CustomsearchApiAlt ATOM = const CustomsearchApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final CustomsearchApiAlt JSON = const CustomsearchApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final List<CustomsearchApiAlt> values = const <CustomsearchApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <CustomsearchApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static CustomsearchApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const CustomsearchApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

