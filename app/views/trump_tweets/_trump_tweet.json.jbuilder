json.extract! trump_tweet, :id, :parsed, :retweets, :published_at, :text, :created_at, :updated_at
json.url trump_tweet_url(trump_tweet, format: :json)
