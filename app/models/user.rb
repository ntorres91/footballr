class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :events_created_by_me, foreign_key: :user_id, class_name: 'Event'
  has_and_belongs_to_many :events

  geocoded_by :address
  after_validation :geocode
end
