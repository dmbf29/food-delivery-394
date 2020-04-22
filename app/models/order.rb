class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id
  # def meal
  #   @meal # instance!
  # end

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @meal = attributes[:meal] # INSTANCE
    @customer = attributes[:customer] # INSTANCE
    @employee = attributes[:employee] # INSTANCE
    @delivered = attributes[:delivered] || false # boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    ['id', 'meal_id', 'customer_id', 'employee_id', 'delivered']
  end

end
