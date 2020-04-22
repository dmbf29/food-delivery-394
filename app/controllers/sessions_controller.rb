require_relative '../views/employees_view'
# user actions

class SessionsController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @employees_view = EmployeesView.new
  end

  def sign_in
    # tell the view to ask the user for username
    username = @employees_view.ask_for('username')
    # tell the view to ask the user for password
    password = @employees_view.ask_for('password')
    # ask the repo for an employee with the username
    employee = @employee_repository.find_by_username(username)
    # check if the password is correct
    if employee && employee.password == password
      @employees_view.right_credentials(employee)
      return employee
    else
      @employees_view.wrong_credentials
      sign_in
    end
  end
end
