class OrdersController < ApplicationController
	before_action :set_item, only: [:index, :create]
	before_action :set_order_address, only: [:index, :new]

	def index
	end

	def new
	end

	def create
		@order_address = OrderAddress.new(order_params)
		if @order_address.valid?
			pay_item
			@order_address.save
			redirect_to root_path
		else
			render :index
		end
	end

	private

	def order_params
		params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :order_id, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
	end

	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
		Payjp::Charge.create(
			amount: @item.price,
			card: order_params[:token],
			currency: 'jpy'
		)
	end

	def set_item
		@item = Item.find(params[:item_id])
	end

	def set_order_address
		@order_address = OrderAddress.new
	end

end
