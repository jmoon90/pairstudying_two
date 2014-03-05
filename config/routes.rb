PairStudying::Application.routes.draw do
  devise_for :users
  root "static_pages#new"
  resources :static_pages, only: [:new, :create] do
    collection do
      get 'faq'
      get 'about'
    end
  end
  resources :orders, only: [:index]
  resources :dashboard
end
