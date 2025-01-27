class Manager
    attr_accessor :age
    attr_reader :name, :department
    @@all = []
    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end

    def employees
        Employee.all.select do |employee|
            employee.manager == self
        end
    end

    def self.all
        @@all
    end

    def hire_employee(name,salary)
        Employee.new(name,salary,self)
    end

    def self.all_departments
        all.map do |manager|
            manager.department
        end.uniq
    end

    def self.average_age
        
        age_array = all.map do |manager|
                        manager.age
                    end
        age_array.reduce(:+) / age_array.size.to_f
    end

end
