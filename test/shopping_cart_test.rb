require 'minitest/autorun'
require 'minitest/pride'
require './lib/product.rb' #Could not load file unless it contained the extension .rb
require './lib/shopping_cart.rb' #Same issue as above
class ShoppingCartTest < Minitest::Test

  def setup
    @shopping_cart_1 = ShoppingCart.new("King Soopers","30items")
    @shopping_cart_2 = ShoppingCart.new("Safeway","20items")

  end

  def test_it_exists
    assert_instance_of ShoppingCart, @shopping_cart_1
  end

  def test_it_has_name
    assert_equal "King Soopers",@shopping_cart_1.name
    assert_equal "Safeway",@shopping_cart_2.name
  end

  def test_it_has_capacity
    assert_equal 30,@shopping_cart_1.capacity
    assert_equal 20,@shopping_cart_2.capacity
  end

  def test_it_has_products_array
    assert_equal [], @shopping_cart_1.products
  end

  def test_it_can_add_products
    assert_equal [], @shopping_cart_1.products
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    assert_equal [product1, product2], @shopping_cart_1.products
  end

  def test_it_has_details
    cart_1_details_hash = {name: "King Soopers",capacity: 30}
    cart_2_details_hash = {name: "Safeway",capacity: 20}
    assert_equal cart_1_details_hash, @shopping_cart_1.details
    assert_equal cart_2_details_hash, @shopping_cart_2.details
  end

  def test_it_can_track_number_of_products
    assert_equal 0, @shopping_cart_1.total_number_of_products
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    assert_equal 12, @shopping_cart_1.total_number_of_products
  end

  def test_it_can_check_full
    assert_equal false, @shopping_cart_1.is_full?
    assert_equal false, @shopping_cart_2.is_full?
    product1 = Product.new(:paper, 'toilet paper', 3.70, '15')
    product2 = Product.new(:meat, 'chicken', 4.50, '7')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    @shopping_cart_2.add_product(product1)
    @shopping_cart_2.add_product(product2)
    assert_equal false, @shopping_cart_1.is_full?
    assert_equal true, @shopping_cart_2.is_full?
  end

  def test_it_determines_products_by_category
    assert_equal [], @shopping_cart_1.products_by_category(:paper)
    assert_equal [], @shopping_cart_1.products_by_category(:meat)
    product1 = Product.new(:paper, 'toilet paper', 3.70, '15')
    product2 = Product.new(:meat, 'chicken', 4.50, '7')
    product3 = Product.new(:meat, 'beef', 6.50, '4')
    product4 = Product.new(:produce, 'apples', 0.99, '3')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    @shopping_cart_1.add_product(product3)
    @shopping_cart_1.add_product(product4)
    assert_equal [product1], @shopping_cart_1.products_by_category(:paper)
    assert_equal [product2,product3], @shopping_cart_1.products_by_category(:meat)
  end

  def test_it_tracks_percentage_occupied
    assert_equal 0, @shopping_cart_1.percentage_occupied
    product1 = Product.new(:paper, 'toilet paper', 3.70, '15')
    product2 = Product.new(:meat, 'chicken', 4.50, '7')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    assert_equal 73.33, @shopping_cart_1.percentage_occupied
  end

  def test_it_can_sort_products_by_quantity
    assert_equal [], @shopping_cart_1.sorted_products_by_quantity
    product1 = Product.new(:paper, 'toilet paper', 3.70, '15')
    product2 = Product.new(:meat, 'chicken', 4.50, '7')
    product3 = Product.new(:meat, 'beef', 6.50, '3')
    product4 = Product.new(:produce, 'apples', 0.99, '5')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    @shopping_cart_1.add_product(product3)
    @shopping_cart_1.add_product(product4)
    assert_equal [product3,product4,product2,product1], @shopping_cart_1.sorted_products_by_quantity
  end

  def test_it_displays_product_breakdown
    assert_equal Hash.new(), @shopping_cart_1.product_breakdown
    product1 = Product.new(:paper, 'toilet paper', 3.70, '15')
    product2 = Product.new(:meat, 'chicken', 4.50, '7')
    product3 = Product.new(:meat, 'beef', 6.50, '3')
    product4 = Product.new(:produce, 'apples', 0.99, '5')
    @shopping_cart_1.add_product(product1)
    @shopping_cart_1.add_product(product2)
    @shopping_cart_1.add_product(product3)
    @shopping_cart_1.add_product(product4)
    sorted_hash = {
      paper: [product1],
      meat: [product2,product3],
      produce: [product4]
    }
    assert_equal sorted_hash, @shopping_cart_1.product_breakdown

  end
end
