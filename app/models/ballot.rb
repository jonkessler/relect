class Ballot < ActiveRecord::Base
  attr_accessible :votes, :election
  
  has_many :votes
  belongs_to :election
  
  validates_presence_of :election
end
