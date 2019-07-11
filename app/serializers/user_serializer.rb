class UserSerializer < ActiveModel::Serializer
  has_many :bookings
  has_many :listings
  attributes :id, :first_name, :last_name, :email, :password_digest

end
