class TelegramBotController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  include ActionView::Helpers::TextHelper

  before_action :connected_user

  def start!(*)
    if session['user_id']
      respond_with :message, text: 'You are connected, let`s do some action'
    else
      telegram_profile = TelegramProfile.create(telegram_id: from['id'])
      respond_with :message, text: 'Click on the button below to connect to your Giftify account',
                             reply_markup: { inline_keyboard: [
                                            [
                                              { text: "Connect",
                                                url: "http://www.#{Rails.application.routes.default_url_options[:host]}/account/telegram_profile/connect?connection_token=#{telegram_profile.connection_token}" }
                                            ]
                                          ]
                                        }
    end
  end

  def disconnect!
    if session['user_id']
      resource.destroy
      session['user_id'] = nil
    end
    respond_with :message, text: 'You are disconnected from your giftify account'
  end

  def balance!
    if session[:user_id]
      respond_with :message, text: "Your balance - #{pluralize(current_user.balance, 'point')}"
    else
      respond_with :message, text: "You couldn`t watch your balance unless you are not authorized"
    end
  end

  def message(*)
    if update['message']['text'] == 'Balance'
      balance!
    else
      respond_with :message, text: "There are no action for #{update['message']['text']}"
    end
  end

  private

  def connected_user
    session[:user_id] = current_user.id if current_user
  end

  def resource
    TelegramProfile.find_by(telegram_id: update['message']['from']['id'])
  end

  def current_user
    resource&.user
  end
end
