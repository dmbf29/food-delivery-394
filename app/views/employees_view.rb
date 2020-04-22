class EmployeesView
  def ask_for(thing)
    puts "What is the #{thing}?"
    print '> '
    gets.chomp
  end

  def wrong_credentials
    puts "Sorry wrong username and/or password"
  end

  def right_credentials(employee)
    puts "Welcome #{employee.username}"
  end
end
