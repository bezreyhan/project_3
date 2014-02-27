require 'spec_helper'

describe User do
  before :each do 
    @valid_attributes = {
      first_name: 'Lorencio',
      last_name: 'Italiano', 
      username: 'litaliano',
      password: '123456', 
      location: 'Venice, Italy',
      email: 'italiano@italy.com'
    }
  end  
  
  describe 'validations' do

    context "when username is not present" do 
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(username: ''))
        expect(user).not_to be_valid
      end
    end

    context "when password is missing" do 
      it "the record is not valid" do
        user = User.new(@valid_attributes.merge(password: ''))
        expect(user).not_to be_valid
      end
    end

    context "when password is not at least 6 characters" do 
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(password: '12345'))
        expect(user).not_to be_valid
      end
    end
  end
end
