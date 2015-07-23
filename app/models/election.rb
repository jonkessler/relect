class Election < ActiveRecord::Base
  attr_accessible :name, :races_attributes, :locked

  has_many :races

  accepts_nested_attributes_for :races

  validates_presence_of :name

  def results
    {}.tap do |results|
      races.each do |race|
        results[race.position] = race.results
      end
    end
  end
end
