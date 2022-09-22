class Counter
    res1 = "https://www.wolframalpha.com/input?i=sum%28%28%28n-1%29%21%2F%28n%2B1%29%21%29%5E%28n*%28n%2B1%29%29%29+n%3D2+to+inf"
    res3 = "https://www.wolframalpha.com/input?i=sum%28%28%284n-1%29%21%282n-1%29%21%29%2F%28%284n%29%21*2%5E%282n%29*%282n%29%21%29%29+n%3D1+to+inf"

    def initialize()
        @e = 0.00001
        @x = 1.6
    end

    def count1()
        return countResult1()
    end

    def count2(default = true)
        readInput() if !default
        return countResult2()
    end

    def readInput()
        print "Enter x: "
        @x = gets.chomp.to_f
    end

    def count3()
        return countResult3()
    end

    def f!(n)
        return 1.0 if n == 0
        return n*f!(n-1)
    end

    def countResult1()
        res = 0.0
        res_prev = 1.0
        n = 2.0
        while (res_prev - res).abs > @e
            res_prev = res
            res += (f!(n-1.0) / f!(n+1.0))**(n*(n+1.0))
            n+=1
        end
        return res
    end

    def countResult2()
        res = 0.0
        res_prev = 1.0
        n = 0.0
        while (res_prev - res).abs > @e
            res_prev = res
            res += 2*(((@x-1)**(2*n+1))/((2*n+1)*((@x+1)**(2*n+1))))
            n+=1
        end
        return res
    end

    def countResult3()
        res = 0.0
        res_prev = 1.0
        n = 1.0
        while (res_prev - res).abs > @e
            res_prev = res
            res += ((f!(4.0*n-1.0)*f!(2.0*n-1.0)) / (f!(4.0*n)*2.0**(2.0*n)*f!(2.0*n)))
            n+=1
        end
        return res
    end

    def ln_x()
        return Math.log(@x)
    end
end


counter = Counter.new
puts "Sum1 = #{counter.count1()}"
puts "Sum1 = #{counter.count2()} = #{counter.ln_x()}"
puts "Sum3 = #{counter.count3()}"

# puts "Sum1 = #{counter.count2(0)}" #custom