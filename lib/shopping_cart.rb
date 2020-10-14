require './lib/product.rb' #Could not load file unless it contained the extension .rb

class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name,capacity_string)
    @name = name
    @capacity = capacity_string.to_i
    @products = []
  end
end
