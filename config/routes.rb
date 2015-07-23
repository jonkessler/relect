Relect::Application.routes.draw do
  devise_for :users, :controllers => { :confirmations => 'users/confirmations', :passwords => 'users/passwords',
                                       :registrations => 'users/registrations', :sessions => 'users/sessions'
                                     }

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

  root to: 'elections#index'
end
