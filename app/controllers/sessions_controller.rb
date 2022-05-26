class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: :create

  def create
    # model/user.rb記載
    if (user = User.find_or_create_from_auth_hash(auth_hash))
      log_in user
    end
    redirect_to boards_path, success: 'ログインしました！'
  end

  def destroy
    log_out
    redirect_to root_path, success: 'ログアウトしました！'
  end

  private

  def auth_hash
    # 公式より。
    # authentication hashにアクセスできる
    request.env['omniauth.auth']
  end
end
