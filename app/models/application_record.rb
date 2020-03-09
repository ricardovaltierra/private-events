class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  default_scope -> { order(date: :desc) } 

   # def self.past    
  #   Event.all.where("date < ?", Time.now)    
  # end

  scope :past, -> { where("date < ?", Time.now) }

  # def self.upcoming
  #   Event.all.where("date > ?", Time.now)
  # end

  scope :upcoming, -> { where("date > ?", Time.now) }

  
end
