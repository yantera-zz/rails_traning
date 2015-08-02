require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login test" do
    get '/hello/view'
    assert_response :redirect
    assert_redirected_to controller: :login, action: :index
    assert_equal '/hello/view', flash[:refere]

    follow_redirect!
    assert_response :success
    assert_equal '/hello/view', flash[:refere]

    post '/login/auth', { username: 'yyamada', password: '12345', refere: 'hello/view'}
    assert_equal users(:yyamada).id, session[:usr]

    follow_redirect!
    assert_response :success
  end
end
