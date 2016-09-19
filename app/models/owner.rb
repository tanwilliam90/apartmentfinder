class Owner < ActiveRecord::Base
  has_many :apartments
  validates :phone_number, length: { minimum: 10 }
  validates :name, :phone_number, presence: true
  
end
