# FurimaのER図

## usersテーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nameKanji          | string | null: false |
| nameKana           | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column | Type          | Option                         |
| ------ | ------------- | ------------------------------ |
| image  | ActiveStorage |                                |
| text   | text          | null: false                    |
| name   | string        | null: false                    |
| user   | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :item

## addressesテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| postalCode      | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| houseNumber     | string     | null: false                    |
| buildingName    | string     | null: false                    |
| telephoneNumber | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
