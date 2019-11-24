class CreateCatRates < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rates do |t|
      t.integer :rate_point
      t.string :comment
      t.references :user
      t.references :cat

      t.timestamps
    end
  end
end
