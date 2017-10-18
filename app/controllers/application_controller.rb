class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	User.find(session[:user_id]) if session.key?("user_id")
  end
  def require_current_user
  	redirect_to '/' unless session.key?("user_id")
  end
  def authorize_user
    # redirect_to '/' unless params[:id] == session[:user_id]
    unless params[:id] == session[:user_id]
      flash[:messages] = ["I'm afraid I can't allow you to do that"]
      redirect_to :back
    end
  end
  helper_method :current_user, :require_current_user, :authorize_user
end
