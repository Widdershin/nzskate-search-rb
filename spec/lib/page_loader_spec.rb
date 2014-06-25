require 'rails_helper'
require 'nokogiri'

describe PageLoader do
  it 'loads pages with Nokogiri', :vcr do
    expect(Nokogiri).to receive(:HTML)
    PageLoader.load_page('http://example.com')
  end
end