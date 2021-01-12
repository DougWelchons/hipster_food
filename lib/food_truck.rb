class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item.name]
  end

  def stock(item, amount)
    @inventory[item.name] += amount
  end

  def sell_item?(item)
    @inventory[item.name] > 0
  end
end
