require 'spec_helper'

describe UsersController do

  describe "POST 'create'" do
    context "when user is valid" do 
      it "user is persisted, show flash notice, redirect to edit_user_path" do
        user = User.any_instance.stub(:valid?).and_return(true)
        post 'create', { user: {first_name: 'lorencio', last_name: 'jo', email: 'lor@example.com', password: 'example', id: 123} }
        expect(assigns(:user)).to be_persisted
        expect(assigns(:user).first_name).to eq "lorencio"
      end


      it 'should show a flash notice and redirect to edit_user_path' do
        @user = double 
        @user.should_receive(:create) 
        User.should_receive(:find).with('123').and_return(@user)
        post 'create', {id: 123}
        expect(flash[:notice]).to eq "user was successfully created"
        response.should be_redirect
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
    it "a new user form" do
      User.should_receive(:new).and_return("a new user form")
      get 'new'
      response.should be_success
      expect(assigns(:user)).to eq "a new user form"
    end
  end

  describe "GET 'show'" do
    it "returns the user profile page" do
      User.should_receive(:find).with('123').and_return("a user")
      get 'show', {id: 123}
      expect(assigns(:user)).to eq "a user"
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns an array of users" do
      User.should_receive(:all).and_return("an array of users")
      get 'index'
      response.should be_success
      expect(assigns(:users)).to eq "an array of users"
    end
  end


  describe "DELETE 'destroy'" do

    it "deletes the user" do
      user = User.create(first_name: 'lorencio', last_name: 'jo', email: 'lor@example.com', password: '123456')
      expect { delete 'destroy', id: user.id }.to change(User,:count).by(-1)
    end

    it "deletes the user" do 
      user = double
      user.should_receive(:destroy) 
      User.should_receive(:find).with('123').and_return(user)
      delete 'destroy', {id: 123}
      response.should be_redirect
    end
  end

end
