class Food < ApplicationRecord
	before_destroy :not_referenced_by_any_line_item
	has_many :food_images, dependent: :destroy
	has_many :food_rates, dependent: :destroy
	has_many :line_items

	scope :suggest_foods, ->{order(point: :desc).take(3)}
	
	private

	def not_refereced_by_any_line_item
		unless line_items.empty?
		errors.add(:base, "Line items present")
		throw :abort
		end
	end
end
