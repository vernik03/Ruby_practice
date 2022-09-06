class Calc
    @@wolfram = "http://surl.li/cxwwf"
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