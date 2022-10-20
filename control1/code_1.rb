module Faculty
    Cybernetics = 1
    Mathematics = 2
    Physics = 3
    Biology = 4
    Phylosophy = 5
end


class Student

    #empty constructor
    def initialize()        
    end

    #required constructor 
    def initialize(id, surname, name, birth_date, faculty, course, group)
        @id = id
        @surname = surname
        @name = name
        @birth_date = birth_date
        @faculty = faculty
        @course = course
        @group = group
    end

    #full constructor
    def initialize(id, surname, name, patronymic, birth_date, address, phone, faculty, course, group)
        @id = id
        @surname = surname
        @name = name
        @patronymic = patronymic
        @birth_date = birth_date
        @address = address
        @phone = phone
        @faculty = faculty
        @course = course
        @group = group
    end

    #getters
    def get_id() @id end
    def get_surname() @surname end
    def get_name() @name end
    def get_patronymic() @patronymic end
    def get_birth_date() @birth_date end
    def get_address() @address end
    def get_phone() @phone end
    def get_faculty() @faculty end
    def get_course() @course end
    def get_group() @group end

    #setters
    def set_id(id) @id = id end
    def set_surname(surname) @surname = surname end
    def set_name(name) @name = name end
    def set_patronymic(patronymic) @patronymic = patronymic end
    def set_birth_date(birth_date) @birth_date = birth_date end
    def set_address(address) @address = address end
    def set_phone(phone) @phone = phone end
    def set_faculty(faculty) @faculty = faculty end
    def set_course(course) @course = course end
    def set_group(group) @group = group end

    #to string
    def toString()
        faculty = ""
        case @faculty
        when Faculty::Cybernetics
            faculty = "Cybernetics"
        when Faculty::Mathematics
            faculty = "Mathematics"
        when Faculty::Physics
            faculty = "Physics"
        when Faculty::Biology
            faculty = "Biology"
        when Faculty::Phylosophy
            faculty = "Phylosophy"
        end        
        return "Student: #{@id}, #{@surname}, #{@name}, #{@patronymic}, #{@birth_date}, #{@address}, #{@phone}, #{faculty}, #{@course}, #{@group}"
    end
end

class StudentManager
    def initialize()   
        @students = Array.new     
    end

    def add_student(student)
        @students.push(student)
    end

    def get_students()
        @students
    end

    def print_students(students)
        temp_students = students
        temp_students.each do |student|
            puts student.toString()
        end
    end

    def get_students_by_faculty(faculty)
        print_students(@students.select { |student| student.get_faculty() == faculty })
    end

    def get_students_by_faculty_and_course()
        puts("Cybernetics: ")
        for i in 1..4
            puts("Course #{i}: ")
            print_students(@students.select { |student| student.get_faculty() == Faculty::Cybernetics && student.get_course() == i })
        end
        puts()
        puts("Mathematics: ")
        for i in 1..4
            print("Course #{i}: ")
            print_students(@students.select { |student| student.get_faculty() == Faculty::Mathematics && student.get_course() == i })
        end
        puts()
        puts("Physics: ")
        for i in 1..4
            puts("Course #{i}: ")
            print_students(@students.select { |student| student.get_faculty() == Faculty::Physics && student.get_course() == i })
        end
        puts()
        puts("Biology: ")
        for i in 1..4
            puts("Course #{i}: ")
            print_students(@students.select { |student| student.get_faculty() == Faculty::Biology && student.get_course() == i })
        end
        puts()
        puts("Phylosophy: ")
        for i in 1..4
            puts("Course #{i}: ")
            print_students(@students.select { |student| student.get_faculty() == Faculty::Phylosophy && student.get_course() == i })
        end
    end

    def get_students_by_birth_date(birth_date)
        print_students(@students.select { |student| student.get_birth_date() > birth_date })
    end

    def get_students_by_group(group)
        print_students(@students.select { |student| student.get_group() == group })
    end

    def fill_students()
        add_student(Student.new(1, "Bloshenko", "David", "Ivanovich", 2005, "Kyiv", 380982376729, Faculty::Cybernetics, 1, "K19"))
        add_student(Student.new(2, "Slisarenko", "Nikita", "Petrovich", 2005, "Kyiv", 380965234568, Faculty::Cybernetics, 1, "K18"))
        add_student(Student.new(3, "Sidorov", "Sidor", "Sidorovich", 2005, "Kyiv", 380961234569, Faculty::Cybernetics, 1, "K19"))
        add_student(Student.new(4, "Semenov", "Sergey", "Semenovich", 2004, "Kyiv", 380981234570, Faculty::Cybernetics, 2, "K29"))
        add_student(Student.new(5, "Ivanov", "Ivan", "Ivanovich", 2004, "Kyiv", 380961234571, Faculty::Cybernetics, 2, "K29"))
        add_student(Student.new(6, "Petrov", "Victor", "Petrovich", 2004, "Kyiv", 380961234572, Faculty::Cybernetics, 2, "K27"))
        add_student(Student.new(7, "Prokopchuk", "Artem", "Sidorovich", 2003, "Kyiv", 380981234573, Faculty::Cybernetics, 3, "K39"))
        add_student(Student.new(8, "Polishchuck", "Stepan", "Semenovich", 2003, "Kyiv", 380961234574, Faculty::Cybernetics, 3, "K39"))
        add_student(Student.new(9, "Bocharov", "Maksim", "Ivanovich", 2003, "Kyiv", 380981234575, Faculty::Cybernetics, 3, "K37"))
        add_student(Student.new(10, "Safroniuk", "Petr", "Petrovich", 2002, "Kyiv", 380961234576, Faculty::Cybernetics, 4, "K47"))
        add_student(Student.new(11, "Koba", "Paul", "Sidorovich", 2002, "Kyiv", 380981234577, Faculty::Cybernetics, 4, "K49"))
        add_student(Student.new(12, "Kyryliuk", "Mykola", "Semenovich", 2002, "Kyiv", 380981234578, Faculty::Cybernetics, 4, "K49"))
        add_student(Student.new(13, "Grebenenko", "Valeriy", "Andriyovich", 2005, "Kyiv", 380982376789, Faculty::Mathematics, 1, "M13"))
        add_student(Student.new(14, "Sahaev", "Lyudmila", "Valeresvna", 2005, "Kyiv", 380965234789, Faculty::Mathematics, 1, "M17"))
        add_student(Student.new(15, "Bykova", "Tamara", "Grigoryevna", 2005, "Kyiv", 380961234790, Faculty::Mathematics, 1, "M17"))
        add_student(Student.new(16, "Korsak", "Natalia", "Iosifovna", 2004, "Kyiv", 380981234789, Faculty::Mathematics, 2, "M23"))
        add_student(Student.new(17, "Boguta", "Aleksyander", "Viktorovich", 2004, "Kyiv", 380961234987, Faculty::Mathematics, 2, "M23"))
        add_student(Student.new(18, "Artemov", "Artem", "Semenovich", 2004, "Kyiv", 380961234688, Faculty::Mathematics, 2, "M27"))
        add_student(Student.new(19, "Gusevich", "Artem", "Romanovich", 2003, "Kyiv", 380981234600, Faculty::Mathematics, 3, "M37"))
        add_student(Student.new(20, "Antonov", "Anton", "Antonovich", 2003, "Kyiv", 380961234484, Faculty::Mathematics, 3, "M33"))
        add_student(Student.new(21, "Gavrilov", "Volodymyr", "Oleksandrovych", 2003, "Kyiv", 380981234578, Faculty::Mathematics, 3, "M37"))
        add_student(Student.new(22, "Tymchenko", "Anatoliy", "Mykolaiovych", 2002, "Kyiv", 380961234151, Faculty::Mathematics, 4, "M43"))
        add_student(Student.new(23, "Moroz", "Ivan", "Arturovich", 2002, "Kyiv", 380981234989, Faculty::Mathematics, 4, "M47"))
        add_student(Student.new(24, "Kotov", "Aleksyander", "Mykolaiovych", 2002, "Kyiv", 380981237656, Faculty::Mathematics, 4, "M47"))
        add_student(Student.new(25, "Golenko", "Oleksyandre", "Vladymurolvich", 2005, "Kyiv", 380982376555, Faculty::Phylosophy, 1, "P15"))
        add_student(Student.new(26, "Baranov", "Dmitry", "Vladimirovich", 2005, "Kyiv", 380965234589, Faculty::Phylosophy, 1, "P16"))
        add_student(Student.new(27, "Tarasiuk", "Yuriy", "Andriyovich", 2005, "Kyiv", 380961234801, Faculty::Phylosophy, 1, "P15"))
        add_student(Student.new(28, "Prokopenko", "Igor", "Vitaliyevich", 2004, "Kyiv", 380981231011, Faculty::Phylosophy, 2, "P26"))
        add_student(Student.new(29, "Slupskiy", "Vasiliy", "Vitaliyevich", 2004, "Kyiv", 380961235780, Faculty::Phylosophy, 2, "P26"))
        add_student(Student.new(30, "Vaskiv", "Stanislav", "Vitaliyevich", 2004, "Kyiv", 380961230012, Faculty::Phylosophy, 2, "P25"))
        add_student(Student.new(31, "Karseren", "Natalya", "Vladimirovna", 2003, "Kyiv", 380981250030, Faculty::Phylosophy, 3, "P35"))
        add_student(Student.new(32, "Prokopiev", "Sergey", "Vitaliyevich", 2003, "Kyiv", 380961288033, Faculty::Phylosophy, 3, "P36"))
        add_student(Student.new(33, "Semenov", "Sergey", "Stanislavovich", 2003, "Kyiv", 380981201053, Faculty::Phylosophy, 3, "P35"))
        add_student(Student.new(34, "Dzyubenko", "Mariya", "Mihailivna", 2002, "Kyiv", 380961234556, Faculty::Phylosophy, 4, "P46"))
        add_student(Student.new(35, "Koleschuk", "Volodymyr", "Olegovich", 2002, "Kyiv", 380981233131, Faculty::Phylosophy, 4, "P46"))
        add_student(Student.new(36, "Pavlenko", "Oleksiy", "Vitaliyevich", 2002, "Kyiv", 380981237656, Faculty::Phylosophy, 4, "P45"))
        add_student(Student.new(37, "Fadedenko", "Vladyslav", "Viktorovich", 2005, "Kyiv", 380981237876, Faculty::Physics, 1, "PS12"))
        add_student(Student.new(38, "Korobka", "Vitaliy", "Denysikovich", 2005, "Kyiv", 380971234789, Faculty::Physics, 1, "PS18"))
        add_student(Student.new(39, "Kolbitov", "Yurii", "Ihorovich", 2005, "Kyiv", 380961230091, Faculty::Physics, 1, "PS18"))
        add_student(Student.new(40, "Andreev", "Andriy", "Antonovich", 2004, "Kyiv", 380981231159, Faculty::Physics, 2, "PS22"))
        add_student(Student.new(41, "Kononov", "Dmytro", "Ihorovich", 2004, "Kyiv", 380961232154, Faculty::Physics, 2, "PS22"))
        add_student(Student.new(42, "Berviuk", "Anna", "Vitaliyivna", 2004, "Kyiv", 380961231104, Faculty::Physics, 2, "PS28"))
        add_student(Student.new(43, "Shamis", "Artur", "Artemovich", 2003, "Kyiv", 380981230899, Faculty::Physics, 3, "PS32"))
        add_student(Student.new(44, "Vykhorin", "Sergey", "Andreevich", 2003, "Kyiv", 380961231111, Faculty::Physics, 3, "PS38"))
        add_student(Student.new(45, "Nesterchuk", "Anton", "Viktorovich", 2003, "Kyiv", 380981235788, Faculty::Physics, 3, "PS38"))
        add_student(Student.new(46, "Gerasimov", "Roman", "Romaovych", 2002, "Kyiv", 380961237899, Faculty::Physics, 4, "PS48"))
        add_student(Student.new(47, "Puzyrekov", "Roman", "Denysikovich", 2002, "Kyiv", 380981239080, Faculty::Physics, 4, "PS42"))
        add_student(Student.new(48, "Bochenko", "Ihor", "Serhiovich", 2002, "Kyiv", 380961237454, Faculty::Physics, 4, "PS48"))
        add_student(Student.new(49, "Amelko", "Vladyslav", "Ivanov", 2005, "Kyiv", 380981235000, Faculty::Biology, 1, "B14"))
        add_student(Student.new(50, "Danilchenko", "Ten", "Techo", 2005, "Kyiv", 380971234555, Faculty::Biology, 1, "B11"))
        add_student(Student.new(51, "Kosarev", "Yurii", "Davido", 2005, "Kyiv", 380961231111, Faculty::Biology, 1, "B14"))
        add_student(Student.new(52, "Lozova", "Valeriy", "Ivanov", 2004, "Kyiv", 380981234325, Faculty::Biology, 2, "B21"))
        add_student(Student.new(53, "Lesovich", "Vladimir", "Deniyovich", 2004, "Kyiv", 380961231345, Faculty::Biology, 2, "B21"))
        add_student(Student.new(54, "Sherstiyenko", "Oleksandra", "Viktorivna", 2004, "Kyiv", 380961235600, Faculty::Biology, 2, "B24"))
        add_student(Student.new(55, "Ostovskiy", "Anton", "Igorev", 2003, "Kyiv", 380981237890, Faculty::Biology, 3, "B34"))
        add_student(Student.new(56, "Besusly", "Ryhor", "Deniyovich", 2003, "Kyiv", 380961235789, Faculty::Biology, 3, "B31"))
        add_student(Student.new(57, "Petryk", "Artem", "Serhiyovych", 2003, "Kyiv", 380981238123, Faculty::Biology, 3, "B34"))
        add_student(Student.new(58, "Kondurov", "Ihor", "Andriyovich", 2002, "Kyiv", 380961234567, Faculty::Biology, 4, "B41"))
        add_student(Student.new(59, "Stankevuch", "Vitaliy", "Solomonovich", 2002, "Kyiv", 380981239000, Faculty::Biology, 4, "B41"))
        add_student(Student.new(60, "Sorokina", "Anastasiya", "Igorevna", 2002, "Kyiv", 380961239870, Faculty::Biology, 4, "B44"))
    end    
end


manager = StudentManager.new()
manager.fill_students()

# manager.get_students_by_faculty(Faculty::Phylosophy)
# manager.get_students_by_faculty_and_course()
# manager.get_students_by_birth_date(2004)
manager.get_students_by_group("P35")