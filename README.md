# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| L_name     | string  | null: false |
| F_name     | string  | null: false |
| birthday   | date    | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| name                 | string  | null: false |
| explanation          | text    | null: false |
| category_id          | integer | null: false |
| product_condition_id | integer | null: false |
| delivery_fee_id      | integer | null: false |
| shipment_source_id   | integer | null: false |
| days_id              | integer | null: false |
| selling_price        | integer | null: false |
| user_id              |         |             |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user    | integer | null: false |
| product | integer | null: false |
| user_id |         |             |
| item_id |         |             |

### Association
- belongs_to :item
- belongs_to :user
- has_one :street_address

## street_addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefectures_id | integer | null: false |
| Municipality   | string  | null: false |
| address        | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |
| purchase_id    |         |             |

### Association
- belongs_to :purchase