class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :level
      t.integer :player
      t.integer :age
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
