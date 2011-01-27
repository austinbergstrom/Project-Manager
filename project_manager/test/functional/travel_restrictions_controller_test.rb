require 'test_helper'

class TravelRestrictionsControllerTest < ActionController::TestCase
  setup do
    @travel_restriction = travel_restrictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_restrictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_restriction" do
    assert_difference('TravelRestriction.count') do
      post :create, :travel_restriction => @travel_restriction.attributes
    end

    assert_redirected_to travel_restriction_path(assigns(:travel_restriction))
  end

  test "should show travel_restriction" do
    get :show, :id => @travel_restriction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @travel_restriction.to_param
    assert_response :success
  end

  test "should update travel_restriction" do
    put :update, :id => @travel_restriction.to_param, :travel_restriction => @travel_restriction.attributes
    assert_redirected_to travel_restriction_path(assigns(:travel_restriction))
  end

  test "should destroy travel_restriction" do
    assert_difference('TravelRestriction.count', -1) do
      delete :destroy, :id => @travel_restriction.to_param
    end

    assert_redirected_to travel_restrictions_path
  end
end
