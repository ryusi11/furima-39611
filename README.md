# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item_name         | string     | null: false                    |
| explain           | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| delivery_price_id | integer    | null: false                    |
| place_id          | integer    | null: false                    |
| delivery_day_id   | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order


## locations テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| code               | string     | null: false                    |
| place_id           | integer    | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |

### Association

- belongs_to :order

 ## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :location