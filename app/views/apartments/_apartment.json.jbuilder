json.extract! apartment, :id, :address1, :address2, :city, :postalcode, :state, :country, :owner_id, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)