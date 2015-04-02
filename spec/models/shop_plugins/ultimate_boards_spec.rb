require 'rails_helper'
require_relative 'shared_examples_for_shop_plugin'

describe UltimateBoards do
  it_should_behave_like "a shop plugin"

  let (:expected_query_url) { 'http://www.ultimateboards.co.nz/search/products/test' }
  let (:expected_query_url_w_spaces) { 'http://www.ultimateboards.co.nz/search/products/test-post' }
  let (:query_to_load) { 'comet' }
  let (:snippet_to_load) { 'ub-fsm' }
  let (:expected_result) do
    Result.new(
      shop: 'Ultimate Boards',
      name: 'Comet Flying Spaghetti Monster Drop Thru',
      url: 'http://www.ultimateboards.co.nz/comet-factory-stamp-marker-drop',
      price: 220.00,
      img: 'http://cdn2.smallfish.co.nz/images2/unknown.jpg?i=NUlRu680T'
    )
  end
end