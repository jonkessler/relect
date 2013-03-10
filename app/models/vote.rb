class Vote < ActiveRecord::Base
  attr_accessible :candidate, :race, :rank, :user_id, :candidate_id
  
  belongs_to :race
  belongs_to :candidate
  belongs_to :user
  
  validates_presence_of :race, :candidate, :rank, :user
end
