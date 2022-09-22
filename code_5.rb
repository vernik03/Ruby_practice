require 'rubyvis'
require 'ostruct'

def visualize(v_data)
    vis = Rubyvis::Panel.new do 
        width 800
        height 700
        bar do
          data v_data
          width 20
          height {|d| d * 0.06}
          bottom(0)
          left {index * 25}
        end
    end
    vis.render
    file = File.new("./task_5_1.svg", "w:UTF-8")
    file.print((vis.to_svg).to_str)
    file.close
end

class Counter


    def initialize(default = true)
        @N = 10
        @c = 4
        readInput() if !default
        @v_data_1 = []
        @v_data_2 = []
        @v_data_3 = []
        @v_data_x = []
    end

    def readInput()
        print "Enter N: "
        @x = gets.chomp.to_f
        print "Enter c: "
        @c = gets.chomp.to_f
    end

    

    def to_recursive_ostruct(hash)
    result = hash.each_with_object({}) do |(x, y), memo|
        memo[x] = y.is_a?(Hash) ? to_recursive_ostruct(y) : y
    end
    OpenStruct.new(result)
    end


    def visualize(text, number, v_data)
        interpolations=["linear","step-before","step-after","polar","polar-reverse", "basis", "cardinal"]

        data = v_data
        p_w=300
        p_h=200
        w = 20+p_w*2
        h = 20+p_h*4
        x = pv.Scale.linear(data, lambda {|d| d.x}).range(0, p_w-30)
        y = pv.Scale.linear(data, lambda {|d| d.y}).range(0, p_h-20)  
        
        vis = pv.Panel.new()
        .width(w)
        .height(h)
        .bottom(20)
        .left(20)
        .right(10)
        .top(5)
        
        n=0
        m=(0).floor
        panel=vis.add(Rubyvis::Panel).
        left(n*(p_w+10)).
        top(m*(p_h+10)).
        width(p_w).
        height(p_h)
        panel.anchor('top').add(Rubyvis::Label).text(text)
        panel.add(Rubyvis::Line).data(data).
        line_width(2).
        left(lambda {|d| x.scale(d.x)}).
        bottom(lambda {|d| y.scale(d.y)}).
        interpolate(interpolations[6])
           
        vis.render
        file = File.new("./svg/task_5_" + number.to_s + ".svg", "w:UTF-8")
        file.print((vis.to_svg).to_str)
        file.close
    end

    def count1()
        for i in 1..@N
            for j in 0..(@c-1)
                if i == @N
                    @v_data_1 << OpenStruct.new(:x=>i, :y=> y(i.to_f))
                    break
                end
                @v_data_1 << OpenStruct.new(:x=>i, :y=> y((i + (1.0/@c)*j).to_f)) 
            end
        end
        puts
        @v_data_1.each {|elem| print elem.y, " " } 
        puts
        visualize("y(x)",1, @v_data_1)
    end

    def count2()
        i = Math::PI/@N
        while i <= Math::PI
            @v_data_2 << OpenStruct.new(:x=>i, :y=> z(i))
            i += (Math::PI - Math::PI/@N) / ((3.0/2.0)*@N + @c)
        end
        puts
        @v_data_2.each {|elem| print elem.y, " " } 
        puts
        visualize("z(x)", 2, @v_data_2)
    end

    def count3()
        i = 2
        while i <= @c
            case i
            when 2...@N                
                @v_data_3 << OpenStruct.new(:x=>i, :y=> y(i.to_f))
            when @N...(2*@N)
                @v_data_3 << OpenStruct.new(:x=>i, :y=> z(i.to_f))
            else
                @v_data_3 << OpenStruct.new(:x=>i, :y=> y(i.to_f) + z(i.to_f))
            end
            i += ((@c-2.0)/(2.0*@N))
        end
        puts
        @v_data_3.each {|elem| print elem.y, " " } 
        puts
        visualize("y(x) + z(x)", 3, @v_data_3)
    end

    def y(x)
        return (x**(1.0/4.0) - (1.0/x)**(1.0/4.0))**(-@N) + (x+1.0)/(x**2.0 - 4.0*x + 3.0*@N) + (((36.0*x*@c*@N)**(1.0/4.0)) / ((x + @c*@N + 1.0)/(x + 5.0)))
    end

    def z(x)
        return (Math.tan(2*x) * Math.cos(2*x)**(-1) - Math.tan(2*@c + x)*Math.cos(2*x)**(-2))/(Math.cos(2*x)**(-1) + Math.cos(3*x)**(-2)) + (1 + Math.cos(@N*x)**(1*@c))/(2*x + Math.sin(3*x)**2)
    end
end


counter = Counter.new()
# puts "Sum1 = #{counter.count1()}"
# puts "Sum1 = #{counter.count2()} = #{counter.ln_x()}"
# puts "Sum3 = #{counter.count3()}"
 counter.count1()
 counter.count2()
 counter.count3()

# counter.visualize(1)

#visualize([38049.30877870525, 7777.38940207084, 2250.7879604461386, 821.9195053828574, 354.31035752627173, 172.99988573129582, 93.14694524907475, 54.32504821491414, 33.909017536543786, 22.46774172760311, 15.712758871644164, 11.548746335658581, 8.888252383193546, 7.137153184703971, 5.956176012083584, 5.143986370214367, 4.57700950904077, 4.177104327043075, 3.893532070194733, 3.692555968730951, 3.5512598515122114, 3.453773869106402, 3.3889130867347985, 3.348666963453234, 3.3272133991167374, 3.320263164152922, 3.324616531772883, 3.337858688550149, 3.3581474296987235, 3.384063175856626, 3.4145016838886426, 3.448596398279244, 3.4856616383247356])


