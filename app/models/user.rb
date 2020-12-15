class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  #, length: { maximum: 10 }# ニックネーム 文字数無制限にされても困るので10文字で留める。
  validates :email, presence: true
  #, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } #  メールアドレスに一意性のあるバリテーションをつける、また@をを含む正しい形式で入力されている
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i, message: 'は英字と数字両方を含むパスワードを設定してください' }
  # 英字と数字の両方を含む6文字以上128文字以下
  validates :first_name_kanji, :last_name_kanji, presence: true, length: { maximum: 30 }, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }
  validates :first_name_kana, :last_name_kana, presence: true, length: { maximum: 30 }, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
  # 上の行は漢字平仮名、下の行はカタカナのみと設定、また文字数無制限にされても困るので30文字で留める。
  validates :birthday, presence: true
end
