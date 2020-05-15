class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :authorid
      t.string :name
      t.integer :minutes

      t.timestamps
    end
  end
end
