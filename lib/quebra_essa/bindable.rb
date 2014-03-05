module QuebraEssa::Bindable

  def bind(obj, method_name)
    context = self
    eigenclass = class<<obj; self end
    eigenclass.class_eval do 
      define_method(method_name) do |*args, &block|
        if block then
          context.send(method_name, self, *args) {|e| block.call e}
        else
          context.send(method_name, self, *args)
        end
      end
    end
  end
end
