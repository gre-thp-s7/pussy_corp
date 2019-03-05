class ApplicationMailer < ActionMailer::Base
  default from: 'pussy-corp@email.com'
  layout 'mailer'
end

# User.create!(first_name: "charles", last_name: "charles", email: "teamgre38@yopmail.com", password: "testtest", password_confirmation: "testtest")