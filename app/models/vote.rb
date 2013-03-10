class Vote < ActiveRecord::Base
  attr_accessible :candidate, :race, :rank
  
  belongs_to :ballot
  has_one :race
  has_one :candidate
  
  validates_presence_of :race, :candidate, :ballot, :rank
  validates_uniqueness_of :rank, :scope => [:ballot_id, :candidate_id, :race_id]
  validates_numericality_of :rank, :greater_than => 0, :less_than => lambda {|vote| vote.race.candidates.size}
end
