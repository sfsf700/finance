class RemoveRDateFromRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :r_date, :date
  end
end