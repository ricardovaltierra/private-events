class Event < ApplicationRecord  
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :attendees, class_name: "User"

  # def self.past    
  #   Event.all.where("date < ?", Time.now)    
  # end

  scope :past, -> { where("date < ?", Time.now) }

  # def self.upcoming
  #   Event.all.where("date > ?", Time.now)
  # end

  scope :upcoming, -> { where("date > ?", Time.now) }
end
