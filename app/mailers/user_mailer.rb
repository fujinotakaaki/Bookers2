class UserMailer < ApplicationMailer

  def thanks_email(user)
    @user = user
    @url  = '/users/users/sign_in'
    mail to: user.email , subject: '私の素敵なサイトへようこそ（大嘘）'
  end

  def notification_email
    mail bcc: User.pluck(:email) , subject: '定期的な通知メールの試験運用'
  end
end
