# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| encrypted_password   | string  | null: false |
| last_name            | string  | null: false |
| first_name           | string  | null: false |
| L_name               | string  | null: false |
| F_name               | string  | null: false |
| birthday             | date    | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| name                 | string     | null: false       |
| explanation          | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| delivery_fee_id      | integer    | null: false       |
| shipment_source_id   | integer    | null: false       |
| day_id               | integer    | null: false       |
| selling_price        | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :street_address

## street_address テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| purchase       | references | foreign_key: true |

### Association
- belongs_to :purchase


## comments テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| comments | text       |                   |
| item_id  | references | foreign_key: true |
| user_id  | references | foreign_key: true |