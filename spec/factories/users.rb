FactoryBot.define do
  factory :user do
    nickname               {Faker::Movies::HarryPotter.character}
    password               {"1a2b3cd"}
    password_confirmation  {"1a2b3cd"}
    email                  {Faker::Internet.unique.email}
    first_name_kanji       {"山田"}
    last_name_kanji        {"花子"}
    first_name_kana        {"ヤマダ"}
    last_name_kana         {"ハナコ"}
    birthday               {"2020-12-12"}
  end
end