class Candidate < ActiveRecord::Base
  attr_accessible :name
  
  has_many :race_candidates
  has_many :races, :through => :race_candidates
  
  validates :name, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :race_candidates
  accepts_nested_attributes_for :races
end
