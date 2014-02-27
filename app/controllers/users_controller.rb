class UsersController < ApplicationController
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

  def new
    @user = User.new
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def post
  end

  def index
    @users = User.all
  end

end
