class Subscription < ActiveRecord::Base
  has_many :posts, :dependent => :destroy, :inverse_of => :subscription

  serialize :feed

  delegate :title, :url, :etag, :to => :feed

  def self.create_from_feed!(feed)
    raise 'Not a valid feed' unless valid_feed?(feed)
    Subscription.transaction do
      s = Subscription.new
      s.feed_url = feed.feed_url
      s.feed = feed
      s.save!
      s.refresh!(true)
      s
    end
  end

  def self.valid_feed?(feed)
    feed.is_a?(Feedzirra::Parser::RSS) or feed.is_a?(Feedzirra::Parser::Atom)
  end

  def refresh!(all=false)
    self.transaction do
      self.feed = Feedzirra::Feed.update(self.feed)
      new_entries = all ? self.feed.entries : self.feed.new_entries
      new_entries.each do |entry|
        post = posts.build
        post.entry = entry.tap { |e| e.sanitize! }
        post.guid = entry.entry_id
        post.save!
      end
      save!
    end
  end
end
