class Shop
  attr_reader :plugin

  def initialize(plugin)
    @plugin = plugin
  end

  def search(query)
    results_page = plugin.load_search_page query
    plugin.parse_search_page results_page
  end
end
