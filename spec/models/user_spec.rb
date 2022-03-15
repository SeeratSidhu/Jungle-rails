require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "given password and password confirmation" do

      it "is not valid without password" do
        @user = User.create(first_name: "Bill", last_name: "Will", email: "bill@g.com", password_confirmation: "123")

        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "is not valid without password confirmation" do
        @user = User.create(first_name: "Kalle", last_name: "Becky", email: "Kally@g.com", password: "123")
        
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
        
      end
      it "is not valid if password and password confirmation are different" do
        @user = User.create(first_name: "Bill", last_name: "Will", email: "bill@g.com", password: "12345", password_confirmation: "123")
        
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end
      it "is not valid if password length is less than 6 characters" do 
        @user = User.create(first_name: "Emi", last_name: "Nem", email: "Em@g.com", password: "123456", password_confirmation: "123456")
        
        expect(@user.password.length).to be >= 6
      end
    end

    it "is not valid for duplicate email" do 
      @user = User.create(first_name: "Eminem", last_name: "Nem", email: "Em@g.com", password: "123456", password_confirmation: "123456")
      @user1 = User.create(first_name: "Eminem", last_name: "Nem", email: "Em@g.com", password: "123456", password_confirmation: "123456")

      
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end
    it "is not valid without email" do
      @user = User.create(first_name: "Eminem", last_name: "Nem", password: "123456", password_confirmation: "123456")

      
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "is not valid without first name" do
      @user = User.create(first_name: nil, last_name: "Nem", email: "e@n.com" ,password: "123456", password_confirmation: "123456")

      
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "is not valid without last name" do
      @user = User.create(first_name: "Arno", last_name: nil, email: "enol@n.com" ,password: "123456", password_confirmation: "123456")

      
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  end
end
