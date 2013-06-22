class SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.all

  end

  def dashboard
    index
    respond_to do |format|
      format.html
    end
  end

  def create
    begin
      feed = Feedzirra::Feed.fetch_and_parse(params[:url])
      if Subscription.valid_feed?(feed)
        if Subscription.where(:feed_url => feed.feed_url).exists?
          render :json => { :message => 'Feed already added' }, :status => :not_found and return
        else
          s = Subscription.create_from_feed!(feed)
          render :json => render_to_string(:partial => 'subscriptions/show', :locals => { :subscription => s }) and return
        end
      else
        render :json => { :message => 'Feed URL returned a 404' }, :status => :not_found and return
      end
    rescue
      render :json => { :message => 'Unexpected error'}, :status => :not_found and return
    end
  end
end
