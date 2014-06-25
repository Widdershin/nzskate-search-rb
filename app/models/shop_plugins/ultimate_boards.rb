class UltimateBoards < Shop
  def search_url(query)
    "http://www.ultimateboards.co.nz/search/products/#{sanitize_query query}"
  end

  def separate_results(page)
    page.css('.galleryImageListItem')
  end

  def parse_result_name(result_html)
    result_html.at_css('img')['alt']
  end

  def parse_result_price(result_html)
    result_html.at_css('.amount').text.to_i
  end

  def parse_result_url(result_html)
    result_html.at_css('a')['href']
  end

  def parse_result_img(result_html)
    result_html.at_css('img')['src']
  end

private

  def sanitize_query(query)
    query.gsub(' ', '-')
  end
end