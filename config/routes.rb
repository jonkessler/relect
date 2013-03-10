Relect::Application.routes.draw do
  devise_for :users

  resources :elections do
    resources :races do
      member do
        get :vote
        post :cast_vote
      end
    end
  end
  
  resources :candidates
  resources :users

  root :to => 'elections#index'
end
