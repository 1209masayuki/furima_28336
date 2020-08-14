class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :name, :info, :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, :price, :user, :image, presence: true
  validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end