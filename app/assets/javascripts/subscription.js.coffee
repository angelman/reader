class @Subscription
  constructor: (data) ->
    @id = data.id
    @title = ko.observable(data.title)
    @url = ko.observable(data.url)

  get_posts: (callback) =>
    $.getJSON(Routes.subscription_posts_path(@id))
    .done (posts) =>
      @posts = (new Post(post) for post in posts)
      callback(@posts)

  @get_posts: (subscription, callback) ->
    if subscription?
      subscription.get_posts(callback)
    else
      $.getJSON(Routes.posts_path())
      .done (posts) =>
        @posts = (new Post(post) for post in posts)
        callback(@posts)