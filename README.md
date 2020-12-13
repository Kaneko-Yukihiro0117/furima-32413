## user テーブル

| Column   | Type   | Options                                     |
| -------- | ------ | ------------------------------------------- |
| nickname | string | null: false                                 |
| password | string | null: false                                 |
| email    | string | null: false, foreign_key: true, index: true |

### Association

- has_one  :profile, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :products
- has_many :comments, dependent: :destroy

## product テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| introduction   | text       | null: false                    |
| brand          | references |              foreign_key: true |
| item_condition | string     | null: false                    |
| image          | string     |                                |
| delivery_fee   | string     | null: false                    |
| delivery_area  | string     | null: false                    |
| delivery_date  | string     | null: false                    |
| category       | references | null: false, foreign_key: true |
| price          | integer    | null: false                    |

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
| card_number      | string     | null: false                    |
| code             | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| telephone        | integer    | unique: true                   |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

##  profileテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| first_name(kanji) | string     | null: false                    |
| last_name(kanji)  | string     | null: false                    |
| first_name(kana)  | string     | null: false                    |
| last_name(kana)   | string     | null: false                    |
| birthday_year     | date       | null: false                    |
| birthday_month    | date       | null: false                    |
| birthday_day      | date       | null: false                    |
| user              | references | null: false, foreign_key: true |

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