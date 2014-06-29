class TerrabangSkate < Shop
  def name
    'Terrabang'
  end

  def search_url query
    "http://terrabangskate.com/catalogsearch/result/?q=#{sanitize query}"
  end

  def separate_results page
    page.css('.item')
  end

  def parse_result_name(result_html)
    result_html.css('h2').text.titleize
  end

  def parse_result_price(result_html)
    Price.extract result_html.css('.price').last.text
  end

  def parse_result_url(result_html)
    result_html.at_css('.product-image')['href']
  end

  def parse_result_img(result_html)
    result_html.at_css('img')['src']
  end

private

  def sanitize query
    query.gsub(' ', '+')
  end
end