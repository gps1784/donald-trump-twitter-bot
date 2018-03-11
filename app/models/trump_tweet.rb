class TrumpTweet < ActiveRecord::Base
  extend TrumpTweetsImporter

  scope :popular,  -> { where('"trump_tweets"."retweets" > 20000') }
  scope :unparsed, -> { where(parsed: false) }
  scope :oldest,   -> { order(:id) }
end
