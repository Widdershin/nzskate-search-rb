require 'rails_helper'

describe SearchService do
  let(:result) { double(:result, name: 'test') }
  let(:meh_result) { double(:meh_result, name: 'testies') }
  let(:bad_result) { double(:bad_result, name: 'squig') }
  let(:test_plugin) { double(:test_plugin, search: [meh_result, result, bad_result]) }

  let(:test_sorter_class) { double :test_sorter_class, new: test_sorter }
  let(:test_sorter) { double :test_sorter }

  let(:search_results) { SearchService.search('test', test_sorter_class) }

  before do
    allow(test_sorter).to receive(:assign_relevance) { [1, 50, 100].map { |rel| double :result, relevance: rel } }
    allow(SearchService).to receive(:shop_plugins).and_return [test_plugin]
  end

  it "sorts the results by relevance descending" do
    expect(search_results).to eq search_results.sort_by(&:relevance).reverse
  end

  it "assigns relevance to the results" do
    result = search_results.first

    expect(result.relevance).to be_between(1, 100)
  end
end