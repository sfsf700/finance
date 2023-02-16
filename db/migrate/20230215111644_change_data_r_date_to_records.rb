class ChangeDataRDateToRecords < ActiveRecord::Migration[6.0]
  def change
    change_column :records, :r_date, :date
    
  end
end
