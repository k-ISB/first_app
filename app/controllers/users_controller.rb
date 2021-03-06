class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :delete]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy 
  

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #@user.send_activation_email
      #flash[:info] = "送られたメールからアカウントの有効化をしてください"
      log_in @user
      flash[:success] = "アカウントを作成しました！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールが変更されたよ！"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :password, :password_confirmation, :profile)
    end

    #正しいユーザーかどうか判断する
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    #管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
