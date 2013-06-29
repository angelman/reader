class @Dashboard
  constructor: (subscriptions) ->
    @subscriptions = ko.observableArray(new Subscription(s) for s in subscriptions)
    @new_subscription = ko.observable('')
    @current_posts = ko.observableArray([])
    @selected_subscription = ko.observable(null)

    window.setTimeout =>
      @get_posts()
    , 0

  add_subscription: ->
    return unless @new_subscription().length
    $.ajax
      type: 'POST',
      url: Routes.subscriptions_path(),
      data:
        url: @new_subscription()
      dataType: 'json'
    .done (s) =>
      @subscriptions.push(new Subscription(s))
      @new_subscription('')
    .fail (data) ->
      alert "Error: #{data.responseJSON.message}"

  get_posts: (subscription) =>
    callback = (posts) =>
      @current_posts(posts)
    Subscription.get_posts(subscription, callback)

  set_current: (subscription) =>
    if subscription == this
      @selected_subscription(null)
      @get_posts()
      return
    @selected_subscription(subscription)
    @get_posts(subscription)