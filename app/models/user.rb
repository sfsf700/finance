class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :genres, dependent: :destroy
  has_many :records, dependent: :destroy
 

  with_options presence: true do 
    validates :name
  end

  with_options allow_blank: true do
    PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze
    validates :password, format: {with: PASSWORD_REGEX, message: "is invalid. Input half-width characters."}
  end

end