class TrumpTweetsController < ApplicationController
  before_action :set_trump_tweet, only: :show

  # GET /trump_tweets
  # GET /trump_tweets.json
  def index
    @trump_tweets = TrumpTweet.all
  end

  # GET /trump_tweets/1
  # GET /trump_tweets/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trump_tweet
      @trump_tweet = TrumpTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trump_tweet_params
      params.require(:trump_tweet)
    end
end
