Rails.application.routes.draw do
  root 'publics/abouts#about'
	devise_for :admins, controllers: {
		sessions: 'admins/sessions',
		passwords: 'admins/passwords',
		registrations: 'admins/registrations'
  	}

	devise_for :users, controllers:{
	    sessions: 'publics/sessions',
	    passwords: 'publics/passwords',
	    registrations: 'publics/registrations'
	}
  namespace :admins do
    resources :results, only: [:index, :update]
  end

  namespace :admins do
    resources :post_comments, only: [:destroy]
  end

  namespace :admins do
    resources :posts, only: [:index, :show, :destroy]
  end

  namespace :admins do
    resources :users, only: [:index, :show]
  end

  scope module: :publics do
    resources :evaluations, only: [:show, :create, :update]
  end

  scope module: :publics do
    resources :schedules, only: [:index, :create]
  end

  scope module: :publics do
    resources :notifications, only: [:index]
  end

 scope module: :publics do
    resources :rewards, only: [:create]
  end

  scope module: :publics do
    resources :posts, only: [:index, :show, :create, :destroy]do
    	resource :post_comments, only: [:create, :destroy]
    	resource :favorites, only: [:create, :destroy]
    end
  end

  scope module: :publics do
    resources :abouts, only: [:index]
    get '/about' => 'abouts#about'
  end

  scope module: :publics do
    resources :users, only: [:show, :update, :destroy]do
      resources :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
    end
  end

  scope module: :publics do
    resources :relationships, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
