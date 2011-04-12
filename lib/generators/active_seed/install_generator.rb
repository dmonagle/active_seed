require 'rails/generators'

module ActiveSeed
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def create_files
        install_dir = File.join('db', 'active_seed')
        copy_file 'development.yml', File.join(install_dir, 'development.yml')
        copy_file 'development.yml', File.join(install_dir, 'production.yml')
        copy_file 'development.yml', File.join(install_dir, 'test.yml')
        empty_directory File.join(install_dir, 'data')
      end
    end
  end
end

