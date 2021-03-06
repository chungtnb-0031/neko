class Food < ApplicationRecord
	before_destroy :not_referenced_by_any_line_item
	has_many :food_images, dependent: :destroy
	has_many :food_rates, dependent: :destroy
	has_many :line_items

	scope :suggest_foods, ->{order(point: :desc).take(3)}
	scope :get_category, ->(category){where "category = ?", category}

	def average_point
		food_rates.average(:rate_point)
	end

	def num_of_rates
		food_rates.count
	end
	
	private

	def not_refereced_by_any_line_item
		unless line_items.empty?
		errors.add(:base, "Line items present")
		throw :abort
		end
	end
end
