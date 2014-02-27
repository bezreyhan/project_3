require 'spec_helper'

describe UsersController do

  describe "POST 'create'" do
    context "when user is valid" do 
      it "user is persisted, show flash notice, redirect to users_path" do
        User.any_instance.stub(:valid?).and_return(true)
        post 'create', { user: {username: 'lorencio'} }
        expect(assigns(:user)).to be_persisted
        expect(assigns(:user).username).to eq "lorencio"
        expect(flash[:notice]).to eq "user was successfully created"
        expect(response).to redirect_to users_path
      end
    end
    
    context "when user is NOT valid" do 
      it "render new action, show flash error" do 
        User.any_instance.stub(:valid?).and_return(false)
        post 'create', { user: { username: 'lorencio' } }
        expect(response).to render_template('new')
        expect(flash[:error]).to eq "aww shucks, user was not created!" 
      end
    end 
  end

  describe "GET 'new'" do
    it "returns http success" do
      User.should_receive(:new).and_return("a new user form")
      get 'new'
      response.should be_success
      expect(assigns(:user)).to eq "a new user form"
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      User.should_receive(:find).with('123').and_return("a user")
      get 'show', {id: 123}
      expect(assigns(:user)).to eq "a user"
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      User.should_receive(:all).and_return("an array of users")
      get 'index'
      response.should be_success
      expect(assigns(:users)).to eq "an array of users"
    end
  end


  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'edit'" do
  #   it "returns http success" do
  #     get 'edit'
  #     response.should be_success
  #   end
  # end

  # describe "PUT 'update'" do
  #   it "returns http success" do
  #     put 'update'
  #     response.should be_success
  #   end
  # end

end
