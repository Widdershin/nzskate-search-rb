class BasementSkate
  def name
    'Basement Skate'
  end

  def search_url query
    "https://www.basementskate.com.au/search.php?mode=search&substring=#{sanitize query}&including=all&by_title=on"
  end

  # def separate_results page
  #   images = page.css('.product-cell img')
  #   prices = page.css('.currency')
  # end

private

  def sanitize query
    query.gsub(' ', '+')
  end
end