class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.sell_item?(item)
    end
  end

  def total_inventory
    total = Hash.new
    Item.all.each do |item|
      total[item] = inventory(item)
    end
    total
  end

  def inventory(item)
    item_inventory = {
                      quantity: 0,
                      food_trucks: []
                      }
    @food_trucks.map do |truck|
      if truck.sell_item?(item)
        item_inventory[:quantity] += truck.check_stock(item)
        item_inventory[:food_trucks] << truck
      end
    end
    item_inventory
  end
end
