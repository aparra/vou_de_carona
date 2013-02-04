VouDeCarona::Application.routes.draw do
  root :to => "welcome#index"
  match '/' => "welcome#index"
 
  resources :caroneiros
  resources :newsletter
  resources :itinerario
  resource :session

  match '/welcome' => "welcome#index", :as => "welcome"
  match '/home' => "home#index", :as => "home"

  match '/login' => "sessions#new", :as => "login"
  match '/logout' => 'sessions#destroy', :as => "logout"

  match '/itinerario/rota/:id' => "itinerario#destroy", :as => "delete_rota"
  match '/itinerario/rota/:id/ativo/:status' => "itinerario#edit", :as => "edit_rota"
  match '/itinerario/rota/:id/mapa' => "itinerario#mapa", :as => "mapa"
  match '/minhas-rotas' => "itinerario#index", :as => "minhas_rotas"
  match '/painel-de-caronas' => "itinerario#painel", :as => "painel"

  match '/adiciona/amigo/:id' => 'amigo#add', :as => "add_amigo"
  match '/encontre-amigos' => "amigo#index", :as => "amigo"
  match '/meus-amigos' => "amigo#conexoes", :as => "conexoes"
  
  match '/auth/twitter/callback' => "twitter#importar_amigos", :as => "importar_amigos_twitter"
end
