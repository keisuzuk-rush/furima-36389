class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

	def edit
		@item = Item.find(params[:id])
		if @item.user != current_user
			render :index
		end
	end

	def update
		@item = Item.find(params[:id])
		if @item.user != current_user
			render :index
		else
			if @item.update(item_params)
				redirect_to item_path
			else
				render :edit
			end
		end

	end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :text, :name, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
