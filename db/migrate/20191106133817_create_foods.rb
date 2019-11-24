class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.string :description
      t.integer :price
      t.boolean :supportable

      t.timestamps
    end
  end
end
