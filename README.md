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
| name               | string | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :addresses

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| price      | string     | null: false                    |
| comment    | text       | null: false                    |

### Association

- has_many :orders
- has_many :addresses


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