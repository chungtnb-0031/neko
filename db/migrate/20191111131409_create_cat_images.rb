class CreateCatImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_images do |t|
      t.string :link
      t.integer :cat_id

      t.timestamps
    end
  end
end
