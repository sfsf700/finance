class Genre < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :g_name, presence: true
end
