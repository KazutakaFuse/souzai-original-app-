class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :destroy]
 
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
    render :edit
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "プロフィールを更新しました" 
    else
      flash.now[:danger] = 'プロフィールを更新できませんでした。'
      render'edit'
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :introduction)
  end
end