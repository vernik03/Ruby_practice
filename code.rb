class Calc
    @@wolfram = "http://surl.li/cxwwf"
    def initialize()
        @x = 1
        @a = 2
        @b = 3
        @c = 4
        @f = 40
    end

    def count(default = false)
        readInput() if !default
        return countFunction()
    end

    def readInput()
        print "Enter x: "
        @x = gets.chomp.to_f
    end

    def countFunction()
        return "https://ru.wikipedia.org/wiki/%D0%A4%D0%BE%D1%80%D0%BC%D1%83%D0%BB%D0%B0_%D0%BF%D0%BB%D0%BE%D1%89%D0%B0%D0%B4%D0%B8_%D0%93%D0%B0%D1%83%D1%81%D1%81%D0%B0"
    end
end


calc = Calc.new
puts calc.count(1) #default
puts calc.count() #custom