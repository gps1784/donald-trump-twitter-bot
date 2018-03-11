require 'test_helper'

class TrumpTweetsControllerTest < ActionController::TestCase
  setup do
    @trump_tweet = trump_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trump_tweets)
  end

  test "should show trump_tweet" do
    get :show, id: @trump_tweet
    assert_response :success
  end
end
