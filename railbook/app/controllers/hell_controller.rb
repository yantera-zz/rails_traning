class HellController < ApplicationController
  def view
    @msg = 'よくきたな、人間共よ！'
    render 'hell/special'
  end
  def list
    @books = Book.all
  end
  def app_var
    render text: MY_APP['logo']['source']
  end
end
