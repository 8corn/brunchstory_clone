Rails.application.routes.draw do
  devise_for :accounts
	
	resources :categories do
		resources :posts, only: [:index]
	end
	resources :posts, only: [:show] do
		resources :comments, only: [:create, :destroy]
	end
		
	resources :follows
  	resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	root 'categories#index'
end
