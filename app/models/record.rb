class Record < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  with_options presence: true do
    validates :price, numericality: { only_integer: true, 
      greater_than_or_equal_to: 0, less_than_or_equal_to: 2_000_000_000 },allow_blank: true
    validates :price
    validates :fdate
    validates :genre_id, numericality: {only_integer: true, message: "must exist"},allow_blank: true
    validates :status, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  end 
end
