class CreateJoinUsersFoods < ActiveRecord::Migration
  def change
    create_table :foods_users do |t|
      t.belongs_to :food, index: true
      t.belongs_to :user, index: true
    end

  remove_column :foods, :user_id
 end
end
