require 'rails_helper'
RSpec.describe Account, type: :model do
  it 'should require entries for all' do
    account = Account.create(
      password: 'basketball', email: 'mark19242@gmail'
    )
    expect(account.errors[:username]).to_not be_empty
   end

   it 'should require entries for all' do
    account = Account.create(
      username: 'Mark Smith', email: 'mark19242@gmail'
    )
    expect(account.errors[:password]).to_not be_empty
   end
   
   it 'should require entries for all' do
    account = Account.create(
      password: 'basketball', username: 'Mark Smith'
    )
    expect(account.errors[:email]).to_not be_empty
   end
  #  "is too short (minimum is 5 characters)"
  it 'should be a minimum of 5 characters' do
    account = Account.create(
      password: 'basketball', username: 'Mark', email:'mark19242@gmail'
    )
    expect(account.errors[:username].first).to include("is too short (minimum is 5 characters)")
  end
  it 'should be unique' do
    account = Account.create(
      password: 'basketball', username: 'Marksmith', email:'mark19242@gmail'
    )
    account2 = Account.create(
      password: 'basketball', username: 'Marksmith', email:'mark19242@gmail'
    )
    expect(account2.errors[:username].first).to include("has already been taken")
  end

  it 'should be a minimum of 6 characters' do
    account = Account.create(
      password: 'ball', username: 'Marksmith', email:'mark19242@gmail'
    )
    expect(account.errors[:password].first).to include("is too short (minimum is 6 characters)")
  end

  it 'should be unique' do
    account = Account.create(
      password: 'basketball', username: 'Marksmith', email:'mark19242@gmail'
    )
    account2 = Account.create(
      password: 'basketball', username: 'Marksmith', email:'mark19242@gmail'
    )
    expect(account2.errors[:password].first).to include("has already been taken")
  end
   
 
end


# it 'is not valid if email is less than 10 characters' do
#   scully = Contact.create(
#     name: 'Dana Scully',
#     email: 'd@f.gov',
#     phone_number: '(202) 123-4567',
#     bio: 'Doctor and FBI agent.'
#   )
#   expect(scully.errors[:email]).to_not be_empty
# end