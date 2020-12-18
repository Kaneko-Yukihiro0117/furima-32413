FactoryBot.define do
  factory :product do
    name                 { 'hugahuga' }
    introduction         { Faker::Lorem.sentences }
    price                { 9_999_998 }
    category_id          { 2 }
    item_condition_id    { 2 }
    prefecture_id        { 2 }
    delivery_fee_id      { 2 }
    delivery_date_id     { 2 }

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/flag.png'), filename: 'flag.png')
    end
  end
end
