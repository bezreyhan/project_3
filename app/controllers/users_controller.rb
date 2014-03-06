class UsersController < ApplicationController
  
  def index
    @users = User.all
    # if session[:background] == nil
    #     session[:background] = 0
    # elsif session[:background] >= 4
    #     session[:background] = 0
    # else
    #     session[:background] += 1
    # end
    # @background_images = ['team.jpg', 'hands_together_hearts.jpg', 'heads.jpg', 'together_hands.jpg', 'working_together.jpg']
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    # 3.times do
    #   interest = @user.interests.build
    #   4.times { interest.user_interests.build }
    # end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome(@user.id).deliver
      session[:user_id] = @user.id  
      flash[:notice] = "user was successfully created"
      redirect_to edit_user_path(current_user)
    else
      render action: 'new'
      flash[:error] = "aww shucks, user was not created!"
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
      params.require(:user).permit(:first_name, :last_name, :username, :location, :email, :password, 
         :user_interests_attributes[:skill_level, :id]
      )
    end
end
