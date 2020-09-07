require 'sqlite3'
require 'sequel'

class Employee
  attr_reader :rowid, :full_name, :birthdate, :salary, :data_base

  def initialize(full_name:, birthdate:, salary:)
    @full_name = full_name
    @birthdate = birthdate
    @salary = salary
    @data_base = connection
  end

  def first_name
    @full_name.split.first
  end

  def last_name
    @full_name.split.last
  end

  def age
    (Date.today).year - Date.parse(@birthdate).year
  end

  def salary_calculation
    @salary - (@salary * 0.225)
  end

  def connection
    db = Sequel.sqlite
    db.create_table :employees do
      primary_key :id
      String :full_name
      String :birthdate
      Float :salary
    end
    db[:employees]
  end

  def save
    @data_base.insert(
      :full_name => @full_name,
      :birthdate => @birthdate,
      :salary => @salary
    )

    result = @data_base.all
    result.last
  end

  def get_employee(id)
    @data_base.where(id: id).first
  end
end
