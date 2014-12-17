class Event < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users

  geocoded_by :address
  after_validation :geocode

  def add_player(user)
    users << user
  end

  def player_left(user)
    users.delete(user)
  end

  def playing?(user)
    users.include?(user)
  end
end
