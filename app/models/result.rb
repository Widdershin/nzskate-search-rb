class Result
  attr_accessor :relevance
  attr_reader :shop, :name, :url, :price, :img

  def initialize(shop:, name:, url:, price:, img:)
    @shop = shop
    @name = name
    @url = url
    @price = price
    @img = img
    @relevance = 0
  end

  def to_hash
    {
      shop: shop,
      name: name,
      url: url,
      price: price,
      img: img
    }
  end

  def == (other)
    self.to_hash == other.to_hash
  end
end