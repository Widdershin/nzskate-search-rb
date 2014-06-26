require 'rails_helper'
require_relative 'shared_examples_for_shop_plugin'


describe HyperRide do
  it_should_behave_like "a shop plugin"

  let (:expected_query_url) { 'http://www.hyperride.co.nz/product/test/search#/?size=0' }
  let (:expected_query_url_w_spaces) { 'http://www.hyperride.co.nz/product/test%20post/search#/?size=0' }
  let (:query_to_load) { 'hawgs' }
  let (:snippet_to_load) { 'hyper-fatty-hawgs' }
  let (:expected_result) do
    Result.new(
      shop: 'Hyper Ride',
      name: 'LANDYACHTZ FATTY HAWGS YELLOW 63MM 78A',
      url: 'http://www.hyperride.co.nz/product/longboard-wheels/402/fatty-hawgs-yellow-63mm-78a/1118860/detail',
      price: 79.95,
      img: '//www.hyperride.co.nz/content/images/products/10/landyachtz-fatty-hawgs-yellow-63mm-78a-001_S.jpg'
    )
  end

  let (:shop) { HyperRide.new }

  it 'ignores promo results', :vcr do
    page = shop.load_search_page('splurgle')

    expect(shop.separate_results page).to be_empty
  end
end
