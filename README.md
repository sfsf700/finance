# アプリケーション名
Mocha家計簿

# アプリケーション概要

いわゆる家計簿がつけれるアプリケーション

いつ、何が、どのくらいお金が動いたのかを可視化する。
収支を登録することにより、月毎や日毎にどのくらいお金が動いたか計算する。
ユーザーが自由にカテゴリーわけすることができる。
そのカテゴリー分けしたもので、カテゴリー別にお金の動きを見ることができる。


# 開発理由

何にどのくらいお金を使っているのか、不透明になっていた。
そのため、お金のコントロールができず、お金の使い方がルーズになっていた。
このアプリを使用することで、何どのくらいお金を使っているのか可視化できるようになる。
具体的な数字で管理することで、ルーズな使い方にならないようになるのではと考え、開発に至りました。


# Development Environment(local)

Ruby 2.6.8<br>
Rails 6.0.6<br>
MySQL 5.6.51<br>


# users table
ユーザーテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


## Association
has_many :records<br>
has_many :genres


## record table
収支保存テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| price    | integer    | null: false                    |
| memo     | string     |                                |
| r_date   | time       | null: false                    |
| genre_id | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true | 
| status   | integer    | null: false                    |

## Association
belongs_to :user<br>
belongs_to :genre

## genres table
カテゴリーテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| g_name  | string     | null: false                    |
| user_id | references | null: false, foreign_key: true | 
| status   | integer    | null: false                    |

## Association
belongs_to :user<br>
has_many :records, dependent: :destroy

## 使用マニュアル

【テストアカウント】
name・・・test
password・・・test717

まず、新規会員登録をします。<br>
任意の名前、アドレス、パスワードを入力して『Sing up』をクリック。<br>
これで会員登録は完了です。設定より名前、アドレスを変更することが可能です。

家計簿をつけるには、予めカテゴリーを登録する必要があります。<br>
サインアップ後のページ、または設定より『カテゴリーを追加する』から<br>
任意のカテゴリー名で登録してください。<br>

カテゴリーを追加できたら、『入力』ページより収支登録ができます。<br>
入力ページの各項目を入力し、保存をクリックで登録完了です。<br>

登録した収支をカレンダー及び、円グラフで確認することができます。<br>
登録した内容を修正や削除が必要な場合はカレンダーページの一覧から<br>
修正・削除が可能です。<br>

家計簿の根幹機能は以上です。<br>
設定からcsvファイル出力や背景色を変更することもできます。

※renderの無料デプロイの使用上、最初のアクセスに時間がかかることがあります。