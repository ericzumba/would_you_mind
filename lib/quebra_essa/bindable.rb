module QuebraEssa::Bindable

  def bind(obj, method_name)
    context = self
    eigenclass = class<<obj; self end
    eigenclass.class_eval do 
      define_method(method_name) do |*args|
        context.send(method_name, self, *args) 
      end
    end
  end
end
