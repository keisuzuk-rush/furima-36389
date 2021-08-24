# FurimaのER図

## usersテーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| text             | text       | null: false                    |
| name             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
