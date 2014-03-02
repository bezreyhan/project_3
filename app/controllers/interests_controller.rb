class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  def index
    #search_thing = URI.decode(params[:search])
    
    if params[:topic] == nil
      @interests = Interst.all

    elsif params[:topic] == "angularJS"
      @interests = Interest.find_by(name: "AngularJS").interests
    
    elsif params[:topic] == "c"
      @interests = Interest.find_by(name: "C").interests

    elsif params[:topic] == "cPlusPlus"
      @interests = Interest.find_by(name: "C++").interests

    elsif params[:topic] == "cSharp"
      @interests = Interest.find_by(name: "C#").interests

    elsif params[:topic] == "java"
      @interests = Interest.find_by(name: "Java").interests

    elsif params[:topic] == "javascript"
      @interests = Interest.find_by(name: "JavaScript").interests

    elsif params[:topic] == "nodeJS"
      @interests = Interest.find_by(name: "NodeJS").interests

    elsif params[:topic] == "objectiveC"
      @interests = Interest.find_by(name: "Objective-C").set_interests

    elsif params[:topic] == "php"
      @interests = Interest.find_by(name: "PHP").interests

    elsif params[:topic] == "postgres"
      @interests = Interest.find_by(name: "PostgreSQL").set_interests

    elsif params[:topic] == "python"
      @interests = Interest.find_by(name: "Python").interests
    
    elsif params[:topic] == "rspec"
      @interests = Interest.find_by(name: "RSPEC").interests

    elsif params[:topic] == "ruby"
      @interests = Interest.find_by(name: "Ruby").set_interests

    elsif params[:topic] == "sql"
      @interests = Interest.find_by(name: "SQL").set_interests

    end
    
    @topic = params[:topic]

  end


  def new
    @interest = Interest.new
  end


  def show
    @interest = Interest.find(params[:id])
  end


  def create
    @interest = Interest.new(interest_params)

    if @interest.save
      redirect_to interest_path
      flash[:notice] = "Language created!"
    else
      render action: 'new'
    end
  end


  def edit
    @interest = Interest.find(params[:id])
  end


  def update
    @interest = Interest.find(params[:id])
    
    if @interest.update(interest_params)
      redirect_to interests_path
      flash[:notice] = "Your language was successfully updated."
    else
      render action: 'edit'
      flash[:notice] = "Your language was not able to be updated."
    end
  end


  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to action: 'index'
  end


 private
  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:name, :description)
  end
end


