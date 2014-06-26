require 'rails_helper'

describe "As a user" do
  describe 'when I visit the homepage' do
    before do
      visit '/'
    end

    it 'I can search for items and see results', :vcr, js: true do
      fill_in "query", with: 'Sector9'
      click_button "Search"
      expect(page).to have_content "Race Formula"
    end

    it 'I can click item titles to go the listing page', :vcr, js:true do
      fill_in "query", with: 'Paris'

      click_button "Search"

      product_link = find_link 'Paris V2 180mm 50* Black'

      expect(product_link).to be_present
      expect(product_link[:href]).to eq 'http://www.ultimateboards.co.nz/paris-v2-180mm-50-black'
    end

  end
end