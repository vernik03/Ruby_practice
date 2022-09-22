class Counter
    def initialize()
        @x = 2.0
    end

    def count1(default = true)
        readInput() if !default
        return countResult1()
    end

    def count2()
        return countResult2()
    end

    def readInput()
        print "Enter x: "
        @x = gets.chomp.to_f
    end

    def countResult1()
        res = 1
        sign = -1
        for i in 1..10
            res += sign*((1.0+i/2.0+i)*@x**i)
            sign *= -1
        end
        return res
    end

    def countResult2()
        res = 1
        for i in 1..8
            res += 1/3.0**i
        end
        return res
    end
end


counter = Counter.new
puts "Sum = #{counter.count1()}" #default
puts "Sum = #{counter.count2()}" #default
#puts "Sum = #{counter.count1(0)}" #custom