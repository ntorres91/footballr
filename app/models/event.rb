class Event < ActiveRecord::Base
  has_many :bookings
  has_and_belongs_to_many :users
end

my_event = Event.find()
my_event.users << current_user
my_event.users.delete(current_user)
