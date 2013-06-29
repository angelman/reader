ko.bindingHandlers.slideVisible =
  init: (element, valueAccessor) ->
    value = !!ko.utils.unwrapObservable(valueAccessor())
    $(element).toggle(value)
  update: (element, valueAccessor) ->
    value = ko.utils.unwrapObservable(valueAccessor())
    if value
      $(element).slideDown(200, -> $(document).trigger('height-changed'))
    else
      $(element).slideUp(200, -> $(document).trigger('height-changed'))