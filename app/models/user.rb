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

  # VALID_EMAIL_REGEX = /^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/
  # validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX } , uniqueness: { case_sensitive: false }}
  #  メールアドレスに一意性のあるバリテーションをつける、また@をを含む正しい形式で入力されている

  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX }, length: { in: 7..128 }
  # パスワードに7文字から最大の128文字の制約をつける

  # with_options presence: true, format: { with: /^[ぁ-んァ-ヶー一-龠]+$/, message: '全角文字（漢字）を使用してください' } do
  # validates :first_name_kanji
  # validates :last_name_kanji
  # end

  # with_options presence: true, format: { with: /^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/,message: '全角文字（カナ）をしようしてください' } do
  # validates :first_name_kana
  # validates :last_name_kana
  # end

  # validates :birthday_cannot_be_in_the_future

  # def birthday_cannot_be_in_the_future
  #  生年月日が入力済、かつ未来日である条件式
  # if birthday.present? && birthday
  #  Date.today
  # エラー対象とするbirthdayのプロパティとエラーメッセージの設定
  # errors.add(:birthday,"生年月日がすでに入力済か、設定できません。")
  # end
  # end
end
