require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      user = User.create(email: "test1@test.com", password: "Password1", password_confirmation: "Password1", first_name: "Test", last_name: "User")
      @post = Post.create(date: Date.today, rationale: "Anything", user_id: user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil

      expect(@post).not_to be_valid
    end
  end
end
