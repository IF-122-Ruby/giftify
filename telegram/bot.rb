require File.expand_path('../config/environment', __dir__)
require 'telegram/bot'

token = '1891774627:AAGc_X4yMqAPumWcbOc1aWdTGs8lmQcViNc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
