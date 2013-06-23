class Post < ActiveRecord::Base
  belongs_to :subscription, :inverse_of => :posts

  serialize :entry

  delegate :title, :url, :author, :published, :to => :entry

  def content
    entry.content || entry.summary
  end
end
