require 'rails_helper'

describe Shop, :type => :model do
  let (:query) { 'test' }
  let (:page) { double(:page) }
  let (:result) { double(:result) }
  let (:result_chunks) { [result] * 2 }
  let (:shop) { Shop.new }

  before do
    allow(PageLoader).to receive(:load_page).and_return(page)
    allow(shop).to receive(:separate_results).with(page).and_return(result_chunks)
    allow(shop).to receive(:parse_result_html).with(result).and_return(result)
  end

  it "searches for items and returns a list of results" do
    expect(shop.search(query)).to eq [result] * 2
  end

  describe "scraping process" do
    it "loads the search webpage" do
      expect(shop).to receive(:load_search_page).with(query).and_call_original
    end

    it "breaks the html into result chunks" do
      expect(shop).to receive(:separate_results).with(page)
    end

    it "parses the result chunks into results" do
      expect(shop).to receive(:parse_result_html).exactly(2).times
    end

    after do
      shop.search(query)
    end
  end

  describe "loading the search page" do
    it "asks PageLoader for the page" do
      expect(PageLoader).to receive(:load_page).with "http://example.com/test"
      shop.load_search_page(query)
    end
  end

  it "can give a search url for a query" do
    expect(shop.search_url query).to eq "http://example.com/test"
  end
end
