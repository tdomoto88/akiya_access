require "test_helper"

class AkiyasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get akiyas_index_url
    assert_response :success
  end

  test "should get show" do
    get akiyas_show_url
    assert_response :success
  end

  test "should get new" do
    get akiyas_new_url
    assert_response :success
  end

  test "should get create" do
    get akiyas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get akiyas_destroy_url
    assert_response :success
  end
end
