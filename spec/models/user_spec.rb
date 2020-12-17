require 'rails_helper'
describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '登録できる' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '登録できない' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailがない場合は登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordがない場合は登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_name_kanjiがない場合は登録できないこと' do
        @user.first_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'last_name_kanjiがない場合は登録できないこと' do
        @user.last_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'first_name_kanaがない場合は登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaがない場合は登録できないこと' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birthdayがない場合は登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailの中間に@がない場合、登録できないこと' do
        @user.email = 'email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが6文字以下であれば登録できないこと' do
        @user.password = '123d5'
        @user.password_confirmation = '123d5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password は英字と数字両方を含むパスワードを設定してください')
      end
      it 'passwordが数字のみの場合、登録できないこと' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字両方を含むパスワードを設定してください')
      end
      it 'passwordが英字のみの場合、登録できないこと' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字両方を含むパスワードを設定してください')
      end
      it 'passwordが全角文字の入力の場合、登録できないこと' do
        @user.password = 'あいうえお'
        @user.password_confirmation = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password は英字と数字両方を含むパスワードを設定してください')
      end
      it 'first_name_kanjiが全角入力でなければ登録できないこと' do
        @user.first_name_kanji = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid')
      end
      it 'last_name_kanjiが全角入力でなければ登録できないこと' do
        @user.last_name_kanji = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji is invalid')
      end
      it 'first_name_kanaが全角入力でなければ登録できないこと' do
        @user.first_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'last_name_kanaが全角入力でなければ登録できないこと' do
        @user.last_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
    end
  end
end
