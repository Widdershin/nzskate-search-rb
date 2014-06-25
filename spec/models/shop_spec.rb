require 'rails_helper'

describe Shop, :type => :model do
  let (:query) { 'test' }
  let (:page) { double(:page) }
  let (:shop) { Shop.new }

  before do
    allow(shop).to receive(:parse_search_page)
    allow(PageLoader).to receive(:load_page).and_return(page)
  end

  describe "searching" do
    it "has a search method" do
      expect{ shop.search(query) }.to_not raise_error
    end

    it "loads the search webpage" do
      expect(shop).to receive(:load_search_page).with(query)
      shop.search(query)
    end

    it "parses the html into results" do
      expect(shop).to receive(:parse_search_page).with(page)
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
