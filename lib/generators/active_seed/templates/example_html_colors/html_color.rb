class HtmlColor < ActiveRecord::Base
  belongs_to :html_color_family

  def luminosity_contrast(compare)
    lum1 = 0.2126 * (self.red/255 ** 2.2)
    + 0.7152 * (self.green/255 ** 2.2)
    + 0.0722 * (self.blue/255 ** 2.2)

    lum2 = 0.2126 * (compare.red/255 ** 2.2)
    + 0.7152 * (compare.green/255 ** 2.2)
    + 0.0722 * (compare.blue/255 ** 2.2)
 
    if(lum1 > lum2)
      return (lum1+0.05) / (lum2+0.05);
    else
      return (lum2+0.05) / (lum1+0.05);
    end
  end

  def best_contrast(colors)
    best_contrast = 0;
    return_color = "000000"
    colors.each do |c|
      contrast = self.luminosity_contrast(c)
      if contrast > best_contrast
        best_contrast = contrast
        return_color = c.hex_code
      end
    end
    return_color
  end

  def red
    (self.hex_code.to_i(16) >> 16) & 255
  end

  def green
    (self.hex_code.to_i(16) >> 8) & 255
  end

  def blue
    self.hex_code.to_i(16) & 255
  end
end
