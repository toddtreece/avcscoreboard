require 'test_helper'

class BotTypesControllerTest < ActionController::TestCase
  setup do
    @bot_type = bot_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bot_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bot_type" do
    assert_difference('BotType.count') do
      post :create, :bot_type => @bot_type.attributes
    end

    assert_redirected_to bot_type_path(assigns(:bot_type))
  end

  test "should show bot_type" do
    get :show, :id => @bot_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bot_type.to_param
    assert_response :success
  end

  test "should update bot_type" do
    put :update, :id => @bot_type.to_param, :bot_type => @bot_type.attributes
    assert_redirected_to bot_type_path(assigns(:bot_type))
  end

  test "should destroy bot_type" do
    assert_difference('BotType.count', -1) do
      delete :destroy, :id => @bot_type.to_param
    end

    assert_redirected_to bot_types_path
  end
end
