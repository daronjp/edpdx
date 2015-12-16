require 'test_helper'

class Hq::UsersControllerTest < ActionController::TestCase
  setup do
    @hq_user = hq_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hq_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hq_user" do
    assert_difference('Hq::User.count') do
      post :create, hq_user: { is_admin: @hq_user.is_admin, password_hash: @hq_user.password_hash, password_salt: @hq_user.password_salt, username: @hq_user.username }
    end

    assert_redirected_to hq_user_path(assigns(:hq_user))
  end

  test "should show hq_user" do
    get :show, id: @hq_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hq_user
    assert_response :success
  end

  test "should update hq_user" do
    patch :update, id: @hq_user, hq_user: { is_admin: @hq_user.is_admin, password_hash: @hq_user.password_hash, password_salt: @hq_user.password_salt, username: @hq_user.username }
    assert_redirected_to hq_user_path(assigns(:hq_user))
  end

  test "should destroy hq_user" do
    assert_difference('Hq::User.count', -1) do
      delete :destroy, id: @hq_user
    end

    assert_redirected_to hq_users_path
  end
end
