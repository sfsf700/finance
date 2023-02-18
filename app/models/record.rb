class Record < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2_000_000_000 }
    validates :r_date
    validates :genre_id
    validates :status, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  end 
end
