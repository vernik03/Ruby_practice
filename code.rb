class Calc
    @@wolfram = "https://www.wolframalpha.com/input?i=%28%28sin%283x%29%29%5E3+%2B+arctan%28f%29+-+6*%2810%5E3.1%29%29%2F%28%E2%88%9A%28a*x%5E2+%2B+b*x+%2Bc%29%29+%2B+%28e%5Ex%29*%28%7Ctan%28x%2B2%29%7C%29%2C+x+%3D+1%2C+a+%3D+2%2C+b%3D3%2C+c%3D4%2C+f%3D40"
    def initialize()
        @x = 1
        @a = 2
        @b = 3
        @c = 4
        @f = 40
    end

    def count(default = false)
        readInput() if !default
        return countFunction()
    end

    def readInput()
        print "Enter x: "
        @x = gets.chomp.to_f
        print "Enter a: "
        @a = gets.chomp.to_f
        print "Enter b: "
        @b = gets.chomp.to_f
        print "Enter c: "
        @c = gets.chomp.to_f
        print "Enter angle degree: "
        @f = gets.chomp.to_f
    end

    def countFunction()
        return ((Math.sin(3*@x)**3 + Math.atan(@f) - 6*10**3.1)/(Math.sqrt(@a*(@x**2) + @b*@x + @c)) + Math::E**@x*((Math.tan(@x+2)).abs))
    end
end


calc = Calc.new
puts calc.count(1) #default
puts calc.count() #custom