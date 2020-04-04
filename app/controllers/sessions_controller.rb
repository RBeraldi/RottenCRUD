class SessionsController < ApplicationController

   skip_before_action :set_current_user

 def login

 end

 def create
  name = params[:user][:name]

  @users = Moviegoer.where(:name => name)

  if @users.length>0
     session[:user_id]='1' #This is the guest user...just for testing..
     redirect_to movies_path 
  else
     redirect_to login_path 
  end
 end
end
