class Record < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  with_options presence: true do
    validates :price
    validates :r_date
    validates :genre_id
  end 
end
