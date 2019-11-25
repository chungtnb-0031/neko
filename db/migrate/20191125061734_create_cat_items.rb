class CreateCatItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_items do |t|
      t.references :cat, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
