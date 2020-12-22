FactoryBot.define do
  factory :card do
    post_code      { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 1, to: 48) }
    city           { '西宮市' }
    address        { '甲子園町1-1' }
    build          { 'レオパレス201号' }
    telephone      { '09012345678' }
    token          { 'tok_01abcdefghijklmnopqrstuvwxyz' }

    association :user, :product
  end
end
