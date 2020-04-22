class CustomersView
  def display_customers(customers) # an array of instances
    if customers.any?
      customers.each_with_index do |customer, index|
        puts "#{index + 1}.) #{customer.name} - #{customer.address}"
      end
    else
      puts Customer.headers.join(', ')
    end
  end

  def ask_for(thing)
    puts "What is the #{thing}?"
    print '> '
    gets.chomp
  end
end
