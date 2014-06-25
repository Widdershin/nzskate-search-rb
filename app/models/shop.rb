class Shop
  def search(query)
    results_page = load_search_page query
    parse_search_page results_page
  end

  def load_search_page(query)
    PageLoader.load_page search_url query
  end

  def search_url(query)
    "http://example.com/#{query}"
  end
end
