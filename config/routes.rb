Rails.application.routes.draw do
  devise_for :accounts
	
	resources :categories do
		resources :lists
		resources :posts do
			resources :comments, only: [:create, :show, :destroy]
			member do
				post 'like'
			end
		end
	end
		
	resources :follows
  	resources :users
	
	root 'categories#index'
end
