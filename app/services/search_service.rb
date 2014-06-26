module SearchService
  def self.search query
    shop_plugins.map { |shop| shop.search query }.flatten
  end

  def self.shop_plugins
    [
      UltimateBoards.new,
      HyperRide.new
    ]
  end
end