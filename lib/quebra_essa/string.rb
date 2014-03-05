class QuebraEssa::String

  def self.csv_to_ary(string)
    string.split(",").map do |e|
      if block_given? then
        yield e 
      else
        e.strip
      end
    end
  end

  def self.bind(obj, method_name)
    def obj.csv_to_ary(&block)
      if block then
        QuebraEssa::String.csv_to_ary(self) {|e| block.call e}
      else
        QuebraEssa::String.csv_to_ary(self) 
      end
    end
  end
end
