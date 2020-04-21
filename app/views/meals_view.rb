class MealsView
  def display_meals(meals) # an array of instances
    meals.each do |meal|
      puts "#{meal.id}.) #{meal.name} - #{meal.price}/yen"
    end
  end

  def ask_for(thing)
    puts "What is the #{thing}?"
    print '> '
    gets.chomp
  end
end
