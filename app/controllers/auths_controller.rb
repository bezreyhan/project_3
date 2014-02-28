class AuthsController < ApplicationController
  def new
    if current_user 
      redirect_to user_path(current_user.id)
      flash[:notice] = "Your alreday logged in silly, logout if you want to login as a different user."
    else
      @user= User.new
    end
  end

  def create
  end

  def destroy
  end
end
