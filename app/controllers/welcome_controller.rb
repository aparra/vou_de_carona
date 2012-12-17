class WelcomeController < ApplicationController
  def index
    @assinante = AssinanteNewsletter.new
  end
end
