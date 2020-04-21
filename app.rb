# require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'router'
# p Meal.new(name: "Happy Meal", price: 400)
csv_file_path = 'data/meals.csv'
meal_repository = MealRepository.new(csv_file_path)
meals_controller = MealsController.new(meal_repository)

csv_file_path = 'data/customers.csv'
customer_repository = CustomerRepository.new(csv_file_path)
customers_controller = CustomersController.new(customer_repository)
#user action -> controller
router = Router.new(meals_controller, customers_controller)
router.run
