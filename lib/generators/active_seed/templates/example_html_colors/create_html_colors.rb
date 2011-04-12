class CreateHtmlColors < ActiveRecord::Migration
  def self.up
    create_table :html_color_families do |t|
      t.string :name

      t.timestamps
    end

    create_table :html_colors do |t|
      t.string :name
      t.string :hex_code
      t.references :html_color_family

      t.timestamps
    end
  end

  def self.down
    drop_table :html_colors
    drop_table :html_color_families
  end
end
