require 'rails/generators'

module ActiveSeed
  module Generators
    class ExampleHtmlColorsGenerator < Rails::Generators::Base
      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates', 'example_html_colors')
      end

      def create_files
          install_dir = File.join('db', 'active_seed')
          directory 'html_colors', File.join(install_dir, "data", "html_colors")
          copy_file 'html_colors.yml', File.join(install_dir, 'html_colors.yml')
      end
    end
  end
end