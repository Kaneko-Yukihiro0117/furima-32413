class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :introduction
    validates :image, length: { minimum: 1 }, unless: :was_attached?

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
