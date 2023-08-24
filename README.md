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
| name               | string | null: false, unique: true |
| name_kana          | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| explain        | string     | null: false                    |
| category       | text       | null: false                    |
| condition      | string     | null: false                    |
| delivery_price | string     | null: false                    |
| place          | text       | null: false                    |
| days           | string     | null: false                    |
| sale_price     | string     | null: false                    |
| price          | text       | null: false                    |
| commission     | string     | null: false                    |
| profit         | string     | null: false                    |
| favorite       | text       | null: false                    |
| report         | string     | null: false                    |
| comment        | text       | null: false                    |

### Association

- has_many :orders


## addresses テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| code               | string | null: false               |
| prefecture         | string | null: false               |
| city               | string | null: false               |
| street             | string | null: false               |
| building           | string | null: false               |
| phone              | string | null: false               |

### Association

- has_many :orders

 ## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |