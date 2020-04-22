require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end


  def list_undelivered_orders
    # orders =  ask the repo for all undelivered orders
    orders = @order_repository.undelivered_orders
    # tell the view to display the orders
    @orders_view.display(orders)
  end

  def add
    # meals = ask the meal repo for all the meals
    meals = @meal_repository.all
    # tell meals view to display meals
    @meals_view.display_meals(meals)
    # index = ask user for meals index to add
    index = @orders_view.ask_for("meal number").to_i - 1
    meal = meals[index]

    # customers = ask the customer repo for all the customers
    customers = @customer_repository.all
    # tell customers view to display customers
    @customers_view.display_customers(customers)
    # index = ask user for customers index to add
    index = @orders_view.ask_for("customer number").to_i - 1
    customer = customers[index]

    # employees = ask the employee repo for delivery guys
    employees = @employee_repository.delivery_guys
    # tell employees view to display employees
    @employees_view.display_employees(employees)
    # index = ask user for employees index to add
    index = @orders_view.ask_for("employee number").to_i - 1
    employee = employees[index]

    # create an instance of an order
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    # tell the order repo to add the order
    @order_repository.add(order)

  end

  def my_undelivered_orders(current_user)
    # orders = ask the order repo for my orders
    # orders = current_user.undelivered_orders
    orders = @order_repository.undelivered_orders.select { |order| order.employee == current_user }
    # tell the view to display orders
    @orders_view.display(orders)
  end

  def mark(current_user)
    # display undelivered_orders
    orders = @order_repository.undelivered_orders.select { |order| order.employee == current_user }
    @orders_view.display(orders)
    # index = tell orders view to ask for one order
    index = @orders_view.ask_for("order number").to_i - 1
    # get an order
    order = orders[index]
    # mark it as delivered !
    # save as well
    @order_repository.mark_as_delivered(order)
  end

end
