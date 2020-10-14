
class Product
attr_reader :category, :name, :unit_price, :hoarded

  def initialize(category,name,unit_price,quantity)
    @category = category
    @name = name
    @quantity = quantity
    @unit_price = unit_price
    @hoarded = false
  end

  def quantity #IP shows instance variable quantity stored as string
    @quantity.to_i
  end

  def hoard
    @hoarded = true
  end

  def is_hoarded? #IP uses question mark notation to output variable
    @hoarded
  end

  def total_price
    quantity * @unit_price
  end
end
