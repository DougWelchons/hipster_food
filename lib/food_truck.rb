class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @item_price = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item.name]
  end

  def stock(item, amount)
    @item_price[item.name] = item.price[1..-1].to_f
    @inventory[item.name] += amount
  end

  def sell_item?(item)
    @inventory[item.name] > 0
  end

  def potential_revenue
    @inventory.map do |item, ammount|
      ammount * @item_price[item]
    end.sum
  end
end
