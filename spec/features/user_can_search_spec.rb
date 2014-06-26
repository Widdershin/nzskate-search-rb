require 'rails_helper'

describe "As a user" do
  describe 'when I visit the homepage and search for Paris', :vcr, js: true do
    before do
      visit '/'

      fill_in "query", with: 'Paris'
      click_button "Search"
    end

    it 'I can see results', js: true do
      expect(page).to have_content "Paris V2 43* Baseplate"
    end

    it 'I can click item titles to go the listing page', js:true do
      product_link = find_link 'Paris V2 180mm 50* Black'

      expect(product_link).to be_present
      expect(product_link[:href]).to eq 'http://www.ultimateboards.co.nz/paris-v2-180mm-50-black'
    end

    it 'I can see results from Ultimate Boards' do
      expect(page).to have_content 'Ultimate Boards'
    end

    it 'I can see results from Hyper Ride' do
      expect(page).to have_content 'Hyper Ride'
    end

  end
end