class CreateFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fighters do |t|
      t.belongs_to :character
      t.belongs_to :fight
      t.belongs_to :weapon
      t.boolean :victory

      t.timestamps
    end
  end
end
