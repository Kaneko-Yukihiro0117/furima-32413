class ItemDelivery < ActiveHash::Base
  self.data = [
    { id: 0, name: 'ーー' },
    { id: 1, name: '1~2日で発送' },
    { id: 2, name: '2~3日で発送' },
    { id: 3, name: '4~7日で発送' },
    { id: 4, name: '日時連絡後に発送' }
  ]

  include ActiveHash::Associations
  has_many :products
end
