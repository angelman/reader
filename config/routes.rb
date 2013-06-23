Reader::Application.routes.draw do
  root :to => 'subscriptions#dashboard'

  resources :subscriptions, :only => [:index, :create] do
    resources :posts, :only => [:index, :show]
  end

  resources :posts, :only => [:index, :show]
end
