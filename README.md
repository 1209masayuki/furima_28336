# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| password   | string  | null: false |
| email      | string  | null: false |
| first_name | string  | null: false |
| last_name  | string  | null: false |
| birth_date | integer | null: false |

### Association

- has_many :items
- has_many :sellers
- has_many :tokens
- has_many :buyers

## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| image         | string  | null: false                    |
| price         | integer | null: false                    |
| item_name     | string  | null: false                    |
| user_id(FK)   | integer | null: false, foreign_key: true |
| seller_id(FK) | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :sellers

## sellers テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| info                | text    | null: false,                   |
| category            | string  | null: false,                   |
| sales_status        | string  | null: false,                   |
| shipping_fee_status | string  | null: false,                   |
| prefecture          | string  | null: false,                   |
| scheduled_delivery  | string  | null: false,                   |
| user_id(FK)         | integer | null: false, foreign_key: true |
| item_id(FK)         | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## tokens テーブル

| Column      | Type    | Options                        |
| ----------  | ------- | ------------------------------ |
| num         | integer | null: false                    |
| period      | integer | null: false                    |
| secure_num  | integer | null: false                    |
| user_id(FK) | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :buyers

## buyers テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal_code  | integer | null: false,                   |
| prefecture   | string  | null: false,                   |
| city         | string  | null: false,                   |
| addresses    | string  | null: false,                   |
| phone_num    | integer | null: false,                   |
| token_id(FK) | integer | null: false, foreign_key: true |
| user_id(FK)  | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :tokens