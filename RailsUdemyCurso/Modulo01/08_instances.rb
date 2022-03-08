class Person
    def initialize(name = "indigente")
        @name = name
    end

    def print_name
        @name
    end

    def speak
        "Olá"
    end
end

# New instance
person.Person.new("Juan")
person.print_name