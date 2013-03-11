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
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end
