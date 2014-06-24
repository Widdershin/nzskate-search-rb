require 'rails_helper'

describe Shop, :type => :model do
  let (:query) { 'test' }
  let (:page) { double(:page) }

  let (:plugin) do
    double(
      :plugin,
      load_search_page: page,
      parse_search_page: []
    )
  end

  let (:shop) { Shop.new(plugin) }

  it 'takes a store plugin' do
    expect(shop.plugin).to eq plugin
  end

  describe "searching" do
    it "has a search method" do
      expect{ shop.search(query) }.to_not raise_error
    end

    it "loads the plugin's webpage" do
      expect(plugin).to receive(:load_search_page).with(query)
      shop.search(query)
    end

    it "parses the html into results" do
      expect(plugin).to receive(:parse_search_page).with(page)
      shop.search(query)
    end
  end
end
