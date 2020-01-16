require './module.rb'

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




