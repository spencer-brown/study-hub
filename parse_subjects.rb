subjects = []

File.open("purdue-courses.txt", "r").each_line do |line|
  data = line.split(' ')
  subject = data[0]
  if !subjects.include? subject
  	subjects << subject
  end
end

File.open("subjects.txt", "w+") do |f|
  subjects.each { |subject| f.puts(subject) }
end