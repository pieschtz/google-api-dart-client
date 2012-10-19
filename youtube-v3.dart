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

#library('youtube-v3');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API YouTubeApi
/**
 * Programmatic access to YouTube features.
 */
class YouTubeApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  YouTubeApi get _$service => this;
  ActivitiesResource _activities;
  ActivitiesResource get activities => _activities;
  SearchResource _search;
  SearchResource get search => _search;
  GuideCategoriesResource _guideCategories;
  GuideCategoriesResource get guideCategories => _guideCategories;
  PlaylistsResource _playlists;
  PlaylistsResource get playlists => _playlists;
  VideosResource _videos;
  VideosResource get videos => _videos;
  ChannelsResource _channels;
  ChannelsResource get channels => _channels;
  PlaylistItemsResource _playlistItems;
  PlaylistItemsResource get playlistItems => _playlistItems;
  VideoCategoriesResource _videoCategories;
  VideoCategoriesResource get videoCategories => _videoCategories;
  SubscriptionResource _subscription;
  SubscriptionResource get subscription => _subscription;
  
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
  YouTubeApiAlt alt;


  YouTubeApi({this.baseUrl:"https://www.googleapis.com/youtube/v3/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _activities = new ActivitiesResource._internal(this);
    _search = new SearchResource._internal(this);
    _guideCategories = new GuideCategoriesResource._internal(this);
    _playlists = new PlaylistsResource._internal(this);
    _videos = new VideosResource._internal(this);
    _channels = new ChannelsResource._internal(this);
    _playlistItems = new PlaylistItemsResource._internal(this);
    _videoCategories = new VideoCategoriesResource._internal(this);
    _subscription = new SubscriptionResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}youtube/v3/20121013 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your YouTube account */
  static final core.String YOUTUBE_SCOPE = "https://www.googleapis.com/auth/youtube";

  /** OAuth2 scope: View your YouTube account */
  static final core.String YOUTUBE_READONLY_SCOPE = "https://www.googleapis.com/auth/youtube.readonly";

  /** OAuth2 scope: Manage your YouTube videos */
  static final core.String YOUTUBE_UPLOAD_SCOPE = "https://www.googleapis.com/auth/youtube.upload";

  /** OAuth2 scope: View and manage your assets and associated content on YouTube */
  static final core.String YOUTUBEPARTNER_SCOPE = "https://www.googleapis.com/auth/youtubepartner";
}

// Resource .ActivitiesResource
class ActivitiesResource extends core.Object {
  final YouTubeApi _$service;
  
  ActivitiesResource._internal(YouTubeApi $service) : _$service = $service;

  // Method ActivitiesResource.Insert
  /**
   * Post a channel bulletin.
   *
   *    * [content] the Activity
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<Activity> insert(core.String part, Activity content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Activity.serialize(content));
    final $path = "activities";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Activity.parse(JSON.parse($text)));
  }

  // Method ActivitiesResource.List
  /**
   * Browse the YouTube channel activity collection.
   *
   *    * [part] Activity parts to include in the returned response. Valid values are: id, snippet and
   *        contentDetails.
   *    * [publishedBefore] Only return activities published before given date (exclusive).
   *    * [channelId] YouTube ID of the channel.
   *    * [mine] Flag indicating to return user's activities.
   *    * [maxResults] Maximum number of results to return
  Default: 5.
  Minimum: 0.
  Maximum: 50.
   *    * [pageToken] Token for the page selection.
   *    * [home] Flag indicating to return user's homepage feed.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   *    * [publishedAfter] Only return activities published after given date (inclusive).
   */
  core.Future<ActivityListResponse> list(core.String part, {core.String publishedBefore, core.String channelId, core.String mine, core.int maxResults, core.String pageToken, core.String home, core.String contentOwnerId, core.String publishedAfter}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?publishedBefore) $queryParams["publishedBefore"] = publishedBefore;
    if (?channelId) $queryParams["channelId"] = channelId;
    if (?mine) $queryParams["mine"] = mine;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?home) $queryParams["home"] = home;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (?publishedAfter) $queryParams["publishedAfter"] = publishedAfter;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "activities";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ActivityListResponse.parse(JSON.parse($text)));
  }
}

// Resource .SearchResource
class SearchResource extends core.Object {
  final YouTubeApi _$service;
  
  SearchResource._internal(YouTubeApi $service) : _$service = $service;

  // Method SearchResource.List
  /**
   * Universal search for youtube.
   *
   *    * [part] Search result parts to include in the returned response. Valid values are: id and snippet.
   *    * [topicId] Only search for resources with the specified topic
   *    * [videoDuration] Add a filter on the duration of the videos.
   *    * [videoDimension] Add a filter for the number of dimensions in the videos.
   *    * [videoLicense] Add a filter on the licensing of the videos.
   *    * [maxResults] Maximum number of search results to return per page.
  Default: 5.
  Minimum: 0.
  Maximum: 50.
   *    * [order] Sort order.
  Default: SEARCH_SORT_RELEVANCE.
   *    * [q] Query to search in Youtube.
   *    * [pageToken] Token for the page selection.
   *    * [videoCaption] Add a filter on the the presence of captions on the videos.
   *    * [videoDefinition] Add a filter for the definition of the videos.
   *    * [published] Only search for resources uploaded at a specific pediod
   *    * [relatedToVideo] Search for resources related to this video. Need to be used with type set to 'video'
   *    * [type] Type of resource to search.
  Default: video,channel,playlist.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<SearchListResponse> list(core.String part, {core.String topicId, SearchResourceListVideoDuration videoDuration, SearchResourceListVideoDimension videoDimension, SearchResourceListVideoLicense videoLicense, core.int maxResults, SearchResourceListOrder order, core.String q, core.String pageToken, SearchResourceListVideoCaption videoCaption, SearchResourceListVideoDefinition videoDefinition, SearchResourceListPublished published, core.String relatedToVideo, core.String type, core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?topicId) $queryParams["topicId"] = topicId;
    if (?videoDuration) $queryParams["videoDuration"] = videoDuration;
    if (?videoDimension) $queryParams["videoDimension"] = videoDimension;
    if (?videoLicense) $queryParams["videoLicense"] = videoLicense;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?order) $queryParams["order"] = order;
    if (?q) $queryParams["q"] = q;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?videoCaption) $queryParams["videoCaption"] = videoCaption;
    if (?videoDefinition) $queryParams["videoDefinition"] = videoDefinition;
    if (?published) $queryParams["published"] = published;
    if (?relatedToVideo) $queryParams["relatedToVideo"] = relatedToVideo;
    if (?type) $queryParams["type"] = type;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "search";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SearchListResponse.parse(JSON.parse($text)));
  }
}

// Enum SearchResource.List.VideoDuration
class SearchResourceListVideoDuration extends core.Object implements core.Hashable {
  /** No filter on the duration. */
  const SearchResourceListVideoDuration ANY = const SearchResourceListVideoDuration._internal("any", 0);
  /** Videos with a duration longer than 20 minutes. */
  const SearchResourceListVideoDuration LONG = const SearchResourceListVideoDuration._internal("long", 1);
  /** Videos with a duration between 4 and 20 minutes. */
  const SearchResourceListVideoDuration MEDIUM = const SearchResourceListVideoDuration._internal("medium", 2);
  /** Videos with a duration under 4 minutes. */
  const SearchResourceListVideoDuration SHORT = const SearchResourceListVideoDuration._internal("short", 3);

  /** All values of this enumeration */
  const core.List<SearchResourceListVideoDuration> values = const <SearchResourceListVideoDuration>[
    ANY,
    LONG,
    MEDIUM,
    SHORT,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListVideoDuration>{ 
    "any": ANY,
    "long": LONG,
    "medium": MEDIUM,
    "short": SHORT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListVideoDuration valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListVideoDuration._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "VideoDuration".hashCode();
}

// Enum SearchResource.List.VideoDimension
class SearchResourceListVideoDimension extends core.Object implements core.Hashable {
  /** Videos in two dimensions. */
  const SearchResourceListVideoDimension VALUE_2D = const SearchResourceListVideoDimension._internal("2d", 0);
  /** Videos in three dimensions. */
  const SearchResourceListVideoDimension VALUE_3D = const SearchResourceListVideoDimension._internal("3d", 1);
  /** No filter on the dimension. */
  const SearchResourceListVideoDimension ANY = const SearchResourceListVideoDimension._internal("any", 2);

  /** All values of this enumeration */
  const core.List<SearchResourceListVideoDimension> values = const <SearchResourceListVideoDimension>[
    VALUE_2D,
    VALUE_3D,
    ANY,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListVideoDimension>{ 
    "2d": VALUE_2D,
    "3d": VALUE_3D,
    "any": ANY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListVideoDimension valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListVideoDimension._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "VideoDimension".hashCode();
}

// Enum SearchResource.List.VideoLicense
class SearchResourceListVideoLicense extends core.Object implements core.Hashable {
  /** No filter on the license. */
  const SearchResourceListVideoLicense ANY = const SearchResourceListVideoLicense._internal("any", 0);
  /** Videos under the Creative Common license. */
  const SearchResourceListVideoLicense CREATIVECOMMON = const SearchResourceListVideoLicense._internal("creativeCommon", 1);
  /** Videos under the YouTube license. */
  const SearchResourceListVideoLicense YOUTUBE = const SearchResourceListVideoLicense._internal("youtube", 2);

  /** All values of this enumeration */
  const core.List<SearchResourceListVideoLicense> values = const <SearchResourceListVideoLicense>[
    ANY,
    CREATIVECOMMON,
    YOUTUBE,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListVideoLicense>{ 
    "any": ANY,
    "creativeCommon": CREATIVECOMMON,
    "youtube": YOUTUBE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListVideoLicense valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListVideoLicense._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "VideoLicense".hashCode();
}

// Enum SearchResource.List.Order
class SearchResourceListOrder extends core.Object implements core.Hashable {
  /** Sort according to the date. */
  const SearchResourceListOrder DATE = const SearchResourceListOrder._internal("date", 0);
  /** Sort according to the rating. */
  const SearchResourceListOrder RATING = const SearchResourceListOrder._internal("rating", 1);
  /** Sort according to the relevance. */
  const SearchResourceListOrder RELEVANCE = const SearchResourceListOrder._internal("relevance", 2);
  /** Sort according to the view count. */
  const SearchResourceListOrder VIEW_COUNT = const SearchResourceListOrder._internal("view_count", 3);

  /** All values of this enumeration */
  const core.List<SearchResourceListOrder> values = const <SearchResourceListOrder>[
    DATE,
    RATING,
    RELEVANCE,
    VIEW_COUNT,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListOrder>{ 
    "date": DATE,
    "rating": RATING,
    "relevance": RELEVANCE,
    "view_count": VIEW_COUNT,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Order".hashCode();
}

// Enum SearchResource.List.VideoCaption
class SearchResourceListVideoCaption extends core.Object implements core.Hashable {
  /** No filter on the captions. */
  const SearchResourceListVideoCaption ANY = const SearchResourceListVideoCaption._internal("any", 0);
  /** Videos with closed captions. */
  const SearchResourceListVideoCaption CLOSEDCAPTION = const SearchResourceListVideoCaption._internal("closedCaption", 1);
  /** Videos without captions. */
  const SearchResourceListVideoCaption NONE = const SearchResourceListVideoCaption._internal("none", 2);

  /** All values of this enumeration */
  const core.List<SearchResourceListVideoCaption> values = const <SearchResourceListVideoCaption>[
    ANY,
    CLOSEDCAPTION,
    NONE,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListVideoCaption>{ 
    "any": ANY,
    "closedCaption": CLOSEDCAPTION,
    "none": NONE,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListVideoCaption valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListVideoCaption._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "VideoCaption".hashCode();
}

// Enum SearchResource.List.VideoDefinition
class SearchResourceListVideoDefinition extends core.Object implements core.Hashable {
  /** No filter on the definition. */
  const SearchResourceListVideoDefinition ANY = const SearchResourceListVideoDefinition._internal("any", 0);
  /** Videos in high definition. */
  const SearchResourceListVideoDefinition HIGH = const SearchResourceListVideoDefinition._internal("high", 1);
  /** Videos in standard definition. */
  const SearchResourceListVideoDefinition STANDARD = const SearchResourceListVideoDefinition._internal("standard", 2);

  /** All values of this enumeration */
  const core.List<SearchResourceListVideoDefinition> values = const <SearchResourceListVideoDefinition>[
    ANY,
    HIGH,
    STANDARD,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListVideoDefinition>{ 
    "any": ANY,
    "high": HIGH,
    "standard": STANDARD,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListVideoDefinition valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListVideoDefinition._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "VideoDefinition".hashCode();
}

// Enum SearchResource.List.Published
class SearchResourceListPublished extends core.Object implements core.Hashable {
  /** No filter on the release date */
  const SearchResourceListPublished ANY = const SearchResourceListPublished._internal("any", 0);
  /** Videos uploaded this month */
  const SearchResourceListPublished THISWEEK = const SearchResourceListPublished._internal("thisWeek", 1);
  /** Videos uploaded today */
  const SearchResourceListPublished TODAY = const SearchResourceListPublished._internal("today", 2);

  /** All values of this enumeration */
  const core.List<SearchResourceListPublished> values = const <SearchResourceListPublished>[
    ANY,
    THISWEEK,
    TODAY,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SearchResourceListPublished>{ 
    "any": ANY,
    "thisWeek": THISWEEK,
    "today": TODAY,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListPublished valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListPublished._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Published".hashCode();
}

// Resource .GuideCategoriesResource
class GuideCategoriesResource extends core.Object {
  final YouTubeApi _$service;
  
  GuideCategoriesResource._internal(YouTubeApi $service) : _$service = $service;

  // Method GuideCategoriesResource.List
  /**
   * Browse the YouTube guide category collection.
   *
   *    * [part] Guide category parts to include in the returned response. Valid values are: id and snippet.
   *    * [regionCode] Return the channelCategories in the given region code.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   *    * [hl] Language for the returned channelCategories.
  Default: en-US.
   *    * [id] Comma-separated YouTube IDs of the channelCategories to be returned.
   */
  core.Future<GuideCategoryListResponse> list(core.String part, {core.String regionCode, core.String contentOwnerId, core.String hl, core.String id}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?regionCode) $queryParams["regionCode"] = regionCode;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (?hl) $queryParams["hl"] = hl;
    if (?id) $queryParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "guideCategories";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => GuideCategoryListResponse.parse(JSON.parse($text)));
  }
}

// Resource .PlaylistsResource
class PlaylistsResource extends core.Object {
  final YouTubeApi _$service;
  
  PlaylistsResource._internal(YouTubeApi $service) : _$service = $service;

  // Method PlaylistsResource.Insert
  /**
   * Create a playlist.
   *
   *    * [content] the Playlist
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<Playlist> insert(core.String part, Playlist content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Playlist.serialize(content));
    final $path = "playlists";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Playlist.parse(JSON.parse($text)));
  }

  // Method PlaylistsResource.List
  /**
   * Browse the YouTube playlist collection.
   *
   *    * [part] Playlist parts to include in the returned response. Valid values are: id, snippet and status.
   *    * [mine] Flag indicating only return the playlists of the authenticated user.
   *    * [maxResults] Maximum number of results to return
  Default: 5.
  Minimum: 0.
  Maximum: 50.
   *    * [id] Comma-separated YouTube IDs of the playlists to be returned.
   *    * [pageToken] Token for the page selection.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<PlaylistListResponse> list(core.String part, {core.String mine, core.int maxResults, core.String id, core.String pageToken, core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?mine) $queryParams["mine"] = mine;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?id) $queryParams["id"] = id;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "playlists";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PlaylistListResponse.parse(JSON.parse($text)));
  }

  // Method PlaylistsResource.Update
  /**
   * Update a playlist.
   *
   *    * [content] the Playlist
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<Playlist> update(core.String part, Playlist content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Playlist.serialize(content));
    final $path = "playlists";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Playlist.parse(JSON.parse($text)));
  }

  // Method PlaylistsResource.Delete
  /**
   * Deletes playlists by IDs.
   *
   *    * [id] YouTube IDs of the playlists to be deleted.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future delete(core.String id, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?id) $queryParams["id"] = id;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "playlists";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Resource .VideosResource
class VideosResource extends core.Object {
  final YouTubeApi _$service;
  
  VideosResource._internal(YouTubeApi $service) : _$service = $service;

  // Method VideosResource.Insert
  /**
   * Upload a video to YouTube.
   *
   *    * [content] the Video
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<Video> insert(core.String part, Video content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Video.serialize(content));
    final $path = "videos";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Video.parse(JSON.parse($text)));
  }

  // Method VideosResource.List
  /**
   * Browse the YouTube video collection.
   *
   *    * [id] YouTube IDs of the videos to be returned.
   *    * [part] Video parts to include in the returned response. Valid values are: id, snippet, contentDetails,
   *        player, statistics, status and topicDetails.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<VideoListResponse> list(core.String id, core.String part, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?id) $queryParams["id"] = id;
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "videos";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => VideoListResponse.parse(JSON.parse($text)));
  }

  // Method VideosResource.Update
  /**
   * Update a video.
   *
   *    * [content] the Video
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<Video> update(core.String part, Video content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Video.serialize(content));
    final $path = "videos";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Video.parse(JSON.parse($text)));
  }

  // Method VideosResource.Delete
  /**
   * Delete a YouTube video.
   *
   *    * [id] YouTube ID of the video to be deleted.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future delete(core.String id, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?id) $queryParams["id"] = id;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "videos";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Resource .ChannelsResource
class ChannelsResource extends core.Object {
  final YouTubeApi _$service;
  
  ChannelsResource._internal(YouTubeApi $service) : _$service = $service;

  // Method ChannelsResource.List
  /**
   * Browse the YouTube channel collection. Either the 'id' or 'mine' parameter must be set.
   *
   *    * [part] Channel parts to include in the returned response. Valid values are: id, snippet, contentDetails and
   *        topicDetails.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   *    * [mine] Filter to only channels owned by authenticated user.
   *    * [maxResults] Maximum number of results to return
  Default: 5.
  Minimum: 0.
  Maximum: 50.
   *    * [categoryId] Filter to retrieve the channels within the given category ID.
   *    * [pageToken] Token for the page selection.
   *    * [mySubscribers] Filter to channels that subscribed to the channel of the authenticated user.
   *    * [id] YouTube IDs of the channels to be returned.
   */
  core.Future<ChannelListResponse> list(core.String part, {core.String contentOwnerId, core.String mine, core.int maxResults, core.String categoryId, core.String pageToken, core.String mySubscribers, core.String id}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (?mine) $queryParams["mine"] = mine;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?categoryId) $queryParams["categoryId"] = categoryId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?mySubscribers) $queryParams["mySubscribers"] = mySubscribers;
    if (?id) $queryParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "channels";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ChannelListResponse.parse(JSON.parse($text)));
  }
}

// Resource .PlaylistItemsResource
class PlaylistItemsResource extends core.Object {
  final YouTubeApi _$service;
  
  PlaylistItemsResource._internal(YouTubeApi $service) : _$service = $service;

  // Method PlaylistItemsResource.Insert
  /**
   * Insert a resource into a playlist.
   *
   *    * [content] the PlaylistItem
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<PlaylistItem> insert(core.String part, PlaylistItem content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(PlaylistItem.serialize(content));
    final $path = "playlistItems";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => PlaylistItem.parse(JSON.parse($text)));
  }

  // Method PlaylistItemsResource.List
  /**
   * Browse the YouTube playlist collection.
   *
   *    * [part] Playlist item parts to include in the returned response. Valid values are: id, snippet and
   *        contentDetails.
   *    * [playlistId] Retrieves playlist items from the given playlist id.
   *    * [maxResults] Maximum number of results to return
  Default: 5.
  Minimum: 0.
  Maximum: 50.
   *    * [id] YouTube IDs of the playlist items to be returned.
   *    * [pageToken] Token for the page selection.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<PlaylistItemListResponse> list(core.String part, {core.String playlistId, core.int maxResults, core.String id, core.String pageToken, core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?playlistId) $queryParams["playlistId"] = playlistId;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?id) $queryParams["id"] = id;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "playlistItems";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PlaylistItemListResponse.parse(JSON.parse($text)));
  }

  // Method PlaylistItemsResource.Update
  /**
   * Update a playlist item.
   *
   *    * [content] the PlaylistItem
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<PlaylistItem> update(core.String part, PlaylistItem content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(PlaylistItem.serialize(content));
    final $path = "playlistItems";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => PlaylistItem.parse(JSON.parse($text)));
  }

  // Method PlaylistItemsResource.Delete
  /**
   * Deletes playlist items by IDs.
   *
   *    * [id] YouTube IDs of the playlist items to be deleted.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future delete(core.String id, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?id) $queryParams["id"] = id;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "playlistItems";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Resource .VideoCategoriesResource
class VideoCategoriesResource extends core.Object {
  final YouTubeApi _$service;
  
  VideoCategoriesResource._internal(YouTubeApi $service) : _$service = $service;

  // Method VideoCategoriesResource.List
  /**
   * Browse list of video categories.
   *
   *    * [part] Video category parts to include in the returned response. Valid values are: id and snippet.
   *    * [regionCode] Return all the categories in this region.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   *    * [hl] Language used for the title of the categories.
  Default: en_US.
   *    * [id] IDs of the categories to be returned.
   */
  core.Future<VideoCategoryListResponse> list(core.String part, {core.String regionCode, core.String contentOwnerId, core.String hl, core.String id}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?regionCode) $queryParams["regionCode"] = regionCode;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (?hl) $queryParams["hl"] = hl;
    if (?id) $queryParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "videoCategories";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => VideoCategoryListResponse.parse(JSON.parse($text)));
  }
}

// Resource .SubscriptionResource
class SubscriptionResource extends core.Object {
  final YouTubeApi _$service;
  
  SubscriptionResource._internal(YouTubeApi $service) : _$service = $service;

  // Method SubscriptionResource.Insert
  /**
   * Insert a subscription.
   *
   *    * [content] the Subscription
   *    * [part] One or more parts to return on the current request.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future<Subscription> insert(core.String part, Subscription content, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Subscription.serialize(content));
    final $path = "subscriptions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Subscription.parse(JSON.parse($text)));
  }

  // Method SubscriptionResource.List
  /**
   * Browses the subscriptions collection.
   *
   *    * [part] Subscription parts to include in the returned response. Valid values are: id, snippet and
   *        contentDetails.
   *    * [channelId] Only return subscriptions to given channelId.
   *    * [mine] Flag indicating only return the subscriptions of the authenticated user.
   *    * [maxResults] Maximum number of search results to return per page.
  Default: 5.
  Minimum: 0.
  Maximum: 50.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   *    * [pageToken] Token for the page selection.
   *    * [forChannelId] Comma separated list of channel IDs to return subscriptions for.
   *    * [order] Sort order.
  Default: SUBSCRIPTION_ORDER_RELEVANCE.
   *    * [id] YouTube IDs of the subscriptions to be returned.
   */
  core.Future<SubscriptionListResponse> list(core.String part, {core.String channelId, core.String mine, core.int maxResults, core.String contentOwnerId, core.String pageToken, core.String forChannelId, SubscriptionResourceListOrder order, core.String id}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?part) $queryParams["part"] = part;
    if (?channelId) $queryParams["channelId"] = channelId;
    if (?mine) $queryParams["mine"] = mine;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?forChannelId) $queryParams["forChannelId"] = forChannelId;
    if (?order) $queryParams["order"] = order;
    if (?id) $queryParams["id"] = id;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "subscriptions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SubscriptionListResponse.parse(JSON.parse($text)));
  }

  // Method SubscriptionResource.Delete
  /**
   * Deletes subscriptions by IDs.
   *
   *    * [id] YouTube IDs of the subscription to be deleted.
   *    * [contentOwnerId] The authenticated user acts on behalf of this content owner.
   */
  core.Future delete(core.String id, {core.String contentOwnerId}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (?id) $queryParams["id"] = id;
    if (?contentOwnerId) $queryParams["contentOwnerId"] = contentOwnerId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "subscriptions";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Enum SubscriptionResource.List.Order
class SubscriptionResourceListOrder extends core.Object implements core.Hashable {
  /** Sort alphabetically */
  const SubscriptionResourceListOrder ALPHABETICAL = const SubscriptionResourceListOrder._internal("alphabetical", 0);
  /** Sort by relevance. */
  const SubscriptionResourceListOrder RELEVANCE = const SubscriptionResourceListOrder._internal("relevance", 1);
  /** Sort by order of activity. */
  const SubscriptionResourceListOrder UNREAD = const SubscriptionResourceListOrder._internal("unread", 2);

  /** All values of this enumeration */
  const core.List<SubscriptionResourceListOrder> values = const <SubscriptionResourceListOrder>[
    ALPHABETICAL,
    RELEVANCE,
    UNREAD,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <SubscriptionResourceListOrder>{ 
    "alphabetical": ALPHABETICAL,
    "relevance": RELEVANCE,
    "unread": UNREAD,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SubscriptionResourceListOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SubscriptionResourceListOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Order".hashCode();
}

// Schema .Activity
class Activity extends IdentityHash {
  /** Basic details about the activity: title, description, thumbnails. */
  ActivitySnippet snippet;

  /** Type specific information about the activity. */
  ActivityContentDetails contentDetails;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the activity. */
  core.String etag;

  /** The unique ID of the activity. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Activity parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Activity();
    result.snippet = ActivitySnippet.parse(json["snippet"]);
    result.contentDetails = ActivityContentDetails.parse(json["contentDetails"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Activity value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = ActivitySnippet.serialize(value.snippet);
    result["contentDetails"] = ActivityContentDetails.serialize(value.contentDetails);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ActivityContentDetails
class ActivityContentDetails extends IdentityHash {
  /** Only present if the type is "comment". */
  ActivityContentDetailsComment comment;

  /** Only present if the type is "playlistItem". */
  ActivityContentDetailsPlaylistItem playlistItem;

  /** Only present if the type is "like". */
  ActivityContentDetailsLike like;

  /** Only present if the type is "social". */
  ActivityContentDetailsSocial social;

  /** Only present if the type is "favorite". */
  ActivityContentDetailsFavorite favorite;

  /** Only present if the type is "upload". */
  ActivityContentDetailsUpload upload;

  /** Only set if the type is "recommendation". */
  ActivityContentDetailsRecommendation recommendation;

  /** Only present if the type is "bulletin". */
  ActivityContentDetailsBulletin bulletin;

  /** Only present if the type is "subscription". */
  ActivityContentDetailsSubscription subscription;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetails();
    result.comment = ActivityContentDetailsComment.parse(json["comment"]);
    result.playlistItem = ActivityContentDetailsPlaylistItem.parse(json["playlistItem"]);
    result.like = ActivityContentDetailsLike.parse(json["like"]);
    result.social = ActivityContentDetailsSocial.parse(json["social"]);
    result.favorite = ActivityContentDetailsFavorite.parse(json["favorite"]);
    result.upload = ActivityContentDetailsUpload.parse(json["upload"]);
    result.recommendation = ActivityContentDetailsRecommendation.parse(json["recommendation"]);
    result.bulletin = ActivityContentDetailsBulletin.parse(json["bulletin"]);
    result.subscription = ActivityContentDetailsSubscription.parse(json["subscription"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetails value) {
    if (value == null) return null;
    final result = {};
    result["comment"] = ActivityContentDetailsComment.serialize(value.comment);
    result["playlistItem"] = ActivityContentDetailsPlaylistItem.serialize(value.playlistItem);
    result["like"] = ActivityContentDetailsLike.serialize(value.like);
    result["social"] = ActivityContentDetailsSocial.serialize(value.social);
    result["favorite"] = ActivityContentDetailsFavorite.serialize(value.favorite);
    result["upload"] = ActivityContentDetailsUpload.serialize(value.upload);
    result["recommendation"] = ActivityContentDetailsRecommendation.serialize(value.recommendation);
    result["bulletin"] = ActivityContentDetailsBulletin.serialize(value.bulletin);
    result["subscription"] = ActivityContentDetailsSubscription.serialize(value.subscription);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsBulletin
class ActivityContentDetailsBulletin extends IdentityHash {
  /** ID of the resource this bulletin is about. */
  ResourceId resourceId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsBulletin parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsBulletin();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsBulletin value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsComment
class ActivityContentDetailsComment extends IdentityHash {
  /** ID of the commented resource. */
  ResourceId resourceId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsComment parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsComment();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsComment value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsFavorite
class ActivityContentDetailsFavorite extends IdentityHash {
  /** ID of the favorited resource. */
  ResourceId resourceId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsFavorite parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsFavorite();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsFavorite value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsLike
class ActivityContentDetailsLike extends IdentityHash {
  /** ID of the rated resource. */
  ResourceId resourceId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsLike parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsLike();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsLike value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsPlaylistItem
class ActivityContentDetailsPlaylistItem extends IdentityHash {
  /** ID of the playlist the video was added to. */
  core.String playlistId;

  /** ID of the video added to the playlist. */
  core.String videoId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsPlaylistItem parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsPlaylistItem();
    result.playlistId = identity(json["playlistId"]);
    result.videoId = identity(json["videoId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsPlaylistItem value) {
    if (value == null) return null;
    final result = {};
    result["playlistId"] = identity(value.playlistId);
    result["videoId"] = identity(value.videoId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsRecommendation
class ActivityContentDetailsRecommendation extends IdentityHash {
  /** ID of the recommended resource. */
  ResourceId resourceId;

  /** Reason for which the video was recommended. */
  core.String reason;

  /** ID of the video that caused this recommendation. */
  ResourceId seedResourceId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsRecommendation parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsRecommendation();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    result.reason = identity(json["reason"]);
    result.seedResourceId = ResourceId.parse(json["seedResourceId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsRecommendation value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    result["reason"] = identity(value.reason);
    result["seedResourceId"] = ResourceId.serialize(value.seedResourceId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsSocial
class ActivityContentDetailsSocial extends IdentityHash {
  /** ID of the resource this social activity is about. */
  ResourceId resourceId;

  /** Image of the post author. */
  core.String imageUrl;

  /** Type of the social network. */
  core.String type;

  /** Url of the social post. */
  core.String referenceUrl;

  /** Author of the post. */
  core.String author;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsSocial parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsSocial();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    result.imageUrl = identity(json["imageUrl"]);
    result.type = identity(json["type"]);
    result.referenceUrl = identity(json["referenceUrl"]);
    result.author = identity(json["author"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsSocial value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    result["imageUrl"] = identity(value.imageUrl);
    result["type"] = identity(value.type);
    result["referenceUrl"] = identity(value.referenceUrl);
    result["author"] = identity(value.author);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsSubscription
class ActivityContentDetailsSubscription extends IdentityHash {
  /** ID of the resource subscribed to. */
  ResourceId resourceId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsSubscription parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsSubscription();
    result.resourceId = ResourceId.parse(json["resourceId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsSubscription value) {
    if (value == null) return null;
    final result = {};
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema ActivityContentDetails.ActivityContentDetailsUpload
class ActivityContentDetailsUpload extends IdentityHash {
  /** ID of the uploaded video. */
  core.String videoId;

  /** Parses an instance from its JSON representation. */
  static ActivityContentDetailsUpload parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityContentDetailsUpload();
    result.videoId = identity(json["videoId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityContentDetailsUpload value) {
    if (value == null) return null;
    final result = {};
    result["videoId"] = identity(value.videoId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ActivityListResponse
class ActivityListResponse extends IdentityHash {
  /** Token to the next page. */
  core.String nextPageToken;

  /** The type of this API response. */
  core.String kind;

  /** List of activities matching the request criteria. */
  core.List<Activity> items;

  /** The eTag of the response. */
  core.String etag;

  /** Token to the previous page. */
  core.String prevPageToken;

  /** Paging information for the list result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static ActivityListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivityListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(Activity.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivityListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(Activity.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["pageInfo"] = PageInfo.serialize(value.pageInfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ActivitySnippet
class ActivitySnippet extends IdentityHash {
  /** Activity thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Title of the activity. */
  core.String title;

  /** Channel publishing the activity. */
  core.String channelId;

  /** Date and time the activity was published at. */
  core.String publishedAt;

  /** Type of the activity. */
  core.String type;

  /** Id of the group that this activity is part of. */
  core.String groupId;

  /** Description of the activity. */
  core.String description;

  /** Parses an instance from its JSON representation. */
  static ActivitySnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ActivitySnippet();
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    result.title = identity(json["title"]);
    result.channelId = identity(json["channelId"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.type = identity(json["type"]);
    result.groupId = identity(json["groupId"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ActivitySnippet value) {
    if (value == null) return null;
    final result = {};
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    result["title"] = identity(value.title);
    result["channelId"] = identity(value.channelId);
    result["publishedAt"] = identity(value.publishedAt);
    result["type"] = identity(value.type);
    result["groupId"] = identity(value.groupId);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Channel
class Channel extends IdentityHash {
  /** Information about channel topics */
  ChannelTopicDetails topicDetails;

  /** The type of this API resource. */
  core.String kind;

  /** Statistics about the channel: number of subscribers, views, and comments. */
  ChannelStatistics statistics;

  /** Information about the channel content: upload playlist id, privacy status. */
  ChannelContentDetails contentDetails;

  /** Basic details about the channel: title, description, and thumbnails. */
  ChannelSnippet snippet;

  /** The eTag of the channel. */
  core.String etag;

  /** The unique ID of the channel. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Channel parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Channel();
    result.topicDetails = ChannelTopicDetails.parse(json["topicDetails"]);
    result.kind = identity(json["kind"]);
    result.statistics = ChannelStatistics.parse(json["statistics"]);
    result.contentDetails = ChannelContentDetails.parse(json["contentDetails"]);
    result.snippet = ChannelSnippet.parse(json["snippet"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Channel value) {
    if (value == null) return null;
    final result = {};
    result["topicDetails"] = ChannelTopicDetails.serialize(value.topicDetails);
    result["kind"] = identity(value.kind);
    result["statistics"] = ChannelStatistics.serialize(value.statistics);
    result["contentDetails"] = ChannelContentDetails.serialize(value.contentDetails);
    result["snippet"] = ChannelSnippet.serialize(value.snippet);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChannelContentDetails
class ChannelContentDetails extends IdentityHash {
  /** Privacy status of the channel. */
  core.String privacyStatus;

  /** The ID of the playlist containing the uploads of this channel. */
  core.String uploads;

  /** Parses an instance from its JSON representation. */
  static ChannelContentDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelContentDetails();
    result.privacyStatus = identity(json["privacyStatus"]);
    result.uploads = identity(json["uploads"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelContentDetails value) {
    if (value == null) return null;
    final result = {};
    result["privacyStatus"] = identity(value.privacyStatus);
    result["uploads"] = identity(value.uploads);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChannelListResponse
class ChannelListResponse extends IdentityHash {
  /** Token to the next page. */
  core.String nextPageToken;

  /** The type of this API response. */
  core.String kind;

  /** List of channels matching the request criteria. */
  core.List<Channel> items;

  /** The eTag of the response. */
  core.String etag;

  /** Token to the previous page. */
  core.String prevPageToken;

  /** Paging information for the list result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static ChannelListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(Channel.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(Channel.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["pageInfo"] = PageInfo.serialize(value.pageInfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChannelSnippet
class ChannelSnippet extends IdentityHash {
  /** Title of the channel. */
  core.String title;

  /** Id of the channel. */
  core.String channelId;

  /** Description of the channel. */
  core.String description;

  /** Date and time the channel was published at. */
  core.String publishedAt;

  /** Channel thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Parses an instance from its JSON representation. */
  static ChannelSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelSnippet();
    result.title = identity(json["title"]);
    result.channelId = identity(json["channelId"]);
    result.description = identity(json["description"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelSnippet value) {
    if (value == null) return null;
    final result = {};
    result["title"] = identity(value.title);
    result["channelId"] = identity(value.channelId);
    result["description"] = identity(value.description);
    result["publishedAt"] = identity(value.publishedAt);
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChannelStatistics
class ChannelStatistics extends IdentityHash {
  /** Number of comments for this channel. */
  core.String commentCount;

  /** Number of subscribers to this channel. */
  core.String subscriberCount;

  /** Number of videos in the channel. */
  core.String videoCount;

  /** Number of times the channel has been viewed. */
  core.String viewCount;

  /** Parses an instance from its JSON representation. */
  static ChannelStatistics parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelStatistics();
    result.commentCount = identity(json["commentCount"]);
    result.subscriberCount = identity(json["subscriberCount"]);
    result.videoCount = identity(json["videoCount"]);
    result.viewCount = identity(json["viewCount"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelStatistics value) {
    if (value == null) return null;
    final result = {};
    result["commentCount"] = identity(value.commentCount);
    result["subscriberCount"] = identity(value.subscriberCount);
    result["videoCount"] = identity(value.videoCount);
    result["viewCount"] = identity(value.viewCount);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChannelTopicDetails
class ChannelTopicDetails extends IdentityHash {
  /** List of topic ids for this channel * */
  core.List<core.String> topicIds;

  /** Parses an instance from its JSON representation. */
  static ChannelTopicDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelTopicDetails();
    result.topicIds = map(identity)(json["topicIds"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelTopicDetails value) {
    if (value == null) return null;
    final result = {};
    result["topicIds"] = map(identity)(value.topicIds);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .GuideCategory
class GuideCategory extends IdentityHash {
  /** Snippet of the category. */
  GuideCategorySnippet snippet;

  /** The type of this API resource. */
  core.String kind;

  /** The eTag of the guide category. */
  core.String etag;

  /** The unique ID of the guide category. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static GuideCategory parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GuideCategory();
    result.snippet = GuideCategorySnippet.parse(json["snippet"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GuideCategory value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = GuideCategorySnippet.serialize(value.snippet);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .GuideCategoryListResponse
class GuideCategoryListResponse extends IdentityHash {
  /** List of categories matching the request criteria. */
  core.List<GuideCategory> items;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static GuideCategoryListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GuideCategoryListResponse();
    result.items = map(GuideCategory.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GuideCategoryListResponse value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(GuideCategory.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .GuideCategorySnippet
class GuideCategorySnippet extends IdentityHash {
  /** Channel publishing the guide category. */
  core.String channelId;

  /** Title of the guide category. */
  core.String title;

  /** Parses an instance from its JSON representation. */
  static GuideCategorySnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new GuideCategorySnippet();
    result.channelId = identity(json["channelId"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(GuideCategorySnippet value) {
    if (value == null) return null;
    final result = {};
    result["channelId"] = identity(value.channelId);
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PageInfo
class PageInfo extends IdentityHash {
  /** The total number of results. */
  core.int totalResults;

  /** The number of results to display for each page. */
  core.int resultPerPage;

  /** Parses an instance from its JSON representation. */
  static PageInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PageInfo();
    result.totalResults = identity(json["totalResults"]);
    result.resultPerPage = identity(json["resultPerPage"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PageInfo value) {
    if (value == null) return null;
    final result = {};
    result["totalResults"] = identity(value.totalResults);
    result["resultPerPage"] = identity(value.resultPerPage);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Playlist
class Playlist extends IdentityHash {
  /** Basic details about the playlist: title, description, thumbnails. */
  PlaylistSnippet snippet;

  /** Status of the playlist: only privacy_status for now. */
  PlaylistStatus status;

  /** The type of this API resource. */
  core.String kind;

  /** The eTag of the playlist. */
  core.String etag;

  /** The unique id of the playlist. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Playlist parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Playlist();
    result.snippet = PlaylistSnippet.parse(json["snippet"]);
    result.status = PlaylistStatus.parse(json["status"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Playlist value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = PlaylistSnippet.serialize(value.snippet);
    result["status"] = PlaylistStatus.serialize(value.status);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistItem
class PlaylistItem extends IdentityHash {
  /** Basic details about the playlist item: title, description, thumbnails. */
  PlaylistItemSnippet snippet;

  /** Content details about the playlist item: start and end clipping time. */
  PlaylistItemContentDetails contentDetails;

  /** The type of this API resource. */
  core.String kind;

  /** The eTag of the playlist item. */
  core.String etag;

  /** The unique id of the playlist item. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static PlaylistItem parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistItem();
    result.snippet = PlaylistItemSnippet.parse(json["snippet"]);
    result.contentDetails = PlaylistItemContentDetails.parse(json["contentDetails"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistItem value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = PlaylistItemSnippet.serialize(value.snippet);
    result["contentDetails"] = PlaylistItemContentDetails.serialize(value.contentDetails);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistItemContentDetails
class PlaylistItemContentDetails extends IdentityHash {
  /** The user-generated note for this item. */
  core.String note;

  /** The time video playback begins. */
  core.String startAt;

  /** The time video playback ends. */
  core.String endAt;

  /** ID of the video. */
  core.String videoId;

  /** Parses an instance from its JSON representation. */
  static PlaylistItemContentDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistItemContentDetails();
    result.note = identity(json["note"]);
    result.startAt = identity(json["startAt"]);
    result.endAt = identity(json["endAt"]);
    result.videoId = identity(json["videoId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistItemContentDetails value) {
    if (value == null) return null;
    final result = {};
    result["note"] = identity(value.note);
    result["startAt"] = identity(value.startAt);
    result["endAt"] = identity(value.endAt);
    result["videoId"] = identity(value.videoId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistItemListResponse
class PlaylistItemListResponse extends IdentityHash {
  /** Token to the next page. */
  core.String nextPageToken;

  /** The type of this API response. */
  core.String kind;

  /** List of playlist items matching the request criteria. */
  core.List<PlaylistItem> items;

  /** The eTag of the response. */
  core.String etag;

  /** Token to the previous page. */
  core.String prevPageToken;

  /** Paging information for the list result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static PlaylistItemListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistItemListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(PlaylistItem.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistItemListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(PlaylistItem.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["pageInfo"] = PageInfo.serialize(value.pageInfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistItemSnippet
class PlaylistItemSnippet extends IdentityHash {
  /** The playlist the item is part of. */
  core.String playlistId;

  /** Description of the playlist item. */
  core.String description;

  /** Title of the playlist item. */
  core.String title;

  /** The ID of the resource referenced by the playlist item. */
  ResourceId resourceId;

  /** Channel publishing the playlist item. */
  core.String channelId;

  /** Date and time the playlist item was published at. */
  core.String publishedAt;

  /** The position of the item within the playlist. */
  core.int position;

  /** Playlist item thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Parses an instance from its JSON representation. */
  static PlaylistItemSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistItemSnippet();
    result.playlistId = identity(json["playlistId"]);
    result.description = identity(json["description"]);
    result.title = identity(json["title"]);
    result.resourceId = ResourceId.parse(json["resourceId"]);
    result.channelId = identity(json["channelId"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.position = identity(json["position"]);
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistItemSnippet value) {
    if (value == null) return null;
    final result = {};
    result["playlistId"] = identity(value.playlistId);
    result["description"] = identity(value.description);
    result["title"] = identity(value.title);
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    result["channelId"] = identity(value.channelId);
    result["publishedAt"] = identity(value.publishedAt);
    result["position"] = identity(value.position);
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistListResponse
class PlaylistListResponse extends IdentityHash {
  /** Token to the next page. */
  core.String nextPageToken;

  /** The type of this API response. */
  core.String kind;

  /** List of playlists matching the request criteria. */
  core.List<Playlist> items;

  /** The eTag of the response. */
  core.String etag;

  /** Token to the previous page. */
  core.String prevPageToken;

  /** Paging information for the list result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static PlaylistListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(Playlist.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(Playlist.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["pageInfo"] = PageInfo.serialize(value.pageInfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistSnippet
class PlaylistSnippet extends IdentityHash {
  /** Title of the playlist. */
  core.String title;

  /** Channel publishing the playlist. */
  core.String channelId;

  /** Description of the playlist. */
  core.String description;

  /** Date and time the playlist was published at. */
  core.String publishedAt;

  /** Playlist thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Parses an instance from its JSON representation. */
  static PlaylistSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistSnippet();
    result.title = identity(json["title"]);
    result.channelId = identity(json["channelId"]);
    result.description = identity(json["description"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistSnippet value) {
    if (value == null) return null;
    final result = {};
    result["title"] = identity(value.title);
    result["channelId"] = identity(value.channelId);
    result["description"] = identity(value.description);
    result["publishedAt"] = identity(value.publishedAt);
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistStatus
class PlaylistStatus extends IdentityHash {
  /** Privacy of the playlist. */
  core.String privacyStatus;

  /** Parses an instance from its JSON representation. */
  static PlaylistStatus parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistStatus();
    result.privacyStatus = identity(json["privacyStatus"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistStatus value) {
    if (value == null) return null;
    final result = {};
    result["privacyStatus"] = identity(value.privacyStatus);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ResourceId
class ResourceId extends IdentityHash {
  /** The kind of the referred resource. */
  core.String kind;

  /** ID of the referred channel. Present only when type is "CHANNEL". */
  core.String channelId;

  /** ID of the referred playlist. Present only when type is "PLAYLIST". */
  core.String playlistId;

  /** ID of the referred video. Present only when type is "VIDEO". */
  core.String videoId;

  /** Parses an instance from its JSON representation. */
  static ResourceId parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ResourceId();
    result.kind = identity(json["kind"]);
    result.channelId = identity(json["channelId"]);
    result.playlistId = identity(json["playlistId"]);
    result.videoId = identity(json["videoId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ResourceId value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["channelId"] = identity(value.channelId);
    result["playlistId"] = identity(value.playlistId);
    result["videoId"] = identity(value.videoId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SearchListResponse
class SearchListResponse extends IdentityHash {
  /** Token to the next page. */
  core.String nextPageToken;

  /** The type of this API response. */
  core.String kind;

  /** List of results matching the request criteria. */
  core.List<SearchResult> items;

  /** The eTag of the response. */
  core.String etag;

  /** Token to the previous page. */
  core.String prevPageToken;

  /** Paging information for the search result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static SearchListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SearchListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(SearchResult.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SearchListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(SearchResult.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["pageInfo"] = PageInfo.serialize(value.pageInfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SearchResult
class SearchResult extends IdentityHash {
  /** Basic details about the search result: title, description, author. */
  SearchResultSnippet snippet;

  /** The type of this API resource. */
  core.String kind;

  /** The eTag of the search result. */
  core.String etag;

  /** The id of the resource. */
  ResourceId id;

  /** Parses an instance from its JSON representation. */
  static SearchResult parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SearchResult();
    result.snippet = SearchResultSnippet.parse(json["snippet"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = ResourceId.parse(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SearchResult value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = SearchResultSnippet.serialize(value.snippet);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = ResourceId.serialize(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SearchResultSnippet
class SearchResultSnippet extends IdentityHash {
  /** Title of the found resource. */
  core.String title;

  /** Channel publishing the found resource. */
  core.String channelId;

  /** Description of the found resource. */
  core.String description;

  /** Date and time the found resource was published at. */
  core.String publishedAt;

  /** Thumbnails for the found resource. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Parses an instance from its JSON representation. */
  static SearchResultSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SearchResultSnippet();
    result.title = identity(json["title"]);
    result.channelId = identity(json["channelId"]);
    result.description = identity(json["description"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SearchResultSnippet value) {
    if (value == null) return null;
    final result = {};
    result["title"] = identity(value.title);
    result["channelId"] = identity(value.channelId);
    result["description"] = identity(value.description);
    result["publishedAt"] = identity(value.publishedAt);
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Subscription
class Subscription extends IdentityHash {
  /** Basic details about the subscription */
  SubscriptionSnippet snippet;

  /** Basic statistics about the subscription */
  SubscriptionStatistics contentDetails;

  /** The type of this API resource. */
  core.String kind;

  /** The eTag of the subscription. */
  core.String etag;

  /** The unique id of the subscription. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Subscription parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Subscription();
    result.snippet = SubscriptionSnippet.parse(json["snippet"]);
    result.contentDetails = SubscriptionStatistics.parse(json["contentDetails"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Subscription value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = SubscriptionSnippet.serialize(value.snippet);
    result["contentDetails"] = SubscriptionStatistics.serialize(value.contentDetails);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SubscriptionListResponse
class SubscriptionListResponse extends IdentityHash {
  /** Token to the next page. */
  core.String nextPageToken;

  /** The type of this API response. */
  core.String kind;

  /** List of subscriptions matching the request criteria. */
  core.List<Subscription> items;

  /** The eTag of the response. */
  core.String etag;

  /** Token to the previous page. */
  core.String prevPageToken;

  /** Paging information for the list result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static SubscriptionListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionListResponse();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.kind = identity(json["kind"]);
    result.items = map(Subscription.parse)(json["items"]);
    result.etag = identity(json["etag"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionListResponse value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["kind"] = identity(value.kind);
    result["items"] = map(Subscription.serialize)(value.items);
    result["etag"] = identity(value.etag);
    result["prevPageToken"] = identity(value.prevPageToken);
    result["pageInfo"] = PageInfo.serialize(value.pageInfo);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SubscriptionSnippet
class SubscriptionSnippet extends IdentityHash {
  /** Description of the subscription. */
  core.String description;

  /** Title of the subscription. */
  core.String title;

  /** The resource subscribed to. */
  ResourceId resourceId;

  /** Channel publishing the subscription. */
  core.String channelId;

  /** Date and time the subscription was published at. */
  core.String publishedAt;

  /** Subscription thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Parses an instance from its JSON representation. */
  static SubscriptionSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionSnippet();
    result.description = identity(json["description"]);
    result.title = identity(json["title"]);
    result.resourceId = ResourceId.parse(json["resourceId"]);
    result.channelId = identity(json["channelId"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionSnippet value) {
    if (value == null) return null;
    final result = {};
    result["description"] = identity(value.description);
    result["title"] = identity(value.title);
    result["resourceId"] = ResourceId.serialize(value.resourceId);
    result["channelId"] = identity(value.channelId);
    result["publishedAt"] = identity(value.publishedAt);
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SubscriptionStatistics
class SubscriptionStatistics extends IdentityHash {
  /** Number of unread activities in the channel. */
  core.int unreadCount;

  /** Approximate number of videos in the channel. */
  core.int countHint;

  /** Parses an instance from its JSON representation. */
  static SubscriptionStatistics parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SubscriptionStatistics();
    result.unreadCount = identity(json["unreadCount"]);
    result.countHint = identity(json["countHint"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SubscriptionStatistics value) {
    if (value == null) return null;
    final result = {};
    result["unreadCount"] = identity(value.unreadCount);
    result["countHint"] = identity(value.countHint);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Thumbnail
class Thumbnail extends IdentityHash {
  /** The URL for the thumbnail. */
  core.String url;

  /** Parses an instance from its JSON representation. */
  static Thumbnail parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Thumbnail();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Thumbnail value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Video
class Video extends IdentityHash {
  /** Status of the video upload, privacy status. */
  VideoStatus status;

  /** Topics related to the video */
  VideoTopicDetails topicDetails;

  /** The type of this API resource. */
  core.String kind;

  /** Statistics about the video: number of views, ratings. */
  VideoStatistics statistics;

  /** Information about the video content, media file. */
  VideoContentDetails contentDetails;

  /** Basic details about the video: title, description, thumbnails. */
  VideoSnippet snippet;

  /** Information used to play the video. */
  VideoPlayer player;

  /** The eTag of the video. */
  core.String etag;

  /** The unique id of the video. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static Video parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Video();
    result.status = VideoStatus.parse(json["status"]);
    result.topicDetails = VideoTopicDetails.parse(json["topicDetails"]);
    result.kind = identity(json["kind"]);
    result.statistics = VideoStatistics.parse(json["statistics"]);
    result.contentDetails = VideoContentDetails.parse(json["contentDetails"]);
    result.snippet = VideoSnippet.parse(json["snippet"]);
    result.player = VideoPlayer.parse(json["player"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Video value) {
    if (value == null) return null;
    final result = {};
    result["status"] = VideoStatus.serialize(value.status);
    result["topicDetails"] = VideoTopicDetails.serialize(value.topicDetails);
    result["kind"] = identity(value.kind);
    result["statistics"] = VideoStatistics.serialize(value.statistics);
    result["contentDetails"] = VideoContentDetails.serialize(value.contentDetails);
    result["snippet"] = VideoSnippet.serialize(value.snippet);
    result["player"] = VideoPlayer.serialize(value.player);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoCategory
class VideoCategory extends IdentityHash {
  /** Basic details about the video category. */
  VideoCategorySnippet snippet;

  /** The type of this API resource. */
  core.String kind;

  /** The eTag of the video. */
  core.String etag;

  /** The unique id of the video category. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static VideoCategory parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoCategory();
    result.snippet = VideoCategorySnippet.parse(json["snippet"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoCategory value) {
    if (value == null) return null;
    final result = {};
    result["snippet"] = VideoCategorySnippet.serialize(value.snippet);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoCategoryListResponse
class VideoCategoryListResponse extends IdentityHash {
  /** List of video categories matching the request criteria. */
  core.List<VideoCategory> items;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static VideoCategoryListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoCategoryListResponse();
    result.items = map(VideoCategory.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoCategoryListResponse value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(VideoCategory.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoCategorySnippet
class VideoCategorySnippet extends IdentityHash {
  /** Channel publishing the video category. */
  core.String channelId;

  /** Title of the video category. */
  core.String title;

  /** Parses an instance from its JSON representation. */
  static VideoCategorySnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoCategorySnippet();
    result.channelId = identity(json["channelId"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoCategorySnippet value) {
    if (value == null) return null;
    final result = {};
    result["channelId"] = identity(value.channelId);
    result["title"] = identity(value.title);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoContentDetails
class VideoContentDetails extends IdentityHash {
  /** Duration of the video. */
  core.String duration;

  /** Parses an instance from its JSON representation. */
  static VideoContentDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoContentDetails();
    result.duration = identity(json["duration"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoContentDetails value) {
    if (value == null) return null;
    final result = {};
    result["duration"] = identity(value.duration);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoListResponse
class VideoListResponse extends IdentityHash {
  /** List of videos matching the request criteria. */
  core.List<Video> items;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static VideoListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoListResponse();
    result.items = map(Video.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoListResponse value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Video.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoPlayer
class VideoPlayer extends IdentityHash {
  /** Iframe embed for the video. */
  core.String embedHtml;

  /** Parses an instance from its JSON representation. */
  static VideoPlayer parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoPlayer();
    result.embedHtml = identity(json["embedHtml"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoPlayer value) {
    if (value == null) return null;
    final result = {};
    result["embedHtml"] = identity(value.embedHtml);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoSnippet
class VideoSnippet extends IdentityHash {
  /** Video thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Textual tags associated with the video. */
  core.List<core.String> tags;

  /** Channel publishing the video. */
  core.String channelId;

  /** Date and time the video was published at. */
  core.String publishedAt;

  /** Title of the video. */
  core.String title;

  /** Video category the video belongs to. */
  core.String categoryId;

  /** Description of the video. */
  core.String description;

  /** Parses an instance from its JSON representation. */
  static VideoSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoSnippet();
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    result.tags = map(identity)(json["tags"]);
    result.channelId = identity(json["channelId"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.title = identity(json["title"]);
    result.categoryId = identity(json["categoryId"]);
    result.description = identity(json["description"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoSnippet value) {
    if (value == null) return null;
    final result = {};
    result["thumbnails"] = mapValues(Thumbnail.serialize)(value.thumbnails);
    result["tags"] = map(identity)(value.tags);
    result["channelId"] = identity(value.channelId);
    result["publishedAt"] = identity(value.publishedAt);
    result["title"] = identity(value.title);
    result["categoryId"] = identity(value.categoryId);
    result["description"] = identity(value.description);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoStatistics
class VideoStatistics extends IdentityHash {
  /** Number of comments for this video. */
  core.String commentCount;

  /** Number of times the video was viewed. */
  core.String viewCount;

  /** Number of times the video was added to a user's favorites list. */
  core.String favoriteCount;

  /** Number of times the video was disliked. */
  core.String dislikeCount;

  /** Number of times the video was liked. */
  core.String likeCount;

  /** Parses an instance from its JSON representation. */
  static VideoStatistics parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoStatistics();
    result.commentCount = identity(json["commentCount"]);
    result.viewCount = identity(json["viewCount"]);
    result.favoriteCount = identity(json["favoriteCount"]);
    result.dislikeCount = identity(json["dislikeCount"]);
    result.likeCount = identity(json["likeCount"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoStatistics value) {
    if (value == null) return null;
    final result = {};
    result["commentCount"] = identity(value.commentCount);
    result["viewCount"] = identity(value.viewCount);
    result["favoriteCount"] = identity(value.favoriteCount);
    result["dislikeCount"] = identity(value.dislikeCount);
    result["likeCount"] = identity(value.likeCount);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoStatus
class VideoStatus extends IdentityHash {
  /** Privacy of the video. */
  core.String privacyStatus;

  /** Status of the video upload. */
  core.String uploadStatus;

  /** Present only if the uploadStatus indicates a rejected upload. */
  core.String rejectionReason;

  /** Present only if the uploadStatus indicates a failed upload. */
  core.String failureReason;

  /** Parses an instance from its JSON representation. */
  static VideoStatus parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoStatus();
    result.privacyStatus = identity(json["privacyStatus"]);
    result.uploadStatus = identity(json["uploadStatus"]);
    result.rejectionReason = identity(json["rejectionReason"]);
    result.failureReason = identity(json["failureReason"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoStatus value) {
    if (value == null) return null;
    final result = {};
    result["privacyStatus"] = identity(value.privacyStatus);
    result["uploadStatus"] = identity(value.uploadStatus);
    result["rejectionReason"] = identity(value.rejectionReason);
    result["failureReason"] = identity(value.failureReason);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoTopicDetails
class VideoTopicDetails extends IdentityHash {
  /** List of topic ids for this video * */
  core.List<core.String> topicIds;

  /** Parses an instance from its JSON representation. */
  static VideoTopicDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoTopicDetails();
    result.topicIds = map(identity)(json["topicIds"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoTopicDetails value) {
    if (value == null) return null;
    final result = {};
    result["topicIds"] = map(identity)(value.topicIds);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum YouTubeApi.Alt
class YouTubeApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const YouTubeApiAlt JSON = const YouTubeApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<YouTubeApiAlt> values = const <YouTubeApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <YouTubeApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static YouTubeApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const YouTubeApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

