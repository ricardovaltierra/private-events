class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  #has_and_belongs_to_many :events
end
