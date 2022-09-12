class Counter
    def initialize()
        @dec_num = 123
    end

    def count(default = false)
        readInput() if !default
        return countResult()
    end

    def readInput()
        print "Enter decimal number: "
        @dec_num = gets.chomp.to_i
    end

    def countResult()
        return @dec_num.to_s(2)
    end
end


counter = Counter.new
puts "Bin = #{counter.count(1)}" #default
puts "Bin = #{counter.count()}" #custom
