## user テーブル

| Column             | Type       | Options                                     |
| ------------------ | ---------- | ------------------------------------------- |
| nickname           | string     | null: false                                 |
| encrypted_password | string     | null: false                                 |
| email              | string     | null: false, unique: true, index: true 　　　|
| first_name_kanji   | string     | null: false                                 |
| last_name_kanji    | string     | null: false                                 |
| first_name_kana    | string     | null: false                                 |
| last_name_kana     | string     | null: false                                 |
| birthday           | date       | null: false                                 |

### Association

- has_many :products
- has_many :user_products

## product テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| delivery_date_id  | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| introduction      | text       | null: false                    |
| item_condition_id | integer    | null: false                    |
| price             | integer    | null: false                    |
｜ user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :user_product

##  addressテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| build            | string     |                                |
| telephone        | string     | null: false                    |
| user_product     | references | null: false, foreign_key: true |


### Association

- belongs_to :user_product

## user_product テーブル （購入履歴）

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
｜ user   | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address
