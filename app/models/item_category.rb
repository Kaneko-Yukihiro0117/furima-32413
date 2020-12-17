class ItemCategory < ActiveHash::Base
  self.data = [
    { id: 0, name: 'ーー' },
    { id: 1, name: 'メンズ' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'コスメ/美容' },
    { id: 4, name: 'キッズ/ベビー/子供用品' },
    { id: 5, name: 'エンタメ/おもちゃ' },
    { id: 6, name: '楽器' },
    { id: 7, name: 'パソコン/家電' },
    { id: 8, name: 'スポーツ/アウトドア' },
    { id: 9, name: '食料品/酒/飲料水' },
    { id: 10, name: 'DIV' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :products
end
