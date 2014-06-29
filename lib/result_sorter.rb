require 'rubyfish'

class ResultSorter
  attr_reader :results

  def initialize(results)
    @results = results
  end

  def sort_by_relevance(query)
    inverse_sorted_results = results.sort_by do |result|
      relevance query, result
    end

    inverse_sorted_results.reverse
  end

  def assign_relevance(query)
    results.map {|result| assign_result_relevance result, query}
  end

private

  def relevance(query, result)
    RubyFish::JaroWinkler.distance(query, result.name) * 100
  end

  def assign_result_relevance(result, query)
    new_result = result.clone
    new_result.relevance = relevance query, result

    new_result
  end
end