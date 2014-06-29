module Price
  def self.extract price_string
    /[\d\.]+/.match(price_string).to_s.to_f
  end
end