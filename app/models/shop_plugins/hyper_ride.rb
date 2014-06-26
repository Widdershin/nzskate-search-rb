class HyperRide < Shop
  def name
    'Hyper Ride'
  end

  def base_url
    "http://www.hyperride.co.nz"
  end

  def search_url query
    "#{base_url}/product/#{sanitize query}/search#/?size=0"
  end

  def separate_results results_page
    results_page.css '#productsSection .product_item'
  end

  def parse_result_name result_html
    result_html.at_css('.product_desc').text.strip.to_s.titleize
  end

  def parse_result_url result_html
    base_url + result_html.at_css('.product_desc')['href']
  end

  def parse_result_price result_html
    extract_price result_html.at_css('.rrp').text
  end

  def parse_result_img result_html
    result_html.at_css('img')['src']
  end

private

  def sanitize query
    query.gsub ' ', '%20'
  end

  def extract_price rrp
    /[\d\.]+/.match(rrp).to_s.to_f
  end
end
