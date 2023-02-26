class ChangeDataRDateToRecords < ActiveRecord::Migration[6.0]

  def chnage
    change_column :records, :r_date, :date
  end
end
