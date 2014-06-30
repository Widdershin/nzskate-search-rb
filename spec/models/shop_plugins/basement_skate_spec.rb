require 'rails_helper'
require_relative 'shared_examples_for_shop_plugin'

describe BasementSkate do
  it_should_behave_like "a shop plugin"

  let (:expected_query_url) { 'https://www.basementskate.com.au/search.php?mode=search&substring=test&including=all&by_title=on' }
  let (:expected_query_url_w_spaces) { 'https://www.basementskate.com.au/search.php?mode=search&substring=test+post&including=all&by_title=on' }
  let (:query_to_load) { 'paris' }
  let (:snippet_to_load) { 'ub-fsm' }
  let (:expected_result) do
    Result.new(
      shop: 'Basement Skate',
      name: 'Paris 129mm Street Trucks',
      url: 'http://www.ultimateboards.co.nz/comet-factory-stamp-marker-drop',
      price: 64.00,
      img: 'https://www.basementskate.com.au/images/T/xctmpzkewTT.png'
    )
  end
end