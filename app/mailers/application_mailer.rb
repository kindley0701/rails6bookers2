class ApplicationMailer < ActionMailer::Base
  #全体のMailer
  default from: 'オーナー <from@example.com>'
  layout 'mailer'
end
