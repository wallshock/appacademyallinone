require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding,salaries)
        @salaries = Hash.new(0)
        salaries.each do |title,salary|   
            @salaries[title] = salary
        end
        @name = name
        @funding = funding
        @employees = []
    end

    def valid_title?(title)
        @salaries.each_key do |titles|
            return true if title == titles
        end
        return false
    end
    
    def >(startup)
        self.funding > startup.funding 
    end

    def hire(name,title)
        if valid_title?(title)
            @employees << Employee.new(name,title)
        else
            raise_error
        end
    end
    
    def size
        @employees.count
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise_error
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end
    
    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title,pay|
            self.salaries[title] = pay if !self.valid_title?(title)
        end

        startup.employees.each do |employee|
            self.employees << employee
        end
        startup.close
    end

end
