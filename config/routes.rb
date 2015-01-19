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
  post 'v1/sign_in', to: 'v1/users#sign_in', as: :sign_in

  root 'application#index'
  get '*path' => 'application#index'

end
