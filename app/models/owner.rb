class Owner < ActiveRecord::Base
  has_many :apartments
  validates :phone_number, length: { minimum: 10 }
  validates :name, :phone_number, presence: true
  has_attached_file :image, styles: { thumb: "60x60#", medium: "240x240>", large: "600x600>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
