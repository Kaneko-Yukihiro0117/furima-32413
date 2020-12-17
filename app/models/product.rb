class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_delivery
  has_many_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :introduction
    validates :image, length: { minimum: 1, maximum: 10 }

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :item_condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_date_id
    end

    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than: 9_999_999 }
  end
end
