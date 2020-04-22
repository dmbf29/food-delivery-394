class MealsView
  def display_meals(meals) # an array of instances
    meals.each_with_index do |meal, index|
      puts "#{index + 1}.) #{meal.name} - #{meal.price}/yen"
    end
  end

  def ask_for(thing)
    puts "What is the #{thing}?"
    print '> '
    gets.chomp
  end
end
