class Event < ActiveRecord::Base
  has_many :bookings
end
