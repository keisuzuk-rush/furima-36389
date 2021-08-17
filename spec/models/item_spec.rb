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
				expect(@item.errors.full_messages).to include("Image can't be blank")
			end
			it 'textが空では登録できない' do
				@item.text = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Text can't be blank")
			end
			it 'nameが空では登録できない' do
				@item.name = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Name can't be blank")
			end
			it 'category_idが空では登録できない' do
				@item.category_id = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Category can't be blank")
			end
			it 'condition_idが空では登録できない' do
				@item.condition_id = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Condition can't be blank")
			end
			it 'shipping_cost_idが空では登録できない' do
				@item.shipping_cost_id = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
			end
			it 'prefecture_idが空では登録できない' do
				@item.prefecture_id = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Prefecture can't be blank")
			end
			it 'delivery_time_idが空では登録できない' do
				@item.delivery_time_id = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Delivery time can't be blank")
			end
			it 'priceが空では登録できない' do
				@item.price = ''
				@item.valid?
				expect(@item.errors.full_messages).to include("Price can't be blank")
			end
			it 'priceが全角では登録できない' do
				@item.price = '０'
				@item.valid?
				expect(@item.errors.full_messages).to include("Price is not a number")
			end
			it 'priceが¥299以下の値では登録できない' do
				@item.price = '100'
				@item.valid?
				expect(@item.errors.full_messages).to include("Price must be greater than 299")
			end
			it 'priceが¥10,000,000以上の値では登録できない' do
				@item.price = '9999999999999'
				@item.valid?
				expect(@item.errors.full_messages).to include("Price must be less than 10000000")
			end
			it 'userがいなければ登録できない' do
				@item.user = nil
				@item.valid?
				expect(@item.errors.full_messages).to include("User must exist")
			end
		end
	end
end
