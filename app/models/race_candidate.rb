class RaceCandidate < ActiveRecord::Base
  attr_accessible :candidate_id, :race_id
  
  belongs_to :race
  belongs_to :candidate
end
