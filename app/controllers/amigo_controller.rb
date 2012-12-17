class AmigoController < ApplicationController
  def index
    @caroneiros = Caroneiro.all
  end
  
  def add
    @amigo = Caroneiro.find_by_id(params[:id])
    current_caroneiro.caroneiros << @amigo
  end
  
  def conexoes
    @caroneiros = current_caroneiro.caroneiros
  end
end
