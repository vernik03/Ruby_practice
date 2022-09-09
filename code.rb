class Calc
    @@wolfram = "http://surl.li/cxwwf"
    def initialize()
        @A = true
        @B = false
        @C = true
        @X = 2
        @Y = 10
        @Z = -50
    end

    def count(default = false)
        readInput() if !default
        return printResult()
    end

    def readInput()
        print "Enter A: "
        @A = gets.chomp.to_b
        print "Enter B: "
        @B = gets.chomp.to_b
        print "Enter C: "
        @C = gets.chomp.to_b
        print "Enter X: "
        @X = gets.chomp.to_f
        print "Enter Y: "
        @Y = gets.chomp.to_f
        print "Enter Z: "
        @Z = gets.chomp.to_f
    end

    def printResult()
        return ((Math.sin(3*@x)**3 + Math.atan(@f) - 6*10**3.1)/(Math.sqrt(@a*(@x**2) + @b*@x + @c)) + Math::E**@x*((Math.tan(@x+2)).abs))
    end
end


calc = Calc.new
puts calc.count(1) #default
puts calc.count() #custom