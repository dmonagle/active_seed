require 'rails/generators'

module IntricaCms
  module Generators
    class HtmlColorExampleGenerator < Rails::Generators::Base
      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates', 'html_color_example')
      end

      def create_files
          install_dir = File.join('db', 'active_seed')
          directory 'html_colors', File.join(install_dir, "data", "html_colors")
          copy_file 'html_colors.yml', File.join(install_dir, 'html_colors.yml')
      end
    end
  end
end