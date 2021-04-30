Rails.application.routes.draw do
  # devise_for :users
  
  Rails.application.routes.draw do
    get "/l/:shortened_url", to: "shortened_links#index"

    resources :links, only: [:index, :create, :destroy]
  end
end
