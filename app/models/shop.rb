class Shop
  def search(query)
    results_page = load_search_page query
    parse_search_page results_page
  end
end
