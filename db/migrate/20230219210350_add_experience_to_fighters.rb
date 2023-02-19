class AddExperienceToFighters < ActiveRecord::Migration[6.1]
  def change
    add_column :fighters, :experience, :integer
  end
end
