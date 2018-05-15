require 'test_helper'

class UserSGsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_sg = user_sgs(:one)
  end

  test "should get index" do
    get user_sgs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_sg_url
    assert_response :success
  end

  test "should create user_sg" do
    assert_difference('UserSg.count') do
      post user_sgs_url, params: { user_sg: { group_id: @user_sg.group_id, school_id: @user_sg.school_id, user_id: @user_sg.user_id } }
    end

    assert_redirected_to user_sg_url(UserSg.last)
  end

  test "should show user_sg" do
    get user_sg_url(@user_sg)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_sg_url(@user_sg)
    assert_response :success
  end

  test "should update user_sg" do
    patch user_sg_url(@user_sg), params: { user_sg: { group_id: @user_sg.group_id, school_id: @user_sg.school_id, user_id: @user_sg.user_id } }
    assert_redirected_to user_sg_url(@user_sg)
  end

  test "should destroy user_sg" do
    assert_difference('UserSg.count', -1) do
      delete user_sg_url(@user_sg)
    end

    assert_redirected_to user_sgs_url
  end
end
