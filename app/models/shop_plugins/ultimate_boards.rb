class UltimateBoards < Shop
  def search_url(query)
    "http://www.ultimateboards.co.nz/search/products/#{sanitize_query query}"
  end

  def separate_results(page)
    page.css('.galleryImageListItem')
  end

private

  def sanitize_query(query)
    query.gsub(' ', '-')
  end
end