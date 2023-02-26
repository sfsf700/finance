class ChangeDataRDateToRecords < ActiveRecord::Migration[6.0]
  def change
    change_column :records, :r_date, 'date USING CAST(r_date AS date)' 
    
    
  end
end
