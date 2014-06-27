require 'rubyfish'

module ResultSorter
  def self.sort_results_by_relevance(query, results)
    results.sort_by do |result|
      RubyFish::DamerauLevenshtein.distance(query, result.name)
    end
  end
end