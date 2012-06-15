#library('blogger-v2');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart');

// API BloggerApi
/**
 * API for access to the data within Blogger.
 */
class BloggerApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
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
  BloggerApiAlt alt;


  BloggerApi([this.baseUrl = "https://www.googleapis.com/blogger/v2/", this.applicationName, this.authenticator]) { 
    _blogs = new BlogsResource._internal(this);
    _posts = new PostsResource._internal(this);
    _pages = new PagesResource._internal(this);
    _comments = new CommentsResource._internal(this);
    _users = new UsersResource._internal(this);
  }
  core.String get userAgent() {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}blogger/v2/20120508 google-api-dart-client/${clientVersion}";
  }
}

// Resource .BlogsResource
class BlogsResource extends core.Object {
  final BloggerApi _$service;
  
  BlogsResource._internal(BloggerApi $service) : _$service = $service;

  // Method BlogsResource.Get
  /**
   * Gets one blog by id.
   * [blogId] The ID of the blog to get.
   */
  core.Future<Blog> get(core.String blogId) {
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
    final $path = "blogs/{blogId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Blog.parse(JSON.parse($text)));
  }
}

// Resource .PostsResource
class PostsResource extends core.Object {
  final BloggerApi _$service;
  
  PostsResource._internal(BloggerApi $service) : _$service = $service;

  // Method PostsResource.List
  /**
   * Retrieves a list of posts, possibly filtered.
   * [blogId] ID of the blog to fetch posts from.
   */
  core.Future<PostList> list(core.String blogId, [core.String pageToken = UNSPECIFIED, core.bool fetchBodies = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String startDate = UNSPECIFIED]) {
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
    final $path = "blogs/{blogId}/posts";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PostList.parse(JSON.parse($text)));
  }

  // Method PostsResource.Get
  /**
   * Get a post by id.
   * [blogId] ID of the blog to fetch the post from.
   * [postId] The ID of the post
   */
  core.Future<Post> get(core.String blogId, core.String postId) {
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
    final $path = "blogs/{blogId}/posts/{postId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Post.parse(JSON.parse($text)));
  }
}

// Resource .PagesResource
class PagesResource extends core.Object {
  final BloggerApi _$service;
  
  PagesResource._internal(BloggerApi $service) : _$service = $service;

  // Method PagesResource.List
  /**
   * Retrieves pages for a blog, possibly filtered.
   * [blogId] ID of the blog to fetch pages from.
   */
  core.Future<PageList> list(core.String blogId, [core.bool fetchBodies = UNSPECIFIED]) {
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
    final $path = "blogs/{blogId}/pages";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => PageList.parse(JSON.parse($text)));
  }

  // Method PagesResource.Get
  /**
   * Gets one blog page by id.
   * [blogId] ID of the blog containing the page.
   * [pageId] The ID of the page to get.
   */
  core.Future<Page> get(core.String blogId, core.String pageId) {
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
    final $path = "blogs/{blogId}/pages/{pageId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Page.parse(JSON.parse($text)));
  }
}

// Resource .CommentsResource
class CommentsResource extends core.Object {
  final BloggerApi _$service;
  
  CommentsResource._internal(BloggerApi $service) : _$service = $service;

  // Method CommentsResource.List
  /**
   * Retrieves the comments for a blog, possibly filtered.
   * [blogId] ID of the blog to fetch comments from.
   * [postId] ID of the post to fetch posts from.
   */
  core.Future<CommentList> list(core.String blogId, core.String postId, [core.String startDate = UNSPECIFIED, core.int maxResults = UNSPECIFIED, core.String pageToken = UNSPECIFIED, core.bool fetchBodies = UNSPECIFIED]) {
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
    final $path = "blogs/{blogId}/posts/{postId}/comments";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => CommentList.parse(JSON.parse($text)));
  }

  // Method CommentsResource.Get
  /**
   * Gets one comment by id.
   * [blogId] ID of the blog to containing the comment.
   * [postId] ID of the post to fetch posts from.
   * [commentId] The ID of the comment to get.
   */
  core.Future<Comment> get(core.String blogId, core.String postId, core.String commentId) {
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
    final $path = "blogs/{blogId}/posts/{postId}/comments/{commentId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Comment.parse(JSON.parse($text)));
  }
}

// Resource .UsersResource
class UsersResource extends core.Object {
  final BloggerApi _$service;
  final UsersBlogsResourceResource blogs;
  
  UsersResource._internal(BloggerApi $service) : _$service = $service,
    blogs = new UsersBlogsResourceResource._internal($service);

  // Method UsersResource.Get
  /**
   * Gets one user by id.
   * [userId] The ID of the user to get.
   */
  core.Future<User> get(core.String userId) {
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
    final $path = "users/{userId}";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => User.parse(JSON.parse($text)));
  }
}


// Resource UsersResource.UsersBlogsResourceResource
class UsersBlogsResourceResource extends core.Object {
  final BloggerApi _$service;
  
  UsersBlogsResourceResource._internal(BloggerApi $service) : _$service = $service;

  // Method UsersResource.UsersBlogsResourceResource.List
  /**
   * Retrieves a list of blogs, possibly filtered.
   * [userId] ID of the user whose blogs are to be fetched. Either the word 'self' (sans quote marks) or the
   *        user's profile identifier.
   */
  core.Future<BlogList> list(core.String userId) {
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
    final $path = "users/{userId}/blogs";
    final $url = new UrlPattern("${_$service.baseUrl}$path").generate($pathParams, $queryParams);
    final $http = new HttpRequest($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => BlogList.parse(JSON.parse($text)));
  }
}

// Schema .Blog
class Blog extends IdentityHash {
  /** The kind of this entry. Always blogger#blog */
  core.String kind;

  /** The description of this blog. This is displayed underneath the title. */
  core.String description;

  /** The locale this Blog is set to. */
  BlogLocale locale;

  /** The container of posts in this blog. */
  BlogPosts posts;

  /** RFC 3339 date-time when this blog was last updated. */
  core.String updated;

  /** The identifier for this resource. */
  core.String id;

  /** The URL where this blog is published. */
  core.String url;

  /** RFC 3339 date-time when this blog was published. */
  core.String published;

  /** The container of pages in this blog. */
  BlogPages pages;

  /** The API REST URL to fetch this resource from. */
  core.String selfLink;

  /** The name of this blog. This is displayed as the title. */
  core.String name;

  /** Parses an instance from its JSON representation. */
  static Blog parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Blog value) {
    if (value == null) return null;
    final result = {};
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
  core.List<Blog> items;

  /** The kind of this entity. Always blogger#blogList */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static BlogList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BlogList();
    result.items = map(Blog.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BlogList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Blog.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Blog.BlogLocale
class BlogLocale extends IdentityHash {
  /** The country this blog's locale is set to. */
  core.String country;

  /** The language variant this blog is authored in. */
  core.String variant;

  /** The language this blog is authored in. */
  core.String language;

  /** Parses an instance from its JSON representation. */
  static BlogLocale parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BlogLocale();
    result.country = identity(json["country"]);
    result.variant = identity(json["variant"]);
    result.language = identity(json["language"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BlogLocale value) {
    if (value == null) return null;
    final result = {};
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
  core.int totalItems;

  /** The URL of the container for pages in this blog. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static BlogPages parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BlogPages();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BlogPages value) {
    if (value == null) return null;
    final result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Blog.BlogPosts
class BlogPosts extends IdentityHash {
  /** The count of posts in this blog. */
  core.int totalItems;

  /** The URL of the container for posts in this blog. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static BlogPosts parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new BlogPosts();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(BlogPosts value) {
    if (value == null) return null;
    final result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Comment
class Comment extends IdentityHash {
  /** The actual content of the comment. May include HTML markup. */
  core.String content;

  /** The kind of this entry. Always blogger#comment */
  core.String kind;

  /** Data about the comment this is in reply to. */
  CommentInReplyTo inReplyTo;

  /** The author of this Comment. */
  CommentAuthor author;

  /** RFC 3339 date-time when this comment was last updated. */
  core.String updated;

  /** Data about the blog containing this comment. */
  CommentBlog blog;

  /** RFC 3339 date-time when this comment was published. */
  core.String published;

  /** Data about the post containing this comment. */
  CommentPost post;

  /** The identifier for this resource. */
  core.String id;

  /** The API REST URL to fetch this resource from. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Comment parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Comment value) {
    if (value == null) return null;
    final result = {};
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
  core.String url;

  /** The comment creator's avatar. */
  CommentAuthorImage image;

  /** The display name. */
  core.String displayName;

  /** The identifier of the Comment creator. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static CommentAuthor parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentAuthor();
    result.url = identity(json["url"]);
    result.image = CommentAuthorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentAuthor value) {
    if (value == null) return null;
    final result = {};
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
  core.String url;

  /** Parses an instance from its JSON representation. */
  static CommentAuthorImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentAuthorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentAuthorImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentBlog
class CommentBlog extends IdentityHash {
  /** The identifier of the blog containing this comment. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static CommentBlog parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentBlog();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentBlog value) {
    if (value == null) return null;
    final result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Comment.CommentInReplyTo
class CommentInReplyTo extends IdentityHash {
  /** The identified of the parent of this comment. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static CommentInReplyTo parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentInReplyTo();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentInReplyTo value) {
    if (value == null) return null;
    final result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CommentList
class CommentList extends IdentityHash {
  /** Pagination token to fetch the next page, if one exists. */
  core.String nextPageToken;

  /** The List of Comments for a Post. */
  core.List<Comment> items;

  /** The kind of this entry. Always blogger#commentList */
  core.String kind;

  /** Pagination token to fetch the previous page, if one exists. */
  core.String prevPageToken;

  /** Parses an instance from its JSON representation. */
  static CommentList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Comment.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentList value) {
    if (value == null) return null;
    final result = {};
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
  core.String id;

  /** Parses an instance from its JSON representation. */
  static CommentPost parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CommentPost();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CommentPost value) {
    if (value == null) return null;
    final result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Page
class Page extends IdentityHash {
  /** The body content of this Page, in HTML. */
  core.String content;

  /** The kind of this entity. Always blogger#page */
  core.String kind;

  /** The author of this Page. */
  PageAuthor author;

  /** The URL that this Page is displayed at. */
  core.String url;

  /** The title of this entity. This is the name displayed in the Admin user interface. */
  core.String title;

  /** RFC 3339 date-time when this Page was last updated. */
  core.String updated;

  /** Data about the blog containing this Page. */
  PageBlog blog;

  /** RFC 3339 date-time when this Page was published. */
  core.String published;

  /** The identifier for this resource. */
  core.String id;

  /** The API REST URL to fetch this resource from. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Page parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Page value) {
    if (value == null) return null;
    final result = {};
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
  core.String url;

  /** The page author's avatar. */
  PageAuthorImage image;

  /** The display name. */
  core.String displayName;

  /** The identifier of the Page creator. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static PageAuthor parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PageAuthor();
    result.url = identity(json["url"]);
    result.image = PageAuthorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PageAuthor value) {
    if (value == null) return null;
    final result = {};
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
  core.String url;

  /** Parses an instance from its JSON representation. */
  static PageAuthorImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PageAuthorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PageAuthorImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Page.PageBlog
class PageBlog extends IdentityHash {
  /** The identifier of the blog containing this page. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static PageBlog parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PageBlog();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PageBlog value) {
    if (value == null) return null;
    final result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PageList
class PageList extends IdentityHash {
  /** The list of Pages for a Blog. */
  core.List<Page> items;

  /** The kind of this entity. Always blogger#pageList */
  core.String kind;

  /** Parses an instance from its JSON representation. */
  static PageList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PageList();
    result.items = map(Page.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PageList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(Page.serialize)(value.items);
    result["kind"] = identity(value.kind);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Post
class Post extends IdentityHash {
  /** The content of the Post. May contain HTML markup. */
  core.String content;

  /** The kind of this entity. Always blogger#post */
  core.String kind;

  /** The author of this Post. */
  PostAuthor author;

  /** The container of comments on this Post. */
  PostReplies replies;

  /** The list of labels this Post was tagged with. */
  core.List<core.String> labels;

  /** RFC 3339 date-time when this Post was last updated. */
  core.String updated;

  /** Data about the blog containing this Post. */
  PostBlog blog;

  /** The URL where this Post is displayed. */
  core.String url;

  /** RFC 3339 date-time when this Post was published. */
  core.String published;

  /** The title of the Post. */
  core.String title;

  /** The identifier of this Post. */
  core.String id;

  /** The API REST URL to fetch this resource from. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static Post parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(Post value) {
    if (value == null) return null;
    final result = {};
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
  core.String url;

  /** The Post author's avatar. */
  PostAuthorImage image;

  /** The display name. */
  core.String displayName;

  /** The identifier of the Post creator. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static PostAuthor parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PostAuthor();
    result.url = identity(json["url"]);
    result.image = PostAuthorImage.parse(json["image"]);
    result.displayName = identity(json["displayName"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PostAuthor value) {
    if (value == null) return null;
    final result = {};
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
  core.String url;

  /** Parses an instance from its JSON representation. */
  static PostAuthorImage parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PostAuthorImage();
    result.url = identity(json["url"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PostAuthorImage value) {
    if (value == null) return null;
    final result = {};
    result["url"] = identity(value.url);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Post.PostBlog
class PostBlog extends IdentityHash {
  /** The identifier of the Blog that contains this Post. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static PostBlog parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PostBlog();
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PostBlog value) {
    if (value == null) return null;
    final result = {};
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .PostList
class PostList extends IdentityHash {
  /** Pagination token to fetch the next page, if one exists. */
  core.String nextPageToken;

  /** The list of Posts for this Blog. */
  core.List<Post> items;

  /** The kind of this entity. Always blogger#postList */
  core.String kind;

  /** Pagination token to fetch the previous page, if one exists. */
  core.String prevPageToken;

  /** Parses an instance from its JSON representation. */
  static PostList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PostList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Post.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.prevPageToken = identity(json["prevPageToken"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PostList value) {
    if (value == null) return null;
    final result = {};
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
  core.String totalItems;

  /** The URL of the comments on this post. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static PostReplies parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new PostReplies();
    result.totalItems = identity(json["totalItems"]);
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(PostReplies value) {
    if (value == null) return null;
    final result = {};
    result["totalItems"] = identity(value.totalItems);
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .User
class User extends IdentityHash {
  /** Profile summary information. */
  core.String about;

  /** The display name. */
  core.String displayName;

  /** The timestamp of when this profile was created, in seconds since epoch. */
  core.String created;

  /** This user's locale */
  UserLocale locale;

  /** The container of blogs for this user. */
  UserBlogs blogs;

  /** The kind of this entity. Always blogger#user */
  core.String kind;

  /** The user's profile page. */
  core.String url;

  /** The identifier for this User. */
  core.String id;

  /** The API REST URL to fetch this resource from. */
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static User parse(core.Map<core.String, core.Object> json) {
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
  static core.Object serialize(User value) {
    if (value == null) return null;
    final result = {};
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
  core.String selfLink;

  /** Parses an instance from its JSON representation. */
  static UserBlogs parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserBlogs();
    result.selfLink = identity(json["selfLink"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserBlogs value) {
    if (value == null) return null;
    final result = {};
    result["selfLink"] = identity(value.selfLink);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema User.UserLocale
class UserLocale extends IdentityHash {
  /** The user's country setting. */
  core.String country;

  /** The user's language variant setting. */
  core.String variant;

  /** The user's language setting. */
  core.String language;

  /** Parses an instance from its JSON representation. */
  static UserLocale parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserLocale();
    result.country = identity(json["country"]);
    result.variant = identity(json["variant"]);
    result.language = identity(json["language"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserLocale value) {
    if (value == null) return null;
    final result = {};
    result["country"] = identity(value.country);
    result["variant"] = identity(value.variant);
    result["language"] = identity(value.language);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum BloggerApi.Alt
class BloggerApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  static final BloggerApiAlt JSON = const BloggerApiAlt._internal("json", 0);

  /** All values of this enumeration */
  static final core.List<BloggerApiAlt> values = const <BloggerApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  static final _valuesMap = const <BloggerApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static BloggerApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const BloggerApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

