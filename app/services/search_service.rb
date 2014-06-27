module SearchService
  def self.search query
    results = shop_plugins.map { |shop| shop.search query }.flatten

    ResultSorter.new(results).sort_by_relevance query
  end

  def self.shop_plugins
    [
      UltimateBoards.new,
      HyperRide.new
    ]
  end
end