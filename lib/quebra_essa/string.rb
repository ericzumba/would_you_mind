require 'quebra_essa/bindable'

class WouldYouMind::String
  extend WouldYouMind::Bindable

  def self.csv_to_ary(string)
    string.split(",").map do |e|
      if block_given? then
        yield e 
      else
        e.strip
      end
    end
  end

end
