Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # get "/cards",to: "cards#index"
    # get "/",to: "cards#index"
     root 'cards#index'
    # get '/cards/new',to:'cards#new'
    resources :cards

    
end
