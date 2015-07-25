require 'test_helper'

class HogeControllerTest < ActionController::TestCase
  test "book save" do
    book = Book.new({
      isbn: '978-4-7741-4466-X',
      title: 'Ruby on Rails本格入門',
      price: 3100,
      publish: '技術評論社',
      published: '2014-02-14',
      cd: fales
    })
    assert book.save, 'Failed to save'
end
