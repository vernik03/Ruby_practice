class LuggageCompartment
    def initialize()
        @luggage = Struct.new(:number, :weight)
        @all_luggage = []
    end

    def add_luggage(number, weight)
        @all_luggage << @luggage.new(number, weight)
    end

    def task_a()
        puts "a)"
        average_weight =  @all_luggage.inject(0){|sum, luggage| sum + luggage.weight } / @all_luggage.inject(0){|sum, luggage| sum + luggage.number }
        puts "Average weight: #{average_weight}" 
        @all_luggage.select {|luggage| puts "luggage: #{luggage.number} things, #{luggage.weight} kg"  if ((luggage.weight / luggage.number) - average_weight).abs <= 0.3}     
    end

    def task_b()
        puts "b)"
        puts "More than two things: #{@all_luggage.select {|luggage| luggage.number > 2}.count}"
        average_number =  @all_luggage.inject(0){|sum, luggage| sum + luggage.number } / @all_luggage.count
        puts "More than average number of things: #{@all_luggage.select {|luggage| luggage.number > average_number}.count}"
    end
    
    def task_c()
        puts "c)"
        temp = []
        @all_luggage.each do |luggage|
            @all_luggage.each do |luggage2|
                if luggage.number == luggage2.number && (luggage.weight - luggage2.weight).abs <= 0.5 &&
                    luggage != luggage2 && !temp.include?([luggage, luggage2]) && !temp.include?([luggage2, luggage])
                    puts "luggage: #{luggage.number} things, #{luggage.weight} kg and #{luggage2.weight} kg"
                    temp << [luggage, luggage2]
                end
            end
        end
        if temp.empty?
            puts "No such luggage"
        end
    end

    def task_d()
        puts "d)"
        temp_l = @luggage.new(0, 0)
        @all_luggage.each do |luggage|
            if luggage.number > temp_l.number && luggage.weight > temp_l.weight
                temp_l = luggage
            end
        end
        if temp_l.number != 0 && temp_l.weight != 0
            puts "Max luggage: #{temp_l.number} things, #{temp_l.weight} kg"
        else
            puts "No max luggage"
        end
    end

    # выяснить, имеется ли пассажир, багаж которого состоит из одной вещи менее 30 кг
    def task_e()
        puts "e)"
        @all_luggage.select {|luggage| puts "luggage: #{luggage.number} things, #{luggage.weight} kg"  if (luggage.number == 1 && luggage.weight < 30)}
    end

end


luggage_compartment = LuggageCompartment.new()
luggage_compartment.add_luggage(5, 2.5)
luggage_compartment.add_luggage(6, 5.0)
luggage_compartment.add_luggage(7, 8.8)
luggage_compartment.add_luggage(9, 9.0)
luggage_compartment.add_luggage(4, 2.1)
luggage_compartment.add_luggage(2, 0.5)
luggage_compartment.add_luggage(5, 0.5)
luggage_compartment.add_luggage(2, 1.2)
luggage_compartment.add_luggage(3, 1.9)
luggage_compartment.add_luggage(8, 2.9)
luggage_compartment.add_luggage(4, 1.7)
luggage_compartment.add_luggage(2, 8.1)
luggage_compartment.add_luggage(6, 4.6)
luggage_compartment.add_luggage(10, 11.5)
luggage_compartment.add_luggage(1, 1.5)
luggage_compartment.add_luggage(1, 0.5)
luggage_compartment.task_a()
luggage_compartment.task_b()
luggage_compartment.task_c()
luggage_compartment.task_d()
luggage_compartment.task_e()

