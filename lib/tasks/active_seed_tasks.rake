namespace :db do
  desc "Load seed files (from db/seeds) into the current environment's database."
  task :active_seed => :environment do
    require "active_seed"
    set = ENV["set"]
    set = ::Rails.env unless !set.nil?
    ActiveSeed.seed(set)
  end
end
