require 'rails_helper'

describe Price do
  it 'can extract prices' do
    expect(Price.extract 'NZD $19.95').to eq 19.95
  end
end