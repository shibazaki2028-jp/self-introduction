class SessionsController < ApplicationController
  def new
    redirect_to articles_path if admin_signed_in?
  end

  def create
    if valid_admin_credentials?(params[:username], params[:password])
      sign_in_admin!
      redirect_to articles_path, notice: "ログインしました。"
    else
      flash.now[:alert] = "ユーザー名またはパスワードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out_admin!
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
