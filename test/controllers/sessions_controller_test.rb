require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post login_url, params: { name: dave.name, password: 'secret' }

    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post login_url, params: { name: dave.name, password: 'wrong' }

    assert_redirected_to login_url
    assert_equal flash[:alert], 'Invalid user/password combination'
  end

  test "should get destroy" do
    delete logout_url

    assert_redirected_to store_index_url
    assert_equal flash[:notice], 'Logged out'
  end
end
