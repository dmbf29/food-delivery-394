require_relative 'base_view'

class CustomersView < BaseView
  def display_customers(customers) # an array of instances
    if customers.any?
      customers.each do |customer|
        puts "#{customer.id}.) #{customer.name} - #{customer.address}"
      end
    else
      puts Customer.headers.join(', ')
    end
  end
end
