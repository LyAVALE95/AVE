require 'test_helper'

class UserQuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_quiz = user_quizzes(:one)
  end

  test "should get index" do
    get user_quizzes_url
    assert_response :success
  end

  test "should get new" do
    get new_user_quiz_url
    assert_response :success
  end

  test "should create user_quiz" do
    assert_difference('UserQuiz.count') do
      post user_quizzes_url, params: { user_quiz: { score: @user_quiz.score } }
    end

    assert_redirected_to user_quiz_url(UserQuiz.last)
  end

  test "should show user_quiz" do
    get user_quiz_url(@user_quiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_quiz_url(@user_quiz)
    assert_response :success
  end

  test "should update user_quiz" do
    patch user_quiz_url(@user_quiz), params: { user_quiz: { score: @user_quiz.score } }
    assert_redirected_to user_quiz_url(@user_quiz)
  end

  test "should destroy user_quiz" do
    assert_difference('UserQuiz.count', -1) do
      delete user_quiz_url(@user_quiz)
    end

    assert_redirected_to user_quizzes_url
  end
end
