class UserMailer < ApplicationMailer

  def thanks_email(user)
    @user = user
    @url  = '/users/users/sign_in'
    mail to: user.email , subject: '私の素敵なサイトへようこそ（大嘘）'
  end
end
