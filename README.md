# しばいぬのScrapbook（Rails版）

作者個人の好みや日記などを残せるサイト。静的HTML/CSSから Ruby on Rails に移行しました。

## 使用技術

- Ruby on Rails 8
- SQLite3
- HTML / CSS（既存デザインを維持）

## 機能

- **公開ページ**: ホーム、好きなアーティスト、日記、追加ログなど（未ログインでも閲覧可能）
- **記事一覧**: 管理者が作成した記事をトップページに表示
- **管理者のみ**: `/login` からログイン後、記事の作成・編集・削除（`/articles`）

## セットアップ

```bash
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
cd self-intro_page
bin/setup
```

開発用の既定パスワードは `changeme`（ユーザー名 `admin`）です。本番では必ず環境変数を設定してください。

```bash
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=your-strong-secret-password
bin/rails server
```

ブラウザで http://localhost:3000 を開きます。

## 管理者認証について

単一の特権管理者向けに、セッションと環境変数による認証を採用しています。

- パスワードはソースコードに含めません
- ログイン試行は `ActiveSupport::SecurityUtils.secure_compare` でタイミング攻撃を緩和
- 記事の CRUD ルートは `before_action :authenticate_admin!` で保護
- 記事の個別URL（`show`）は公開していません（トップページでの閲覧のみ）

## 作成者

専修大学 ネットワーク情報学部 芝﨑弘人（2028年卒業予定）
