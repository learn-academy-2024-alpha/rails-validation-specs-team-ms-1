class Account < ApplicationRecord
    has_many :addresses
    validates :username, :email, :password, presence: true
    validates :username, length: {minimum: 5}
    validates :username, uniqueness: true
    validates :password, length: {minimum: 6}
    validates :password, uniqueness: true
end

