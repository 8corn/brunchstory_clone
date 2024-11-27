Rails.application.routes.draw do
  devise_for :accounts
	resources :posts do
		resources :comments
		resources :likes, only: [:create, :destroy]
	end
	resources :follows
  	resources :categories
  	resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	root 'posts#index'
end
