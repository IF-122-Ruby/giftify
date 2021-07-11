class TelegramBotController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  include ActionView::Helpers::TextHelper

  def start!(*)
    if session[:user_id]
      respond_with :message, text: 'You are connected, try do some action'
    else
      respond_with :message, text: 'Hi. Send /connect to get a link to join giftify account'
    end
  end

  def connect!
    if session[:user_id]
      respond_with :message
    else
      telegram_profile
      respond_with :message, text: 'Click on the button below to connect to your Giftify account',
                           reply_markup: { inline_keyboard: [
                                          [
                                            { text: "Connect",
                                              url: "http://www.localhost:3000/account/telegram_connect?connection_token=#{@telegram_profile.connection_token}" }
                                          ]
                                        ]
                                      }
    end
  end

  def disconnect!
    TelegramProfile.find_by(telegram_id: update['message']['from']['id']).destroy
    session['user_id'] = nil
    respond_with :message, text: 'You are disconnected to your giftify account'
  end

  def balance!
    if current_user || session[:user_id]
      respond_with :message, text: "Your balance - #{pluralize(current_user.balance, 'point')}"
    else
      respond_with :message, text: "You couldn`t watch your balance unless you are not authorized"
    end
  end

  def message(*)
    if update['message']['text'] == 'Balance'
      balance!
    elsif update['message']['text'] == 'balance'
      session.clear
      respond_with :message, text: "There are no action for #{update['message']['text']}"
    end
  end

  private

  def current_user
    @current_user = TelegramProfile.find_by(telegram_id: update['message']['from']['id'])&.user
  end

  def telegram_profile
    if current_user
      session[:user_id] = current_user.id
    else
      @telegram_profile = TelegramProfile.create(telegram_id: update['message']['from']['id'])
    end
  end
end
