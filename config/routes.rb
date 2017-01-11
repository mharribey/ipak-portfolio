Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :skip => [:registrations]
      as :user do
        get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
        put 'users' => 'devise/registrations#update', :as => 'user_registration'
      end

      devise_scope :user do
        get '/login'  => 'devise/sessions#new', :as => 'new_user_session_custom'
        post '/users/sign_in'  => '/login',  as: :user_session_custom
      end

  resources :categories, only: 'show'
  resources :posts
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
