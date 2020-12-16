class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: {minimum: 3 }
    # ニックネームの文字数を１文字や２文字にされないよう３文字以上の制約をつける
    validates :email,    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                         uniqueness: true
    #  メールアドレスに一意性のあるバリテーションをつける、また@をを含む正しい形式で入力されている
    validates :password,              format: { with: /\A^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,20}$\z/, message: 'は英字と数字両方を含むパスワードを設定してください' }
     # 英字と数字の両方を含む6文字以上20文字以下
    validates :birthday
    with_options length: { maximum: 30 } do
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
        validates :first_name_kanji
        validates :last_name_kanji
    # 全角漢字。平仮名。カタカナを取り入れる。また文字数無制限にされても困るので30文字で留める。
       end
      with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
        validates :first_name_kana
        validates :last_name_kana
    # カタカナのみと設定、また文字数無制限にされても困るので30文字で留める。
      end
    end
  end
end
