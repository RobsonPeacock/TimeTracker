require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test1@test.com", password: "Password1", password_confirmation: "Password1", first_name: "Test", last_name: "User")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name or last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
