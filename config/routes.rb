Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user_panel/home#index"

  namespace :user_panel do
    get 'home/settings'
    post 'home/settings', method: 'home#save_settings'

    resources :glacier_jobs

  end
end
