require 'test_helper'

class UserTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_teacher = user_teachers(:one)
  end

  test "should get index" do
    get user_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_user_teacher_url
    assert_response :success
  end

  test "should create user_teacher" do
    assert_difference('UserTeacher.count') do
      post user_teachers_url, params: { user_teacher: {  } }
    end

    assert_redirected_to user_teacher_url(UserTeacher.last)
  end

  test "should show user_teacher" do
    get user_teacher_url(@user_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_teacher_url(@user_teacher)
    assert_response :success
  end

  test "should update user_teacher" do
    patch user_teacher_url(@user_teacher), params: { user_teacher: {  } }
    assert_redirected_to user_teacher_url(@user_teacher)
  end

  test "should destroy user_teacher" do
    assert_difference('UserTeacher.count', -1) do
      delete user_teacher_url(@user_teacher)
    end

    assert_redirected_to user_teachers_url
  end
end
