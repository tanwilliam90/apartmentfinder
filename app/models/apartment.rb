class Apartment < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  belongs_to :owner
  validates :address1, :city, :state, :owner, presence: true

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def full_address
    full_address = address1 + ' ' + address2 + ', ' + city + ', ' + postalcode.to_s + ', ' + state + ', ' + country
  end
end
