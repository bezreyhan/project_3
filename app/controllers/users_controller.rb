class UsersController < ApplicationController

  def index
    respond_to do |format|
        format.html { @users = User.all }
        format.json { render json: User.all   }
    end

    # @users = User.all
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      latLng = Geocoder.coordinates(@user)
      marker.lat user.latitude
      marker.lng user.longitude 
      # marker.infowindow user.description
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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

  def linkedin_create
    data = request.env['omniauth.auth']
    if User.from_omniauth(data) == false
        user = User.find_by(email: data["info"]["email"])
        session[:user_id] = user.id
        redirect_to edit_user_path(current_user) 
    else
        user = User.find_by(email: data["info"]["email"])
        session[:user_id] = user.id
        redirect_to users_path
    end
  end


  def edit
    @user = User.find(params[:id])
    @user_interests = current_user.user_interests
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:avatar]
      @user.update_attributes(avatar: params[:user][:avatar])
    end

    if @user.update(params.require(:user).permit(:first_name, :last_name, :username, :location, :email
      ))
      session[:user_id] = @user.id
      redirect_to @user
      flash[:notice] = "Your profile was successfully updated."
    else
      render action: 'edit'
      flash[:error] = "Your profile was not able to be updated, please make sure to fill out all of the fields."
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
      params.require(:user).permit(:first_name, :last_name, :username, :location, :email, :password, :avatar
      )
    end
end
