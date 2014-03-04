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
    
    @user = User.new(user_params)
   respond_to do |format|
      if @user.save
        UserMailer.welcome(@user.id).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # if params[:user][:image]
    #   @user.update_attributes(image: params[:user][:image])
    # end

    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to @user
      flash[:notice] = "Your profile was successfully updated."
    else
      render action: 'edit'
      flash[:notice] = "Your profile was not able to be updated, please make sure to fill out all of the fields."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Your user was destroyed"
    redirect_to users_url 
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :location, :email, :password)
    end
end
