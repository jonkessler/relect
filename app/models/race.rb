class Race < ActiveRecord::Base
  attr_accessible :position, :votes_attributes

  belongs_to :election
  has_many :race_candidates
  has_many :candidates, :through => :race_candidates
  has_many :votes

  accepts_nested_attributes_for :votes
  
  validates_presence_of :position, :election
end
