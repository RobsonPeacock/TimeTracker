@user = User.create(email: "test@test.com", password: "Password1", password_confirmation: "Password1", first_name: "Test", last_name: "User")

puts '1 User created'

AdminUser.create(email: "admin@test.com", password: "Password1", password_confirmation: "Password1", first_name: "Admin", last_name: "User")

puts '1 Admin User created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts '100 Posts have been created'
