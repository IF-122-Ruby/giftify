class UserMonthlyBalanceMailer < ApplicationMailer

  def balance_email(user)
    @user = user
    mail(to: user.email, subject: 'Your current balance on Giftify')
  end

end
