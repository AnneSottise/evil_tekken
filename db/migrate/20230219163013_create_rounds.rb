class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.belongs_to :fight
      t.belongs_to :attacker
      t.belongs_to :defenser
      t.integer :position
      t.decimal :damage
      t.decimal :defenser_life

      t.timestamps
    end
  end
end
