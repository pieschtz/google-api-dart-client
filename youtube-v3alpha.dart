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

#library('youtube-v3alpha');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API YoutubeApi
/**
 * Programmatic access to YouTube features.
 */
class YoutubeApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  YoutubeApi get _$service() => this;
  ChannelsResource _channels;
  ChannelsResource get channels() => _channels;
  SearchResource _search;
  SearchResource get search() => _search;
  PlaylistitemsResource _playlistitems;
  PlaylistitemsResource get playlistitems() => _playlistitems;
  PlaylistsResource _playlists;
  PlaylistsResource get playlists() => _playlists;
  VideosResource _videos;
  VideosResource get videos() => _videos;
  
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
  YoutubeApiAlt alt;


  YoutubeApi([this.baseUrl = "https://www.googleapis.com/youtube/v3alpha/", applicationName, this.authenticator]) :
      this.applicationName = applicationName
          .replaceAll(const core.RegExp(@'\s+'), '_')
          .replaceAll(const core.RegExp(@'[^-_.,0-9a-zA-Z]'), '')
  { 
    _channels = new ChannelsResource._internal(this);
    _search = new SearchResource._internal(this);
    _playlistitems = new PlaylistitemsResource._internal(this);
    _playlists = new PlaylistsResource._internal(this);
    _videos = new VideosResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}youtube/v3alpha/20120727 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: Manage your YouTube account */
  static final core.String YOUTUBE_SCOPE = "https://www.googleapis.com/auth/youtube";
}

// Resource .ChannelsResource
class ChannelsResource extends core.Object {
  final YoutubeApi _$service;
  
  ChannelsResource._internal(YoutubeApi $service) : _$service = $service;

  // Method ChannelsResource.List
  /**
   * Browse the YouTube channel collection. Either the 'id' or 'mine' parameter must be set.
   *
   *    * [part] Parts of the channel resource to be returned.
   *    * [id] YouTube IDs of the channels to be returned.
   *    * [mine] Flag indicating only return the channel ids of the authenticated user.
   */
  core.Future<ChannelListResponse> list(core.String part, [core.String id = UNSPECIFIED, core.String mine = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["part"] = part;
    if (UNSPECIFIED != id) $queryParams["id"] = id;
    if (UNSPECIFIED != mine) $queryParams["mine"] = mine;
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
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ChannelListResponse.parse(JSON.parse($text)));
  }
}

// Resource .SearchResource
class SearchResource extends core.Object {
  final YoutubeApi _$service;
  
  SearchResource._internal(YoutubeApi $service) : _$service = $service;

  // Method SearchResource.List
  /**
   * Universal search for youtube.
   *
   *    * [q] Query to search in Youtube.
   *    * [startIndex] Index of the first search result to return.
  Default: 0.
  Minimum: 0.
  Maximum: 1000.
   *    * [type] Type of resource to search.
   *    * [order] Sort order.
  Default: SEARCH_SORT_RELEVANCE.
   *    * [maxResults] Maximum number of search results to return per page.
  Default: 25.
  Minimum: 0.
  Maximum: 50.
   */
  core.Future<SearchListResponse> list([core.String q = UNSPECIFIED, core.int startIndex = UNSPECIFIED, SearchResourceListType type = UNSPECIFIED, SearchResourceListOrder order = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (UNSPECIFIED != q) $queryParams["q"] = q;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != type) $queryParams["type"] = type;
    if (UNSPECIFIED != order) $queryParams["order"] = order;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
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
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => SearchListResponse.parse(JSON.parse($text)));
  }
}

// Enum SearchResource.List.Type
class SearchResourceListType extends core.Object implements core.Hashable {
  /** Search for channels. */
  static final SearchResourceListType CHANNEL = const SearchResourceListType._internal("channel", 0);
  /** Search for playlists. */
  static final SearchResourceListType PLAYLIST = const SearchResourceListType._internal("playlist", 1);
  /** Search for videos. */
  static final SearchResourceListType VIDEO = const SearchResourceListType._internal("video", 2);

  /** All values of this enumeration */
  static final core.List<SearchResourceListType> values = const <SearchResourceListType>[
    CHANNEL,
    PLAYLIST,
    VIDEO,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <SearchResourceListType>{ 
    "channel": CHANNEL,
    "playlist": PLAYLIST,
    "video": VIDEO,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static SearchResourceListType valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const SearchResourceListType._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Type".hashCode();
}

// Enum SearchResource.List.Order
class SearchResourceListOrder extends core.Object implements core.Hashable {
  /** Sort according to the date. */
  static final SearchResourceListOrder DATE = const SearchResourceListOrder._internal("date", 0);
  /** Sort according to the rating. */
  static final SearchResourceListOrder RATING = const SearchResourceListOrder._internal("rating", 1);
  /** Sort according to the relevance. */
  static final SearchResourceListOrder RELEVANCE = const SearchResourceListOrder._internal("relevance", 2);
  /** Sort according to the view count. */
  static final SearchResourceListOrder VIEW_COUNT = const SearchResourceListOrder._internal("view_count", 3);

  /** All values of this enumeration */
  static final core.List<SearchResourceListOrder> values = const <SearchResourceListOrder>[
    DATE,
    RATING,
    RELEVANCE,
    VIEW_COUNT,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <SearchResourceListOrder>{ 
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

// Resource .PlaylistitemsResource
class PlaylistitemsResource extends core.Object {
  final YoutubeApi _$service;
  
  PlaylistitemsResource._internal(YoutubeApi $service) : _$service = $service;

  // Method PlaylistitemsResource.List
  /**
   * Browse the YouTube playlist collection.
   *
   *    * [part] Parts of the playlist resource to be returned.
   *    * [startIndex] Index of the first element to return (starts at 0)

  Minimum: 0.
   *    * [playlistId] Retrieves playlist items from the given playlist id.
   *    * [id] YouTube IDs of the playlists to be returned.
   *    * [maxResults] Maximum number of results to return
  Default: 50.
  Minimum: 0.
   */
  core.Future<PlaylistItemListResponse> list(core.String part, [core.int startIndex = UNSPECIFIED, core.String playlistId = UNSPECIFIED, core.String id = UNSPECIFIED, core.int maxResults = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["part"] = part;
    if (UNSPECIFIED != startIndex) $queryParams["startIndex"] = startIndex;
    if (UNSPECIFIED != playlistId) $queryParams["playlistId"] = playlistId;
    if (UNSPECIFIED != id) $queryParams["id"] = id;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "playlistitems";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PlaylistItemListResponse.parse(JSON.parse($text)));
  }
}

// Resource .PlaylistsResource
class PlaylistsResource extends core.Object {
  final YoutubeApi _$service;
  
  PlaylistsResource._internal(YoutubeApi $service) : _$service = $service;

  // Method PlaylistsResource.List
  /**
   * Browse the YouTube playlist collection.
   *
   *    * [id] YouTube IDs of the playlists to be returned.
   *    * [part] Parts of the playlist resource to be returned.
   */
  core.Future<PlaylistListResponse> list(core.String id, core.String part) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    $pathParams["part"] = part;
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
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PlaylistListResponse.parse(JSON.parse($text)));
  }
}

// Resource .VideosResource
class VideosResource extends core.Object {
  final YoutubeApi _$service;
  
  VideosResource._internal(YoutubeApi $service) : _$service = $service;

  // Method VideosResource.List
  /**
   * Browse the YouTube video collection.
   *
   *    * [id] YouTube IDs of the videos to be returned.
   *    * [part] Parts of the video resource to be returned.
   */
  core.Future<VideoListResponse> list(core.String id, core.String part) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["id"] = id;
    $pathParams["part"] = part;
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
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => VideoListResponse.parse(JSON.parse($text)));
  }
}

// Schema .Channel
class Channel extends IdentityHash {
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
  /** Map of channels matching the request criteria, keyed by channel id. */
  core.Map<core.String, Channel> channels;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static ChannelListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelListResponse();
    result.channels = mapValues(Channel.parse)(json["channels"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelListResponse value) {
    if (value == null) return null;
    final result = {};
    result["channels"] = mapValues(Channel.serialize)(value.channels);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ChannelSnippet
class ChannelSnippet extends IdentityHash {
  /** Title of the channel. */
  core.String title;

  /** Description of the channel. */
  core.String description;

  /** Channel thumbnails. */
  core.Map<core.String, Thumbnail> thumbnails;

  /** Parses an instance from its JSON representation. */
  static ChannelSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ChannelSnippet();
    result.title = identity(json["title"]);
    result.description = identity(json["description"]);
    result.thumbnails = mapValues(Thumbnail.parse)(json["thumbnails"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ChannelSnippet value) {
    if (value == null) return null;
    final result = {};
    result["title"] = identity(value.title);
    result["description"] = identity(value.description);
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

// Schema .PageInfo
class PageInfo extends IdentityHash {
  /** The total number of results. */
  core.int totalResults;

  /** The index position of the first result to display. */
  core.int startIndex;

  /** The number of results to display for each page. */
  core.int resultPerPage;

  /** Parses an instance from its JSON representation. */
  static PageInfo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PageInfo();
    result.totalResults = identity(json["totalResults"]);
    result.startIndex = identity(json["startIndex"]);
    result.resultPerPage = identity(json["resultPerPage"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PageInfo value) {
    if (value == null) return null;
    final result = {};
    result["totalResults"] = identity(value.totalResults);
    result["startIndex"] = identity(value.startIndex);
    result["resultPerPage"] = identity(value.resultPerPage);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Playlist
class Playlist extends IdentityHash {
  /** Basic details about the playlist: title, description, thumbnails. */
  PlaylistSnippet snippet;

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
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistItemListResponse
class PlaylistItemListResponse extends IdentityHash {
  /** Map of playlist items matching the request criteria, keyed by id. */
  core.Map<core.String, PlaylistItem> playlistItems;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static PlaylistItemListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistItemListResponse();
    result.playlistItems = mapValues(PlaylistItem.parse)(json["playlistItems"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistItemListResponse value) {
    if (value == null) return null;
    final result = {};
    result["playlistItems"] = mapValues(PlaylistItem.serialize)(value.playlistItems);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
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

  /** Author of the playlist item. */
  core.String channelId;

  /** The date and time the playlist item was created. */
  core.String publishedAt;

  /** The position of the item within the playlist. */
  core.int position;

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
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistListResponse
class PlaylistListResponse extends IdentityHash {
  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Map of playlists matching the request criteria, keyed by id. */
  core.Map<core.String, Playlist> playlists;

  /** Parses an instance from its JSON representation. */
  static PlaylistListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistListResponse();
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.playlists = mapValues(Playlist.parse)(json["playlists"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PlaylistListResponse value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["playlists"] = mapValues(Playlist.serialize)(value.playlists);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PlaylistSnippet
class PlaylistSnippet extends IdentityHash {
  /** Title of the playlist. */
  core.String title;

  /** Author of the playlist. */
  core.String channelId;

  /** Description of the playlist. */
  core.String description;

  /** The date and time the playlist was created. */
  core.String publishedAt;

  /** Textual tags associated with the playlist. */
  core.List<core.String> tags;

  /** Parses an instance from its JSON representation. */
  static PlaylistSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PlaylistSnippet();
    result.title = identity(json["title"]);
    result.channelId = identity(json["channelId"]);
    result.description = identity(json["description"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.tags = map(identity)(json["tags"]);
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
    result["tags"] = map(identity)(value.tags);
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
  /** List of results matching the request criteria. */
  core.List<SearchResult> searchResults;

  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Paging information for the search result. */
  PageInfo pageInfo;

  /** Parses an instance from its JSON representation. */
  static SearchListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SearchListResponse();
    result.searchResults = map(SearchResult.parse)(json["searchResults"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.pageInfo = PageInfo.parse(json["pageInfo"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SearchListResponse value) {
    if (value == null) return null;
    final result = {};
    result["searchResults"] = map(SearchResult.serialize)(value.searchResults);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
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
  /** Author of the found resource. */
  core.String channelId;

  /** Description of the search result. */
  core.String description;

  /** The date and time the found resource was created. */
  core.String publishedAt;

  /** Title of the search result. */
  core.String title;

  /** Parses an instance from its JSON representation. */
  static SearchResultSnippet parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SearchResultSnippet();
    result.channelId = identity(json["channelId"]);
    result.description = identity(json["description"]);
    result.publishedAt = identity(json["publishedAt"]);
    result.title = identity(json["title"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SearchResultSnippet value) {
    if (value == null) return null;
    final result = {};
    result["channelId"] = identity(value.channelId);
    result["description"] = identity(value.description);
    result["publishedAt"] = identity(value.publishedAt);
    result["title"] = identity(value.title);
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

// Schema .VideoContentDetails
class VideoContentDetails extends IdentityHash {
  /** Duration of the video. */
  core.String duration;

  /** The aspect ratio of the video. */
  core.String aspectRatio;

  /** Parses an instance from its JSON representation. */
  static VideoContentDetails parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoContentDetails();
    result.duration = identity(json["duration"]);
    result.aspectRatio = identity(json["aspectRatio"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoContentDetails value) {
    if (value == null) return null;
    final result = {};
    result["duration"] = identity(value.duration);
    result["aspectRatio"] = identity(value.aspectRatio);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .VideoListResponse
class VideoListResponse extends IdentityHash {
  /** The type of this API response. */
  core.String kind;

  /** The eTag of the response. */
  core.String etag;

  /** Map of videos matching the request criteria, keyed by video id. */
  core.Map<core.String, Video> videos;

  /** Parses an instance from its JSON representation. */
  static VideoListResponse parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new VideoListResponse();
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.videos = mapValues(Video.parse)(json["videos"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(VideoListResponse value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["videos"] = mapValues(Video.serialize)(value.videos);
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

  /** Channel the video was uploaded into. */
  core.String channelId;

  /** Date time the video was uploaded. */
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

// Enum YoutubeApi.Alt
class YoutubeApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final YoutubeApiAlt JSON = const YoutubeApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<YoutubeApiAlt> values = const <YoutubeApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <YoutubeApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static YoutubeApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const YoutubeApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

