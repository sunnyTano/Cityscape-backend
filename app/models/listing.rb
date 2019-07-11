class Listing < ApplicationRecord
    has_many :bookings
    # belongs_to :user
    belongs_to :user, optional: true
end
