require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '保存できる場合' do
      it '全て入力されていれば保存ができる' do
        expect(@product).to be_valid
      end
    end
    context '保存できない場合' do
      it 'nameが空の時、保存されない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'introductionが空の時、保存されない' do
        @product.introduction = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'priceが空の時、保存されない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空の時、保存されない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空の時、保存されない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Category is not a number')
      end
      it 'item_condition_idが空の時、保存されない' do
        @product.item_condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Item condition is not a number')
      end
      it 'prefecture_idが空の時、保存されない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'delivery_fee_idが空の時、保存されない' do
        @product.delivery_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee is not a number')
      end
      it 'delivery_date_idが空の時、保存されない' do
        @product.delivery_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery date is not a number')
      end
      it 'priceが半角数字以外の時、保存されない' do
        @product.price = '１２３４'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300円未満の時、保存されない' do
        @product.price = 284
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000円以上の時、保存されない' do
        @product.price = 100_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'category_idがid:0の時、保存されない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 0')
      end
      it 'item_condition_idがid:0の時、保存されない' do
        @product.item_condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Item condition must be other than 0')
      end
      it 'prefecture_idがid:0の時、保存されない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'delivery_fee__idがid:0の時、保存されない' do
        @product.delivery_fee_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee must be other than 0')
      end
      it 'delivery_date_idがid:0の時、保存されない' do
        @product.delivery_date_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery date must be other than 0')
      end
    end
    context 'アソシエーション関連' do
      it 'userと紐づいていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end

#
