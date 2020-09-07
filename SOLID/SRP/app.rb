require_relative 'employee'

employee = Employee.new(full_name: 'Jordana Nogueira', birthdate: '06/01/1988', salary: 5_000.0)
puts employee.full_name
puts employee.birthdate
puts employee.salary

puts employee.first_name
puts employee.last_name
puts employee.age
puts employee.salary_calculation

instance_employee = employee.save
puts "employee criado #{instance_employee}"

result = employee.get_employee(instance_employee[:id])
puts "select de employee #{result}"
