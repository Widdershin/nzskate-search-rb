class Shop
  attr_reader :plugin

  def initialize(plugin)
    @plugin = plugin
  end

  def search(query)
    results_page = plugin.load_search_page query
  end
end
