require_relative 'base_view'

class MealsView < BaseView
  def display_meals(meals) # an array of instances
    meals.each do |meal|
      puts "#{meal.id}.) #{meal.name} - #{meal.price}/yen"
    end
  end
end
