class Trip < ApplicationRecord
  belongs_to :start_place, :class_name => 'Place'
  belongs_to :finish_place, :class_name => 'Place'
  has_many :users
  has_many :trip_users
end
