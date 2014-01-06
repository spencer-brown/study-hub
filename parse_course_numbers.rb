# course_numbers = []

File.open("purdue-courses.txt", "r").each_line do |line|
  first = line.split(' - ')
  
  number = (first[0].split(' '))[1]
  name = first[1]

  course_number = number + ' ' + name
  puts course_number

  course_numbers << course_number
end

File.open("couse_numbers.txt", "w+") do |f|
  course_numbers.each { |course_number| f.puts(course_number) }
end