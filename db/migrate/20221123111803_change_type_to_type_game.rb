class ChangeTypeToTypeGame < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :type, :game_type
  end
end
