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
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | date   | null: false |
### Association
- has_many :items
- has_many :orders

## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category_id  | integer    | null: false                    |
| quality_id   | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| shipping_id  | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | reference  | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :order

## ordersテーブル
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
| shipping_id   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    | 
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | integer    | null: false                    |
### Association
- belongs_to :order


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
