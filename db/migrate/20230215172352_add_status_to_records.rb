class AddStatusToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :status, :integer ,null: false
  end
end