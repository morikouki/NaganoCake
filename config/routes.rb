Rails.application.routes.draw do
  	devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}
	devise_for :customers, controllers: {
	  sessions:      'customers/sessions',
	  passwords:     'customers/passwords',
	  registrations: 'customers/registrations'
	}

	get 'about' => 'home#about'

	resources :genres, only: [:index, :create, :edit, :update]
	resources :products
	resources :customers, only: [:index, :show, :edit, :update]

	namespace :user do
		resources :products, only: [:index, :show]
		get 'top' => 'products#top'

		resources :customers, only: [:edit, :update] do
			collection do
				get 'my_page' => 'customers#my_page'
				get 'confirm' => 'customers#confirm'
	        	patch '/withdraw' => 'customers#withdraw'
			end
		end

		resources :shippings, only: [:index, :create, :edit, :update, :destroy]
		resources :cart_items, only: [:index, :create, :update, :destroy] do
			collection do
				delete "destroy_all" => "cart_items#destroy_all"
			end
		end

		resources :orders, only: [:index, :new, :create, :show] do
			collection do
				get 'confirm' => 'orders#confirm'
				get 'complete' => 'orders#complete'
			end
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
