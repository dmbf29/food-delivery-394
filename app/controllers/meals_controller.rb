# handle the user actions
# DONT PUTS IN THE CONTROLLER
require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    meals = @meal_repository.all # an array of instances
    @meals_view.display_meals(meals)
  end

  def add
    # tell view to ask for the name
    name = @meals_view.ask_for("meal name")
    # tell view to ask for the price
    price = @meals_view.ask_for("meal price").to_i
    # create an instance of a meal
    meal = Meal.new(name: name, price: price)
    # tell repo to save it
    @meal_repository.add(meal)
  end

end
