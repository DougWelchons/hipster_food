class Item
  @@instances = []

  attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price]
    @@instances << self
  end

  def self.all
    @@instances
  end
end
