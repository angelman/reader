class @Dashboard
  constructor: (subscriptions) ->
    @subscriptions = ko.observableArray(new Subscription(s) for s in subscriptions)
    @new_subscription = ko.observable('')

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