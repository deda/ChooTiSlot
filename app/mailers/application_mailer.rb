class ApplicationMailer < ActionMailer::Base
  default from: Settings.notifications.email.default_from
  layout 'mailer'
end
