Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user_panel/home#index"

  namespace :user_panel do
    get 'home/settings'
    post 'home/settings', to: 'home#save_settings'

    resources :glacier_jobs do
      collection do
        get 'get_all_vaults'
        post 'schedule_new_job'
      end
    end

    resources :glaciers do
      collection do
        get 'show_by_name'
      end
    end
  end
end
