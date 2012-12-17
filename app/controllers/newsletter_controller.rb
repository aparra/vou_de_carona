class NewsletterController < ApplicationController
  def new
    @assinante_newsletter = AssinanteNewsletter.new
  end
  
  def create
    @assinante_newsletter = AssinanteNewsletter.new(params[:assinante_newsletter])
    if @assinante_newsletter.save
      render :action => "sucesso"
    else 
      render :action => "new"
    end
  end
end
