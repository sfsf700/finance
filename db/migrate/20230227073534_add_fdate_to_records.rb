class AddFdateToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :fdate, :date, null: false
  end
end
