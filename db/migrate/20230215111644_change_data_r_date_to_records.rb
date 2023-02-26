class ChangeDataRDateToRecords < ActiveRecord::Migration[6.0]

  def up
    if Rails.env.development?
      change_column :records, :r_date, :date
    else Rails.env.production?
      change_column :records, :r_date,  'date USING CAST(r_date AS date)'
    end
  end 

  def down
    change_column :records, :r_date, :date
  end
end
