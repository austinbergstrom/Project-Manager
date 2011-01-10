require 'test_helper'

class ProjectTypesControllerTest < ActionController::TestCase
  setup do
    @project_type = project_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_type" do
    assert_difference('ProjectType.count') do
      post :create, :project_type => @project_type.attributes
    end

    assert_redirected_to project_type_path(assigns(:project_type))
  end

  test "should show project_type" do
    get :show, :id => @project_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @project_type.to_param
    assert_response :success
  end

  test "should update project_type" do
    put :update, :id => @project_type.to_param, :project_type => @project_type.attributes
    assert_redirected_to project_type_path(assigns(:project_type))
  end

  test "should destroy project_type" do
    assert_difference('ProjectType.count', -1) do
      delete :destroy, :id => @project_type.to_param
    end

    assert_redirected_to project_types_path
  end
end
