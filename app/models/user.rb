class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  geocoded_by :address
  after_validation :geocode
end
