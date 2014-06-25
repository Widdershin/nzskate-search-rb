require 'rails_helper'

describe UltimateBoards do
  let (:shop) { UltimateBoards.new }

  describe '#search_url' do
    it 'gives a search url for a query' do
      expect(shop.search_url 'test').to eq 'http://www.ultimateboards.co.nz/search/products/test'
    end

    it 'handles spaces in in the query' do
      expect(shop.search_url 'test post').to eq 'http://www.ultimateboards.co.nz/search/products/test-post'
    end
  end
end