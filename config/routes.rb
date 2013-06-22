Reader::Application.routes.draw do
  root :to => 'subscriptions#dashboard'

  resources :subscriptions, :only => [:index, :create]
end
