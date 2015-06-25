def form_tag
  @book = Book.new
end
def form_for
  @book = Book.new
end
def select
  @book = Book.new(publish: '技術評論社')
end
def col_select
  @book = Book.new(publish: '技術評論社')
  @books = Book.select(:publish).distinct
end
