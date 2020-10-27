# Record

## サイト概要
私生活における、あらゆる情報を記録することができ必要であれば期限の通知、記録の可視化ができるようなサイトになっております。

## サイトURL
### ユーザー側
<https://recordrcd.work>
- テストユーザー
- Eメール：test@test.com
- パスワード：hogehoge

### 管理者側
<https://recordrcd.work/admins/sign_in>
- メールアドレス:admin@admin.com
- パスワード:adminadmin

### サイトテーマ
使い方は無限大

### テーマを選んだ理由
一つのカテゴリーに絞った記録をするサイトはよく見かけますが、自ら記録したいカテゴリーを複数作成して使用するアプリやサイトをあまり見たことがないので、実際に作ってみたいと思った事と、何より自分自身がこのサイトを使って私生活を効率化したいと思ったからでです。

### ターゲットユーザ
私生活の効率化を行いたい人

管理能力を補いたい人

### 主な利用シーン
・お金を管理をしたい人

・冷蔵庫の賞味期限を管理したい人

・カフェの滞在時間を管理したい人

など様々なことが想定されます。

## 主な使用技術

### 機能一覧
<https://docs.google.com/spreadsheets/d/1d-OfoS7b9Eoe76SxYiKflDdo67rRwzL5rM2OKqPBY0M/edit#gid=0>

### フロントエンド
- HTML&CSS
- Javascript

### バックエンド
- Ruby
- Ruby on Rails

### テスト
- RSpec （model/system）

### その他
- 開発環境（vagrant,virtual_box）
- 本番環境・デプロイ（AWS EC2,capistrano,Nginx,mysql）
- ドメイン取得
- SSL認証、HTTPS

### 管理者機能
- 会員の一覧
- お問い合わせ返信（Action Mailer使用）

### その他機能
- カレンダー機能
- 検索ができる検索窓
- キーワード、タイトル、本文での部分一致絞り込みの検索 (ransack使用)
- お問い合わせフォーム（fullcalendar使用）
- 通知機能（Action Mailer、whenever、cron使用）
- 数値を入れた際にグラフでチェックできる（chartkick使用）
- 投稿機能（非同期通信）
- 削除機能 （非同期通信）
- カテゴリー機能（投稿する際に選択することでカテゴリー別に投稿が可能)
- pagination機能
- devese 、その他のエラー文の日本語化

