namespace :notification do
  desc 'Sends SMS notification for employees to log overtime'
  task sms: :environment do
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
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
