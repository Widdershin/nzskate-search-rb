module SearchService
  def self.search query, sorter=ResultSorter
    results = shop_plugins.map { |shop| shop.search query }.flatten

    results_with_relevance = sorter.new(results).assign_relevance query

    results_with_relevance.sort_by(&:relevance).reverse
  end

  def self.shop_plugins
    [
      UltimateBoards.new,
      HyperRide.new
    ]
  end
end