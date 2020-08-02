namespace :notification do
  desc 'Sends SMS notification for employees to log overtime'
  task sms: :environment do
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

end
