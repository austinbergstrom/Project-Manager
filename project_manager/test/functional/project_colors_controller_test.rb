require 'test_helper'

class ProjectColorsControllerTest < ActionController::TestCase
  setup do
    @project_color = project_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_color" do
    assert_difference('ProjectColor.count') do
      post :create, :project_color => @project_color.attributes
    end

    assert_redirected_to project_color_path(assigns(:project_color))
  end

  test "should show project_color" do
    get :show, :id => @project_color.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @project_color.to_param
    assert_response :success
  end

  test "should update project_color" do
    put :update, :id => @project_color.to_param, :project_color => @project_color.attributes
    assert_redirected_to project_color_path(assigns(:project_color))
  end

  test "should destroy project_color" do
    assert_difference('ProjectColor.count', -1) do
      delete :destroy, :id => @project_color.to_param
    end

    assert_redirected_to project_colors_path
  end
end
