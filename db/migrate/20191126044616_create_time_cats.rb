class CreateTimeCats < ActiveRecord::Migration[5.2]
  def change
    create_table :time_cats do |t|
      t.references :user, foreign_key: true
      t.references :cat, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
