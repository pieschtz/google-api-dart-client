#library("shopping");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API ShoppingApi
/**
 * Lets you search over product data.
 */
class ShoppingApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  ShoppingApi get _$service() => this;
  ProductsResource _products;
  ProductsResource get products() => _products;
  
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
  ShoppingApiAlt alt;


  ShoppingApi([this.baseUrl = "https://www.googleapis.com/shopping/search/v1/", this.applicationName]) { 
    _products = new ProductsResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}shopping/v1/20120530 google-api-dart-client/${clientVersion}";
  }
}

// Resource .ProductsResource
class ProductsResource {
  final ShoppingApi _$service;
  
  ProductsResource._internal(ShoppingApi $service) : _$service = $service;

  // Method ProductsResource.List
  /**
   * Returns a list of products and content modules
   * [source] Query source
   */
  Future<Products> list(String source, [String facetsInclude = UNSPECIFIED, bool plusOneEnabled = UNSPECIFIED, bool plusOneUseGcsConfig = UNSPECIFIED, bool facetsEnabled = UNSPECIFIED, bool relatedQueriesUseGcsConfig = UNSPECIFIED, bool promotionsEnabled = UNSPECIFIED, String channels = UNSPECIFIED, String currency = UNSPECIFIED, bool categoryRecommendationsEnabled = UNSPECIFIED, String facetsDiscover = UNSPECIFIED, String categoryRecommendationsCategory = UNSPECIFIED, int startIndex = UNSPECIFIED, String availability = UNSPECIFIED, String crowdBy = UNSPECIFIED, bool spellingEnabled = UNSPECIFIED, String taxonomy = UNSPECIFIED, bool spellingUseGcsConfig = UNSPECIFIED, String useCase = UNSPECIFIED, String location = UNSPECIFIED, int maxVariants = UNSPECIFIED, String plusOneOptions = UNSPECIFIED, String categoriesInclude = UNSPECIFIED, String boostBy = UNSPECIFIED, bool safe = UNSPECIFIED, bool categoriesUseGcsConfig = UNSPECIFIED, int maxResults = UNSPECIFIED, bool facetsUseGcsConfig = UNSPECIFIED, bool categoriesEnabled = UNSPECIFIED, String attributeFilter = UNSPECIFIED, bool clickTracking = UNSPECIFIED, String thumbnails = UNSPECIFIED, String language = UNSPECIFIED, String categoryRecommendationsInclude = UNSPECIFIED, String country = UNSPECIFIED, String rankBy = UNSPECIFIED, String restrictBy = UNSPECIFIED, String q = UNSPECIFIED, bool redirectsEnabled = UNSPECIFIED, bool redirectsUseGcsConfig = UNSPECIFIED, bool relatedQueriesEnabled = UNSPECIFIED, bool categoryRecommendationsUseGcsConfig = UNSPECIFIED, bool promotionsUseGcsConfig = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["source"] = source;
    if (UNSPECIFIED != facetsInclude) $queryParams["facets.include"] = facetsInclude;
    if (UNSPECIFIED != plusOneEnabled) $queryParams["plusOne.enabled"] = plusOneEnabled;
    if (UNSPECIFIED != plusOneUseGcsConfig) $queryParams["plusOne.useGcsConfig"] = plusOneUseGcsConfig;
    if (UNSPECIFIED != facetsEnabled) $queryParams["facets.enabled"] = facetsEnabled;
    if (UNSPECIFIED != relatedQueriesUseGcsConfig) $queryParams["relatedQueries.useGcsConfig"] = relatedQueriesUseGcsConfig;
    if (UNSPECIFIED != promotionsEnabled) $queryParams["promotions.enabled"] = promotionsEnabled;
    if (UNSPECIFIED != channels) $queryParams["channels"] = channels;
    if (UNSPECIFIED != currency) $queryParams["currency"] = currency;
    if (UNSPECIFIED != categoryRecommendationsEnabled) $queryParams["categoryRecommendations.enabled"] = categoryRecommendationsEnabled;
    if (UNSPECIFIED != facetsDiscover) $queryParams["facets.discover"] = facetsDiscover;
    if (UNSPECIFIED != categoryRecommendationsCategory) $queryParams["categoryRecommendations.category"] = categoryRecommendationsCategory;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != availability) $queryParams["availability"] = availability;
    if (UNSPECIFIED != crowdBy) $queryParams["crowdBy"] = crowdBy;
    if (UNSPECIFIED != spellingEnabled) $queryParams["spelling.enabled"] = spellingEnabled;
    if (UNSPECIFIED != taxonomy) $queryParams["taxonomy"] = taxonomy;
    if (UNSPECIFIED != spellingUseGcsConfig) $queryParams["spelling.useGcsConfig"] = spellingUseGcsConfig;
    if (UNSPECIFIED != useCase) $queryParams["useCase"] = useCase;
    if (UNSPECIFIED != location) $queryParams["location"] = location;
    if (UNSPECIFIED != maxVariants) $queryParams["maxVariants"] = maxVariants;
    if (UNSPECIFIED != plusOneOptions) $queryParams["plusOne.options"] = plusOneOptions;
    if (UNSPECIFIED != categoriesInclude) $queryParams["categories.include"] = categoriesInclude;
    if (UNSPECIFIED != boostBy) $queryParams["boostBy"] = boostBy;
    if (UNSPECIFIED != safe) $queryParams["safe"] = safe;
    if (UNSPECIFIED != categoriesUseGcsConfig) $queryParams["categories.useGcsConfig"] = categoriesUseGcsConfig;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != facetsUseGcsConfig) $queryParams["facets.useGcsConfig"] = facetsUseGcsConfig;
    if (UNSPECIFIED != categoriesEnabled) $queryParams["categories.enabled"] = categoriesEnabled;
    if (UNSPECIFIED != attributeFilter) $queryParams["attributeFilter"] = attributeFilter;
    if (UNSPECIFIED != clickTracking) $queryParams["clickTracking"] = clickTracking;
    if (UNSPECIFIED != thumbnails) $queryParams["thumbnails"] = thumbnails;
    if (UNSPECIFIED != language) $queryParams["language"] = language;
    if (UNSPECIFIED != categoryRecommendationsInclude) $queryParams["categoryRecommendations.include"] = categoryRecommendationsInclude;
    if (UNSPECIFIED != country) $queryParams["country"] = country;
    if (UNSPECIFIED != rankBy) $queryParams["rankBy"] = rankBy;
    if (UNSPECIFIED != restrictBy) $queryParams["restrictBy"] = restrictBy;
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != redirectsEnabled) $queryParams["redirects.enabled"] = redirectsEnabled;
    if (UNSPECIFIED != redirectsUseGcsConfig) $queryParams["redirects.useGcsConfig"] = redirectsUseGcsConfig;
    if (UNSPECIFIED != relatedQueriesEnabled) $queryParams["relatedQueries.enabled"] = relatedQueriesEnabled;
    if (UNSPECIFIED != categoryRecommendationsUseGcsConfig) $queryParams["categoryRecommendations.useGcsConfig"] = categoryRecommendationsUseGcsConfig;
    if (UNSPECIFIED != promotionsUseGcsConfig) $queryParams["promotions.useGcsConfig"] = promotionsUseGcsConfig;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "{source}/products").generate($pathParams, $queryParams);
    final $completer = new Completer<Products>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Products.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method ProductsResource.Get
  /**
   * Returns a single product
   * [source] Query source
   * [accountId] Merchant center account id
   * [productIdType] Type of productId
   * [productId] Id of product
   */
  Future<Product> get(String source, int accountId, String productIdType, String productId, [String categoriesInclude = UNSPECIFIED, bool recommendationsEnabled = UNSPECIFIED, bool plusOneUseGcsConfig = UNSPECIFIED, String taxonomy = UNSPECIFIED, bool categoriesUseGcsConfig = UNSPECIFIED, String recommendationsInclude = UNSPECIFIED, bool categoriesEnabled = UNSPECIFIED, String location = UNSPECIFIED, bool plusOneEnabled = UNSPECIFIED, String thumbnails = UNSPECIFIED, String attributeFilter = UNSPECIFIED, bool recommendationsUseGcsConfig = UNSPECIFIED, String plusOneOptions = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["source"] = source;
    $pathParams["accountId"] = accountId;
    $pathParams["productIdType"] = productIdType;
    $pathParams["productId"] = productId;
    if (UNSPECIFIED != categoriesInclude) $queryParams["categories.include"] = categoriesInclude;
    if (UNSPECIFIED != recommendationsEnabled) $queryParams["recommendations.enabled"] = recommendationsEnabled;
    if (UNSPECIFIED != plusOneUseGcsConfig) $queryParams["plusOne.useGcsConfig"] = plusOneUseGcsConfig;
    if (UNSPECIFIED != taxonomy) $queryParams["taxonomy"] = taxonomy;
    if (UNSPECIFIED != categoriesUseGcsConfig) $queryParams["categories.useGcsConfig"] = categoriesUseGcsConfig;
    if (UNSPECIFIED != recommendationsInclude) $queryParams["recommendations.include"] = recommendationsInclude;
    if (UNSPECIFIED != categoriesEnabled) $queryParams["categories.enabled"] = categoriesEnabled;
    if (UNSPECIFIED != location) $queryParams["location"] = location;
    if (UNSPECIFIED != plusOneEnabled) $queryParams["plusOne.enabled"] = plusOneEnabled;
    if (UNSPECIFIED != thumbnails) $queryParams["thumbnails"] = thumbnails;
    if (UNSPECIFIED != attributeFilter) $queryParams["attributeFilter"] = attributeFilter;
    if (UNSPECIFIED != recommendationsUseGcsConfig) $queryParams["recommendations.useGcsConfig"] = recommendationsUseGcsConfig;
    if (UNSPECIFIED != plusOneOptions) $queryParams["plusOne.options"] = plusOneOptions;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "{source}/products/{accountId}/{productIdType}/{productId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Product>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Product.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .Product
class Product extends IdentityHash {
  
  String selfLink;

  /** The kind of item, always shopping#product. */
  String kind;

  /** Product. */
  ShoppingModelProductJsonV1 product;

  /** Unique identifier for this request. */
  String requestId;

  /** Recommendations for product. */
  List<ShoppingModelRecommendationsJsonV1> recommendations;

  /** Google internal. */
  ShoppingModelDebugJsonV1 debug;

  /** Id of product. */
  String id;

  /** List of categories for product. */
  List<ShoppingModelCategoryJsonV1> categories;

  /** Parses an instance from its JSON representation. */
  static Product parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Product();
    result.selfLink = identity(json["selfLink"]);
    result.kind = identity(json["kind"]);
    result.product = ShoppingModelProductJsonV1.parse(json["product"]);
    result.requestId = identity(json["requestId"]);
    result.recommendations = map(ShoppingModelRecommendationsJsonV1.parse)(json["recommendations"]);
    result.debug = ShoppingModelDebugJsonV1.parse(json["debug"]);
    result.id = identity(json["id"]);
    result.categories = map(ShoppingModelCategoryJsonV1.parse)(json["categories"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Product value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["selfLink"] = identity(value.selfLink);
    result["kind"] = identity(value.kind);
    result["product"] = ShoppingModelProductJsonV1.serialize(value.product);
    result["requestId"] = identity(value.requestId);
    result["recommendations"] = map(ShoppingModelRecommendationsJsonV1.serialize)(value.recommendations);
    result["debug"] = ShoppingModelDebugJsonV1.serialize(value.debug);
    result["id"] = identity(value.id);
    result["categories"] = map(ShoppingModelCategoryJsonV1.serialize)(value.categories);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Products
class Products extends IdentityHash {
  /** List of promotions. */
  List<ProductsPromotions> promotions;

  /** Self link of feed. */
  String selfLink;

  /** The fixed string "shopping#products". The kind of feed returned. */
  String kind;

  /** List of returned stores. */
  List<ProductsStores> stores;

  /** Current item count. */
  int currentItemCount;

  /** List of returned products. */
  List<Product> items;

  /** List of facets. */
  List<ProductsFacets> facets;

  /** Number of items per page of results. */
  int itemsPerPage;

  /** Redirects. */
  List<String> redirects;

  /** Next link of feed. */
  String nextLink;

  /** Related queries. */
  List<String> relatedQueries;

  /** Total number of search results. */
  int totalItems;

  /** 1-based index of the first item in the search results. */
  int startIndex;

  /** Etag of feed. */
  String etag;

  /** Unique identifier for this request. */
  String requestId;

  /** Recommendations for category. */
  List<ShoppingModelRecommendationsJsonV1> categoryRecommendations;

  /** Google internal. */
  ShoppingModelDebugJsonV1 debug;

  /** Spelling. */
  ProductsSpelling spelling;

  /** Previous link of feed. */
  String previousLink;

  /** Id of feed. */
  String id;

  /** List of categories. */
  List<ShoppingModelCategoryJsonV1> categories;

  /** Parses an instance from its JSON representation. */
  static Products parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Products();
    result.promotions = map(ProductsPromotions.parse)(json["promotions"]);
    result.selfLink = identity(json["selfLink"]);
    result.kind = identity(json["kind"]);
    result.stores = map(ProductsStores.parse)(json["stores"]);
    result.currentItemCount = identity(json["currentItemCount"]);
    result.items = map(Product.parse)(json["items"]);
    result.facets = map(ProductsFacets.parse)(json["facets"]);
    result.itemsPerPage = identity(json["itemsPerPage"]);
    result.redirects = map(identity)(json["redirects"]);
    result.nextLink = identity(json["nextLink"]);
    result.relatedQueries = map(identity)(json["relatedQueries"]);
    result.totalItems = identity(json["totalItems"]);
    result.startIndex = identity(json["startIndex"]);
    result.etag = identity(json["etag"]);
    result.requestId = identity(json["requestId"]);
    result.categoryRecommendations = map(ShoppingModelRecommendationsJsonV1.parse)(json["categoryRecommendations"]);
    result.debug = ShoppingModelDebugJsonV1.parse(json["debug"]);
    result.spelling = ProductsSpelling.parse(json["spelling"]);
    result.previousLink = identity(json["previousLink"]);
    result.id = identity(json["id"]);
    result.categories = map(ShoppingModelCategoryJsonV1.parse)(json["categories"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Products value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["promotions"] = map(ProductsPromotions.serialize)(value.promotions);
    result["selfLink"] = identity(value.selfLink);
    result["kind"] = identity(value.kind);
    result["stores"] = map(ProductsStores.serialize)(value.stores);
    result["currentItemCount"] = identity(value.currentItemCount);
    result["items"] = map(Product.serialize)(value.items);
    result["facets"] = map(ProductsFacets.serialize)(value.facets);
    result["itemsPerPage"] = identity(value.itemsPerPage);
    result["redirects"] = map(identity)(value.redirects);
    result["nextLink"] = identity(value.nextLink);
    result["relatedQueries"] = map(identity)(value.relatedQueries);
    result["totalItems"] = identity(value.totalItems);
    result["startIndex"] = identity(value.startIndex);
    result["etag"] = identity(value.etag);
    result["requestId"] = identity(value.requestId);
    result["categoryRecommendations"] = map(ShoppingModelRecommendationsJsonV1.serialize)(value.categoryRecommendations);
    result["debug"] = ShoppingModelDebugJsonV1.serialize(value.debug);
    result["spelling"] = ProductsSpelling.serialize(value.spelling);
    result["previousLink"] = identity(value.previousLink);
    result["id"] = identity(value.id);
    result["categories"] = map(ShoppingModelCategoryJsonV1.serialize)(value.categories);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Products.ProductsFacets
class ProductsFacets extends IdentityHash {
  /**
 * Number of products matching the query that have a value for the facet's property or attribute.
 */
  int count;

  /** Display name of facet. */
  String displayName;

  /** Name of the facet's attribute (omitted for property facets). */
  String name;

  /** List of Buckets within facet. */
  List<ProductsFacetsBuckets> buckets;

  /** Property of facet (omitted for attribute facets). */
  String property;

  /** Type of facet's attribute (omitted for property facets, one of: text, bool, int, float). */
  String type;

  /**
 * Unit of the facet's property or attribute (omitted if the facet's property or attribute has no
 * unit).
 */
  String unit;

  /** Parses an instance from its JSON representation. */
  static ProductsFacets parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProductsFacets();
    result.count = identity(json["count"]);
    result.displayName = identity(json["displayName"]);
    result.name = identity(json["name"]);
    result.buckets = map(ProductsFacetsBuckets.parse)(json["buckets"]);
    result.property = identity(json["property"]);
    result.type = identity(json["type"]);
    result.unit = identity(json["unit"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProductsFacets value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["count"] = identity(value.count);
    result["displayName"] = identity(value.displayName);
    result["name"] = identity(value.name);
    result["buckets"] = map(ProductsFacetsBuckets.serialize)(value.buckets);
    result["property"] = identity(value.property);
    result["type"] = identity(value.type);
    result["unit"] = identity(value.unit);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Products.ProductsFacets.ProductsFacetsBuckets
class ProductsFacetsBuckets extends IdentityHash {
  /**
 * Number of products matching the query that have a value for the facet's property or attribute
 * that matches the bucket.
 */
  int count;

  /**
 * Whether the lower bound of the bucket is exclusive (omitted for value buckets or if the range has
 * no lower bound).
 */
  bool minExclusive;

  /** Lower bound of the bucket (omitted for value buckets or if the range has no lower bound). */
  Object min;

  /** Upper bound of the bucket (omitted for value buckets or if the range has no upper bound). */
  Object max;

  /** Value of the bucket (omitted for range buckets). */
  Object value;

  /**
 * Whether the upper bound of the bucket is exclusive (omitted for value buckets or if the range has
 * no upper bound).
 */
  bool maxExclusive;

  /** Parses an instance from its JSON representation. */
  static ProductsFacetsBuckets parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProductsFacetsBuckets();
    result.count = identity(json["count"]);
    result.minExclusive = identity(json["minExclusive"]);
    result.min = identity(json["min"]);
    result.max = identity(json["max"]);
    result.value = identity(json["value"]);
    result.maxExclusive = identity(json["maxExclusive"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProductsFacetsBuckets value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["count"] = identity(value.count);
    result["minExclusive"] = identity(value.minExclusive);
    result["min"] = identity(value.min);
    result["max"] = identity(value.max);
    result["value"] = identity(value.value);
    result["maxExclusive"] = identity(value.maxExclusive);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Products.ProductsPromotions
class ProductsPromotions extends IdentityHash {
  /** Product of promotion (omitted if type is not product). */
  ShoppingModelProductJsonV1 product;

  /** Description of promotion (omitted if type is not standard). */
  String description;

  /** Link to promotion image (omitted if type is not standard). */
  String imageLink;

  /** Link to promotion (omitted if type is not standard). */
  String destLink;

  /** Custom HTML of promotion (omitted if type is not custom). */
  String customHtml;

  /** Link to promotion without scheme. DEPRECATED. WILL BE REMOVED SOON. USE destLink. */
  String link;

  /** List of custom fields of promotion. */
  List<ProductsPromotionsCustomFields> customFields;

  /** Type of promotion (one of: standard, product, custom). */
  String type;

  /** Name of promotion (omitted if type is not standard). */
  String name;

  /** Parses an instance from its JSON representation. */
  static ProductsPromotions parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProductsPromotions();
    result.product = ShoppingModelProductJsonV1.parse(json["product"]);
    result.description = identity(json["description"]);
    result.imageLink = identity(json["imageLink"]);
    result.destLink = identity(json["destLink"]);
    result.customHtml = identity(json["customHtml"]);
    result.link = identity(json["link"]);
    result.customFields = map(ProductsPromotionsCustomFields.parse)(json["customFields"]);
    result.type = identity(json["type"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProductsPromotions value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["product"] = ShoppingModelProductJsonV1.serialize(value.product);
    result["description"] = identity(value.description);
    result["imageLink"] = identity(value.imageLink);
    result["destLink"] = identity(value.destLink);
    result["customHtml"] = identity(value.customHtml);
    result["link"] = identity(value.link);
    result["customFields"] = map(ProductsPromotionsCustomFields.serialize)(value.customFields);
    result["type"] = identity(value.type);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Products.ProductsPromotions.ProductsPromotionsCustomFields
class ProductsPromotionsCustomFields extends IdentityHash {
  /** Name of field. */
  String name;

  /** Value of field. */
  String value;

  /** Parses an instance from its JSON representation. */
  static ProductsPromotionsCustomFields parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProductsPromotionsCustomFields();
    result.name = identity(json["name"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProductsPromotionsCustomFields value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["name"] = identity(value.name);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Products.ProductsSpelling
class ProductsSpelling extends IdentityHash {
  /** Suggestion for spelling. */
  String suggestion;

  /** Parses an instance from its JSON representation. */
  static ProductsSpelling parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProductsSpelling();
    result.suggestion = identity(json["suggestion"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProductsSpelling value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["suggestion"] = identity(value.suggestion);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Products.ProductsStores
class ProductsStores extends IdentityHash {
  /** Merchant-supplied store code. */
  String storeCode;

  /** Name of merchant. */
  String name;

  /** Name of store. */
  String storeName;

  /** Id of store. */
  String storeId;

  /** Telephone number of store. */
  String telephone;

  /** Location of store. */
  String location;

  /** Address of store. */
  String address;

  /** Parses an instance from its JSON representation. */
  static ProductsStores parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ProductsStores();
    result.storeCode = identity(json["storeCode"]);
    result.name = identity(json["name"]);
    result.storeName = identity(json["storeName"]);
    result.storeId = identity(json["storeId"]);
    result.telephone = identity(json["telephone"]);
    result.location = identity(json["location"]);
    result.address = identity(json["address"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ProductsStores value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["storeCode"] = identity(value.storeCode);
    result["name"] = identity(value.name);
    result["storeName"] = identity(value.storeName);
    result["storeId"] = identity(value.storeId);
    result["telephone"] = identity(value.telephone);
    result["location"] = identity(value.location);
    result["address"] = identity(value.address);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ShoppingModelCategoryJsonV1
class ShoppingModelCategoryJsonV1 extends IdentityHash {
  /** URL of category. */
  String url;

  /** Short name of category. */
  String shortName;

  /** Ids of the parents of the category. */
  List<String> parents;

  /** Id of category. */
  String id;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelCategoryJsonV1 parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelCategoryJsonV1();
    result.url = identity(json["url"]);
    result.shortName = identity(json["shortName"]);
    result.parents = map(identity)(json["parents"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelCategoryJsonV1 value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["shortName"] = identity(value.shortName);
    result["parents"] = map(identity)(value.parents);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ShoppingModelDebugJsonV1
class ShoppingModelDebugJsonV1 extends IdentityHash {
  /** Google internal. */
  String searchRequest;

  /** Google internal. */
  String rdcResponse;

  /** Google internal. */
  String facetsRequest;

  /** Google internal. */
  String searchResponse;

  /** Google internal. */
  String elapsedMillis;

  /** Google internal. */
  String facetsResponse;

  /** Google internal */
  List<ShoppingModelDebugJsonV1BackendTimes> backendTimes;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelDebugJsonV1 parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelDebugJsonV1();
    result.searchRequest = identity(json["searchRequest"]);
    result.rdcResponse = identity(json["rdcResponse"]);
    result.facetsRequest = identity(json["facetsRequest"]);
    result.searchResponse = identity(json["searchResponse"]);
    result.elapsedMillis = identity(json["elapsedMillis"]);
    result.facetsResponse = identity(json["facetsResponse"]);
    result.backendTimes = map(ShoppingModelDebugJsonV1BackendTimes.parse)(json["backendTimes"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelDebugJsonV1 value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["searchRequest"] = identity(value.searchRequest);
    result["rdcResponse"] = identity(value.rdcResponse);
    result["facetsRequest"] = identity(value.facetsRequest);
    result["searchResponse"] = identity(value.searchResponse);
    result["elapsedMillis"] = identity(value.elapsedMillis);
    result["facetsResponse"] = identity(value.facetsResponse);
    result["backendTimes"] = map(ShoppingModelDebugJsonV1BackendTimes.serialize)(value.backendTimes);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelDebugJsonV1.ShoppingModelDebugJsonV1BackendTimes
class ShoppingModelDebugJsonV1BackendTimes extends IdentityHash {
  /** Google internal */
  String serverMillis;

  /** Google internal */
  String hostName;

  /** Google internal */
  String name;

  /** Google internal */
  String elapsedMillis;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelDebugJsonV1BackendTimes parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelDebugJsonV1BackendTimes();
    result.serverMillis = identity(json["serverMillis"]);
    result.hostName = identity(json["hostName"]);
    result.name = identity(json["name"]);
    result.elapsedMillis = identity(json["elapsedMillis"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelDebugJsonV1BackendTimes value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["serverMillis"] = identity(value.serverMillis);
    result["hostName"] = identity(value.hostName);
    result["name"] = identity(value.name);
    result["elapsedMillis"] = identity(value.elapsedMillis);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ShoppingModelProductJsonV1
class ShoppingModelProductJsonV1 extends IdentityHash {
  /**
 * Whether this product matched the user query. Only set for the variant offers (if any) attached to
 * a product offer.
 */
  bool queryMatched;

  /** The first GTIN of the product. Deprecated in favor of "gtins". */
  String gtin;

  /** Images of product. */
  List<ShoppingModelProductJsonV1Images> images;

  /** Inventories of product. */
  List<ShoppingModelProductJsonV1Inventories> inventories;

  /** Author of product. */
  ShoppingModelProductJsonV1Author author;

  /** Condition of product (one of: new, refurbished, used). */
  String condition;

  /** Merchant-provided id of product (available only with a cx source). */
  String providedId;

  /** Google Internal. */
  List<String> internal8;

  /** Description of product. */
  String description;

  /** List of all the product's GTINs (in GTIN-14 format). */
  List<String> gtins;

  /** Google Internal. */
  List<String> internal1;

  /** Brand of product. */
  String brand;

  /** Google Internal. */
  String internal3;

  /** Google Internal. */
  List<ShoppingModelProductJsonV1Internal4> internal4;

  /** Google Internal. */
  String internal6;

  /** Google Internal. */
  bool internal7;

  /** Link to product. */
  String link;

  /** List of all the product's MPNs. */
  List<String> mpns;

  /** Attributes of product (available only with a cx source). */
  List<ShoppingModelProductJsonV1Attributes> attributes;

  /** The number of variant offers returned that matched the query. */
  int totalMatchingVariants;

  /** A list of variant offers associated with this product. */
  List<ShoppingModelProductJsonV1Variants> variants;

  /** RFC 3339 formatted modification time and date of product. */
  String modificationTime;

  /**
 * Categories of product according to the selected taxonomy, omitted if no taxonomy is selected.
 */
  List<String> categories;

  /** BCP 47 language tag of language of product. */
  String language;

  /** ISO 3166 code of target country of product. */
  String country;

  /** Title of product. */
  String title;

  /** RFC 3339 formatted creation time and date of product. */
  String creationTime;

  /** Google Internal. */
  double internal14;

  /** Google Internal. */
  String internal12;

  /** Google Internal. */
  double internal13;

  /** Google Internal. */
  List<String> internal10;

  /** Code to add to the page to render the +1 content. */
  String plusOne;

  /** Google id of product. */
  String googleId;

  /** Google Internal. */
  double internal15;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1 parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1();
    result.queryMatched = identity(json["queryMatched"]);
    result.gtin = identity(json["gtin"]);
    result.images = map(ShoppingModelProductJsonV1Images.parse)(json["images"]);
    result.inventories = map(ShoppingModelProductJsonV1Inventories.parse)(json["inventories"]);
    result.author = ShoppingModelProductJsonV1Author.parse(json["author"]);
    result.condition = identity(json["condition"]);
    result.providedId = identity(json["providedId"]);
    result.internal8 = map(identity)(json["internal8"]);
    result.description = identity(json["description"]);
    result.gtins = map(identity)(json["gtins"]);
    result.internal1 = map(identity)(json["internal1"]);
    result.brand = identity(json["brand"]);
    result.internal3 = identity(json["internal3"]);
    result.internal4 = map(ShoppingModelProductJsonV1Internal4.parse)(json["internal4"]);
    result.internal6 = identity(json["internal6"]);
    result.internal7 = identity(json["internal7"]);
    result.link = identity(json["link"]);
    result.mpns = map(identity)(json["mpns"]);
    result.attributes = map(ShoppingModelProductJsonV1Attributes.parse)(json["attributes"]);
    result.totalMatchingVariants = identity(json["totalMatchingVariants"]);
    result.variants = map(ShoppingModelProductJsonV1Variants.parse)(json["variants"]);
    result.modificationTime = identity(json["modificationTime"]);
    result.categories = map(identity)(json["categories"]);
    result.language = identity(json["language"]);
    result.country = identity(json["country"]);
    result.title = identity(json["title"]);
    result.creationTime = identity(json["creationTime"]);
    result.internal14 = identity(json["internal14"]);
    result.internal12 = identity(json["internal12"]);
    result.internal13 = identity(json["internal13"]);
    result.internal10 = map(identity)(json["internal10"]);
    result.plusOne = identity(json["plusOne"]);
    result.googleId = identity(json["googleId"]);
    result.internal15 = identity(json["internal15"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1 value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["queryMatched"] = identity(value.queryMatched);
    result["gtin"] = identity(value.gtin);
    result["images"] = map(ShoppingModelProductJsonV1Images.serialize)(value.images);
    result["inventories"] = map(ShoppingModelProductJsonV1Inventories.serialize)(value.inventories);
    result["author"] = ShoppingModelProductJsonV1Author.serialize(value.author);
    result["condition"] = identity(value.condition);
    result["providedId"] = identity(value.providedId);
    result["internal8"] = map(identity)(value.internal8);
    result["description"] = identity(value.description);
    result["gtins"] = map(identity)(value.gtins);
    result["internal1"] = map(identity)(value.internal1);
    result["brand"] = identity(value.brand);
    result["internal3"] = identity(value.internal3);
    result["internal4"] = map(ShoppingModelProductJsonV1Internal4.serialize)(value.internal4);
    result["internal6"] = identity(value.internal6);
    result["internal7"] = identity(value.internal7);
    result["link"] = identity(value.link);
    result["mpns"] = map(identity)(value.mpns);
    result["attributes"] = map(ShoppingModelProductJsonV1Attributes.serialize)(value.attributes);
    result["totalMatchingVariants"] = identity(value.totalMatchingVariants);
    result["variants"] = map(ShoppingModelProductJsonV1Variants.serialize)(value.variants);
    result["modificationTime"] = identity(value.modificationTime);
    result["categories"] = map(identity)(value.categories);
    result["language"] = identity(value.language);
    result["country"] = identity(value.country);
    result["title"] = identity(value.title);
    result["creationTime"] = identity(value.creationTime);
    result["internal14"] = identity(value.internal14);
    result["internal12"] = identity(value.internal12);
    result["internal13"] = identity(value.internal13);
    result["internal10"] = map(identity)(value.internal10);
    result["plusOne"] = identity(value.plusOne);
    result["googleId"] = identity(value.googleId);
    result["internal15"] = identity(value.internal15);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Attributes
class ShoppingModelProductJsonV1Attributes extends IdentityHash {
  /** Type of product attribute (one of: text, bool, int, float, dateRange, url). */
  String type;

  /** Value of product attribute. */
  Object value;

  /** Display Name of prodct attribute. */
  String displayName;

  /** Name of product attribute. */
  String name;

  /** Unit of product attribute. */
  String unit;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1Attributes parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1Attributes();
    result.type = identity(json["type"]);
    result.value = identity(json["value"]);
    result.displayName = identity(json["displayName"]);
    result.name = identity(json["name"]);
    result.unit = identity(json["unit"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1Attributes value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["type"] = identity(value.type);
    result["value"] = identity(value.value);
    result["displayName"] = identity(value.displayName);
    result["name"] = identity(value.name);
    result["unit"] = identity(value.unit);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Author
class ShoppingModelProductJsonV1Author extends IdentityHash {
  /** Name of product author. */
  String name;

  /** Account id of product author. */
  String accountId;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1Author parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1Author();
    result.name = identity(json["name"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1Author value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["name"] = identity(value.name);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Images
class ShoppingModelProductJsonV1Images extends IdentityHash {
  
  String status;

  /** Link to product image. */
  String link;

  /** Thumbnails of product image. */
  List<ShoppingModelProductJsonV1ImagesThumbnails> thumbnails;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1Images parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1Images();
    result.status = identity(json["status"]);
    result.link = identity(json["link"]);
    result.thumbnails = map(ShoppingModelProductJsonV1ImagesThumbnails.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1Images value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["status"] = identity(value.status);
    result["link"] = identity(value.link);
    result["thumbnails"] = map(ShoppingModelProductJsonV1ImagesThumbnails.serialize)(value.thumbnails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Images.ShoppingModelProductJsonV1ImagesThumbnails
class ShoppingModelProductJsonV1ImagesThumbnails extends IdentityHash {
  /**
 * Content of thumbnail (only available for the first thumbnail of the top results if SAYT is
 * enabled).
 */
  String content;

  /** Width of thumbnail (omitted if not specified in the request). */
  int width;

  /** Link to thumbnail. */
  String link;

  /** Height of thumbnail (omitted if not specified in the request). */
  int height;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1ImagesThumbnails parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1ImagesThumbnails();
    result.content = identity(json["content"]);
    result.width = identity(json["width"]);
    result.link = identity(json["link"]);
    result.height = identity(json["height"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1ImagesThumbnails value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["content"] = identity(value.content);
    result["width"] = identity(value.width);
    result["link"] = identity(value.link);
    result["height"] = identity(value.height);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Internal4
class ShoppingModelProductJsonV1Internal4 extends IdentityHash {
  /** Google Internal. */
  int node;

  /** Google Internal. */
  double confidence;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1Internal4 parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1Internal4();
    result.node = identity(json["node"]);
    result.confidence = identity(json["confidence"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1Internal4 value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["node"] = identity(value.node);
    result["confidence"] = identity(value.confidence);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Inventories
class ShoppingModelProductJsonV1Inventories extends IdentityHash {
  /** Installment price of product inventory. */
  double installmentPrice;

  /** Number of months for installment price. */
  int installmentMonths;

  /** Distance of product inventory. */
  double distance;

  /** Price of product inventory. */
  double price;

  /** Store ID of product inventory. */
  String storeId;

  /** Tax of product inventory. */
  double tax;

  /** Shipping cost of product inventory. */
  double shipping;

  /** Currency of product inventory (an ISO 4217 alphabetic code). */
  String currency;

  /** Sale price of product inventory. */
  double salePrice;

  /** Original price of product inventory. Only returned for products that are on sale. */
  double originalPrice;

  /** Distance unit of product inventory. */
  String distanceUnit;

  /** Sale start date. */
  String saleStartDate;

  /** Availability of product inventory. */
  String availability;

  /** Channel of product inventory (one of: online, local). */
  String channel;

  /** Sale end date. */
  String saleEndDate;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1Inventories parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1Inventories();
    result.installmentPrice = identity(json["installmentPrice"]);
    result.installmentMonths = identity(json["installmentMonths"]);
    result.distance = identity(json["distance"]);
    result.price = identity(json["price"]);
    result.storeId = identity(json["storeId"]);
    result.tax = identity(json["tax"]);
    result.shipping = identity(json["shipping"]);
    result.currency = identity(json["currency"]);
    result.salePrice = identity(json["salePrice"]);
    result.originalPrice = identity(json["originalPrice"]);
    result.distanceUnit = identity(json["distanceUnit"]);
    result.saleStartDate = identity(json["saleStartDate"]);
    result.availability = identity(json["availability"]);
    result.channel = identity(json["channel"]);
    result.saleEndDate = identity(json["saleEndDate"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1Inventories value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["installmentPrice"] = identity(value.installmentPrice);
    result["installmentMonths"] = identity(value.installmentMonths);
    result["distance"] = identity(value.distance);
    result["price"] = identity(value.price);
    result["storeId"] = identity(value.storeId);
    result["tax"] = identity(value.tax);
    result["shipping"] = identity(value.shipping);
    result["currency"] = identity(value.currency);
    result["salePrice"] = identity(value.salePrice);
    result["originalPrice"] = identity(value.originalPrice);
    result["distanceUnit"] = identity(value.distanceUnit);
    result["saleStartDate"] = identity(value.saleStartDate);
    result["availability"] = identity(value.availability);
    result["channel"] = identity(value.channel);
    result["saleEndDate"] = identity(value.saleEndDate);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelProductJsonV1.ShoppingModelProductJsonV1Variants
class ShoppingModelProductJsonV1Variants extends IdentityHash {
  /** The detailed offer data for a particular variant offer. */
  ShoppingModelProductJsonV1 variant;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelProductJsonV1Variants parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelProductJsonV1Variants();
    result.variant = ShoppingModelProductJsonV1.parse(json["variant"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelProductJsonV1Variants value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["variant"] = ShoppingModelProductJsonV1.serialize(value.variant);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ShoppingModelRecommendationsJsonV1
class ShoppingModelRecommendationsJsonV1 extends IdentityHash {
  /** List of recommendations. */
  List<ShoppingModelRecommendationsJsonV1RecommendationList> recommendationList;

  /**
 * Type of recommendation list (for offer-based recommendations, one of: all, purchaseToPurchase,
 * visitToVisit, visitToPurchase, relatedItems; for category-based recommendations, one of: all,
 * categoryMostVisited, categoryBestSeller).
 */
  String type;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelRecommendationsJsonV1 parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelRecommendationsJsonV1();
    result.recommendationList = map(ShoppingModelRecommendationsJsonV1RecommendationList.parse)(json["recommendationList"]);
    result.type = identity(json["type"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelRecommendationsJsonV1 value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["recommendationList"] = map(ShoppingModelRecommendationsJsonV1RecommendationList.serialize)(value.recommendationList);
    result["type"] = identity(value.type);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ShoppingModelRecommendationsJsonV1.ShoppingModelRecommendationsJsonV1RecommendationList
class ShoppingModelRecommendationsJsonV1RecommendationList extends IdentityHash {
  /** Recommended product. */
  ShoppingModelProductJsonV1 product;

  /** Parses an instance from its JSON representation. */
  static ShoppingModelRecommendationsJsonV1RecommendationList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new ShoppingModelRecommendationsJsonV1RecommendationList();
    result.product = ShoppingModelProductJsonV1.parse(json["product"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(ShoppingModelRecommendationsJsonV1RecommendationList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["product"] = ShoppingModelProductJsonV1.serialize(value.product);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum ShoppingApi.Alt
class ShoppingApiAlt implements Hashable {
  /** Responses with Content-Type of application/atom+xml */
  static final ShoppingApiAlt ATOM = const ShoppingApiAlt._internal("atom", 0);
  /** Responses with Content-Type of application/json */
  static final ShoppingApiAlt JSON = const ShoppingApiAlt._internal("json", 1);

  /** All values of this enumeration */
  static final List<ShoppingApiAlt> values = const <ShoppingApiAlt>[
    ATOM,
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <ShoppingApiAlt>{ 
    "atom": ATOM,
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ShoppingApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const ShoppingApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

