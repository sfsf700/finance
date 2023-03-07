class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :price, null: false
      t.time :r_date, null: false
      t.string :memo
      t.references :genre, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end