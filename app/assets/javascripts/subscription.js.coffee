class @Subscription
  constructor: (data) ->
    @id = data.id
    @title = ko.observable(data.title)
    @url = ko.observable(data.url)
    @posts = []
    @is_populated = false

  @is_poluated: false
  @posts: []

  get_posts: (callback) =>
    if @is_populated
      callback()
    else
      $.getJSON(Routes.subscription_posts_path(@id))
      .done (posts) =>
        @posts = (new Post(post) for post in posts)
        @is_populated = true
        callback()

  @get_posts: (subscription, callback) ->
    if subscription?
      subscription.get_posts(callback)
    else
      if @is_populated
        callback()
      else
        $.getJSON(Routes.posts_path())
        .done (posts) =>
          @posts = (new Post(post) for post in posts)
          @is_populated = true
          callback()