require './lib/product.rb' #Could not load file unless it contained the extension .rb

class ShoppingCart
  def initialize(name,capacity_string)
    @name = name
    @capacity = capacity_string.to_i
  end
end
