class UserMailer < ApplicationMailer

  default from: "twitter_clone_notifications@test.com"

  def follow_notification user
    @user = user
    mail(to: @user.email, subject: 'You have a new follower!')
  end
end
