class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  has_many :created_events, foreign_key: :user_id, class_name: "Event"
  has_and_belongs_to_many :events

  geocoded_by :address
  after_validation :geocode
end
