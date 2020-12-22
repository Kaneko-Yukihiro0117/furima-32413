require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  context '登録できる時' do
    it '郵便番号、都道府県、市町村、番地、建物、電話番号、トークンが存在すれば登録できる' do
      expect(@card).to be_valid
    end
    it '建物が空でも登録できる' do
      @card.build = ''
      expect(@card).to  be_valid
    end
  end
  context '登録できない時' do
    it '郵便番号が空の時は登録できない' do
      @card.post_code = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフンがないと登録できない' do
      @card.post_code = '12345678'
      @card.valid?
      expect(@card.errors.full_messages).to include('Post code is invalid')
    end
    it '都道府県が空の時は登録できない' do
      @card.prefecture_id = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が空の時は登録できない' do
      @card.city = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空の時は登録できない' do
      @card.address = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空の時は登録できない' do
      @card.telephone = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Telephone can't be blank")
    end
    it '電話番号が12桁以上の時は登録できない' do
      @card.telephone = 123_123_123_123
      @card.valid?
      expect(@card.errors.full_messages).to include('Telephone is invalid')
    end
    it '電話番号がハイフン入るとは登録できない' do
      @card.telephone = '123-12312312'
      @card.valid?
      expect(@card.errors.full_messages).to include('Telephone is invalid')
    end
    it 'トークンが空の時登録できない' do
      @card.token = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Token can't be blank")
    end
  end
  context 'アソシエーション関連' do
    it 'userと紐づいてないと、登録できない' do
      @card.user_id = nil
      @card.valid?
      expect(@card.errors.full_messages).to include("User can't be blank")
    end
    it 'productと紐づいてないと、登録できない' do
      @card.product_id = nil
      @card.valid?
      expect(@card.errors.full_messages).to include("Product can't be blank")
    end
  end
end
