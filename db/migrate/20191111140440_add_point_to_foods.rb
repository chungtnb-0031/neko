class AddPointToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :point, :integer
  end
end
