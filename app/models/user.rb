class User < ApplicationRecord
  has_many :bookings
  # has_many :new_listings
  has_many :listings
  has_secure_password
end
