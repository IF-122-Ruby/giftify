class Account::TelegramProfilesController < Account::AccountsController
  def create
    @telegram_profile = TelegramProfile.find_by(connection_token: params[:connection_token])

    if @telegram_profile.update(user: current_user, connection_token: nil)
      flash[:success] = 'You`re connected to telegram'
      Telegram.bot.send_message(chat_id: @telegram_profile.telegram_id,
                                text: 'You are connected to giftify successfully', 
                                reply_markup: {
                                  keyboard: [["Balance"]],
                                  resize_keyboard: true
                                  }
                                )
    else
      flash[:success] = 'You aren`t connected to telegram'
      Telegram.bot.send_message(chat_id: @telegram_profile.telegram_id,
                                text: 'You are not connected to giftify')
    end
    redirect_back(fallback_location: root_path)
  end
end
