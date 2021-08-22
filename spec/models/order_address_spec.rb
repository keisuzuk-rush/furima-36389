require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
		@user = FactoryBot.create(:user)
		@item = FactoryBot.create(:item)
		@order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
		sleep 0.1
	end

	describe '商品購入のための情報登録' do
		context '情報の登録ができるとき' do
			it 'postal_code、prefecture_id、city、house_number、telephone_numberが存在すれば登録できる' do
				expect(@order_address).to be_valid
			end
		end
		context '情報の登録ができないとき' do
			it 'postal_codeが空では登録できない' do
				@order_address.postal_code = ''
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
			end
			it 'postal_codeが全角では登録できない' do
				@order_address.postal_code = '１２３−４５６７'
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Postal code is invalid")
			end
			it 'prefecture_idが空では登録できない' do
				@order_address.prefecture_id = ''
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
			end
			it 'cityが空では登録できない' do
				@order_address.city = ''
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("City can't be blank")
			end
			it 'house_numberが空では登録できない' do
				@order_address.house_number = ''
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("House number can't be blank")
			end
			it 'telephone_numberが空では登録できない' do
				@order_address.telephone_number = ''
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
			end
			it 'telephone_numberが全角では登録できない' do
				@order_address.telephone_number = '００００００００００'
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
			end
			it 'telephone_numberが10桁未満では登録できない' do
				@order_address.telephone_number = '000'
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
			end
			it 'telephone_numberが12桁以上では登録できない' do
				@order_address.telephone_number = '000000000000'
				@order_address.valid?
				expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
			end
		end
	end
end
