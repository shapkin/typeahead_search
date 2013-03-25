Bonsai::Application.routes.draw do
  resources :authors do
    collection do
      get 'search'
    end
  end
  resources :books

  root :to => 'authors#index'
end