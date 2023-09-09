require 'rails_helper'

RSpec.describe OrderLocation, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_location = FactoryBot.build(:order_location, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'すべての入力項目が揃っていれば購入できる' do
        expect(@order_location).to be_valid
      end
    end
    context '建物名が空でも購入できるとき' do
      it '建物名は空でも購入できる' do
        @order_location.building = ''
        expect(@order_location).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'codeが空では購入できない' do
        @order_location.code = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Code can't be blank")
      end
      it 'codeは半角数字でないと購入できない' do
        @order_location.code = '１２３４５６７'
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Code should be in the format of '3 digits - 4 digits'")
      end
      it 'codeは-を含まないと登録できない' do
        @order_location.code = '1234567'
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Code should be in the format of '3 digits - 4 digits'")
      end
      it 'placeが初期値では購入できない' do
        @order_location.place_id = 1
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Place can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_location.city = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では購入できない' do
        @order_location.street = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空では購入できない' do
        @order_location.phone = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは-を含むと登録できない' do
        @order_location.phone = '090-1234-56'
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone should be 10 or 11 digits")
      end
      it 'phoneは9桁以下では登録できない' do
        @order_location.phone = '090123456'
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone should be 10 or 11 digits")
      end
      it 'phoneは12桁以上では登録できない' do
        @order_location.phone = '090123456789'
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone should be 10 or 11 digits")
      end
      it 'user_idが空では購入できない' do
        @order_location.user_id = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_location.item_id = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_location.token = ''
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Token can't be blank")
      end
    end
    
  end
end