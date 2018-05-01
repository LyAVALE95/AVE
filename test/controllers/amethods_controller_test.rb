require 'test_helper'

class AmethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amethod = amethods(:one)
  end

  test "should get index" do
    get amethods_url
    assert_response :success
  end

  test "should get new" do
    get new_amethod_url
    assert_response :success
  end

  test "should create amethod" do
    assert_difference('Amethod.count') do
      post amethods_url, params: { amethod: { description: @amethod.description, description_subject: @amethod.description_subject, name: @amethod.name, skills: @amethod.skills, subject: @amethod.subject } }
    end

    assert_redirected_to amethod_url(Amethod.last)
  end

  test "should show amethod" do
    get amethod_url(@amethod)
    assert_response :success
  end

  test "should get edit" do
    get edit_amethod_url(@amethod)
    assert_response :success
  end

  test "should update amethod" do
    patch amethod_url(@amethod), params: { amethod: { description: @amethod.description, description_subject: @amethod.description_subject, name: @amethod.name, skills: @amethod.skills, subject: @amethod.subject } }
    assert_redirected_to amethod_url(@amethod)
  end

  test "should destroy amethod" do
    assert_difference('Amethod.count', -1) do
      delete amethod_url(@amethod)
    end

    assert_redirected_to amethods_url
  end
end
