Rails.application.routes.draw do

  devise_for :users
  resources :parts do
    collection do
      get 'search'
    end
  end

  resources :cars do
    collection do
      get 'search'
    end
  end

  resources :makes do
    collection do
      get 'search'
    end
  end

  resources :cars_parts
  resources :makes
  resources :cars
  resources :parts

  get 'say/hello'
  get 'say/goodbye'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
