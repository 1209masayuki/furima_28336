# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| password   | string  | null: false |
| email      | string  | null: false |
| first_name | string  | null: false |
| last_name  | string  | null: false |
| birth_date | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| image               | string  | null: false                    |
| price               | integer | null: false                    |
| item_name           | string  | null: false                    |
| info                | text    | null: false,                   |
| category            | string  | null: false,                   |
| sales_status        | string  | null: false,                   |
| shipping_fee_status | string  | null: false,                   |
| prefecture          | string  | null: false,                   |
| scheduled_delivery  | string  | null: false,                   |
| user_id(FK)         | integer | null: false, foreign_key: true |

### Association

- belongs_to :users

## buyers テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal_code  | integer | null: false,                   |
| prefecture   | string  | null: false,                   |
| city         | string  | null: false,                   |
| addresses    | string  | null: false,                   |
| phone_num    | integer | null: false,                   |
| user_id(FK)  | integer | null: false, foreign_key: true |

### Association

- belongs_to :users