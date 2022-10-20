
class Counter
    def initialize()     
        readInput()
        count()
    end

    def initialize(a, b, c, x_start, x_end, x_step)
        @a = a
        @b = b
        @c = c
        @x_start = x_start
        @x_end = x_end
        @x_step = x_step
        count()
    end

    def count()
        x = @x_start.to_f
        while x <= @x_end.to_f
            if (@a.to_i | @b.to_i) & (@a.to_i | @c.to_i) != 0
                result = countResultCase(x)
            else
                result = countResultCase(x.to_i)
            end
            if result != nil
                puts "x = #{x}\tresult = #{result}"
            end
            x += @x_step.to_f
        end
    end

    def readInput()
        puts "Enter a:"
        @a = gets.to_f
        puts "Enter b:"
        @b = gets.to_f
        puts "Enter c:"
        @c = gets.to_f
        puts "Enter start of range:"
        @x_start = gets
        puts "Enter end of range:"
        @x_end = gets
        puts "Enter steps:"
        @x_step = gets.to_f
    end

    def countResultCase(x)
        case x
        when x < 0 && @b!=0
            return @a*x**2 + @b
        when x > 0 && @b==0
            return (x - @a) / (x - @c)
        else
            return x / @c
        end
    end
end


# counter = Counter.new(3,0,2,-3,3,0.1)
counter = Counter.new()