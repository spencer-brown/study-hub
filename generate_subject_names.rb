subject_names = []

File.open("subject_names.txt", "r").each_line do |line|
  data = line.split('>')
  subject_name = data[1]
  subject_names << subject_name
end

File.open("subjects.txt", "w+") do |f|
  subject_names.each { |subject_name| f.puts(subject_name) }
end