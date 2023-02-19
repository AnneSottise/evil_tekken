class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :life
      t.integer :attack
      t.integer :defense
      t.string :avatar

      t.timestamps
    end
  end
end

# Ideas
# Add a signature phrase
# Add a special skill
# Add level
