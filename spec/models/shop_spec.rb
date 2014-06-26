require 'rails_helper'

describe Shop, :type => :model do
  let (:query) { 'test' }
  let (:page) { double(:page) }
  let (:result) { double(:result) }
  let (:result_chunk) { double(:result_chunk) }
  let (:result_chunks) { [result_chunk] * 2 }
  let (:shop) { Shop.new }

  before do
    allow(PageLoader).to receive(:load_page).and_return(page)
    allow(shop).to receive(:separate_results).with(page).and_return(result_chunks)
    allow(shop).to receive(:name).and_return('Example')
    allow(shop).to receive(:search_url).with(query).and_return("http://example.com/#{query}")
  end

  describe "searching" do
    before do
      allow(shop).to receive(:parse_result_html).with(result_chunk).and_return(result)
    end

    it "searches for items and returns a list of results" do
      expect(shop.search(query)).to eq [result] * 2
    end

    describe "scraping process" do
      it "loads the search webpage" do
        expect(shop).to receive(:load_search_page).with(query).and_call_original
      end

      it "breaks the html into result chunks" do
        expect(shop).to receive(:separate_results).with(page)
      end

      it "parses the result chunks into results" do
        expect(shop).to receive(:parse_result_html).exactly(2).times
      end

      after do
        shop.search(query)
      end
    end
  end

  it 'parses result html into results' do
    allow(shop).to receive(:parse_result_name).with(result_chunk).and_return('foo-name')
    allow(shop).to receive(:parse_result_url).with(result_chunk).and_return('foo-url')
    allow(shop).to receive(:parse_result_price).with(result_chunk).and_return(100.00)
    allow(shop).to receive(:parse_result_img).with(result_chunk).and_return('foo-img')

    expected_result = Result.new(
      shop: 'Example',
      name: 'foo-name',
      url: 'foo-url',
      price: 100.00,
      img: 'foo-img'
    )
    expect(shop.parse_result_html result_chunk).to eq expected_result
  end

  it "loads the search page" do
    expect(PageLoader).to receive(:load_page).with "http://example.com/test"
    shop.load_search_page(query)
  end

  it "can give a search url for a query" do
    expect(shop.search_url query).to eq "http://example.com/test"
  end
end
