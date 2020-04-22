class Employee
  attr_reader :id, :username, :password

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @role = attributes[:role] # string
    @username = attributes[:username] # string
    @password = attributes[:password] # string
    # @orders = []
  end

  def manager?
    @role == 'manager' # true/false
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  # def add_order(order)
  #   @orders << order
  #   order.employee = self
  # end
end

# julien.orders
# look in the orders table(csv)
# find all the orders that have juliens id


