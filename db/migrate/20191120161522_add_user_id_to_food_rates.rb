class AddUserIdToFoodRates < ActiveRecord::Migration[5.2]
  def change
    add_column :food_rates, :user_id, :integer
  end
end
