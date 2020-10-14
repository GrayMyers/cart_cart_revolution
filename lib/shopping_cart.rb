require './lib/product.rb' #Could not load file unless it contained the extension .rb

class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name,capacity_string)
    @name = name
    @capacity = capacity_string.to_i #IP did not specify how to store these variables
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_of_products > @capacity
  end
end
