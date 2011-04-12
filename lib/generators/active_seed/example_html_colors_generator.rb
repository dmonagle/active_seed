require 'rails/generators'
require 'rails/generators/migration'

module ActiveSeed
  module Generators
    class ExampleHtmlColorsGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates', 'example_html_colors')
      end

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          @add = @add.nil? ? 0.0 : @add + 0.1
          Time.now.utc.strftime("%Y%m%d%H%M%S").to_f + @add
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def create_files
          install_dir = File.join('db', 'active_seed')
          directory 'html_colors', File.join(install_dir, "data", "html_colors")
          copy_file 'html_colors.yml', File.join(install_dir, 'html_colors.yml')
      end

      def create_models
        copy_file 'html_color.rb', File.join("app", "models", 'html_color.rb')
        copy_file 'html_color_family.rb', File.join("app", "models", 'html_color_family.rb')
      end

      def create_migrations
        migration_template 'create_html_colors.rb', File.join("db", "migrate", "create_html_colors.rb")
      end
    end
  end
end