# ApplicationName
Finance

# ApplicationDescription



# Development Reason







# URL



# Development Environment(local)
Ruby 2.6.8
Rails 6.06
MySQL 5.6.51

# Development Environment(public)
Ruby 2.6.8
Rails 6.0.6



# users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| admin              | boolean | default: false            |


## Association
 has_many :finances
 has_many :genres
 has_many :stocks


## finances table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| price    | string     | null: false                    |
| memo     | string     | null: false                    |
| fin_date | time       | null: false                    |
| genre_id | references | null: false                    |
| user_id  | references | null: false, foreign_key: true | 

## Association
 belongs_to :user

## genres table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| genre_name | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true | 

## Association
 belongs_to :user
 bas_one :finance

## stocks table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| st_name  | string     | null: false                    |
| quantity | int        | null: false                    |
| st_date  | time       | null: false                    |
| user_id  | references | null: false, foreign_key: true | 

## Association
 belongs_to :user
 


# finance
