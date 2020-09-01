namespace :notification do
  desc 'Sends SMS notification for employees to log overtime'
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into Time Tracker to request overtime or confirm your hours for last week: https://rp-time-tracker.herokuapp.com/"

      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    end
  end

  desc 'Sends email notification to managers (admin users) each day to inform of pending overtime requests'
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.present?
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
