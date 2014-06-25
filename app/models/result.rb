class Result
  attr_reader :name, :url, :price, :img

  def initialize(name:, url:, price:, img:)
    @name = name
    @url = url
    @price = price
    @img = img
  end

  def to_hash
    {
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