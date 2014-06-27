require 'rails_helper'

describe ResultSorter do
  let(:results_to_sort) do
    [
      'Paris V2 43* Baseplate',
      'Paris V2 180 Mm Black',
      'Paris V2 43 Degree Baseplate Black Single',
      'Riptide WFB Paris Magnum Bushings',
      'Gopro Hero3 White Edition',
      'Paris Street Trucks 149 Mm'
    ].map { |name| double(:result, name: name) }
  end

  let (:sorter) { ResultSorter.new(results_to_sort) }

  it 'gives the most relevant listing first' do
    sorted_results = sorter.sort_by_relevance('street')
    expect(sorted_results.first.name).to eq 'Paris Street Trucks 149 Mm'
  end

  it 'ignores case' do
    sorted_results_title = sorter.sort_by_relevance('Paris Trucks')
    sorted_results_lower = sorter.sort_by_relevance('paris trucks')
    expect(sorted_results_title).to eq sorted_results_lower
  end
end