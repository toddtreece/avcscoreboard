require 'test_helper'

class LapsControllerTest < ActionController::TestCase
  setup do
    @lap = laps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lap" do
    assert_difference('Lap.count') do
      post :create, :lap => @lap.attributes
    end

    assert_redirected_to lap_path(assigns(:lap))
  end

  test "should show lap" do
    get :show, :id => @lap.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lap.to_param
    assert_response :success
  end

  test "should update lap" do
    put :update, :id => @lap.to_param, :lap => @lap.attributes
    assert_redirected_to lap_path(assigns(:lap))
  end

  test "should destroy lap" do
    assert_difference('Lap.count', -1) do
      delete :destroy, :id => @lap.to_param
    end

    assert_redirected_to laps_path
  end
end
