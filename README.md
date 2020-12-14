## user テーブル

| Column             | Type       | Options                                     |
| ------------------ | ---------- | ------------------------------------------- |
| nickname           | string     | null: false                                 |
| encrypted_password | string     | null: false                                 |
| email              | string     | null: false, foreign_key: true, index: true |
| first_name(kanji)  | string     | null: false                                 |
| last_name(kanji)   | string     | null: false                                 |
| first_name(kana)   | string     | null: false                                 |
| last_name(kana)    | string     | null: false                                 |
| birthday           | date       | null: false                                 |

### Association

- has_many :addresses, dependent: :destroy
- has_many :products
- has_many :comments, dependent: :destroy

## product テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| name              | string     | null: false |
| introduction      | text       | null: false |
| item_condition    | string     | null: false |
| image             | string     |             |
| price             | integer    | null: false |

### Association

- has_one :user
- has_many :comments, dependent: :destroy

##  addressテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address1         | string     | null: false                    |
| address2         | string     | null: false                    |
| telephone        | string     | null: false, unique: true      |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## user_product テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| delivery_fee_id   | integer    | null: false                    |
| delivery_area_id  | integer    | null: false                    |
| delivery_date_id  | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product


## comment テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user