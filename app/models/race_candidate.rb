class RaceCandidate < ActiveRecord::Base  
  belongs_to :race
  belongs_to :candidate
  
  validates_presence_of :race, :candidate
end
