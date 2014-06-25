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

  end
end