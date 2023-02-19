class AddLevelToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :level, :integer
  end
end
