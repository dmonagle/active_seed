namespace :db do
  desc "Load seed files (from db/seeds) into the current environment's database." 
  task :active_seed => :environment do
    require "active_seed/seed_csv"
    set = ENV["set"] 
    set = RAILS_ENV unless !set.nil?
    set_file = File.join(RAILS_ROOT, "db", "active_seed", set, ".yml")
    if !File.exists?(set_file)
    	puts "Set file doesn't exist: " << set_file
	    return
    end
    puts "Seeding from set '" + set + "'"
    fixture_list = YAML::load_file(set_file)
    fixture_list.each do |model, sf| 
	    seed_file = File.join(RAILS_ROOT, "db", "active_seed", "data", sf + ".csv")
    	if !File.exists?(seed_file)
		    puts "Seed file doesn't exist: " << seed_file
    	else
		    puts "Seeding '" + seed_file + "'..." 
		    seed_csv(model, seed_file) 
	    end
    end
  end
end
