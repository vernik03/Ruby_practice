class Counter
    def initialize()
        @x = 9.5252
    end

    def count(default = false, type = "case")
        readInput() if !default
        return countResultCase() if type == "case"
        return countResultIf() if type == "if"
    end

    def readInput()
        print "Enter x: "
        @x = gets.chomp.to_f
    end

    def countResultCase()
        case @x
        when -4.0
            puts "Out of range"
            return nil
        when -4.0..0.0
            return ((@x-2.0).abs / (@x**2)*Math.cos(@x))**(1.0/7.0)
        when 0.0..12.0
            return 1.0 / (Math.tan(@x + 1.0/(Math::E**@x))/(Math.sin(@x)**2))**(2.0/7.0)
        else
            return 1/(1+@x/(1+@x/(1+@x)))
        end
    end

    def countResultIf()
        if @x == -4.0
            puts "Out of range"
            return nil
        elsif @x <= 0.0 && @x > -4.0
            return ((@x-2.0).abs / (@x**2)*Math.cos(@x))**(1.0/7.0)
        elsif @x <= 12.0 && @x > 0.0
            return 1.0 / (Math.tan(@x + 1.0/(Math::E**@x))/(Math.sin(@x)**2))**(2.0/7.0)
        else
            return 1/(1+@x/(1+@x/(1+@x)))
        end
    end
end


counter = Counter.new
puts "y = #{counter.count(1, "case")}" #default
puts "y = #{counter.count(1, "if")}" #default
#puts "Dec = #{counter.count()}" #custom