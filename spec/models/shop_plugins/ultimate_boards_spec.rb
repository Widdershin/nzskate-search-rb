require 'rails_helper'

describe UltimateBoards do
  let (:shop) { UltimateBoards.new }

  it 'has a name' do
    expect(shop.name).to eq 'Ultimate Boards'
  end

  describe '#search_url' do
    it 'gives a search url for a query' do
      expect(shop.search_url 'test').to eq 'http://www.ultimateboards.co.nz/search/products/test'
    end

    it 'handles spaces in the query' do
      expect(shop.search_url 'test post').to eq 'http://www.ultimateboards.co.nz/search/products/test-post'
    end
  end

  it 'can separate a page into results', :vcr do
    page = shop.load_search_page('comet')

    expect(shop.separate_results page).not_to be_empty
  end

  describe 'parsing html' do
    let (:test_html) { load_html_snippet 'ub-fsm' }

    it 'can parse the listing name' do
      expect(shop.parse_result_name test_html).to eq 'Comet Flying Spaghetti Monster Drop Thru'
    end

    it 'can parse the listing url' do
      expect(shop.parse_result_url test_html).to eq 'http://www.ultimateboards.co.nz/comet-factory-stamp-marker-drop'
    end

    it 'can parse the listing price' do
      expect(shop.parse_result_price test_html).to eq 220
    end

    it 'can parse the listing img' do
      expect(shop.parse_result_img test_html).to start_with 'http://cdn2.smallfish.co.nz/images2/unknown.jpg?i=NUlRu680T'
    end
  end
end