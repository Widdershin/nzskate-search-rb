require 'rails_helper'
require 'json'

describe SearchController, :type => :controller do
  describe 'GET :search' do
    it 'returns an array of results for the given query' do
      result = double(:result, to_hash: { 'name' => 'test', 'price' => 99 })
      allow(SearchService).to receive(:search).and_return [result]
      post :search, query: 'test'

      json_result = JSON.parse response.body

      expect(json_result).to include result.to_hash
    end
  end
end
