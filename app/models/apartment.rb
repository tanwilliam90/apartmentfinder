class Apartment < ActiveRecord::Base
  belongs_to :owner
  validates :address1, :city, :state, :owner, presence: true
end
