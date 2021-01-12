require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test
  def test_it_exists_and_has_readable_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expected = {}

    assert_instance_of FoodTruck, food_truck
    assert_equal expected, food_truck.inventory
    assert_equal "Rocky Mountain Pies", food_truck.name
  end

  def test_it_can_stock_items
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    assert_equal 0, food_truck.check_stock(item1)

    food_truck.stock(item1, 30)
    food_truck.stock(item2, 12)
    food_truck.stock(item1, 25)

    expected = {item1.name => 55, item2.name => 12}

    assert_equal 55, food_truck.check_stock(item1)
    assert_equal expected, food_truck.inventory
  end

  def test_it_can_ceck_if_it_sells_an_item
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    assert_equal 0, food_truck.check_stock(item1)

    food_truck.stock(item1, 30)

    assert_equal true, food_truck.sell_item?(item1)
    assert_equal false, food_truck.sell_item?(item2)
  end

  def test_it_can_return_potential_revenue
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    assert_equal 0, food_truck.check_stock(item1)

    food_truck.stock(item1, 30)
    food_truck.stock(item2, 12)
    food_truck.stock(item1, 25)

    assert_equal 236.25, food_truck.potential_revenue
  end
end
