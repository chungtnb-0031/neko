class CreateCatRates < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rates do |t|
      t.integer :rate_point
      t.string :comment
      t.integer :user_id
      t.integer :cat_id

      t.timestamps
    end
  end
end
