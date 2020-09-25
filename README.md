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
| birth_day       | date   | null: false |
### Association
- has_many :items
- has_many :managements

## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | integer    | null: false                    |
| quality      | integer    | null: false                    |
| postage      | integer    | null: false                    |
| shipping     | integer    | null: false                    |
| day          | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | reference  | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :management

## managementsテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | reference  | null: false, foreign_key: true |
| item         | reference  | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    | 
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
### Association
- belongs_to :management


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
