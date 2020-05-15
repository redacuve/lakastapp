class AddGoupidToRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :group_id, :integer
  end
end
