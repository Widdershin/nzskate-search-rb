require 'rails_helper'

describe Shop, :type => :model do
  let (:query) { 'test' }
  let (:page) { double(:page) }
  let (:shop) { Shop.new }

  before do
    allow(shop).to receive(:load_search_page).and_return(page)
    allow(shop).to receive(:parse_search_page)
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
end
