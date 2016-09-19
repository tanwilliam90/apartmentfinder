require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'has to be a thing' do
    expect{Apartment.new}.to_not raise_error
  end
  it 'has info' do
    apt = Apartment.new
    apt.address1 = "7182 Sharon Drive"
    apt.address2 = "Apt #302"
    apt.city = "San Jose"
    apt.state = "CA"
    apt.country = "USA"
    apt.postalcode = 95129
    expect(apt.address1).to eq "7182 Sharon Drive"
    expect(apt.address2).to eq "Apt #302"
    expect(apt.city).to eq "San Jose"
    expect(apt.state).to eq "CA"
    expect(apt.country).to eq "USA"
    expect(apt.postalcode).to be 95129
  end
end
