require 'rails_helper'

describe SearchService do
  let(:result) { double(:result, name: 'test') }
  let(:meh_result) { double(:meh_result, name: 'testies') }
  let(:bad_result) { double(:bad_result, name: 'squig') }
  let(:test_plugin) { double(:test_plugin, search: [meh_result, result, bad_result]) }

  before do
    allow(SearchService).to receive(:shop_plugins).and_return([test_plugin])
  end

  it "searches" do
    expect(SearchService.search('test')).to include result
  end

  it "sorts the results by relevance" do
    expect(SearchService.search('test')).to match [result, meh_result, bad_result]
  end
end