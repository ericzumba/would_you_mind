# todo: trocar o nome pra WouldYouMind
class QuebraEssa::Hash
  def self.reach(hash, *path)
    result = nil
    path.each do |p|
      result = hash[p]
      break if !result.is_a? Hash
      hash = hash[p]
    end
    result
  end

  def self.bind(obj, method_name)
    eigenclass = class<<obj; self end
    eigenclass.class_eval do 
      define_method(method_name) do |*path|
        QuebraEssa::Hash.reach(self, *path) 
      end
    end
  end

  # def self.bind(obj, method_name)
  #   obj.instance_eval do 
  #     self.class.send(:define_method, method_name) do |*path|
  #       QuebraEssa::Hash.send(method_name, *path)
  #     end
  #   end
  # end
end
