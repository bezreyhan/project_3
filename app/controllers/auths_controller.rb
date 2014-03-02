class AuthsController < ApplicationController
  
  def new
    if current_user 
      flash[:notice] = "Your alreday logged in silly, logout if you want to login as a different user."
      redirect_to user_path(current_user.id)
    else
      @user= User.new
    end
  end

  def create
    if !(User.where(email: params[:user][:email]).empty?)
      user = User.find_by(email: params[:user][:email])
      ## is it a problem that the password exists in the params, even temporarily
      if user.authenticated?(params[:user][:password])
        session[:user_id] = user.id
        ## change the oath of this redirect_to to go to the list of profiles
        redirect_to user_path(session[:user_id])
        flash[:notice] = "Your logged in!"
      else
        flash[:notice] = "Sorry the email and password did not match"
        redirect_to new_auth_path
      end
    else
      flash[:notice] = "Sorry, we can't find that email"
      redirect_to new_auth_path
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_auth_path
  end

  def show
  end  

end
