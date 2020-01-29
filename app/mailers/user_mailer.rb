class UserMailer < ActionMailer::Base
  default from: "ne-pas-repondre@florileges.info"

  def welcome_email
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email, subject: "Bienvenue dans la communauté Florilèges-Prairies urbaines!")
  end
end
