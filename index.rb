require 'rubygems'
require 'json'

module Action_stu
    #global variable
    $student = []
    #read data
    def Action_stu.readData
        json = File.read('db.json')
        $student = JSON.parse(json)
    end

    #write data
    def Action_stu.writeData
        File.open("db.json","w") do |f|
            f.write($student.to_json)
        end
    end

    #show menu
    def Action_stu.menu 
        puts "Chọn các mục dưới :"
        puts "1. Thêm mới sinh viên"
        puts "2. Xoá sinh viên"
        puts "3. Tìm kiếm sinh viên"
        puts "4. Xem danh sách sinh viên"
        puts "5. Thoát"
    end

    #print list student
    def Action_stu.printStudent
        readData()
        $student.each do |item|
            puts item
        end
    end

    #create new students
    def Action_stu.createStudent
        begin
            readData()
            print "Nhập số student muốn thêm : "
            total = gets.chomp
            for i in (1..total.to_i)
                puts "NHẬP THÔNG TIN STUDENT THỨ #{i}"
                print "Nhập tên student : "
                name = gets.chomp
                print "Nhập tuổi student : "
                age = gets.chomp
                data = {
                    "name" => name.strip.capitalize,
                    "age" => age.strip.to_i
                }
                $student.push(data)
                writeData()
                puts "Create student complete"
            end
        rescue => exception
            puts exception
        end
    end

    #remove student
    def Action_stu.deleteStudent
        begin
            readData()
            print "Nhập tên student muốn xoá : "
            name = gets.chomp
            tmp = 0
            $student.each do |item|
                if(item["name"].downcase == name.strip.downcase)
                    tmp = tmp + 1
                    $student.delete(item)
                    writeData()
                    puts "Complete remove student"
                end
            end
        rescue => exception
            
        end
        if tmp == 0
            puts "Not found"
        end
    end

    #search student
    def Action_stu.searchStudent
        begin
            readData()
            print "Nhập tên student muốn tìm : "
            name = gets.chomp
            tmp = 0
            error = []
            $student.each do |item|
                if item["name"].downcase.include?(name.strip.downcase) == true
                    puts item
                    tmp = tmp + 1
                end
            end
        rescue => exception

        end
        if tmp == 0
            puts "not found"
        end
    end
end

#main
loop do
    Action_stu.menu
    puts 'Chọn mục :'
    input = gets.chomp
    case input
    when '1'
        Action_stu.createStudent
    when '2'
        Action_stu.deleteStudent
    when '3'
        Action_stu.searchStudent
    when '4'
        Action_stu.printStudent
    when '5'
        break
    else 
        puts 'error, please reinput'
    end
end



