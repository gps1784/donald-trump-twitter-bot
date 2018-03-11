module TrumpTweetsImporter
  def import_from_twitter
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil    
    print "Collecting @realDonaldTrump tweets: "
    lowest_id          = nil
    # first, see if there are any new tweets
    loop do
      options = {
        include_rts: false,
        tweet_mode: :extended,
        trim_user: true,
        count: 100
      }
      options[:max_id] = lowest_id if lowest_id

      tweets = Rails.application.config.twitter_client.user_timeline("realDonaldTrump", options)

      break if tweets.length == 0

      print '#'

      TrumpTweet.transaction do
        tweets.each do |tweet|
          attrs = tweet.attrs
          if TrumpTweet.exists?(id: attrs[:id])
            # we've seen this tweet before, so we're done
            break
          end
          # this is a new tweet to record
          TrumpTweet.create(
            id: attrs[:id],
            parsed: false,
            retweets: tweet.retweet_count,
            published_at: attrs[:created_at],
            text: attrs[:full_text]
          )
        end # each tweet
      end # transaction
      lowest_id = tweets.map{ |t| t.attrs[:id] }.min
    end # loop
  ensure
    ActiveRecord::Base.logger = old_logger
  end # import_from_twitter
end
