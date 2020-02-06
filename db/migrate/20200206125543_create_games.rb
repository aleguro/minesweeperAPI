class CreateGames < ActiveRecord::Migration[5.2]

  def change

    create_table :games do |t|

      t.integer :cols
      t.integer :rows
      t.integer :status
      t.integer :mines_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
