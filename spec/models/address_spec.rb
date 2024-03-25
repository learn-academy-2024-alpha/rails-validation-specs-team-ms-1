require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should have a street number'do
    address = Address.create(
      street_name: 'Main St', city: 'Austin', state: 'Texas', zip: 12345
    )
    expect(address.errors[:street_number]).to_not be_empty
end

it 'should have a street name'do
    address = Address.create(
      street_number: 234, city: 'Austin', state: 'Texas', zip: 12345
    )
    expect(address.errors[:street_name]).to_not be_empty
end

it 'should have a city'do
    address = Address.create(
      street_name: 'Main St', street_number: 234, state: 'Texas', zip: 12345
    )
    expect(address.errors[:city]).to_not be_empty
end

it 'should have a state'do
    address = Address.create(
      street_name: 'Main St', city: 'Austin', street_number: 234 , zip: 12345
    )
    expect(address.errors[:state]).to_not be_empty
end

it 'should have a zip'do
    address = Address.create(
      street_name: 'Main St', city: 'Austin', street_number: 234 , state: 'Texas'
    )
    expect(address.errors[:zip]).to_not be_empty
end
end
