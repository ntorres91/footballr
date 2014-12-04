class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  # geocoded_by :full_street_address   # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates
end
