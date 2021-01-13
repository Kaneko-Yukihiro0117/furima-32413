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
        expect(@product.errors.full_messages).to include('Nameを入力してください')
      end
      it 'introductionが空の時、保存されない' do
        @product.introduction = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Introductionを入力してください')
      end
      it 'priceが空の時、保存されない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Priceを入力してください')
      end
      it 'imageが空の時、保存されない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Imageを入力してください')
      end
      it 'category_idが空の時、保存されない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Categoryを入力してください')
      end
      it 'item_condition_idが空の時、保存されない' do
        @product.item_condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Item conditionを入力してください')
      end
      it 'prefecture_idが空の時、保存されない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefectureを入力してください')
      end
      it 'delivery_fee_idが空の時、保存されない' do
        @product.delivery_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery feeを入力してください')
      end
      it 'delivery_date_idが空の時、保存されない' do
        @product.delivery_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery dateを入力してください')
      end
      it 'priceが半角数字以外の時、保存されない' do
        @product.price = '１２３４'
        @product.valid?
        expect(@product.errors.full_messages).to include('Priceは数値で入力してください')
      end
      it 'priceが300円未満の時、保存されない' do
        @product.price = 284
        @product.valid?
        expect(@product.errors.full_messages).to include('Priceは300より大きい値にしてください')
      end
      it 'priceが10000000円以上の時、保存されない' do
        @product.price = 100_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Priceは9999999より小さい値にしてください')
      end
      it 'category_idがid:0の時、保存されない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Categoryは0以外の値にしてください')
      end
      it 'item_condition_idがid:0の時、保存されない' do
        @product.item_condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Item conditionは0以外の値にしてください')
      end
      it 'prefecture_idがid:0の時、保存されない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefectureは0以外の値にしてください')
      end
      it 'delivery_fee__idがid:0の時、保存されない' do
        @product.delivery_fee_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery feeは0以外の値にしてください')
      end
      it 'delivery_date_idがid:0の時、保存されない' do
        @product.delivery_date_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery dateは0以外の値にしてください')
      end
    end
    context 'アソシエーション関連' do
      it 'userと紐づいていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
