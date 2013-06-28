require 'test_helper'

class SurveyTextsControllerTest < ActionController::TestCase
  setup do
    @survey_text = survey_texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_text" do
    assert_difference('SurveyText.count') do
      post :create, survey_text: { body: @survey_text.body, title: @survey_text.title }
    end

    assert_redirected_to survey_text_path(assigns(:survey_text))
  end

  test "should show survey_text" do
    get :show, id: @survey_text
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_text
    assert_response :success
  end

  test "should update survey_text" do
    put :update, id: @survey_text, survey_text: { body: @survey_text.body, title: @survey_text.title }
    assert_redirected_to survey_text_path(assigns(:survey_text))
  end

  test "should destroy survey_text" do
    assert_difference('SurveyText.count', -1) do
      delete :destroy, id: @survey_text
    end

    assert_redirected_to survey_texts_path
  end
end
