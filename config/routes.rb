Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      resources :locations do
        resources :recordings

      end
    end
  end

  resources :locations


end
