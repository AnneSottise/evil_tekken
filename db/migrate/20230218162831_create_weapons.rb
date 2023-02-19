class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :attack
      t.integer :defense
      t.string :avatar

      t.timestamps
    end
  end
end
