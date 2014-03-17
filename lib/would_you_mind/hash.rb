# todo: trocar o nome pra WouldYouMind
require 'would_you_mind/bindable'

class WouldYouMind::Hash
  extend WouldYouMind::Bindable

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
