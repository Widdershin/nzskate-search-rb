require 'rails_helper'

shared_examples_for "a shop plugin" do
  let (:shop) { described_class.new }

 it 'has a name' do
    expect(shop.name).to eq expected_result.shop
  end

  describe '#search_url' do
    it 'gives a search url for a query' do
      expect(shop.search_url 'test').to eq expected_query_url
    end

    it 'handles spaces in the query' do
      expect(shop.search_url 'test post').to eq expected_query_url_w_spaces
    end
  end

  it 'can separate a page into results', :vcr do
    page = shop.load_search_page query_to_load

    expect(shop.separate_results page).not_to be_empty
  end

  describe 'parsing html' do
    let (:test_html) { load_html_snippet snippet_to_load }
    let (:parsed_name) { shop.parse_result_name test_html }

    it 'can parse the listing name' do
      expect(parsed_name).to eq expected_result.name
    end

    it 'titleizes the listing name' do
      expect(parsed_name).to eq parsed_name.titleize
    end

    it 'can parse the listing url' do
      expect(shop.parse_result_url test_html).to eq expected_result.url
    end

    it 'can parse the listing price' do
      expect(shop.parse_result_price test_html).to eq expected_result.price
    end

    it 'has a decimal listing price' do
      expect(shop.parse_result_price test_html).to be_a Float
    end

    it 'can parse the listing img' do
      expect(shop.parse_result_img test_html).to start_with expected_result.img
    end
  end
end