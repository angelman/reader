class PostsController < ApplicationController

  respond_to :json

  def index
    if params[:subscription_id]
      @posts = Post.where(:subscription_id => params[:subscription_id])
    else
      @posts = Post.all
    end
  end
end