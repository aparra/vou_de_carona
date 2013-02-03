class TwitterController < ApplicationController
  
  def importar_amigos
    auth = request.env["omniauth.auth"]

    Twitter.configure do |config|
      config.oauth_token = auth.credentials.token
      config.oauth_token_secret = auth.credentials.secret
    end

    amigos_twitter = []
    
    if current_caroneiro.email == 'ander.pp@gmail.com'
      amigos_twitter << '@ligia1986'
    end
    
    caroneiros = Caroneiro.where('twitter IN (?)', amigos_twitter);
    current_caroneiro.caroneiros.push(*@caroneiros)
    
    if amigos_twitter.size > 0
      redirect_to conexoes_path, :notice => "#{caroneiros.size} novo(s) amigo(s) adicionado(s)"
    else
      redirect_to conexoes_path, :alert => "Nenhum amgio novo adicionado"
    end
  end
end
