class InstantRunoffElection
  def initialize(ballots, candidates)
    @ballots = Marshal.load(Marshal.dump(ballots))
    @candidates = candidates.dup
  end

  def run!
    results = []
    rounds = []
    (@candidates.size - 1).times do
      # remove empty ballots
      @ballots.reject!(&:empty?)

      results = @candidates.map{|c| [c, @ballots.map(&:first).select{|pref| c == pref}.size]}.sort{|a, b| b[1] <=> a[1]}
      rounds << results.dup
      break if results.size <= 2 || results.first[1] >= (@ballots.size / 2.0).ceil

      eliminated_candidate = results.last[0]
      @candidates -= [eliminated_candidate]
      
      @ballots.each do |ballot|
        ballot.reject!{|vote| vote == eliminated_candidate}
      end
    end

    {:results => results, :rounds => rounds}
  end
end