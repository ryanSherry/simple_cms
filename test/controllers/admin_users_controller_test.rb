require "test_helper"

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get admin_users_index,_url
    assert_response :success
  end

  test "should get new," do
    get admin_users_new,_url
    assert_response :success
  end

  test "should get edit," do
    get admin_users_edit,_url
    assert_response :success
  end

  test "should get delete" do
    get admin_users_delete_url
    assert_response :success
  end
end
