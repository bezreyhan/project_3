class UserInterestsController < ApplicationController
  
  def index
    @userinterests = UserInterests.all
  end

  def new
    @userinterests = UserInterests.new
  end

  def create
    @userinterests = UserInterests.new(params.require(:userintersts).permit(:username))
    if @userinterests.save
      flash[:notice] = "Your interest was successfully created"
      redirect_to userinterests_path
    else
      render action: 'new'
      flash[:error] = "Aww shucks, your interest was not created!"
    end    
  end

  def show
    @userinterests = UserInterests.find(params[:id])
  end

  def edit
    @userinterests = UserInterests.find(params[:id])
  end

  def update
    @userinterests = UserInterests.find(params[:id])
    if @userinterests.update(user_params)
      session[:userinterests_id] = @userinterests.id
      redirect_to @userinterests
      flash[:notice] = "Your interest was successfully updated."
    else
      render action: 'edit'
      flash[:notice] = "Your interest was not able to be updated, please make sure to fill out all of the fields."
    end
  end

  def destroy
    @userinterests = UserInterests.find(params[:id])
    @userinterests.destroy
    flash[:success] = "Your interest was destroyed"
    redirect_to userinterests_url
  end
end
