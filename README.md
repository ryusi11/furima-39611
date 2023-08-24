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
| last_name          | string | null: false, unique: true |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false, unique: true |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item_name      | string     | null: false                    |
| explain        | string     | null: false                    |
| category       | text       | null: false                    |
| condition      | string     | null: false                    |
| delivery_price | string     | null: false                    |
| place          | text       | null: false                    |
| days           | string     | null: false                    |
| price          | text       | null: false                    |
| comment        | text       |                                |

### Association

- belongs_to :user
- has_one :order


## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| code               | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     | null: false                    |
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
- has_one :address