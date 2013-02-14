class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  
  protected
  
  def authorize
    # allow regular users to "site" content but nothing else
    unless controller_name == "site"
      unless session[:admin_id]
        flash[:notice] = "Please login"
        redirect_to(:controller => "sessions", :action => "login")
      end
    end 
  end 
end
