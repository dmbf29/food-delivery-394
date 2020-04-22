class Employee
  attr_reader :id, :username, :password

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @role = attributes[:role] # string
    @username = attributes[:username] # string
    @password = attributes[:password] # string
  end

  def manager?
    @role == 'manager' # true/false
  end
end
