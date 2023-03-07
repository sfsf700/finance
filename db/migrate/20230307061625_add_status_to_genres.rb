class AddStatusToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :status, :integer, null: false
  end
end
