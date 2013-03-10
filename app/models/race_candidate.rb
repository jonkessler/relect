class RaceCandidate < ActiveRecord::Base
  attr_accessible :candidate_id, :race_id

  belongs_to :race
  belongs_to :candidate
  
  #validates_presence_of :race, :candidate
  validates_uniqueness_of :race_id, :scope => :candidate_id
end
