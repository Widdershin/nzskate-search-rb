require 'rails_helper'

describe Shop, :type => :model do
  let (:shop) { Shop.new }

  describe "searching" do
    it "has a search method" do
      expect{ shop.search('test') }.to_not raise_error
    end
  end
end
