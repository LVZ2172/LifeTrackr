class ChangeFoodColumn < ActiveRecord::Migration
  def up
    change_column :foods, :calories, :float
  end

  def down
    change_column :foods, :calories, :integer
  end
end
