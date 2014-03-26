class UserMailer < ActionMailer::Base
  default from: "no-reply@mailerapp.com"

  def welcome_email(user)
  	@user = user
  	attachments['rails.jpg'] = File.read("#{Rails.root}/app/assets/images/rails.jpg")
  	mail(to: @user.email, subject: "Welcome to our app ;)")
  end

  def send_email(user, subject)
  	@user = user
  	@subject = subject
  	mail(to: @user.email, subject: @subject)
  end

  def newsletter_email(users)
  	@users = users
  	@users.each do |user|
  		send_email(user, "Newsletter 0.4v").deliver
  	end
  end
end
