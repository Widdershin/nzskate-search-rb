require 'rails_helper'

describe Shop, :type => :model do
  let (:plugin) { double(:plugin) }
  let (:shop) { Shop.new(plugin) }

  it 'takes a store plugin' do
    expect(shop.plugin).to eq plugin
  end

  describe "searching" do
    it "has a search method" do
      expect{ shop.search('test') }.to_not raise_error
    end
  end
end
