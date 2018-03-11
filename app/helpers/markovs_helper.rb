module MarkovsHelper
  def test_twitter
    tweets = Rails.application.config.twitter_client.user_timeline(
      "realDonaldTrump",
      include_rts: false,
      tweet_mode: :extended
    )

    tweets[1].attrs.each do |key, value|
      puts "#{key}:\t#{value}"
    end
    puts
    tweets.map do |tweet| puts tweet.attrs[:id] end
    puts
  end # test_twitter

  module_function :test_twitter
end
