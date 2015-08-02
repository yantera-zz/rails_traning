require 'test_helper'

class FugaControllerTest < ActionController::TestCase
  test "list action" do
    get :list
    assert_equal 10, assigns(:books).length, 'found rows is wrong.'
    assert_response :success, 'list action failed.'
    assert_template 'hello/list'
  end
  test "routing check" do
    assert_generates('hello/list', {contorller: 'hello', action: 'list'})
    assert_recognizes('hello', {contorller: 'hello', action: 'hello/list'})
  end
  test "select check" do
          # listアクションを実行（hello/list.html.erbが実行されているはず）
    get :list
    assert_select 'title'
    assert_select 'title', true
    assert_select 'font', false
    assert_select 'title', 'Railbook'
    assert_select 'title', /[A-Za-z0-9]+/
    assert_select 'script[data-turbolinks-track=?]', /.+/
    assert_select 'table tr[style]', 10
    assert_select 'table' do
    assert_select 'tr[style]', 1..10
    assert_select 'title', { count: 1, text: 'Railbook' }
  end
end
