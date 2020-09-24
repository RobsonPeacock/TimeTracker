class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rp-time-tracker.herokuapp.com'
  layout 'mailer'
end
