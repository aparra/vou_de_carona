class CaroneirosController < ApplicationController
  def new
    @caroneiro = Caroneiro.new
  end
  
  def create
    @caroneiro = Caroneiro.new(params[:caroneiro])
    if @caroneiro.save
      session[:caroneiro_id] = @caroneiro.id
      redirect_to home_path, :notice => 'conta criada com sucesso'
    else 
      render :action => "new"
    end
  end
end
