class Vote < ActiveRecord::Base
  attr_accessible :ballot_id, :candidate_id, :race_id, :rank
  
  belongs_to :ballot
  has_one :race
  has_one :candidate
  
  validates_uniqueness_of :rank, :scope => [:ballot_id, :candidate_id, :race_id]
end
