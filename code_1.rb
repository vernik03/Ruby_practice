class Calc
    @@wolfram = "https://www.wolframalpha.com/input?i=%28%21%28A+or+B%29+and+%28A+or+%21B%29%29%2C+A%3DTRUE%2C+B%3DFALSE" #?????????????
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
        @X = gets.chomp.to_i
        print "Enter Y: "
        @Y = gets.chomp.to_i
        print "Enter Z: "
        @Z = gets.chomp.to_i
    end

    def printResult()
        puts !(@A || @B) && (@A && !@B)
        puts ((@Z != @Y) == (6 >= @Y) || (@Z != @Y) == 0 && (6 >= @Y) == 1) && @A || @B && @C && @X >= 1.5        
        puts ( ((8 - @X * 2 <= @Z) ? false : true)) && (((@Y ** 2) && !(@X ** 2) ? false : true)) || (@Z >= 15)
        puts @X > 0 && @Y < 0 || @Z >= (@X * @Y - @Y / @X) + (@Z * -1)
        puts !(@A || @B && !(@C || (!@A || @B)))
        puts @X**2 + @Y**2 >= 1 && @X >= 0 && @Y >= 0
        puts (@A && (@C && @B) <=> (@B || @A) || @C) && @B
    end
end


calc = Calc.new
calc.count(1) #default
#calc.count() #custom