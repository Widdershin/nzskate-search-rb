class Result
  attr_reader :name, :url, :price, :img

  def initialize(name:, url:, price:, img:)
    @name = name
    @url = url
    @price = price
    @img = img
  end
end