@user = User.create(
                    email: "test@test.com",
                    password: "Password1",
                    password_confirmation: "Password1",
                    first_name: "Test",
                    last_name: "User",
                    phone: "441543624319"
                   )

puts '1 User created'

AdminUser.create(
                 email: "admin@test.com",
                 password: "Password1",
                 password_confirmation: "Password1",
                 first_name: "Admin",
                 last_name: "User",
                 phone: "441543624319"
                )

puts '1 Admin User created'

100.times do |post|
  Post.create!(
               date: Date.today,
               rationale: "#{post} rationale content",
               user_id: @user.id,
               overtime_request: 2.5
              )
end

puts '100 Posts have been created'
