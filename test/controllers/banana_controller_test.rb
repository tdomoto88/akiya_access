require "test_helper"

class BananaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get banana_index_url
    assert_response :success
  end

  test "should get new" do
    get banana_new_url
    assert_response :success
  end

  test "should get create" do
    get banana_create_url
    assert_response :success
  end

  test "should get update" do
    get banana_update_url
    assert_response :success
  end
end
