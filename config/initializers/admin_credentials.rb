# 単一の特権管理者: ユーザー名とパスワードは環境変数で設定（本番では必須）
module AdminCredentials
  module_function

  def username
    ENV.fetch("ADMIN_USERNAME", "admin")
  end

  def password
    ENV.fetch("ADMIN_PASSWORD") do
      if Rails.env.development?
        "changeme"
      else
        raise KeyError, "ADMIN_PASSWORD environment variable is required in production"
      end
    end
  end
end
