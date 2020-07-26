# URL
https://carewrite.info/<br>
介護施設における、利用者の管理、利用者ごとの記録保存を目的としたアプリケーションです。
企業を作成してログインすることで、利用者、記録者の登録が可能になり、利用者ごとに記録を残すことができます。<br>
各ログイン画面の、「テストログイン」をクリックすると登録作業をせずにログインできます。

![](https://user-images.githubusercontent.com/59407044/88450306-fa64b700-ce88-11ea-94e7-5a0fb91a04d6.png)


# 言語・使用技術

#### フロント
- Haml
- Scss
- Javascript

#### バックエンド
- Ruby 2.5.1
- Ruby on Rails 5.2.4

#### サーバー
- Nginx 1.16.1

#### DB
- MySQL 5.6

#### インフラ・開発環境等
- Docker/docker-compose
- AWS（VPC, EC2, Route 53）
- CircleCI（CI/CD)
- Capistrano3
- RSpec

#### AWS構成図
![](https://i.gyazo.com/494392afe85abe46f40ad78f3ae24552.png)

# 実装機能
- ユーザー機能
  - 企業登録、利用者登録、記録者登録、ログイン、ログアウト機能
- 記録投稿機能
- 記録月別標示機能
- 記録検索機能
- ページネーション機能
