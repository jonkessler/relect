class Race < ActiveRecord::Base
  attr_accessible :position, :votes_attributes, :race_candidates_attributes

  belongs_to :election
  has_many :race_candidates
  has_many :candidates, :through => :race_candidates
  has_many :votes

  accepts_nested_attributes_for :race_candidates, :allow_destroy => true
  accepts_nested_attributes_for :votes
  
  validates_presence_of :position, :election
end
