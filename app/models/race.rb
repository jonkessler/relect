class Race < ActiveRecord::Base
  attr_accessible :position

  belongs_to :election
  has_many :race_candidates
  has_many :candidates, :through => :race_candidates
end
