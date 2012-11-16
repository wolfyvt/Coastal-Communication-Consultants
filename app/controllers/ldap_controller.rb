class LdapController < ApplicationController

  before_filter :authorize, :except => :login

  def login
     if request.get?
      #probably replace with session.each do
      session[:user_uid] = nil
      session[:user_common_name] = nil
      session[:user_uidNumber] = nil
      session[:user_mail] = nil
      session[:user_groups] = nil
      session[:admin] = nil
    else
      username = params[:user].fetch(:name) 
      password = params[:user].fetch(:password)         
      
      begin 
        user_obj = User.authenticate(username, password)

        # set session parameters
        session[:user_uid] = user_obj.uid
        session[:user_common_name] = user_obj.cn
#        session[:user_uidNumber] = user_obj.uidNumber
#        session[:user_mail] = user_obj.mail
#        session[:user_groups] = user_obj.groups.collect {|group| group.cn}
        
        # set session variable as admin if user in admin group        
        admins.each do |admin|
          session[:admin] = true if session[:user_common_name] == admin.cn
        end
                
        flash[:notice] = "Hi, #{session[:user_common_name]}!"
        redirect_to(:controller => "site", :action => "index")       
    rescue Exception => e
        flash[:notice] = "Could not login.  Invalid username/password."
      end
    end
  end
  
  def logout
    session[:user_uid] = nil
    session[:user_common_name] = nil
    session[:user_uidNumber] = nil
    session[:user_mail] = nil
    session[:user_groups] = nil
    session[:admin] = nil
    
    flash[:notice] = "You are now logged out"
    redirect_to(:controller => "site", :action => "index")
  end
  
#  def change_password
#    
#  end

end


