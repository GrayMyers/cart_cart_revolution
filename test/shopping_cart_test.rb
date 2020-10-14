require 'minitest/autorun'
require 'minitest/pride'
require './lib/product.rb' #Could not load file unless it contained the extension .rb
require './lib/shopping_cart.rb' #Same issue as above
class ShoppingCartTest < Minitest::Test

  def setup
    @shopping_cart = ShoppingCart.new("King Soopers","30items")
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @shopping_cart
  end
end
