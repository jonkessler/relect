class Vote < ActiveRecord::Base
  attr_accessible :candidate_id, :race_id, :rank
  
  belongs_to :race
  belongs_to :candidate
  
  validates_presence_of :race, :candidate, :rank
  #validates_uniqueness_of :rank, :scope => [:candidate_id, :race_id]
  #validates_uniqueness_of :candidate_id, :scope => [:race_id, :rank]
  #validates_numericality_of :rank, :greater_than => 0, :less_than => lambda {|vote| vote.race.candidates.size}
end
