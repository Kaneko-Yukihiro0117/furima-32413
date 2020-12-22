class Card
  include ActiveModel::Model
  attr_accessor :token, :user_id, :product_id, :post_code, :prefecture_id, :city, :address, :build, :telephone, :price, :image

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :token
    validates :post_code,       format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :build
    validates :telephone,       format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, build: build, telephone: telephone, order_id: order.id)
  end
end
