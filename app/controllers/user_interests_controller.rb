class UserInterestsController < ApplicationController
  
  def index
    @userinterests = UserInterest.all
  end

  def new
    @userinterest = UserInterest.new
  end

  def create
    @userinterest = UserInterest.new(params.require(:user_interest).permit(:user_id, :interest_id, :skill_level))
    if @userinterest.save
      flash[:notice] = "Your interest was successfully created"
      redirect_to edit_user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
      flash[:error] = "You already have that language silly!"
    end    
  end

  def show
    @userinterests = UserInterest.find(params[:id])
  end

  def edit
    @userinterests = UserInterest.find(params[:id])
  end

  def update
    @userinterests = UserInterest.find(params[:id])
    if @userinterests.update(user_params)
      session[:userinterests_id] = @userinterests.id
      redirect_to @userinterests
      flash[:notice] = "Your interest was successfully updated."
    else
      render action: 'edit'
      flash[:error] = "Your interest was not able to be updated, please make sure to fill out all of the fields."
    end
  end

  def destroy
    @userinterests = UserInterest.find(params[:id])
    @userinterests.destroy
    redirect_to edit_user_path(current_user)
  end

end
