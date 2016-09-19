require 'rails_helper'

RSpec.describe Owner, type: :model do
  it 'has to be a thing' do
    expect{Owner.new}.to_not raise_error
  end
end
