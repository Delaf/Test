# coding: UTF-8
#require 'telegram_bot'

tokenn = '1256536550:AAHdvWTfNzgHZnSS_geuVowGW5Q1XvpisCQ'


bot = TelegramBot.new(token: tokenn)
bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /greet/i
      reply.text = "Hello, #{message.from.first_name}!"
    else
      reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end



