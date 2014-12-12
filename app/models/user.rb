class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :events

  geocoded_by :address
  after_validation :geocode
end
