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

#library('prediction-v1.5');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API PredictionApi
/**
 * Lets you access a cloud hosted machine learning service that makes it easy to build smart apps
 */
class PredictionApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  PredictionApi get _$service() => this;
  TrainedmodelsResource _trainedmodels;
  TrainedmodelsResource get trainedmodels() => _trainedmodels;
  HostedmodelsResource _hostedmodels;
  HostedmodelsResource get hostedmodels() => _hostedmodels;
  
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
  PredictionApiAlt alt;


  PredictionApi([this.baseUrl = "https://www.googleapis.com/prediction/v1.5/", this.applicationName, this.authenticator]) { 
    _trainedmodels = new TrainedmodelsResource._internal(this);
    _hostedmodels = new HostedmodelsResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}prediction/v1.5/20120614 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View your data in Google Cloud Storage */
  final core.String DEVSTORAGE_READ_ONLY_SCOPE = "https://www.googleapis.com/auth/devstorage.read_only";

  /** OAuth2 scope: Manage your data in the Google Prediction API */
  final core.String PREDICTION_SCOPE = "https://www.googleapis.com/auth/prediction";
}

// Resource .TrainedmodelsResource
class TrainedmodelsResource extends core.Object {
  final PredictionApi _$service;
  
  TrainedmodelsResource._internal(PredictionApi $service) : _$service = $service;

  // Method TrainedmodelsResource.Insert
  /**
   * Begin training your model.
   * [content] the Training
   */
  core.Future<Training> insert(Training content) {
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
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Training.serialize(content));
    final $path = "trainedmodels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Training.parse(JSON.parse($text)));
  }

  // Method TrainedmodelsResource.Get
  /**
   * Check training status of your model.
   * [id] The unique name for the predictive model.
   */
  core.Future<Training> get(core.String id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "trainedmodels/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Training.parse(JSON.parse($text)));
  }

  // Method TrainedmodelsResource.Predict
  /**
   * Submit model id and request a prediction.
   * [id] The unique name for the predictive model.
   * [content] the Input
   */
  core.Future<Output> predict(core.String id, Input content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Input.serialize(content));
    final $path = "trainedmodels/{id}/predict";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Output.parse(JSON.parse($text)));
  }

  // Method TrainedmodelsResource.List
  /**
   * List available models.
   */
  core.Future<List> list([core.String pageToken = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "trainedmodels/list";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => List.parse(JSON.parse($text)));
  }

  // Method TrainedmodelsResource.Update
  /**
   * Add new data to a trained model.
   * [id] The unique name for the predictive model.
   * [content] the Update
   */
  core.Future<Training> update(core.String id, Update content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Update.serialize(content));
    final $path = "trainedmodels/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Training.parse(JSON.parse($text)));
  }

  // Method TrainedmodelsResource.Analyze
  /**
   * Get analysis of the model and the data the model was trained on.
   * [id] The unique name for the predictive model.
   */
  core.Future<Analyze> analyze(core.String id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "trainedmodels/{id}/analyze";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Analyze.parse(JSON.parse($text)));
  }

  // Method TrainedmodelsResource.Delete
  /**
   * Delete a trained model.
   * [id] The unique name for the predictive model.
   */
  core.Future delete(core.String id) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "trainedmodels/{id}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Resource .HostedmodelsResource
class HostedmodelsResource extends core.Object {
  final PredictionApi _$service;
  
  HostedmodelsResource._internal(PredictionApi $service) : _$service = $service;

  // Method HostedmodelsResource.Predict
  /**
   * Submit input and request an output against a hosted model.
   * [hostedModelName] The name of a hosted model.
   * [content] the Input
   */
  core.Future<Output> predict(core.String hostedModelName, Input content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["hostedModelName"] = hostedModelName;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Input.serialize(content));
    final $path = "hostedmodels/{hostedModelName}/predict";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Output.parse(JSON.parse($text)));
  }
}

// Schema .Analyze
class Analyze extends IdentityHash {
  /** What kind of resource this is. */
  core.String kind;

  /** List of errors with the data. */
  core.List<core.Map<core.String, core.String>> errors;

  /** Description of the data the model was trained on. */
  AnalyzeDataDescription dataDescription;

  /** Description of the model. */
  AnalyzeModelDescription modelDescription;

  /** The unique name for the predictive model. */
  core.String id;

  /** A URL to re-request this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Analyze parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Analyze();
    result.kind = identity(json["kind"]);
    result.errors = map(mapValues(identity))(json["errors"]);
    result.dataDescription = AnalyzeDataDescription.parse(json["dataDescription"]);
    result.modelDescription = AnalyzeModelDescription.parse(json["modelDescription"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Analyze value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["errors"] = map(mapValues(identity))(value.errors);
    result["dataDescription"] = AnalyzeDataDescription.serialize(value.dataDescription);
    result["modelDescription"] = AnalyzeModelDescription.serialize(value.modelDescription);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription
class AnalyzeDataDescription extends IdentityHash {
  /** Description of the output value or label. */
  AnalyzeDataDescriptionOutputFeature outputFeature;

  /** Description of the input features in the data set. */
  core.List<AnalyzeDataDescriptionFeatures> features;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescription parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescription();
    result.outputFeature = AnalyzeDataDescriptionOutputFeature.parse(json["outputFeature"]);
    result.features = map(AnalyzeDataDescriptionFeatures.parse)(json["features"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescription value) {
    if (value == null) return null;
    final result = {};
    result["outputFeature"] = AnalyzeDataDescriptionOutputFeature.serialize(value.outputFeature);
    result["features"] = map(AnalyzeDataDescriptionFeatures.serialize)(value.features);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionFeatures
class AnalyzeDataDescriptionFeatures extends IdentityHash {
  /** The feature index. */
  core.String index;

  /** Description of multiple-word text values of this feature. */
  AnalyzeDataDescriptionFeaturesText text;

  /** Description of the numeric values of this feature. */
  AnalyzeDataDescriptionFeaturesNumeric numeric;

  /** Description of the categorical values of this feature. */
  AnalyzeDataDescriptionFeaturesCategorical categorical;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionFeatures parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionFeatures();
    result.index = identity(json["index"]);
    result.text = AnalyzeDataDescriptionFeaturesText.parse(json["text"]);
    result.numeric = AnalyzeDataDescriptionFeaturesNumeric.parse(json["numeric"]);
    result.categorical = AnalyzeDataDescriptionFeaturesCategorical.parse(json["categorical"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionFeatures value) {
    if (value == null) return null;
    final result = {};
    result["index"] = identity(value.index);
    result["text"] = AnalyzeDataDescriptionFeaturesText.serialize(value.text);
    result["numeric"] = AnalyzeDataDescriptionFeaturesNumeric.serialize(value.numeric);
    result["categorical"] = AnalyzeDataDescriptionFeaturesCategorical.serialize(value.categorical);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionFeatures.AnalyzeDataDescriptionFeaturesCategorical
class AnalyzeDataDescriptionFeaturesCategorical extends IdentityHash {
  /** Number of categorical values for this feature in the data. */
  core.String count;

  /** List of all the categories for this feature in the data set. */
  core.List<AnalyzeDataDescriptionFeaturesCategoricalValues> values;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionFeaturesCategorical parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionFeaturesCategorical();
    result.count = identity(json["count"]);
    result.values = map(AnalyzeDataDescriptionFeaturesCategoricalValues.parse)(json["values"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionFeaturesCategorical value) {
    if (value == null) return null;
    final result = {};
    result["count"] = identity(value.count);
    result["values"] = map(AnalyzeDataDescriptionFeaturesCategoricalValues.serialize)(value.values);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionFeatures.AnalyzeDataDescriptionFeaturesCategorical.AnalyzeDataDescriptionFeaturesCategoricalValues
class AnalyzeDataDescriptionFeaturesCategoricalValues extends IdentityHash {
  /** Number of times this feature had this value. */
  core.String count;

  /** The category name. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionFeaturesCategoricalValues parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionFeaturesCategoricalValues();
    result.count = identity(json["count"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionFeaturesCategoricalValues value) {
    if (value == null) return null;
    final result = {};
    result["count"] = identity(value.count);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionFeatures.AnalyzeDataDescriptionFeaturesNumeric
class AnalyzeDataDescriptionFeaturesNumeric extends IdentityHash {
  /** Number of numeric values for this feature in the data set. */
  core.String count;

  /** Variance of the numeric values of this feature in the data set. */
  core.double variance;

  /** Mean of the numeric values of this feature in the data set. */
  core.double mean;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionFeaturesNumeric parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionFeaturesNumeric();
    result.count = identity(json["count"]);
    result.variance = identity(json["variance"]);
    result.mean = identity(json["mean"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionFeaturesNumeric value) {
    if (value == null) return null;
    final result = {};
    result["count"] = identity(value.count);
    result["variance"] = identity(value.variance);
    result["mean"] = identity(value.mean);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionFeatures.AnalyzeDataDescriptionFeaturesText
class AnalyzeDataDescriptionFeaturesText extends IdentityHash {
  /** Number of multiple-word text values for this feature. */
  core.String count;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionFeaturesText parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionFeaturesText();
    result.count = identity(json["count"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionFeaturesText value) {
    if (value == null) return null;
    final result = {};
    result["count"] = identity(value.count);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionOutputFeature
class AnalyzeDataDescriptionOutputFeature extends IdentityHash {
  /** Description of the output labels in the data set. */
  core.List<AnalyzeDataDescriptionOutputFeatureText> text;

  /** Description of the output values in the data set. */
  AnalyzeDataDescriptionOutputFeatureNumeric numeric;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionOutputFeature parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionOutputFeature();
    result.text = map(AnalyzeDataDescriptionOutputFeatureText.parse)(json["text"]);
    result.numeric = AnalyzeDataDescriptionOutputFeatureNumeric.parse(json["numeric"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionOutputFeature value) {
    if (value == null) return null;
    final result = {};
    result["text"] = map(AnalyzeDataDescriptionOutputFeatureText.serialize)(value.text);
    result["numeric"] = AnalyzeDataDescriptionOutputFeatureNumeric.serialize(value.numeric);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionOutputFeature.AnalyzeDataDescriptionOutputFeatureNumeric
class AnalyzeDataDescriptionOutputFeatureNumeric extends IdentityHash {
  /** Number of numeric output values in the data set. */
  core.String count;

  /** Variance of the output values in the data set. */
  core.double variance;

  /** Mean of the output values in the data set. */
  core.double mean;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionOutputFeatureNumeric parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionOutputFeatureNumeric();
    result.count = identity(json["count"]);
    result.variance = identity(json["variance"]);
    result.mean = identity(json["mean"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionOutputFeatureNumeric value) {
    if (value == null) return null;
    final result = {};
    result["count"] = identity(value.count);
    result["variance"] = identity(value.variance);
    result["mean"] = identity(value.mean);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeDataDescription.AnalyzeDataDescriptionOutputFeature.AnalyzeDataDescriptionOutputFeatureText
class AnalyzeDataDescriptionOutputFeatureText extends IdentityHash {
  /** Number of times the output label occurred in the data set. */
  core.String count;

  /** The output label. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static AnalyzeDataDescriptionOutputFeatureText parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeDataDescriptionOutputFeatureText();
    result.count = identity(json["count"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeDataDescriptionOutputFeatureText value) {
    if (value == null) return null;
    final result = {};
    result["count"] = identity(value.count);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Analyze.AnalyzeModelDescription
class AnalyzeModelDescription extends IdentityHash {
  /** A list of the confusion matrix row totals */
  core.Map<core.String, core.double> confusionMatrixRowTotals;

  /**
 * An output confusion matrix. This shows an estimate for how this model will do in predictions.
 * This is first indexed by the true class label. For each true class label, this provides a pair
 * {predicted_label, count}, where count is the estimated number of times the model will predict the
 * predicted label given the true label. Will not output if more then 100 classes [Categorical
 * models only].
 */
  core.Map<core.String, core.Map<core.String, core.double>> confusionMatrix;

  /** Basic information about the model. */
  Training modelinfo;

  /** Parses an instance from its JSON representation. */
  static AnalyzeModelDescription parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new AnalyzeModelDescription();
    result.confusionMatrixRowTotals = mapValues(identity)(json["confusionMatrixRowTotals"]);
    result.confusionMatrix = mapValues(mapValues(identity))(json["confusionMatrix"]);
    result.modelinfo = Training.parse(json["modelinfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(AnalyzeModelDescription value) {
    if (value == null) return null;
    final result = {};
    result["confusionMatrixRowTotals"] = mapValues(identity)(value.confusionMatrixRowTotals);
    result["confusionMatrix"] = mapValues(mapValues(identity))(value.confusionMatrix);
    result["modelinfo"] = Training.serialize(value.modelinfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Input
class Input extends IdentityHash {
  /** Input to the model for a prediction */
  InputInput input;

  /** Parses an instance from its JSON representation. */
  static Input parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Input();
    result.input = InputInput.parse(json["input"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Input value) {
    if (value == null) return null;
    final result = {};
    result["input"] = InputInput.serialize(value.input);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Input.InputInput
class InputInput extends IdentityHash {
  /** A list of input features, these can be strings or doubles. */
  core.List<core.Object> csvInstance;

  /** Parses an instance from its JSON representation. */
  static InputInput parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new InputInput();
    result.csvInstance = map(identity)(json["csvInstance"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(InputInput value) {
    if (value == null) return null;
    final result = {};
    result["csvInstance"] = map(identity)(value.csvInstance);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .List
class List extends IdentityHash {
  /** Pagination token to fetch the next page, if one exists. */
  core.String nextPageToken;

  /** List of models. */
  core.List<Training> items;

  /** What kind of resource this is. */
  core.String kind;

  /** A URL to re-request this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static List parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new List();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Training.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(List value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Training.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Output
class Output extends IdentityHash {
  /** What kind of resource this is. */
  core.String kind;

  /** The most likely class label [Categorical models only]. */
  core.String outputLabel;

  /** The unique name for the predictive model. */
  core.String id;

  /** A list of class labels with their estimated probabilities [Categorical models only]. */
  core.List<OutputOutputMulti> outputMulti;

  /** The estimated regression value [Regression models only]. */
  core.double outputValue;

  /** A URL to re-request this resource. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Output parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Output();
    result.kind = identity(json["kind"]);
    result.outputLabel = identity(json["outputLabel"]);
    result.id = identity(json["id"]);
    result.outputMulti = map(OutputOutputMulti.parse)(json["outputMulti"]);
    result.outputValue = identity(json["outputValue"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Output value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["outputLabel"] = identity(value.outputLabel);
    result["id"] = identity(value.id);
    result["outputMulti"] = map(OutputOutputMulti.serialize)(value.outputMulti);
    result["outputValue"] = identity(value.outputValue);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Output.OutputOutputMulti
class OutputOutputMulti extends IdentityHash {
  /** The probability of the class label. */
  core.double score;

  /** The class label. */
  core.String label;

  /** Parses an instance from its JSON representation. */
  static OutputOutputMulti parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new OutputOutputMulti();
    result.score = identity(json["score"]);
    result.label = identity(json["label"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(OutputOutputMulti value) {
    if (value == null) return null;
    final result = {};
    result["score"] = identity(value.score);
    result["label"] = identity(value.label);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Training
class Training extends IdentityHash {
  /** What kind of resource this is. */
  core.String kind;

  /** Insert time of the model (as a RFC 3339 timestamp). */
  core.String created;

  /** Training completion time (as a RFC 3339 timestamp). */
  core.String trainingComplete;

  /** Google storage location of the training data file. */
  core.String storageDataLocation;

  /** Google storage location of the pmml model file. */
  core.String storagePMMLModelLocation;

  /**
 * The current status of the training job. This can be one of following: RUNNING; DONE; ERROR;
 * ERROR: TRAINING JOB NOT FOUND
 */
  core.String trainingStatus;

  /** Model metadata. */
  TrainingModelInfo modelInfo;

  /** Google storage location of the preprocessing pmml file. */
  core.String storagePMMLLocation;

  /** The unique name for the predictive model. */
  core.String id;

  /** A URL to re-request this resource. */
  core.String selfLink;

  /**
 * A class weighting function, which allows the importance weights for class labels to be specified
 * [Categorical models only].
 */
  core.List<core.Map<core.String, core.double>> utility;

  /** Parses an instance from its JSON representation. */
  static Training parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Training();
    result.kind = identity(json["kind"]);
    result.created = identity(json["created"]);
    result.trainingComplete = identity(json["trainingComplete"]);
    result.storageDataLocation = identity(json["storageDataLocation"]);
    result.storagePMMLModelLocation = identity(json["storagePMMLModelLocation"]);
    result.trainingStatus = identity(json["trainingStatus"]);
    result.modelInfo = TrainingModelInfo.parse(json["modelInfo"]);
    result.storagePMMLLocation = identity(json["storagePMMLLocation"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    result.utility = map(mapValues(identity))(json["utility"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Training value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["created"] = identity(value.created);
    result["trainingComplete"] = identity(value.trainingComplete);
    result["storageDataLocation"] = identity(value.storageDataLocation);
    result["storagePMMLModelLocation"] = identity(value.storagePMMLModelLocation);
    result["trainingStatus"] = identity(value.trainingStatus);
    result["modelInfo"] = TrainingModelInfo.serialize(value.modelInfo);
    result["storagePMMLLocation"] = identity(value.storagePMMLLocation);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    result["utility"] = map(mapValues(identity))(value.utility);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Training.TrainingModelInfo
class TrainingModelInfo extends IdentityHash {
  /** Number of class labels in the trained model [Categorical models only]. */
  core.String numberLabels;

  /**
 * An estimated mean squared error. The can be used to measure the quality of the predicted model
 * [Regression models only].
 */
  core.double meanSquaredError;

  /** Type of predictive model (CLASSIFICATION or REGRESSION) */
  core.String modelType;

  /** Number of valid data instances used in the trained model. */
  core.String numberInstances;

  /** Estimated accuracy of model taking utility weights into account [Categorical models only]. */
  core.double classWeightedAccuracy;

  /**
 * A number between 0.0 and 1.0, where 1.0 is 100% accurate. This is an estimate, based on the
 * amount and quality of the training data, of the estimated prediction accuracy. You can use this
 * is a guide to decide whether the results are accurate enough for your needs. This estimate will
 * be more reliable if your real input data is similar to your training data [Categorical models
 * only].
 */
  core.double classificationAccuracy;

  /** Parses an instance from its JSON representation. */
  static TrainingModelInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new TrainingModelInfo();
    result.numberLabels = identity(json["numberLabels"]);
    result.meanSquaredError = identity(json["meanSquaredError"]);
    result.modelType = identity(json["modelType"]);
    result.numberInstances = identity(json["numberInstances"]);
    result.classWeightedAccuracy = identity(json["classWeightedAccuracy"]);
    result.classificationAccuracy = identity(json["classificationAccuracy"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(TrainingModelInfo value) {
    if (value == null) return null;
    final result = {};
    result["numberLabels"] = identity(value.numberLabels);
    result["meanSquaredError"] = identity(value.meanSquaredError);
    result["modelType"] = identity(value.modelType);
    result["numberInstances"] = identity(value.numberInstances);
    result["classWeightedAccuracy"] = identity(value.classWeightedAccuracy);
    result["classificationAccuracy"] = identity(value.classificationAccuracy);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Update
class Update extends IdentityHash {
  /** The input features for this instance */
  core.List<core.Object> csvInstance;

  /** The true class label of this instance */
  core.String label;

  /** Parses an instance from its JSON representation. */
  static Update parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Update();
    result.csvInstance = map(identity)(json["csvInstance"]);
    result.label = identity(json["label"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Update value) {
    if (value == null) return null;
    final result = {};
    result["csvInstance"] = map(identity)(value.csvInstance);
    result["label"] = identity(value.label);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum PredictionApi.Alt
class PredictionApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final PredictionApiAlt JSON = const PredictionApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<PredictionApiAlt> values = const <PredictionApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <PredictionApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static PredictionApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const PredictionApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

