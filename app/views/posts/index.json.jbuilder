json.array! @posts do |post|
  json.(post, :id, :title, :url, :author, :content, :published)
end
