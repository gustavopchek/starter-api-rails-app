Rails.application.routes.draw do
  # devise_for :users
  
  Rails.application.routes.draw do
    # resources :notepads do
    #   resources :notepad_pages
    # end

    resources :links, only: [:index, :create, :delete]
  end
end
