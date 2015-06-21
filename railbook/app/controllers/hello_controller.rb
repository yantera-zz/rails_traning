class HelloController < ApplicationController
  def show
  end
  def list
    @books = Book.all
  end
end
