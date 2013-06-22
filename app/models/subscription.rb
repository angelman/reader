class Subscription < ActiveRecord::Base
  serialize :feed

  delegate :title, :url, :etag, :to => :feed

  def self.create_from_feed!(feed)
    raise 'Not a valid feed' unless valid_feed?(feed)
    s = Subscription.new
    s.feed = feed
    s.save!
    s
  end

  def self.valid_feed?(feed)
    feed.is_a?(Feedzirra::Parser::RSS) or feed.is_a?(Feedzirra::Parser::Atom)
  end
end
