module SessionsHelper
  def current_user
    # session内にuser_idが含まれていない(ログインしていない)時はnilを返す。
    # ある場合はuser_idにsession情報を格納する
    return unless (user_id = session[:user_id])
    
    @current_user ||= User.find_by(id: user_id)
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
