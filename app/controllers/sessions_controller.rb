class SessionsController < ApplicationController
  before_filter :authorize, :except => :login
  
  def login
    if request.get?
      session[:admin_id] = nil      
    else
      admin = Administrator.find_by_username(params[:username])
      if admin and admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_url
      else
        redirect_to login_url, notice: "Could not log in. Invalid username/password combination."
      end 
    end
  end

  def logout
    session[:admin_id] = nil
    redirect_to root_url, notice: "Logged out."
  end
end
