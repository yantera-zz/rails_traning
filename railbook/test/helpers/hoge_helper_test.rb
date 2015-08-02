require 'test_helper'

class HogeHelperTest < ActionView::TestCase
  test "format helper" do
    result = format_datetime(Time.now, :date)
    assert_match /¥d{4}年¥d{1,2}月¥d{1,2}/, result
  end
end