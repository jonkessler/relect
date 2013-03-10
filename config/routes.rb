Relect::Application.routes.draw do
  resources :elections do
    resources :races
    resources :ballots, :except => [:index, :destroy]
  end
  
  resources :candidates
  resources :users

  root :to => 'elections#index'
end
