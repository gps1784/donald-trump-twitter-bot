Rails.application.config.twitter_client = Twitter::REST::Client.new do |twtr_cfg|
  twtr_cfg.consumer_key        = ENV['TRUMP_BOT_TW_CONSUMER_KEY']
  twtr_cfg.consumer_secret     = ENV['TRUMP_BOT_TW_CONSUMER_SECRET']
  twtr_cfg.access_token        = ENV['TRUMP_BOT_TW_ACCESS_KEY']
  twtr_cfg.access_token_secret = ENV['TRUMP_BOT_TW_ACCESS_SECRET']
end

