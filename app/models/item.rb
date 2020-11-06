class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, :explanation, :image
    validates :category_id, numericality: { other_than: 0 }
    validates :product_condition_id, numericality: { other_than: 0 }
    validates :delivery_fee_id, numericality: { other_than: 0 }
    validates :shipment_source_id, numericality: { other_than: 0 }
    validates :days_id, numericality: { other_than: 0 }
    validates :selling_price,  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end




  include ActiveHash::Associations
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day
end
