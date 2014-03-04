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
  
  # describe 'scopes' do
  #   describe '.italy_locations' do 
  #       it 'returns only users who live in Italy' do
  #           User.create(@valid_attributes.merge(location: 'Venice, Italy'))
  #           User.create(@valid_attributes.merge(location: 'Rome, Italy'))
  #           User.create(@valid_attributes.merge(location: 'Florence, Italy'))
  #           unwanted = User.create(@valid_attributes.merge(location: 'Paris, France'))
            
              # expect(User.italy_locations).not_to include unwanted
  #           expect(User.italy_locations).to eq 3  # => not sufficient, you need the next line
  #       end
  #   end 
  # end 

  describe 'validations' do

    context "when first name is not present" do
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(first_name: ''))
        expect(user).not_to be_valid
      end
    end

    context "when first name is too long" do
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(first_name: 'a' * 51))
        expect(user).not_to be_valid
      end
    end

    context "when last name is not present" do
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(last_name: ''))
        expect(user).not_to be_valid
      end
    end

    context "when last name is too long" do
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(last_name: 'a' * 51))
        expect(user).not_to be_valid
      end
    end

    context "when email is not present" do
      it "the record is not valid" do 
        user = User.new(@valid_attributes.merge(email: ''))
        expect(user).not_to be_valid
      end
    end

    context "when email format is invalid" do
        it "the record is not valid" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
                user = User.new(@valid_attributes.merge(email: invalid_address))
                expect(user).not_to be_valid
            end
        end
    end

    context "when email format is valid" do
        it "should be valid" do
            addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |valid_address|
                user = User.new(@valid_attributes.merge(email: valid_address))
                expect(user).to be_valid
            end
        end      
    end

    context "if user with email 'aa@bb.com' exists" do
      it "is invalid with a duplicate email address" do
        User.create(
          @valid_attributes.merge(email: 'aa@bb.com'))
        user = User.new(@valid_attributes.merge(email: 'aa@bb.com'))
        expect(user).to have(1).errors_on(:email)
      end
    end

    # context "email address with mixed case" do
    #     before do
    #         user = User.new(@valid_attributes.merge(email: 'example@gmail.com').downcase)
    #         user.save
    #     end

    #     it "should be saved as all lower-case" do 
    #         expect(assigns(user.reload.email)).to eq mixed_case_email.downcase
    #     end
    # end
    # 
    #     let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    #     it "should be saved as all lower-case" do
    #         user = User.new(@valid_attributes.merge(email: mixed_case_email)) 
    #         user.save
    #         expect(assigns(user.reload.email)).to eq mixed_case_email.downcase
    #     end
    #   it "should accept email_downcase before save" do
            # user = double
            # user.should_receive(email).and_return(email.downcase) # => use return in case you want to

    context "when password is not present" do 
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

# context "when username is not present" do 
    #   it "the record is not valid" do 
    #     user = User.new(@valid_attributes.merge(username: ''))
    #     expect(user).not_to be_valid
    #   end
# end
