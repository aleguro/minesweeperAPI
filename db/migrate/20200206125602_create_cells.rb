class CreateCells < ActiveRecord::Migration[5.2]

  def change

    create_table :cells do |t|

      t.references :game, foreign_key: true
      t.integer :x
      t.integer :y
      t.integer :mined, default: 0
      t.integer :status

      t.timestamps
    end
  end
end
