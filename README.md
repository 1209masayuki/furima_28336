# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_date      | date    | null: false |

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false,                   |
| category_id            | integer    | null: false,                   |
| sales_status_id        | integer    | null: false,                   |
| shipping_fee_status_id | integer    | null: false,                   |
| prefecture_id          | integer    | null: false,                   |
| scheduled_delivery_id  | integer    | null: false,                   |
| price                  | integer    | null: false, index: true       |


## buyers テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false, default: "",      |
| prefecture_id | integer | null: false,                   |
| city          | string  | null: false, default: "",      |
| addresses     | string  | null: false, default: ""       |
| building      | string  | default: ""                    |
| phone_num     | string  | null: false, default: ""       |

## transactions テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

# モデル設計

## User モデル

### Association
* has_many :transactions

### Validates
* validates :nickname, :email, :birth_date, presence: true
* with_options presence: true do
* validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Password Include both letters numbers"}
* validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
* validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters"}
* validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
* validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"}
end

## Item モデル

### Association
* has_one :buyer
* belongs_to :transaction
* extend ActiveHash::Associations::ActiveRecordExtensions
* belongs_to_active_hash :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery

### Validates

* validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
* validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id numericality: { other_than: 1 }
* validates :name, :info, category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, :price, :user, presence: true
* validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
* validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

## Buyer モデル

### Association
* belongs_to :item
* extend ActiveHash::Associations::ActiveRecordExtensions
* belongs_to_active_hash :prefecture

### Validates

* validates :prefecture_id, numericality: { other_than: 1 }
* validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
* validates :postal_code :prefecture, :city, :addresses, :phone_num, :user, presence:true
* validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

##  Transaction モデル

### Association
* has_many :items
* belongs_to :user

### Validates
* validates :user, :item, presence: true

##  Scheduled_delivery モデル

* class Scheduled_delivery < ActiveHash::Base
self.data = [
  {}
]
end

##  Prefecture モデル

* class Prefecture < ActiveHash::Base
self.data = [
  {}
]
end

##  Shipping_fee_status モデル

* class Shipping_fee_status < ActiveHash::Base
self.data = [
  {}
]
end

##  Category モデル

* class Category < ActiveHash::Base
self.data = [
  {}
]
end

##  Sales_status モデル

* class Sales_status < ActiveHash::Base
self.data = [
  {}
]
end