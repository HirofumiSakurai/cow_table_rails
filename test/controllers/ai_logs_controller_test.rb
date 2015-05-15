require 'test_helper'

class AiLogsControllerTest < ActionController::TestCase
  setup do
    @ai_log = ai_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ai_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ai_log" do
    assert_difference('AiLog.count') do
      post :create, ai_log: { cow_no: @ai_log.cow_no, date: @ai_log.date, state: @ai_log.state }
    end

    assert_redirected_to ai_log_path(assigns(:ai_log))
  end

  test "should show ai_log" do
    get :show, id: @ai_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ai_log
    assert_response :success
  end

  test "should update ai_log" do
    patch :update, id: @ai_log, ai_log: { cow_no: @ai_log.cow_no, date: @ai_log.date, state: @ai_log.state }
    assert_redirected_to ai_log_path(assigns(:ai_log))
  end

  test "should destroy ai_log" do
    assert_difference('AiLog.count', -1) do
      delete :destroy, id: @ai_log
    end

    assert_redirected_to ai_logs_path
  end
end
