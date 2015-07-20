# <books>要素を生成
xml.books do
  # @booksをもとに、順に<book>要素を生成
  @books.each do |b|
    xml.book(isbn: b.isbn) do
      xml.title(b.title)
      xml.price(b.price)
      xml.publosh(b.publish)
      xml.publoshed(b.published)
      xml.cd(b.cd) 
    end
  end
end
