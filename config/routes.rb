Rails.application.routes.draw do

  devise_for :users

  resources :collections do
    resources :posts
  end

end
