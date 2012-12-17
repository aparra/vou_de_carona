#encoding: utf-8

class SessionsController < ApplicationController
  def create
    if caroneiro = Caroneiro.autentica(params[:email], params[:password])
      session[:caroneiro_id] = caroneiro.id
      redirect_to home_path
    else
      redirect_to welcome_path, :alert => 'login e/ou senha inválido'
    end
  end
  
  def destroy
    reset_session
    redirect_to welcome_path
  end
end
