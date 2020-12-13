## user テーブル

| Column             | Type       | Options                                     |
| ------------------ | ---------- | ------------------------------------------- |
| nickname           | string     | null: false                                 |
| password           | string     | null: false                                 |
| encrypted_password | string     | null: false                                 |
| email              | string     | null: false, foreign_key: true, index: true |
| first_name(kanji)  | string     | null: false                                 |
| last_name(kanji)   | string     | null: false                                 |
| first_name(kana)   | string     | null: false                                 |
| last_name(kana)    | string     | null: false                                 |
| birthday_year      | date       | null: false                                 |
| birthday_month     | date       | null: false                                 |
| birthday_day       | date       | null: false                                 |

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
| delivery_fee_id   | integer    | null: false |
| delivery_area_id  | integer    | null: false |
| delivery_date_id  | integer    | null: false |
| category_id       | integer    | null: false |
| price             | integer    | null: false |

### Association

- has_many :users
- has_many :comments, dependent: :destroy

##  addressテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | integer(7) | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address1         | string     |                                |
| address2         | string     |                                |
| telephone        | integer    | unique: true                   |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## comment テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user