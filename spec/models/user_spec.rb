require 'spec_helper'

describe User do
  
  describe 'validations' do

    context "when username is not present" do 
      it "the record is not valid" do 
        user = User.new(username: '')
        expect(user).not_to be_valid
      end
    end

    context "when password is missing" do 
      it "the record is not valid" do
        user = User.new(username: "lorencio", password: '')
        expect(user).not_to be_valid
      end
    end

    context "when password is not at least 6 characters" do 
      it "the record is not valid" do 
        user = User.new(username: "lorencio", password: '12345')
        expect(user).not_to be_valid
      end
    end
  end
end
