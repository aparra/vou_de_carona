class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
    def current_caroneiro
      return unless session[:caroneiro_id]
      @current_caroneiro ||= Caroneiro.find_by_id(session[:caroneiro_id])
    end
    
    helper_method :current_caroneiro
    
    def authenticate
      logged_in? ? true : access_denied
    end
    
    def logged_in?
      current_caroneiro.is_a? Caroneiro
    end
    
    helper_method :logged_in?
    
    def access_denied
      redirect_to login_path, :notice => 'acesso negado' and return false
  end
end
