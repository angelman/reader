json.array! @subscriptions do |subscription|
  json.partial! :partial => 'subscriptions/show', :formats => :json, :locals => { :subscription => subscription }
end
