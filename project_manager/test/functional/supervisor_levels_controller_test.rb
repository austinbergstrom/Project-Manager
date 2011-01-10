require 'test_helper'

class SupervisorLevelsControllerTest < ActionController::TestCase
  setup do
    @supervisor_level = supervisor_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supervisor_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supervisor_level" do
    assert_difference('SupervisorLevel.count') do
      post :create, :supervisor_level => @supervisor_level.attributes
    end

    assert_redirected_to supervisor_level_path(assigns(:supervisor_level))
  end

  test "should show supervisor_level" do
    get :show, :id => @supervisor_level.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @supervisor_level.to_param
    assert_response :success
  end

  test "should update supervisor_level" do
    put :update, :id => @supervisor_level.to_param, :supervisor_level => @supervisor_level.attributes
    assert_redirected_to supervisor_level_path(assigns(:supervisor_level))
  end

  test "should destroy supervisor_level" do
    assert_difference('SupervisorLevel.count', -1) do
      delete :destroy, :id => @supervisor_level.to_param
    end

    assert_redirected_to supervisor_levels_path
  end
end
