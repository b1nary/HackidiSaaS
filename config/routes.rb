Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/privacy-policy' => "pages#privacy_policy", as: :privacy_policy
  get '/impressum' => "pages#impressum", as: :impressum
end
