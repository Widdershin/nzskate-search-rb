require 'rails_helper'

describe SearchService do
  let(:result) { double(:result) }
  let(:test_plugin) { double(:test_plugin, search: [result]) }

  it "searches" do
    allow(SearchService).to receive(:shop_plugins).and_return([test_plugin])
    expect(SearchService.search('test')).to include result
  end
end