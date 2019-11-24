class AddPointToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :point, :integer
  end
end
