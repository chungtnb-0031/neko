class Cat < ApplicationRecord
	has_many :cat_images, dependent: :destroy
	has_many :cat_rates, dependent: :destroy

	scope :suggest_cats, ->{order(point: :desc).take(3)}
end
