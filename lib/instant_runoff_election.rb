class InstantRunoffElection
  def initialize(ballots)
    @ballots = Marshal.load(Marshal.dump(ballots))
  end

  def run!
    #TODO: eliminate candidates with no votes in any particular round
    
    results = nil
    rounds = []
    loop do
      # remove empty ballots
      @ballots.reject!(&:empty?)

      results = @ballots.map(&:first).group_by{|c| c}.map{|candidate, votes| [candidate, votes.size]}.sort{|a, b| b[1] <=> a[1]}
      rounds << results.dup
      break if results.size <= 2 || results.first[1] >= (@ballots.size / 2.0).ceil

      eliminated_candidate = results.last[0]
      @ballots.each do |ballot|
        ballot.reject!{|vote| vote == eliminated_candidate}
      end
    end

    {:results => results, :rounds => rounds}
  end
end