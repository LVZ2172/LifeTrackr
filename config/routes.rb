Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  resources :users do
    resources :foods
  end

end
