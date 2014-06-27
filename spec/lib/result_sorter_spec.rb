require 'rails_helper'

describe ResultSorter do
  let (:good_result) { double(:good_result, name: 'test') }
  let (:meh_result) { double(:meh_result, name: 'testicles') }
  let (:bad_result) { double(:bad_result, name: 'poodle') }

  it "sorts results by relevance" do
    sorted_results = ResultSorter.sort_results_by_relevance('test', [meh_result, good_result, bad_result])
    expect(sorted_results).to match [good_result, meh_result, bad_result]
  end
end