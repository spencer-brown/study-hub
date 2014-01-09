desc 'load subjects from subjects.txt into the database'
task :load_subjects => :environment do

	File.open("subject_names.txt", "r").each_line do |line|
	  clean_line = (line.split('>'))[1]
	  subject_abbr = (clean_line.split('-'))[0]
	  subject_name = (clean_line.split('-'))[1].chomp

	  # puts subject_name
	  Subject.create abbr: subject_abbr, name: subject_name
	end
end

desc 'destroy all subjects currently loaded in the db'
task :clear_subjects => :environment do
	for subject in Subject.all
		subject.destroy
	end
end