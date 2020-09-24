# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation


# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | string | null: false |
### Association
- has_many :items
- has_one :address
- has_one :card

## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | text       | null: false                    |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| quality      | string     | null: false                    |
| postage      | string     | null: false                    |
| shipping     | string     | null: false                    |
| day          | string     | null: false                    |
| price        | integer    | null: false                    |
| cost         | integer    | null: false                    |
| sales_profit | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
### Association
- belongs_to :user

## addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    | 
| building_name | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
### Association
- belongs_to :user

## cards テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| number        | integer    | null: false                    |
| month         | integer    | null: false                    |
| year          | integer    | null: false                    |
| security_code | references | null: false, foreign_key: true |
### Association
- belongs_to :user 


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
