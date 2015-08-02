require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @b = books(:jis)
  end

  def teardown
    @b = nil
  end

  test "book sava" do
    books = Book.new({
      isbn: '978-4-7741-4466-X',
      title: 'Ruby on Rails本格入門'
      price: 3100,
      publish: '技術評論社'
      published: '2014-02-14'
      cd: false
    })
    #assert book.save, 'Failed to save'
    assert !book.save, 'Failed to validate'
    assert_equal book.errors.size, 2, 'Failed to validate count'
    assert book.errors[:isbn].any?,'Failed to isbn validate'
   end

  test "where method test" do
    result = Book.find_by(title: JavaScriptライブラリ実践活用)
    assert_instance_of Book, result ,'result is not instance of Book'
    assert_equal @b.isbin, result.isbn ,'isbn column is wrong.'
    assert_equal Date.new(2013, 03, 19), result.published ,'published column is wrong'
  end

end
