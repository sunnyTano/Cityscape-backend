class BookingSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :listing
  attributes :id, :user, :listing, :user_id, :listing_id
end
