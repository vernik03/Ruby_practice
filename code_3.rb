class Calc
    def initialize(size)
        set_matrix(size)
   end

    def print_matrix()
        for i in 0..@A.size-1
            for j in 0..@A.size-1
                print "#{@A[i][j]} "
            end
            print " = #{@b[i]}\n"
        end
        puts
    end

    def set_matrix(size)
        if size >= 3 and size <= 9
            @A = Array.new(size) { Array.new(size) }
            for i in 0..@A.size-1
                for j in 0..@A.size-1
                    if i == j
                        @A[i][j] = 2.0
                    else
                        @A[i][j] = 3.0
                    end
                end
            end
            @b = Array.new(size) { |i| i+1 }
        else
            puts "Wrong size"
        end
    end

    # решить систему линейных уравнений методом исключения Гаусса и получить значения неизвестных x1, x2, x3, ..., xn
    def solve()
        for i in 0..@A.size-1
            for j in 0..@A.size-1
                if i != j
                    k = @A[j][i]/@A[i][i]
                    for m in 0..@A.size-1
                        @A[j][m] -= k*@A[i][m]
                    end
                    @b[j] -= k*@b[i]
                end
            end
        end
        for i in 0..@A.size-1
            @b[i] /= @A[i][i]
        end
    end
    
end


print "Введіть розмір матриці (3-9): "
size = gets.to_i
calc = Calc.new(size)
calc.print_matrix()
calc.solve()
calc.print_matrix()