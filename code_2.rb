f = lambda { |x, i| (Math.log(3)**i /factorial(i)) * x**i } 

def factorial(n)
    n == 0 ? 1 : n * factorial(n-1)
end

class Calc
    def initialize(func, a = 0.1, b = 1.0, n_a = 10, n_b = 58)
        @x_min = a
        @x_max = b
        @n_min = n_a
        @n_max = n_b
        @f = func
    end

    def check(x, a, b)
        if x < a || x > b
            return false
        end
        return true
    end

    def count_sum(x, n)
        eps = 0.0
        if check(x, @x_min, @x_max) != true
            return "x is out of range"
        end
        if n > 0 && n < 1
            eps = n
            n = 2**32 - 1    
        elsif check(n, @n_min, @n_max) != true
            return "n is out of range"
        end
        sum = 0.0
        prev = sum
        for i in 0..n
            prev = sum
            sum += @f.call(x, i)
            if eps > 0 && (sum - prev).abs < eps
                break
            end
        end
        return sum
    end
end


calc = Calc.new(f, 0.1, 1.0, 10, 58)
puts calc.count_sum(0.5, 0.001)
puts calc.count_sum(0.5, 10)
puts calc.count_sum(0.5, 58)
puts calc.count_sum(0.7, 25)
puts calc.count_sum(1.1, 58)
puts calc.count_sum(1.0, 100)
puts calc.count_sum(0.8, 58)
