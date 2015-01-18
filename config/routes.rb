Lighter::Application.routes.draw do

  namespace :v1 do
    resources :users, defaults: {format: :json} do
      member do
        get :compatible_users
      end
      resources :likes, defaults: {format: :json}
      resources :matches, defaults: {format: :json}
    end

  end

end
