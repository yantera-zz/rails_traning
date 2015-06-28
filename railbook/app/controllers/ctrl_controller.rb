class CtrlController < ApplicationController
  def para
    render text: 'idパラメータ：' + params[:id]
  end
  def para_array
    render text: 'categoryパラメータ：' + params[:category].inspect
  end
end
