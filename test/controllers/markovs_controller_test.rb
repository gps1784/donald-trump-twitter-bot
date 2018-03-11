require 'test_helper'

class MarkovsControllerTest < ActionController::TestCase
  setup do
    @markov = markovs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:markovs)
  end

  test "should show markov" do
    get :show, id: @markov
    assert_response :success
  end
end
