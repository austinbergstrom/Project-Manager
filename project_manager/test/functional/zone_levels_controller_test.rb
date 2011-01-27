require 'test_helper'

class ZoneLevelsControllerTest < ActionController::TestCase
  setup do
    @zone_level = zone_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zone_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zone_level" do
    assert_difference('ZoneLevel.count') do
      post :create, :zone_level => @zone_level.attributes
    end

    assert_redirected_to zone_level_path(assigns(:zone_level))
  end

  test "should show zone_level" do
    get :show, :id => @zone_level.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @zone_level.to_param
    assert_response :success
  end

  test "should update zone_level" do
    put :update, :id => @zone_level.to_param, :zone_level => @zone_level.attributes
    assert_redirected_to zone_level_path(assigns(:zone_level))
  end

  test "should destroy zone_level" do
    assert_difference('ZoneLevel.count', -1) do
      delete :destroy, :id => @zone_level.to_param
    end

    assert_redirected_to zone_levels_path
  end
end
