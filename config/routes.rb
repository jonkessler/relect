Relect::Application.routes.draw do
  devise_for :users

  resources :elections do
    resources :races

    member do
      get :vote
      put :cast_votes
      get :results
    end
  end
  
  resources :candidates
  resources :users

  root :to => 'elections#index'
end
