Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # get "/cards",to: "cards#index"
    # get "/",to: "cards#index"
     root 'cards#index'
    # get '/cards/new',to:'cards#new'
    resources :cards do
      member do
        post :like
      end
      resources :comments,shallow: true,except:[:index,:new,:show]
      #shallow: true 代替resources :comments,only:[:index,:new,:create]
    end
      #shallow: true 代替resources :comments,only:[:show,:edit,:update,:destroy]

    
end
