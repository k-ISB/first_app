class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        log_in user
        message = "アカウントが有効化されていません"
        message += "メールを確認して、有効化リンクを開いてください"
        #flash[:warning] = message
        redirect_to user
        #redirect_to root_url
      end
    else
      flash.now[:danger] = "正しい情報か確認してね！"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
