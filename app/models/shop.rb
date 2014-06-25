class Shop
  def search(query)
    results_page = load_search_page query
    result_chunks = separate_results results_page
    result_chunks.map { |result| parse_result_html result }
  end

  def load_search_page(query)
    PageLoader.load_page search_url query
  end

  def search_url(query)
    "http://example.com/#{query}"
  end

  def separate_results(results_page)
    raise 'Not Implemented, Abstract Base Class'
  end

  def parse_result_html(result_html)
    raise 'Not Implemented, Abstract Base Class'
  end
end
