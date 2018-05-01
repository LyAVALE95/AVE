require 'test_helper'

class SessionDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session_detail = session_details(:one)
  end

  test "should get index" do
    get session_details_url
    assert_response :success
  end

  test "should get new" do
    get new_session_detail_url
    assert_response :success
  end

  test "should create session_detail" do
    assert_difference('SessionDetail.count') do
      post session_details_url, params: { session_detail: { txt1: @session_detail.txt1, txt2: @session_detail.txt2, txt3: @session_detail.txt3 } }
    end

    assert_redirected_to session_detail_url(SessionDetail.last)
  end

  test "should show session_detail" do
    get session_detail_url(@session_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_detail_url(@session_detail)
    assert_response :success
  end

  test "should update session_detail" do
    patch session_detail_url(@session_detail), params: { session_detail: { txt1: @session_detail.txt1, txt2: @session_detail.txt2, txt3: @session_detail.txt3 } }
    assert_redirected_to session_detail_url(@session_detail)
  end

  test "should destroy session_detail" do
    assert_difference('SessionDetail.count', -1) do
      delete session_detail_url(@session_detail)
    end

    assert_redirected_to session_details_url
  end
end
