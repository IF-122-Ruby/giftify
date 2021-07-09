class TelegramBotController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    save_context :create_telegram_account
    respond_with :message, text: 'Hello! Click on the button below to connect to your Giftify account', reply_markup: { inline_keyboard: [[{ text: "Connect", url: '/connect' }]] }
  end

  def connect!(*)
    
  end

  def create_telegram_account
    @telegram_account = TelegramAccount.create(chat_id: update['message']['from']['id'])
    @telegram_account.update(connection_token: @telegram_account.generate_token)
    session['connection_token'] = @telegram_account.connection_token
  end

  def message(*)
    respond_with :message, text: "There are no action for #{update['message']['text']}"
  end
end
