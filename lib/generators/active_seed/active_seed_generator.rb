require 'rails/generators'

class ActiveSeedGenerator < Rails::Generators::Base
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def create_files
      copy_file 'development.yml', "db/seed/development.yml"
  end
end
