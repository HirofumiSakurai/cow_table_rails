require 'test_helper'

class DaughtersControllerTest < ActionController::TestCase
  setup do
    @daughter = daughters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daughters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daughter" do
    assert_difference('Daughter.count') do
      post :create, daughter: { owner_id: @daughter.owner_id }
    end

    assert_redirected_to daughter_path(assigns(:daughter))
  end

  test "should show daughter" do
    get :show, id: @daughter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daughter
    assert_response :success
  end

  test "should update daughter" do
    patch :update, id: @daughter, daughter: { owner_id: @daughter.owner_id }
    assert_redirected_to daughter_path(assigns(:daughter))
  end

  test "should destroy daughter" do
    assert_difference('Daughter.count', -1) do
      delete :destroy, id: @daughter
    end

    assert_redirected_to daughters_path
  end
end
