
class Product
attr_reader :category, :name, :unit_price

  def initialize(category,name,unit_price,quantity)
    @category = category
    @name = name
    @quantity = quantity
    @unit_price = unit_price
  end

  def quantity
    @quantity.to_i
  end
end
