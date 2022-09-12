class Counter
    def initialize()
        @P = 2
        @t = 16
        @r = 8
    end

    def count(default = false)
        readInput() if !default
        return countResult()
    end

    def readInput()
        print "Enter P: "
        @P = gets.chomp.to_f
        print "Enter t: "
        @t = gets.chomp.to_f
        print "Enter r: "
        @r = gets.chomp.to_f
    end

    def countResult()
        return @P ** @r * (1-@P ** (@t * -1)) 
    end
end


counter = Counter.new
puts "Range = #{counter.count(1)}" #default
puts "Range = #{counter.count(1).to_f}" #default, float
puts "Range = #{counter.count()}" #custom