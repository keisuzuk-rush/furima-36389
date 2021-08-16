class Item < ApplicationRecord
	belongs_to :user
	has_one_attached :image

	with_options presence: ture do
		validates :text
		validates :name
		validates :category_id
		validates :condition_id
		validates :shipping_cost_id
		validates :prefecture_id
		validates :delivery_time_id
		validates :price
	end
end
