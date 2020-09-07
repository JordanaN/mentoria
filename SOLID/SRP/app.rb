require_relative 'employee'

jojo = Employee.new(full_name: 'Jordana Nogueira', birthdate: '06/01/1988', salary: 5_000.0)
puts jojo.full_name
puts jojo.birthdate
puts jojo.salary

puts jojo.first_name
puts jojo.last_name
puts jojo.age
puts jojo.salary_calculation

instance_employee = jojo.save
puts "employee criado #{instance_employee}"

employee = jojo.get_employee(instance_employee[:id])
puts "select de employee #{employee}"
