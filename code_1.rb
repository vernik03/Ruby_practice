class Calc
     def initialize()
        @A = []
        12.times do
            @A << rand(10)
        end
        puts "Массив А: #{@A}" 
    end

    def count_groups()
        temp_s = nil
        count = 0
        for i in 0..@A.size-1
            if @A[i] == @A[i+1] or @A[i] == temp_s
                if temp_s == @A[i]
                    print " #{@A[i]}"
                else
                    temp_s = @A[i]
                    count += 1
                    print "\n#{count} группа: #{ @A[i]}" 
                end
            else
                temp_s = nil
            end
        end   
    end
end


calc = Calc.new
calc.count_groups() 