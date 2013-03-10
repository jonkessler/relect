class Candidate < ActiveRecord::Base
  attr_accessible :name
  
  has_many :race_candidates
  has_many :races, :through => :race_candidates
  
  validates_presence_of :name
end
