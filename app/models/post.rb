class Post < ActiveRecord::Base
  belongs_to :subscription, :inverse_of => :posts

  serialize :entry

  delegate :title, :url, :author, :summary, :content, :published, :to => :entry
end
