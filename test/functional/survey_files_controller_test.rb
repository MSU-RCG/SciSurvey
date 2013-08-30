require 'test_helper'

class SurveyFilesControllerTest < ActionController::TestCase
  setup do
    @survey_file = survey_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_file" do
    assert_difference('SurveyFile.count') do
      post :create, survey_file: { attachement: @survey_file.attachement, response_set_id: @survey_file.response_set_id }
    end

    assert_redirected_to survey_file_path(assigns(:survey_file))
  end

  test "should show survey_file" do
    get :show, id: @survey_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_file
    assert_response :success
  end

  test "should update survey_file" do
    put :update, id: @survey_file, survey_file: { attachement: @survey_file.attachement, response_set_id: @survey_file.response_set_id }
    assert_redirected_to survey_file_path(assigns(:survey_file))
  end

  test "should destroy survey_file" do
    assert_difference('SurveyFile.count', -1) do
      delete :destroy, id: @survey_file
    end

    assert_redirected_to survey_files_path
  end
end
