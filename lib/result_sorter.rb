require 'rubyfish'

class ResultSorter
  attr_reader :results

  def initialize(results)
    @results = results
  end

  def sort_by_relevance(query)
    inverse_sorted_results = results.sort_by do |result|
      RubyFish::JaroWinkler.distance(query, result.name)
    end

    inverse_sorted_results.reverse
  end
end