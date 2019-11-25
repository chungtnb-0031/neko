class Cat < ApplicationRecord
	has_many :cat_images, dependent: :destroy
	has_many :cat_rates, dependent: :destroy
	has_many :cat_items, dependent: :destroy
	
	scope :suggest_cats, ->{order(point: :desc).take(3)}

	def num_of_likes
		cat_rates.where("rate_point = ?", 1).count
	end

	def num_of_rates
		cat_rates.count
	end
end
