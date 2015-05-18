require 'test_helper'

class KineControllerTest < ActionController::TestCase
  setup do
    @cow = kine(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kine)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cow" do
    assert_difference('Cow.count') do
      post :create, cow: { birth: @cow.birth, ear_num: @cow.ear_num, name: @cow.name, owner_id: @cow.owner_id, parent: @cow.parent, sex: @cow.sex, t10: @cow.t10, t11: @cow.t11, t12: @cow.t12, t13: @cow.t13, t14: @cow.t14, t15: @cow.t15, t16: @cow.t16, t17: @cow.t17, t18: @cow.t18, t19: @cow.t19, t1: @cow.t1, t20: @cow.t20, t21: @cow.t21, t22: @cow.t22, t23: @cow.t23, t24: @cow.t24, t25: @cow.t25, t26: @cow.t26, t27: @cow.t27, t28: @cow.t28, t29: @cow.t29, t2: @cow.t2, t30: @cow.t30, t31: @cow.t31, t32: @cow.t32, t33: @cow.t33, t34: @cow.t34, t35: @cow.t35, t36: @cow.t36, t37: @cow.t37, t38: @cow.t38, t39: @cow.t39, t3: @cow.t3, t40: @cow.t40, t41: @cow.t41, t42: @cow.t42, t43: @cow.t43, t44: @cow.t44, t45: @cow.t45, t46: @cow.t46, t47: @cow.t47, t48: @cow.t48, t49: @cow.t49, t4: @cow.t4, t50: @cow.t50, t5: @cow.t5, t6: @cow.t6, t7: @cow.t7, t8: @cow.t8, t9: @cow.t9 }
    end

    assert_redirected_to cow_path(assigns(:cow))
  end

  test "should show cow" do
    get :show, id: @cow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cow
    assert_response :success
  end

  test "should update cow" do
    patch :update, id: @cow, cow: { birth: @cow.birth, ear_num: @cow.ear_num, name: @cow.name, owner_id: @cow.owner_id, parent: @cow.parent, sex: @cow.sex, t10: @cow.t10, t11: @cow.t11, t12: @cow.t12, t13: @cow.t13, t14: @cow.t14, t15: @cow.t15, t16: @cow.t16, t17: @cow.t17, t18: @cow.t18, t19: @cow.t19, t1: @cow.t1, t20: @cow.t20, t21: @cow.t21, t22: @cow.t22, t23: @cow.t23, t24: @cow.t24, t25: @cow.t25, t26: @cow.t26, t27: @cow.t27, t28: @cow.t28, t29: @cow.t29, t2: @cow.t2, t30: @cow.t30, t31: @cow.t31, t32: @cow.t32, t33: @cow.t33, t34: @cow.t34, t35: @cow.t35, t36: @cow.t36, t37: @cow.t37, t38: @cow.t38, t39: @cow.t39, t3: @cow.t3, t40: @cow.t40, t41: @cow.t41, t42: @cow.t42, t43: @cow.t43, t44: @cow.t44, t45: @cow.t45, t46: @cow.t46, t47: @cow.t47, t48: @cow.t48, t49: @cow.t49, t4: @cow.t4, t50: @cow.t50, t5: @cow.t5, t6: @cow.t6, t7: @cow.t7, t8: @cow.t8, t9: @cow.t9 }
    assert_redirected_to cow_path(assigns(:cow))
  end

  test "should destroy cow" do
    assert_difference('Cow.count', -1) do
      delete :destroy, id: @cow
    end

    assert_redirected_to kine_path
  end
end
