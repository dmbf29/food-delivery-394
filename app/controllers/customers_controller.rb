# handle the user actions
# DONT PUTS IN THE CONTROLLER
require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    customers = @customer_repository.all # an array of instances
    @customers_view.display_customers(customers)
  end

  def add
    # tell view to ask for the name
    name = @customers_view.ask_for("customer name")
    # tell view to ask for the price
    address = @customers_view.ask_for("customer address")
    # create an instance of a customer
    customer = Customer.new(name: name, address: address)
    # tell repo to save it
    @customer_repository.add(customer)
  end

end
