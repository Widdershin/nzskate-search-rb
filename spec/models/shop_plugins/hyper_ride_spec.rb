require 'rails_helper'

describe HyperRide do
  let (:shop) { HyperRide.new }

  it 'has a name' do
    expect(shop.name).to eq 'Hyper Ride'
  end

  describe '#search_url' do
    it 'gives a search url for a query' do
      expect(shop.search_url 'test').to eq 'http://www.hyperride.co.nz/product/test/search#/?size=0'
    end

    it 'handles spaces in the query' do
      expect(shop.search_url 'test post').to eq 'http://www.hyperride.co.nz/product/test%20post/search#/?size=0'
    end
  end

  it 'can separate a page into results', :vcr do
    page = shop.load_search_page('hawgs')

    expect(shop.separate_results page).not_to be_empty
  end

  it 'ignores promo results', :vcr do
    page = shop.load_search_page('splurgle')

    expect(shop.separate_results page).to be_empty
  end

  describe 'parsing html' do
    let (:test_html) { load_html_snippet 'hyper-fatty-hawgs' }

    it 'can parse the listing name' do
      expect(shop.parse_result_name test_html).to eq 'LANDYACHTZ FATTY HAWGS YELLOW 63MM 78A'
    end

    it 'can parse the listing url' do
      expect(shop.parse_result_url test_html).to eq 'http://www.hyperride.co.nz/product/longboard-wheels/402/fatty-hawgs-yellow-63mm-78a/1118860/detail'
    end

    it 'can parse the listing price' do
      expect(shop.parse_result_price test_html).to eq 79.95
    end

    it 'can parse the listing img' do
      expect(shop.parse_result_img test_html).to eq '//www.hyperride.co.nz/content/images/products/10/landyachtz-fatty-hawgs-yellow-63mm-78a-001_S.jpg'
    end
  end
end
