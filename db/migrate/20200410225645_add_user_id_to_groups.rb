class AddUserIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :user_id, :integer
  end
end
