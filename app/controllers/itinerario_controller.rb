class ItinerarioController < ApplicationController
  def new
    @rota = Rota.new(:origem => Endereco.new, :destino => Endereco.new)
  end
  
  def index
    @rotas = current_caroneiro.rotas
  end

  def edit
    @rota = current_caroneiro.rotas.find_by_id(params[:id])
    @rota.update_attributes(:ativa => params[:status])
  end
  
  def create
    @rota = Rota.new(params[:rota])
    
    @rota.caroneiro = current_caroneiro
    @rota.publicada_em = Time.now
    @rota.ativa = true
    
    if @rota.save
      redirect_to :action => "index"
    else 
      render :action => "new"
    end
  end

  def destroy
    current_caroneiro.rotas.find_by_id(params[:id]).destroy
    redirect_to :action => "index"
  end

  def painel
    @rotas = Rota.where("ativa = ?", true).order("publicada_em DESC").all
  end
end
