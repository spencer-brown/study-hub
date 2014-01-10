desc 'load subjects from subjects.txt into the database'
task :load_subjects => :environment do
	File.open("subject_names.txt", "r").each_line do |line|
	  # remove excess html from scrape
	  clean_line = (line.split('>'))[1]
	  subject_abbr = (clean_line.split('-'))[0]
	  
	  # separate name and abbr
	  name_split = clean_line.split('-')
	  
	  # account for names that have heiphens
	  subject_name = ""
	  name_split[1..name_split.size].each do |word|
	  	subject_name += "#{word}" + ' '
	  end
	  subject_name = subject_name.strip

	  Subject.create abbr: subject_abbr, name: subject_name
	end
end



desc 'destroy all subjects currently loaded in the db'
task :clear_subjects => :environment do
	for subject in Subject.all
		subject.destroy
	end
end