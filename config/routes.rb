Rails.application.routes.draw do
  
  root to: 'application#home'

  resources :songs
  resources :musicians

  namespace :api do
    namespace :v1 do
      
      resources :songs

      resources :musicians do
        resources :songs
      end

    end
  end

end
