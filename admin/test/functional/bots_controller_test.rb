require 'test_helper'

class BotsControllerTest < ActionController::TestCase
  setup do
    @bot = bots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bot" do
    assert_difference('Bot.count') do
      post :create, :bot => @bot.attributes
    end

    assert_redirected_to bot_path(assigns(:bot))
  end

  test "should show bot" do
    get :show, :id => @bot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bot.to_param
    assert_response :success
  end

  test "should update bot" do
    put :update, :id => @bot.to_param, :bot => @bot.attributes
    assert_redirected_to bot_path(assigns(:bot))
  end

  test "should destroy bot" do
    assert_difference('Bot.count', -1) do
      delete :destroy, :id => @bot.to_param
    end

    assert_redirected_to bots_path
  end
end
