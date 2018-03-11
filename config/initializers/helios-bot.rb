Rails.application.config.helios_bot_client = Helios::Bot.configure do |hb_cfg|
  hb_cfg.username = ENV['TRUMP_BOT_HB_USERNAME']
  hb_cfg.password = ENV['TRUMP_BOT_HB_PASSWORD']
  hb_cfg.base_uri = "https://gateway.watsonplatform.net/tone-analyzer/api/v3"
end

