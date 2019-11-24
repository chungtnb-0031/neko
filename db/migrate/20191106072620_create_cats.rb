class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :category
      t.string :description
      t.integer :price
      t.boolean :available

      t.timestamps
    end
  end
end
