class AddAdjacentsCountToCells < ActiveRecord::Migration[5.2]
  def change

    add_column :cells, :adjacents, :integer, default: 0
  end
end
