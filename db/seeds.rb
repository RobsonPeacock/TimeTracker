@employee = Employee.create!(
                    email: "test@test.com",
                    password: "Password1",
                    password_confirmation: "Password1",
                    first_name: "Test",
                    last_name: "User",
                    phone: "1543624319",
                    ssn: 1234,
                    company: "Example Company"
                  )

puts '1 User created'

AdminUser.create!(
                 email: "admin@test.com",
                 password: "Password1",
                 password_confirmation: "Password1",
                 first_name: "Admin",
                 last_name: "User",
                 phone: "1543624319",
                 ssn: 1235,
                 company: "Example Company"
                )

puts '1 Admin User created'

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))

puts '3 Audit Logs have been created'

100.times do |post|
  Post.create!(
               date: Date.today,
               rationale: "#{post} Lorem ipsum dolor sit amet, consectetur
               adipiscing elit. Sed id venenatis mauris, eu posuere orci.
               Nunc fringilla lobortis metus ut ultrices. Aenean vel ipsum
               nulla. Integer maximus risus sed sapien pharetra tristique.
               Aliquam eu hendrerit felis. Pellentesque nec feugiat nulla.
               Sed lobortis, purus et varius luctus, risus augue vulputate
               metus, at fringilla massa massa at eros. Pellentesque nec
               nisl lacus. Mauris sagittis dignissim arcu, eget porta nisi
               congue a. Donec eleifend est quis purus laoreet malesuada.
               Aenean a tellus arcu. Ut odio elit, gravida a ligula id,
               posuere laoreet enim. Proin elementum ornare interdum. Lorem
               ipsum dolor sit amet, consectetur adipiscing elit.",
               user_id: @employee.id,
               daily_hours: 12.5
              )
end

puts '100 Posts have been created'
