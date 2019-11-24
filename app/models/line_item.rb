class LineItem < ApplicationRecord
  belongs_to :food
  belongs_to :cart

  def total_price
    food.price.to_i * quantity.to_i
  end
end
