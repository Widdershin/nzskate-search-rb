require 'rails_helper'

describe Shop, :type => :model do
  let (:query) { 'test' }
  let (:plugin) { double(:plugin, load_search_page: nil) }
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
  end
end
