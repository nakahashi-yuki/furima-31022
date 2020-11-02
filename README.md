# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| fullname   | string  | null: false |
| name       | string  | null: false |
| birthday   | integer | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_name         | string  | null: false |
| item_explanation  | text    | null: false |
| category          | string  | null: false |
| product_condition | string  | null: false |
| delivery_fee      | integer | null: false |
| shipment_source   | string  | null: false |
| days              | string  | null: false |
| selling_price     | string  | null: false |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card_number     | integer | null: false |
| expiration_date | integer | null: false |
| security_code   | integer | null: false |

### Association
- belongs_to :item
- belongs_to :user
- has_one :street_address

## street_addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefectures   | string  | null: false |
| Municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |

### Association
- belongs_to :purchase