class Election < ActiveRecord::Base
  attr_accessible :name, :races_attributes

  has_many :races

  accepts_nested_attributes_for :races

  validates_presence_of :name

  def results

  end
end
