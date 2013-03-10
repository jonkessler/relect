class Election < ActiveRecord::Base
  attr_accessible :name

  has_many :ballots
  has_many :races
  
  validates_presence_of :name
end
