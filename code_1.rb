class Polynom
    @@geogebra = "http://surl.li/cxwwm"
    def initialize()
        @polynom = [
            [150,49], [221,78], [219,121], [208,158], [167,182],
            [108,192], [72,171], [59,133], [76,115], [91,97],
            [75,78], [67,58], [79,47], [98,30], [118,22],
            [136,30], [143,37]]
    end

    def square(default = false)
        readInput() if !default
        return polynomSquareCount()
    end

    def readInput()
        print "Enter number of vertices: "
        num = gets.chomp.to_i
        @polynom = []
        for i in 1..num
            print "Enter coordinates for vertex #{i}: "
            @polynom << gets.chomp.split(" ").map {|x| x.to_i}
        end
    end

    def polynomSquareCount()
        i = 0
        sum1 = 0
        sum2 = 0
        while i < @polynom.count - 1 do
            sum1 += @polynom[i][0] * @polynom[i+1][1]
            i += 1
        end
        sum1 += @polynom[i][0] * @polynom[0][1]
        i = 0
        while i < @polynom.count - 1 do
            sum2 += @polynom[i+1][0] * @polynom[i][1]
            i += 1
        end
        sum2 += @polynom[0][0] * @polynom[i][1]
        
        return (sum1 - sum2).abs/2
    end
end


polynom = Polynom.new
puts "Polynom square = #{polynom.square(1)}" #default
puts "Polynom square = #{polynom.square()}" #custom