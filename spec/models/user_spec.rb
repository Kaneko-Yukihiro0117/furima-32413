require 'rails_helper'
describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
  
  it "全ての項目の入力が存在すれば登録できること" do
    expect(@user).to  be_valid
  end
  it "nicknameがない場合は登録できないこと" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to  include("can't be blank")
    #ニックネームが必須 
  end
  it  "emailがない場合は登録できないこと" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to  include("can't be blank")
  end
  it "passwordがない場合は登録できないこと" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to  include("can't be blank")
  end
  it "encrypted_passwordがない場合は登録できないこと" do
    @user.encrypted_password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("can't be blank")
  end
   #パスワードが必須
   it "first_name_kanjiがない場合は登録できないこと" do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
  end
  it "first_name_kanaがない場合は登録できないこと" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("can't be blank")
  end
  it "last_name_kanjiがない場合は登録できないこと" do
    @user.last_name_kanji = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("can't be blank")
  end
  it "last_name_kanaがない場合は登録できないこと" do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("can't be blank")
  end
  #ユーザー本名が、名字と名前でそれぞれ必須 & ユーザー本名のフリガナが、名字と名前でそれぞれ必須
  it "birthdayがない場合は登録できないこと" do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("can't be blank")
  end
  #生年月日が必須
  it "重複したemailが存在する場合登録できないこと" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    # 2人目のユーザー
    another_user.valid?
    expect(another_user.errors.full_messages).to  include("has already been taken")
  end
  #メールアドレスは一意である
  it "emailの中間に@がない場合、登録できないこと" do
    @user.email = "email"
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid") 
  end
  #メールアドレスは@とドメインを含む必要がある
  it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
    @user.encrypted_password = "" 
    # 故意に確認用のパスワードを空にしてみる
    @user.valid?
    expect(@user.errors.full_messages).to include("can't be blank", "is too short (minimum is 6 characters)", "は英字と数字両方を含むパスワードを設定してください")
  end
  #パスワードは確認用を含めて2回入力する
  it "passwordが数字と英字を含む6文字の場合、登録できること" do
    @user.password = "1a2b3c"
    @user.password_confirmation = "1a2b3c"
    expect(@user).to be_valid
  end
  it "passwordが6文字以下であれば登録できないこと" do
    @user.password = "123d5"
    @user.encrypted_password = "123d5"
    @user.valid?
    expect(@user.errors.full_messages).to include("は英字と数字両方を含むパスワードを設定してください")
  end
  #パスワードは6文字以上
  it "passwordが数字のみの場合、登録できないこと" do
    @user.password = "1234567"
    @user.encrypted_password = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("は英字と数字両方を含むパスワードを設定してください")
  end
  it "passwordが英字のみの場合、登録できないこと" do
    @user.password = "abcdefg"
    @user.encrypted_password = "abcdefg"
    @user.valid?
    expect(@user.errors.full_messages).to include("は英字と数字両方を含むパスワードを設定してください")
  end
  it 'first_name_kanjiが全角入力でなければ登録できないこと' do
    @user.first_name_kanji = "kana"
    # 故意に半角入力にしてみる
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid")
  end
  it 'last_name_kanjiが全角入力でなければ登録できないこと' do
    @user.last_name_kanji = "kana"
    # 故意に半角入力にしてみる
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid")
  end
  #ユーザー本名は全角で入力させる
  it 'first_name_kanaがカタカナでなければ登録できないこと' do
    @user.first_name_kana = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid")
  end 
  it 'last_name_kanaがカタカナでなければ登録できないこと' do
    @user.last_name_kana = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid")
  end
  it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
    @user.first_name_kana = "あいうえお"
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid")
  end

  it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
    @user.last_name_kana = "あいうえお"
    @user.valid?
    expect(@user.errors.full_messages).to include("is invalid")
  end
  #ユーザー本名のフリガナは全角で入力させる
    end
  end
end