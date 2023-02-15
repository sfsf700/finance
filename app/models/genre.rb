class Genre < ApplicationRecord
  belongs_to :user

  validates :g_name, presence: true
end
