class Bootcamp
    
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, name| hash[name] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end
    
    def students
        @students
    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        if @students.length < 6
            @students << str 
            return true
        else
            return false
        end
    end
    
    def enrolled?(str)
        return true if @students.include?(str)
        return false
    end

    def student_to_teacher_ratio
        students.length / teachers.length
    end

    def add_grade(str,n)
        if enrolled?(str)
            @grades[str] += [n] 
            return true
        else
            return false
        end
    end

    def num_grades(str)
        @grades[str].length
    end

    def average_grade(str)
        return @grades[str].sum / @grades[str].length if @grades[str].length > 0
        return nil if @grades[str].length == 0
    end
end
