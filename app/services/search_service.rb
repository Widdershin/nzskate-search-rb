module SearchService
  def self.search query
    results = []

    shop_plugins.each do |shop|
      results += shop.search(query)
    end

    results
  end

  def self.shop_plugins
    [
      UltimateBoards.new,
      HyperRide.new
    ]
  end
end