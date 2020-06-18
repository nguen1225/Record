ActionMailer::Base.default_url_options = {  host: 'localhost', port: 3000 }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: ENV['EMAIL_USER'],
  password: ENV['EMAIL_PASSWORD'],
  #authentication: 'plain',
  authentication: :login ,
  enable_starttls_auto: true
}