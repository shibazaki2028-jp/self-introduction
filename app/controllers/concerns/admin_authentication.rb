module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :admin_signed_in?
  end

  private

  def admin_signed_in?
    session[:admin_authenticated] == true
  end

  def authenticate_admin!
    return if admin_signed_in?

    redirect_to login_path, alert: "管理者としてログインしてください。"
  end

  def sign_in_admin!
    session[:admin_authenticated] = true
  end

  def sign_out_admin!
    session.delete(:admin_authenticated)
  end

  def valid_admin_credentials?(username, password)
    ActiveSupport::SecurityUtils.secure_compare(username.to_s, AdminCredentials.username) &&
      ActiveSupport::SecurityUtils.secure_compare(password.to_s, AdminCredentials.password)
  end
end
