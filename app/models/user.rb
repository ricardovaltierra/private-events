class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_and_belongs_to_many :attended_events, foreign_key: 'event_id', class_name: "Event"
end
