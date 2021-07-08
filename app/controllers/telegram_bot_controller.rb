class TelegramBotController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: 'Hi. Entry your /email example@mail.com and then /password example'
  end

  def email!(email)
    respond_with :message, text: 'Success'
    session['email'] = email
  end

  def password!(password)
    if telegram_user?(password)
      session['user_id'] = User.find_by(email: session['email']).id
      respond_with :message, text: 'Success. Entry /balance to see your balance of points'
    else
      respond_with :message, text: 'Not found'
    end
  end

  def balance!(*)
    if telegram_user
      respond_with :message, text: "Your current balance on site #{telegram_user.balance}"
    else
      respond_with :message, text: 'You are not athorized to perform this action'
    end
  end

  private

  def telegram_user?(password)
    User.find_by(email: session['email'])&.valid_password?(password)
  end

  def telegram_user
    User.find(session['user_id'])
  end
end
