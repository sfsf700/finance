class ChangeDataRDateToRecords < ActiveRecord::Migration[6.0]
  def up
    
    if Rails.env.development? || Rails.env.test?
      change_column :records, :r_date, :date
    else Rails.env.production?
      # 本番環境はusingオプションを追加
      change_column :records, :r_date, 'date USING CAST(r_date AS date)'
    end
  end

  def down
    change_column :records, :r_date, :date
  end
end
