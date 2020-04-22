class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}.) #{order.meal.name} - #{order.customer.name} | DG: #{order.employee.username}"
    end
  end

  def ask_for(thing)
    puts "What is the #{thing}?"
    print '> '
    gets.chomp
  end
end
