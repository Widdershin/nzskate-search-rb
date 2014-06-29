require 'rails_helper'
require_relative 'shared_examples_for_shop_plugin'

describe TerrabangSkate do
  it_should_behave_like "a shop plugin"

  let (:expected_query_url) { 'http://terrabangskate.com/catalogsearch/result/?q=test' }
  let (:expected_query_url_w_spaces) { 'http://terrabangskate.com/catalogsearch/result/?q=test+post' }
  let (:query_to_load) { 'cult' }
  let (:snippet_to_load) { 'tb-converter' }
  let (:expected_result) do
    Result.new(
      shop: 'Terrabang Skate Co',
      name: 'Cult Converter Skate Wheels   Blue | Dia 70mm Duro 85a',
      url: 'http://terrabangskate.com/cult-converter-skate-wheels-blue-dia-70mm-duro-85a',
      price: 20.00,
      img: 'http://terrabangskate.com/media/catalog/product/cache/1/small_image/220x/9df78eab33525d08d6e5fb8d27136e95/c/u/cult_converter_blue_quarter.jpg'
    )
  end
end