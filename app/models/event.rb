class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :attendees, class_name: 'User'

  validates :name, presence: true, length: {maximum: 100}
  validates :date, :location, :content, presence: true 
end
