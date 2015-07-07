class CtrlController < ApplicationController
  def para
    render text: 'idパラメータ：' + params[:id]
  end
  def para_array
    render text: 'categoryパラメータ：' + params[:category].inspect
  end
  def req_head
    render text: request.headers['User-Agent'] 
  end
  def req_head2
    @headers = request,headers
  end
end
