f1 = lambda { |x| 1/((x+1)*Math.sqrt(x**2 + 1)) } # лямбда с одним аргументов

f2 = lambda { |x| Math.tan(x/2 + Math::PI/4)**3 }

# вычисление интеграла методом прямоугольников на интервале [a, b]
def prm(a, b, f, eps)
    n = 1
    s = 0
    while true
        h = (b-a)/n
        s1 = 0
        for i in 0..n-1
            s1 += f.call(a + i*h)
        end
        s1 *= h
        if (s1 - s).abs < eps
            return s1
        end
        s = s1
        n *= 2
    end
end


# вычисление интеграла методом трапеций на интервале [a, b]
def trp(a, b, f, eps)
    n = 1
    s = 0
    while true
        h = (b - a) / n
        s1 = 0
        for i in 1..n-1
            s1 += f.call(a + i*h)
        end
        s1 = (s1 + (f.call(a) + f.call(b))/2) * h
        if (s1 - s).abs < eps
            return s1
        end
        s = s1
        n *= 2
    end
end

puts prm(0.0, 1.0, f1, 0.0001)
puts trp(0.0, 1.0, f1, 0.0001)
puts prm(0.0, Math::PI/4, f2, 0.0001)
puts trp(0.0, Math::PI/4, f2, 0.0001)