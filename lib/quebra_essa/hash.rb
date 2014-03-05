# todo: trocar o nome pra WouldYouMind
require 'quebra_essa/bindable'

class QuebraEssa::Hash
  extend QuebraEssa::Bindable

  def self.reach(hash, *path)
    result = nil
    path.each do |p|
      result = hash[p]
      break if !result.is_a? Hash
      hash = hash[p]
    end
    result
  end

end
