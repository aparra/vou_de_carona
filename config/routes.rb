VouDeCarona::Application.routes.draw do
  resources :caroneiros
  resources :newsletter
  resources :itinerario
  resource :session
    
  match '/welcome' => "welcome#index", :as => "welcome"
  match '/home' => "home#index", :as => "home"

  match '/login' => "sessions#new", :as => "login"
  match '/logout' => 'sessions#destroy', :as => "logout"

  match '/itinerario/rota/:id' => "itinerario#destroy", :as => "delete_rota"
  match '/minhas-rotas' => "itinerario#index", :as => "minhas_rotas"
  match '/painel-de-caronas' => "itinerario#painel", :as => "painel"

  match '/adiciona/amigo/:id' => 'amigo#add', :as => "add_amigo"
  match '/encontre-amigos' => "amigo#index", :as => "amigo"
  match '/meus-amigos' => "amigo#conexoes", :as => "conexoes"
end
