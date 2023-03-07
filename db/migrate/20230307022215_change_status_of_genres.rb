class ChangeStatusOfGenres < ActiveRecord::Migration[6.0]
  def up
    change_column_null :genres, :status, :integer, null: false, default: 0
  end

  def down
    change_column_null :genres, :status, :integer, null: false
  end
end
