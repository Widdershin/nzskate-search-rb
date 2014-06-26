require 'rails_helper'

describe Result do
  let (:result) { Result.new(shop: 'TestShop', name: 'test', url: 'foo', price: 99, img: 'baz') }

  it 'has a hash representation' do
    expected_hash = {
      shop: 'TestShop',
      name: 'test',
      url: 'foo',
      price: 99,
      img: 'baz'
    }

    expect(result.to_hash).to eq expected_hash
  end

  it 'can tell you if two results are identical' do
    result_clone = result.clone

    expect(result).to eq result_clone
  end
end