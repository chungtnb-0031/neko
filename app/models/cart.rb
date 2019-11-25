class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :cat_items, dependent: :destroy
  def add_food(food)
    current_item = line_items.find_by(food_id: food.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(food_id: food.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_cat(cat)
    cat_items.build(cat_id: cat.id)
  end
end
