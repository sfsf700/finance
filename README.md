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

## Association
belongs_to :user<br>
has_many :records, dependent: :destroy