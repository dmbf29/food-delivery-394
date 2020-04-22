require 'csv'
require_relative '../models/employee'

class EmployeeRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(@csv_file_path)
  end

  # find an instance of an employee
  def find_by_username(username) # return an instance or nil
    @employees.find do |employee| # instance
      employee.username == username
    end
  end

  def find(id)
    # return an instance / nil
    @employees.find { |employee| employee.id == id }
  end

  def delivery_guys
    @employees.select do |employee|
      employee.delivery_guy?
    end
  end


  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end

end
