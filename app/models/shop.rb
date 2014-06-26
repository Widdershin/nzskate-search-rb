class Shop
  include ShopHelper

  def search(query)
    results_page = load_search_page query
    result_chunks = separate_results results_page
    result_chunks.map { |result| parse_result_html result }
  end

  def load_search_page(query)
    PageLoader.load_page search_url query
  end

  def parse_result_html(result_html)
    Result.new(
      shop: name,
      name: parse_result_name(result_html),
      price: parse_result_price(result_html),
      url: parse_result_url(result_html),
      img: parse_result_img(result_html),
    )
  end

  def separate_results(results_page)
    not_implemented
  end

  def search_url(query)
    not_implemented
  end

  def name
    not_implemented
  end
end
