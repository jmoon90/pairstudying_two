PairStudying::Application.routes.draw do
  root "static_pages#new"
  resources :static_pages, only: [:new, :create] do
    collection do
      get 'faq'
    end
  end
  resources :orders, only: [:index]
end
