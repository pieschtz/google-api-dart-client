#library("blogger");
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API BloggerApi
/**
 * API for access to the data within Blogger.
 */
class BloggerApi {
  /** The API root, such as [:https://www.googleapis.com:] */
  final String baseUrl;
  /** The client library version */
  final String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final String applicationName;
  BloggerApi get _$service() => this;
  BlogsResource _blogs;
  BlogsResource get blogs() => _blogs;
  PostsResource _posts;
  PostsResource get posts() => _posts;
  PagesResource _pages;
  PagesResource get pages() => _pages;
  CommentsResource _comments;
  CommentsResource get comments() => _comments;
  UsersResource _users;
  UsersResource get users() => _users;
  
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
  BloggerApiAlt alt;


  BloggerApi([this.baseUrl = "https://www.googleapis.com/blogger/v2/", this.applicationName]) { 
    _blogs = new BlogsResource._internal(this);
    _posts = new PostsResource._internal(this);
    _pages = new PagesResource._internal(this);
    _comments = new CommentsResource._internal(this);
    _users = new UsersResource._internal(this);
  }
  String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}blogger/v2/20120508 google-api-dart-client/${clientVersion}";
  }
}

// Resource .BlogsResource
class BlogsResource {
  final BloggerApi _$service;
  
  BlogsResource._internal(BloggerApi $service) : _$service = $service;

  // Method BlogsResource.Get
  /**
   * Gets one blog by id.
   * [blogId] The ID of the blog to get.
   */
  Future<Blog> get(String blogId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Blog>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Blog.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .PostsResource
class PostsResource {
  final BloggerApi _$service;
  
  PostsResource._internal(BloggerApi $service) : _$service = $service;

  // Method PostsResource.List
  /**
   * Retrieves a list of posts, possibly filtered.
   * [blogId] ID of the blog to fetch posts from.
   */
  Future<PostList> list(String blogId, [String pageToken = UNSPECIFIED, bool fetchBodies = UNSPECIFIED, int maxResults = UNSPECIFIED, String startDate = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != fetchBodies) $queryParams["fetchBodies"] = fetchBodies;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != startDate) $queryParams["startDate"] = startDate;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}/posts").generate($pathParams, $queryParams);
    final $completer = new Completer<PostList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = PostList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method PostsResource.Get
  /**
   * Get a post by id.
   * [blogId] ID of the blog to fetch the post from.
   * [postId] The ID of the post
   */
  Future<Post> get(String blogId, String postId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    $pathParams["postId"] = postId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}/posts/{postId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Post>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Post.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .PagesResource
class PagesResource {
  final BloggerApi _$service;
  
  PagesResource._internal(BloggerApi $service) : _$service = $service;

  // Method PagesResource.List
  /**
   * Retrieves pages for a blog, possibly filtered.
   * [blogId] ID of the blog to fetch pages from.
   */
  Future<PageList> list(String blogId, [bool fetchBodies = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    if (UNSPECIFIED != fetchBodies) $queryParams["fetchBodies"] = fetchBodies;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}/pages").generate($pathParams, $queryParams);
    final $completer = new Completer<PageList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = PageList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method PagesResource.Get
  /**
   * Gets one blog page by id.
   * [blogId] ID of the blog containing the page.
   * [pageId] The ID of the page to get.
   */
  Future<Page> get(String blogId, String pageId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    $pathParams["pageId"] = pageId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}/pages/{pageId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Page>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Page.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .CommentsResource
class CommentsResource {
  final BloggerApi _$service;
  
  CommentsResource._internal(BloggerApi $service) : _$service = $service;

  // Method CommentsResource.List
  /**
   * Retrieves the comments for a blog, possibly filtered.
   * [blogId] ID of the blog to fetch comments from.
   * [postId] ID of the post to fetch posts from.
   */
  Future<CommentList> list(String blogId, String postId, [String startDate = UNSPECIFIED, int maxResults = UNSPECIFIED, String pageToken = UNSPECIFIED, bool fetchBodies = UNSPECIFIED]) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    $pathParams["postId"] = postId;
    if (UNSPECIFIED != startDate) $queryParams["startDate"] = startDate;
    if (UNSPECIFIED != maxResults) $queryParams["maxResults"] = maxResults;
    if (UNSPECIFIED != pageToken) $queryParams["pageToken"] = pageToken;
    if (UNSPECIFIED != fetchBodies) $queryParams["fetchBodies"] = fetchBodies;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}/posts/{postId}/comments").generate($pathParams, $queryParams);
    final $completer = new Completer<CommentList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = CommentList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }

  // Method CommentsResource.Get
  /**
   * Gets one comment by id.
   * [blogId] ID of the blog to containing the comment.
   * [postId] ID of the post to fetch posts from.
   * [commentId] The ID of the comment to get.
   */
  Future<Comment> get(String blogId, String postId, String commentId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["blogId"] = blogId;
    $pathParams["postId"] = postId;
    $pathParams["commentId"] = commentId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "blogs/{blogId}/posts/{postId}/comments/{commentId}").generate($pathParams, $queryParams);
    final $completer = new Completer<Comment>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = Comment.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Resource .UsersResource
class UsersResource {
  final BloggerApi _$service;
  final UsersBlogsResourceResource blogs;
  
  UsersResource._internal(BloggerApi $service) : _$service = $service,
    blogs = new UsersBlogsResourceResource._internal($service);

  // Method UsersResource.Get
  /**
   * Gets one user by id.
   * [userId] The ID of the user to get.
   */
  Future<User> get(String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/{userId}").generate($pathParams, $queryParams);
    final $completer = new Completer<User>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = User.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}


// Resource UsersResource.UsersBlogsResourceResource
class UsersBlogsResourceResource {
  final BloggerApi _$service;
  
  UsersBlogsResourceResource._internal(BloggerApi $service) : _$service = $service;

  // Method UsersResource.UsersBlogsResourceResource.List
  /**
   * Retrieves a list of blogs, possibly filtered.
   * [userId] ID of the user whose blogs are to be fetched. Either the word 'self' (sans quote marks) or the
   *        user's profile identifier.
   */
  Future<BlogList> list(String userId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["userId"] = userId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $url = new UrlPattern(_$service.baseUrl + "users/{userId}/blogs").generate($pathParams, $queryParams);
    final $completer = new Completer<BlogList>();
    final $http = new HttpRequest($url, "GET", $headers);
    final $request = $http.request();
    $request.handleException(($ex) { $completer.completeException($ex); return true; });
    $request.then((final $text) {
      var $result;
      bool $success = false;
      try {
        $result = BlogList.parse(JSON.parse($text)); $success = true;
      } catch (final $ex) { $completer.completeException($ex); }
      if ($success) $completer.complete($result);
    });
    return $completer.future;
  }
}

// Schema .Blog
class Blog extends IdentityHash {
  /** The kind of this entry. Always blogger#blog */
  String kind;

  /** The description of this blog. This is displayed underneath the title. */
  String description;

  /** The locale this Blog is set to. */
  BlogLocale locale;

  /** The container of posts in this blog. */
  BlogPosts posts;

  /** RFC 3339 date-time when this blog was last updated. */
  String updated;

  /** The identifier for this resource. */
  String id;

  /** The URL where this blog is published. */
  String url;

  /** RFC 3339 date-time when this blog was published. */
  String published;

  /** The container of pages in this blog. */
  BlogPages pages;

  /** The API REST URL to fetch this resource from. */
  String selfLink;

  /** The name of this blog. This is displayed as the title. */
  String name;

  /** Parses an instance from its JSON representation. */
  static Blog parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Blog();
    result.kind = identity(json["kind"]);
    result.description = identity(json["description"]);
    result.locale = BlogLocale.parse(json["locale"]);
    result.posts = BlogPosts.parse(json["posts"]);
    result.updated = identity(json["updated"]);
    result.id = identity(json["id"]);
    result.url = identity(json["url"]);
    result.published = identity(json["published"]);
    result.pages = BlogPages.parse(json["pages"]);
    result.selfLink = identity(json["selfLink"]);
    result.name = identity(json["name"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Blog value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["kind"] = identity(value.kind);
    result["description"] = identity(value.description);
    result["locale"] = BlogLocale.serialize(value.locale);
    result["posts"] = BlogPosts.serialize(value.posts);
    result["updated"] = identity(value.updated);
    result["id"] = identity(value.id);
    result["url"] = identity(value.url);
    result["published"] = identity(value.published);
    result["pages"] = BlogPages.serialize(value.pages);
    result["selfLink"] = identity(value.selfLink);
    result["name"] = identity(value.name);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .BlogList
class BlogList extends IdentityHash {
  /** The list of Blogs this user has Authorship or Admin rights over. */
  List<Blog> items;

  /** The kind of this entity. Always blogger#blogList */
  String kind;

  /** Parses an instance from its JSON representation. */
  static BlogList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BlogList();
    result.items = map(Blog.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BlogList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Blog.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Blog.BlogLocale
class BlogLocale extends IdentityHash {
  /** The country this blog's locale is set to. */
  String country;

  /** The language variant this blog is authored in. */
  String variant;

  /** The language this blog is authored in. */
  String language;

  /** Parses an instance from its JSON representation. */
  static BlogLocale parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BlogLocale();
    result.country = identity(json["country"]);
    result.variant = identity(json["variant"]);
    result.language = identity(json["language"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BlogLocale value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["country"] = identity(value.country);
    result["variant"] = identity(value.variant);
    result["language"] = identity(value.language);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Blog.BlogPages
class BlogPages extends IdentityHash {
  /** The count of pages in this blog. */
  int totalItems;

  /** The URL of the container for pages in this blog. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static BlogPages parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BlogPages();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BlogPages value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Blog.BlogPosts
class BlogPosts extends IdentityHash {
  /** The count of posts in this blog. */
  int totalItems;

  /** The URL of the container for posts in this blog. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static BlogPosts parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new BlogPosts();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(BlogPosts value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Comment
class Comment extends IdentityHash {
  /** The actual content of the comment. May include HTML markup. */
  String content;

  /** The kind of this entry. Always blogger#comment */
  String kind;

  /** Data about the comment this is in reply to. */
  CommentInReplyTo inReplyTo;

  /** The author of this Comment. */
  CommentAuthor author;

  /** RFC 3339 date-time when this comment was last updated. */
  String updated;

  /** Data about the blog containing this comment. */
  CommentBlog blog;

  /** RFC 3339 date-time when this comment was published. */
  String published;

  /** Data about the post containing this comment. */
  CommentPost post;

  /** The identifier for this resource. */
  String id;

  /** The API REST URL to fetch this resource from. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Comment parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Comment();
    result.content = identity(json["content"]);
    result.kind = identity(json["kind"]);
    result.inReplyTo = CommentInReplyTo.parse(json["inReplyTo"]);
    result.author = CommentAuthor.parse(json["author"]);
    result.updated = identity(json["updated"]);
    result.blog = CommentBlog.parse(json["blog"]);
    result.published = identity(json["published"]);
    result.post = CommentPost.parse(json["post"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Comment value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["content"] = identity(value.content);
    result["kind"] = identity(value.kind);
    result["inReplyTo"] = CommentInReplyTo.serialize(value.inReplyTo);
    result["author"] = CommentAuthor.serialize(value.author);
    result["updated"] = identity(value.updated);
    result["blog"] = CommentBlog.serialize(value.blog);
    result["published"] = identity(value.published);
    result["post"] = CommentPost.serialize(value.post);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentAuthor
class CommentAuthor extends IdentityHash {
  /** The URL of the Comment creator's Profile page. */
  String url;

  /** The comment creator's avatar. */
  CommentAuthorImage image;

  /** The display name. */
  String displayName;

  /** The identifier of the Comment creator. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentAuthor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentAuthor();
    result.url = identity(json["url"]);
    result.image = CommentAuthorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentAuthor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["image"] = CommentAuthorImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentAuthor.CommentAuthorImage
class CommentAuthorImage extends IdentityHash {
  /** The comment creator's avatar URL. */
  String url;

  /** Parses an instance from its JSON representation. */
  static CommentAuthorImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentAuthorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentAuthorImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentBlog
class CommentBlog extends IdentityHash {
  /** The identifier of the blog containing this comment. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentBlog parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentBlog();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentBlog value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentInReplyTo
class CommentInReplyTo extends IdentityHash {
  /** The identified of the parent of this comment. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentInReplyTo parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentInReplyTo();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentInReplyTo value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentList
class CommentList extends IdentityHash {
  /** Pagination token to fetch the next page, if one exists. */
  String nextPageToken;

  /** The List of Comments for a Post. */
  List<Comment> items;

  /** The kind of this entry. Always blogger#commentList */
  String kind;

  /** Pagination token to fetch the previous page, if one exists. */
  String prevPageToken;

  /** Parses an instance from its JSON representation. */
  static CommentList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Comment.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Comment.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["prevPageToken"] = identity(value.prevPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentPost
class CommentPost extends IdentityHash {
  /** The identifier of the post containing this comment. */
  String id;

  /** Parses an instance from its JSON representation. */
  static CommentPost parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new CommentPost();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(CommentPost value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Page
class Page extends IdentityHash {
  /** The body content of this Page, in HTML. */
  String content;

  /** The kind of this entity. Always blogger#page */
  String kind;

  /** The author of this Page. */
  PageAuthor author;

  /** The URL that this Page is displayed at. */
  String url;

  /** The title of this entity. This is the name displayed in the Admin user interface. */
  String title;

  /** RFC 3339 date-time when this Page was last updated. */
  String updated;

  /** Data about the blog containing this Page. */
  PageBlog blog;

  /** RFC 3339 date-time when this Page was published. */
  String published;

  /** The identifier for this resource. */
  String id;

  /** The API REST URL to fetch this resource from. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Page parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Page();
    result.content = identity(json["content"]);
    result.kind = identity(json["kind"]);
    result.author = PageAuthor.parse(json["author"]);
    result.url = identity(json["url"]);
    result.title = identity(json["title"]);
    result.updated = identity(json["updated"]);
    result.blog = PageBlog.parse(json["blog"]);
    result.published = identity(json["published"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Page value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["content"] = identity(value.content);
    result["kind"] = identity(value.kind);
    result["author"] = PageAuthor.serialize(value.author);
    result["url"] = identity(value.url);
    result["title"] = identity(value.title);
    result["updated"] = identity(value.updated);
    result["blog"] = PageBlog.serialize(value.blog);
    result["published"] = identity(value.published);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Page.PageAuthor
class PageAuthor extends IdentityHash {
  /** The URL of the Page creator's Profile page. */
  String url;

  /** The page author's avatar. */
  PageAuthorImage image;

  /** The display name. */
  String displayName;

  /** The identifier of the Page creator. */
  String id;

  /** Parses an instance from its JSON representation. */
  static PageAuthor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PageAuthor();
    result.url = identity(json["url"]);
    result.image = PageAuthorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PageAuthor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["image"] = PageAuthorImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Page.PageAuthor.PageAuthorImage
class PageAuthorImage extends IdentityHash {
  /** The page author's avatar URL. */
  String url;

  /** Parses an instance from its JSON representation. */
  static PageAuthorImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PageAuthorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PageAuthorImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Page.PageBlog
class PageBlog extends IdentityHash {
  /** The identifier of the blog containing this page. */
  String id;

  /** Parses an instance from its JSON representation. */
  static PageBlog parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PageBlog();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PageBlog value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PageList
class PageList extends IdentityHash {
  /** The list of Pages for a Blog. */
  List<Page> items;

  /** The kind of this entity. Always blogger#pageList */
  String kind;

  /** Parses an instance from its JSON representation. */
  static PageList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PageList();
    result.items = map(Page.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PageList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["items"] = map(Page.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Post
class Post extends IdentityHash {
  /** The content of the Post. May contain HTML markup. */
  String content;

  /** The kind of this entity. Always blogger#post */
  String kind;

  /** The author of this Post. */
  PostAuthor author;

  /** The container of comments on this Post. */
  PostReplies replies;

  /** The list of labels this Post was tagged with. */
  List<String> labels;

  /** RFC 3339 date-time when this Post was last updated. */
  String updated;

  /** Data about the blog containing this Post. */
  PostBlog blog;

  /** The URL where this Post is displayed. */
  String url;

  /** RFC 3339 date-time when this Post was published. */
  String published;

  /** The title of the Post. */
  String title;

  /** The identifier of this Post. */
  String id;

  /** The API REST URL to fetch this resource from. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static Post parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new Post();
    result.content = identity(json["content"]);
    result.kind = identity(json["kind"]);
    result.author = PostAuthor.parse(json["author"]);
    result.replies = PostReplies.parse(json["replies"]);
    result.labels = map(identity)(json["labels"]);
    result.updated = identity(json["updated"]);
    result.blog = PostBlog.parse(json["blog"]);
    result.url = identity(json["url"]);
    result.published = identity(json["published"]);
    result.title = identity(json["title"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(Post value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["content"] = identity(value.content);
    result["kind"] = identity(value.kind);
    result["author"] = PostAuthor.serialize(value.author);
    result["replies"] = PostReplies.serialize(value.replies);
    result["labels"] = map(identity)(value.labels);
    result["updated"] = identity(value.updated);
    result["blog"] = PostBlog.serialize(value.blog);
    result["url"] = identity(value.url);
    result["published"] = identity(value.published);
    result["title"] = identity(value.title);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Post.PostAuthor
class PostAuthor extends IdentityHash {
  /** The URL of the Post creator's Profile page. */
  String url;

  /** The Post author's avatar. */
  PostAuthorImage image;

  /** The display name. */
  String displayName;

  /** The identifier of the Post creator. */
  String id;

  /** Parses an instance from its JSON representation. */
  static PostAuthor parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PostAuthor();
    result.url = identity(json["url"]);
    result.image = PostAuthorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PostAuthor value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    result["image"] = PostAuthorImage.serialize(value.image);
    result["displayName"] = identity(value.displayName);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Post.PostAuthor.PostAuthorImage
class PostAuthorImage extends IdentityHash {
  /** The Post author's avatar URL. */
  String url;

  /** Parses an instance from its JSON representation. */
  static PostAuthorImage parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PostAuthorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PostAuthorImage value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Post.PostBlog
class PostBlog extends IdentityHash {
  /** The identifier of the Blog that contains this Post. */
  String id;

  /** Parses an instance from its JSON representation. */
  static PostBlog parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PostBlog();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PostBlog value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PostList
class PostList extends IdentityHash {
  /** Pagination token to fetch the next page, if one exists. */
  String nextPageToken;

  /** The list of Posts for this Blog. */
  List<Post> items;

  /** The kind of this entity. Always blogger#postList */
  String kind;

  /** Pagination token to fetch the previous page, if one exists. */
  String prevPageToken;

  /** Parses an instance from its JSON representation. */
  static PostList parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PostList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Post.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PostList value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Post.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["prevPageToken"] = identity(value.prevPageToken);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Post.PostReplies
class PostReplies extends IdentityHash {
  /** The count of comments on this post. */
  String totalItems;

  /** The URL of the comments on this post. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static PostReplies parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new PostReplies();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(PostReplies value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .User
class User extends IdentityHash {
  /** Profile summary information. */
  String about;

  /** The display name. */
  String displayName;

  /** The timestamp of when this profile was created, in seconds since epoch. */
  String created;

  /** This user's locale */
  UserLocale locale;

  /** The container of blogs for this user. */
  UserBlogs blogs;

  /** The kind of this entity. Always blogger#user */
  String kind;

  /** The user's profile page. */
  String url;

  /** The identifier for this User. */
  String id;

  /** The API REST URL to fetch this resource from. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static User parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new User();
    result.about = identity(json["about"]);
    result.displayName = identity(json["displayName"]);
    result.created = identity(json["created"]);
    result.locale = UserLocale.parse(json["locale"]);
    result.blogs = UserBlogs.parse(json["blogs"]);
    result.kind = identity(json["kind"]);
    result.url = identity(json["url"]);
    result.id = identity(json["id"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(User value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["about"] = identity(value.about);
    result["displayName"] = identity(value.displayName);
    result["created"] = identity(value.created);
    result["locale"] = UserLocale.serialize(value.locale);
    result["blogs"] = UserBlogs.serialize(value.blogs);
    result["kind"] = identity(value.kind);
    result["url"] = identity(value.url);
    result["id"] = identity(value.id);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema User.UserBlogs
class UserBlogs extends IdentityHash {
  /** The URL of the Blogs for this user. */
  String selfLink;

  /** Parses an instance from its JSON representation. */
  static UserBlogs parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new UserBlogs();
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(UserBlogs value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema User.UserLocale
class UserLocale extends IdentityHash {
  /** The user's country setting. */
  String country;

  /** The user's language variant setting. */
  String variant;

  /** The user's language setting. */
  String language;

  /** Parses an instance from its JSON representation. */
  static UserLocale parse(Map<String, Object> json) {
    if (json == null) return null;
    final result = new UserLocale();
    result.country = identity(json["country"]);
    result.variant = identity(json["variant"]);
    result.language = identity(json["language"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static Object serialize(UserLocale value) {
    if (value == null) return null;
    Map<String, Object> result = {};
    result["country"] = identity(value.country);
    result["variant"] = identity(value.variant);
    result["language"] = identity(value.language);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum BloggerApi.Alt
class BloggerApiAlt implements Hashable {
  /** Responses with Content-Type of application/json */
  static final BloggerApiAlt JSON = const BloggerApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final List<BloggerApiAlt> values = const <BloggerApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BloggerApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BloggerApiAlt valueOf(String item) => _valuesMap[item];

  final int _ordinal;
  final String _value;
  const BloggerApiAlt._internal(String this._value, int this._ordinal);

  /** Get the string representation of an enumeration value */
  String toString() => _value;
  int hashCode() => _ordinal ^ "Alt".hashCode();
}

