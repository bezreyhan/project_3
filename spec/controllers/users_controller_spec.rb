require 'spec_helper'

describe UsersController do

  describe "POST 'create'" do
    it "returns http success" do
      User.should_receive(:create).and_return("create a new user")
      post 'create', {user: {username: 'jake'} }
      response.should be_success
      expect(assigns(:user)).to eq "create a new user"
      expect(assigns(:user).username).to eq "jake"
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

  # describe "GET 'show'" do
  #   it "returns http success" do
  #     get 'show'
  #     response.should be_success
  #   end
  # end

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

  # describe "GET 'post'" do
  #   it "returns http success" do
  #     get 'post'
  #     response.should be_success
  #   end
  # end

end
