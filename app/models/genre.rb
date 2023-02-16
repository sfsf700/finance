class Genre < ApplicationRecord
  belongs_to :user
  has_many :records
  has_many :spendings
  validates :g_name, presence: true
end
