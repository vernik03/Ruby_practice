class Calc
    def initialize()
        @B = Array.new(8) { Array.new(8) }
        for i in 0..@B.size-1
            for j in 0..@B.size-1
                if i == j
                    @B[i][j] = 1
                else
                    @B[i][j] = rand(10)
                end
            end
        end
   end

    def print_matrix()
        for i in 0..@B.size-1
            for j in 0..@B.size-1
                print "#{@B[i][j]}\t"
            end
            puts
        end
        puts
    end

    def multiply_matrix(num)
        for i in 0..@B.size-1
            for j in 0..@B.size-1
                @B[i][j] *= num
            end
        end
    end
end


calc = Calc.new
calc.print_matrix()
calc.multiply_matrix(2)
calc.print_matrix()