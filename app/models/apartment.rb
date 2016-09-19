class Apartment < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  belongs_to :owner
  validates :address1, :city, :state, :owner, presence: true

  def full_address
    full_address = address1 + ' ' + address2 + ', ' + city + ', ' + postalcode.to_s + ', ' + state + ', ' + country
  end
end
