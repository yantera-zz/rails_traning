class ViewController < ApplicationController

  def form_tag
    @book = Book.new
  end

  def form_for
    @book = Book.new
  end

  def field
    @book = Book.new
  end

  def html5
    @book = Book.new
  end

  def select
    @book = Book.new(publish: '技術評論社')
  end

  def select_tag
  end

  def select_tag2
  end

  def col_select
    @book = Book.new(publish: '技術評論社')
    @books = Book.select(:publish).distinct
  end

  def col_select2
    @book = Book.new(publish: '技術評論社')
    @books = Book.select(:publish).distinct
  end

  def group_select
    @review = Review.new
    @authors = Author.all
  end

  def group_select2
  end

  def dat_select
    @book = Book.find(980190963)
  end

  def col_radio
    @book = Book.new(publish: '技術評論社')
    @books = Book.select(:publish).distinct
  end

  def fields
    @user = User.find(980190962)
  end

  def hightlight
  end

  def conc
  end

  def datetime
  end

  def excerpt
  end

  def format
  end

  def link
  end

  def number_to
  end

  def sanitize
  end

  def simple_format
  end

  def truncate
  end

  def default_url_options(options = {})
    { charset: 'utf-8' }
  end

  def adopt
    render layout: 'sub'
  end

  def multi
    render layout: 'layout'    # レイアウトlayout.html.erbを適用
  end

  def nest
    @msg = '今日も良い天気です。'
    render layout: 'child'
  end
end
