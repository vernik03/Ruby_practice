class Counter
    def initialize()
        @bin_num = "1000010001"
    end

    def count(default = false)
        readInput() if !default
        return countResult()
    end

    def readInput()
        print "Enter binary number: "
        @bin_num = gets.chomp.to_s
    end

    def countResult()
        return @bin_num.to_i(2)
    end
end


counter = Counter.new
puts "Dec = #{counter.count(1)}" #default
puts "Dec = #{counter.count()}" #custom
