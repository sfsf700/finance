class ChangeDataSDateToSpendings < ActiveRecord::Migration[6.0]
  def change
    change_column :spendings, :s_date, :date
  end
end
