class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: {minimum: 3 }
    validates :email,    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                         uniqueness: true
    validates :password,              format: { with: /\A^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,20}$\z/, message: 'は英字と数字両方を含むパスワードを設定してください' }
    validates :birthday
    with_options length: { maximum: 30 } do
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
        validates :first_name_kanji
        validates :last_name_kanji
       end
      with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
        validates :first_name_kana
        validates :last_name_kana
      end
    end
  end
end
