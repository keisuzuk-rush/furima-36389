require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報の登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品の登録ができる時' do
      it 'image、text、name、category_id、condition_id、shipping_cost_id、prefecture_id、delivery_time_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の登録ができない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it 'category_idが{ --- }では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択して下さい')
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end
      it 'condition_idが{ --- }では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択して下さい')
      end
      it 'shipping_cost_idが空では登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it 'shipping_cost_idが{ --- }では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択して下さい')
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it 'prefecture_idが{ --- }では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択して下さい')
      end
      it 'delivery_time_idが空では登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it 'delivery_time_idが{ --- }では登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択して下さい')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it 'priceが全角では登録できない' do
        @item.price = '０'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'a1a1'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角英語では登録できない' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが¥299以下の値では登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は299より大きい値にしてください')
      end
      it 'priceが¥10,000,000以上の値では登録できない' do
        @item.price = '9999999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は10000000より小さい値にしてください')
      end
      it 'userがいなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
