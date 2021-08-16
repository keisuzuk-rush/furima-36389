class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :category
	belongs_to :condition
	belongs_to :delivery_time
	belongs_to :prefecture
	belongs_to :shipping_cost
	
	belongs_to :user
	has_one_attached :image

	with_options presence: true do
		validates :image
		validates :text
		validates :name
		with_options numericality: { other_than: 1, message: "can't be blank"} do
			validates :category_id
			validates :condition_id
			validates :shipping_cost_id
			validates :prefecture_id
			validates :delivery_time_id
		end
		validates :price, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
	end
end
