Rails.application.routes.draw do
  devise_for :accounts
	
	resources :categories do
		resources :posts
		resources :lists
	end
	resources :posts, only: [:show] do
		resources :comments, only: [:create, :destroy]
	end
		
	resources :follows
  	resources :users
	
	root 'categories#index'
end
