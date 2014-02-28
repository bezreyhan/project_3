class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username))
    if @user.save
      flash[:notice] = "user was successfully created"
      redirect_to users_path
    else
      render action: 'new'
      flash[:error] = "aww shucks, user was not created!"
    end    
  end

  def edit

  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # flash[:success] = "Your user was destroyed"
    # redirect_to users_url 
  end


  

end
