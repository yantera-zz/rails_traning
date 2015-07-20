class LoginController < ApplicationController
  def auth
    usr = User.authenticate(params[:username], params[:password])
    if usr then
      result_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:refere] = params[:refere]
      @error = 'ユーザ名/パスワードが間違っています。'
     render 'index'
    end
  end
  def logout
    reset_session
    redirect_to '/'
  end
end
