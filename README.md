# アプリケーション名
Finance

# アプリケーション概要

スマホで使うことを想定した家計簿アプリ。
何についてお金が動いたのか、ユーザーが自由にカテゴリーわけすることができる。
また月間や年間といった条件で、収支を表示させ、確認することができる。
収支をカレンダーや円グラフで使用して表示させるようにする。

# 開発理由

Railsの理解をより深めるため、使用したことのないgemや技術を使用しアプリ開発したかった。
今回、可読性やメンテナンス性も意識してコードを記述する。
またスマホを想定した画面設計をする。


# Development Environment(local)

Ruby 2.6.8
Rails 6.06
MySQL 5.6.51


# users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


## Association
 has_many :finances
 has_many :genres


## finances table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| price    | string     | null: false                    |
| memo     | string     | null: false                    |
| f_date   | time       | null: false                    |
| genre_id | references | null: false                    |
| user_id  | references | null: false, foreign_key: true | 

## Association
 belongs_to :user

## genres table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| g_name  | string     | null: false                    |
| user_id | references | null: false, foreign_key: true | 

## Association
 belongs_to :user
 bas_one :finance
