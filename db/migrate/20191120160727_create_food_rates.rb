class CreateFoodRates < ActiveRecord::Migration[5.2]
  def change
    create_table :food_rates do |t|
      t.integer :rate_point
      t.string :comment

      t.timestamps
    end
  end
end
