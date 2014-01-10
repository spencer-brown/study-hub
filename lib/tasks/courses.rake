desc 'get subjects from course list'
task :get_subjects => :environment do
	subject_abbr_list = []

	# get list of subject abbr
	File.open("purdue-courses.txt", "r").each_line do |line|
		subject = (line.split(' - ')[0]).split(' ')[0]
		subject_abbr_list << subject if !subject_abbr_list.include? subject
	end

	# write list to get_subjects.txt
	File.open("get_subjects.txt", "w+") do |f|
  	subject_abbr_list.each { |subject_abbr| f.puts(subject_abbr) }
  end
end




desc 'load subjects from subject_names.txt into the database'
task :load_subjects => :environment do

	# The scraped subject_names.txt doesn't include all of the subjects
	# -----------------------------------------------------------------
	# File.open("subject_names.txt", "r").each_line do |line|
	#   # remove excess html from scrape
	#   clean_line = (line.split('>'))[1]
	#   subject_abbr = (clean_line.split('-'))[0]
	  
	#   # separate name and abbr
	#   name_split = clean_line.split('-')
	  
	#   # account for names that have heiphens
	#   subject_name = ""
	#   name_split[1..name_split.size].each do |word|
	#   	subject_name += "#{word}" + ' '
	#   end
	#   subject_name = subject_name.strip

	#   Subject.create abbr: subject_abbr, name: subject_name
	# end

	File.open("get_subjects.txt", "r").each_line do |line|
	  subject_abbr = line.chomp

	  Subject.create abbr: subject_abbr, name: nil
	end	
end



desc 'destroy all subjects currently loaded in the db - for initial dev only'
task :clear_subjects => :environment do
	for subject in Subject.all
		subject.destroy
	end
end



desc 'load courses from purdue-courses.txt'
task :load_courses => :environment do
	File.open("purdue-courses.txt", "r").each_line do |line|
		
		# separate course number and name
		number_name = line.split(' - ')

		subject_id = Subject.find_by_abbr((number_name[0].split(' '))[0])
		number = (number_name[0].split(' '))[1]
		name = number_name[1]

		Group.create name: name, subject_id: subject_id, number: number
	end	
end