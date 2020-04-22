class EmployeesView
  def ask_for(thing)
    puts "What is the #{thing}?"
    print '> '
    gets.chomp
  end

  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}.) #{employee.username}"
    end
  end

  def wrong_credentials
    puts "Sorry wrong username and/or password"
  end

  def right_credentials(employee)
    puts "Welcome #{employee.username}"
  end
end
