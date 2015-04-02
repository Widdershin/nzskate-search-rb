module ShopHelper
  def not_implemented
    raise "#{self.class}##{caller_locations(1,1)[0].label} is not implemented."
  end
end