require 'rails_helper'

describe Result do
  let (:result_data) {
    {
      shop: 'TestShop',
      name: 'test',
      url: 'foo',
      price: 99,
      img: 'baz',
      relevance: 60
    }
  }
  let (:result) { Result.new(result_data) }

  it 'has a hash representation' do
    expect(result.to_hash).to eq result_data
  end

  it 'can tell you if two results are identical' do
    result_clone = result.clone

    expect(result).to eq result_clone
  end
end