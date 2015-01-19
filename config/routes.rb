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

  get "/404" => "v1/errors#not_found"
  get "/500" => "v1/errors#exception"

  root 'application#index'
  get '*path' => 'application#index'

end
