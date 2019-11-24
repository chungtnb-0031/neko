class AddFoodIdToFoodRates < ActiveRecord::Migration[5.2]
  def change
    add_column :food_rates, :food_id, :integer
  end
end
