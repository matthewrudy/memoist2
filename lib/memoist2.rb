module Memoist2

  def self.memoized_ivar_for(symbol)
    "@_memoized_#{symbol.to_s.sub(/\?\Z/, '_query').sub(/!\Z/, '_bang')}".to_sym
  end

  module ClassMethods

    def memoize(method_name)
      memoized_ivar = Memoist2.memoized_ivar_for(method_name)
      memoized_module = Module.new do
        module_eval <<-EVAL
          def #{method_name}
            unless #{memoized_ivar}
              #{memoized_ivar} = [super]
            end
            #{memoized_ivar}[0]
          end
        EVAL
      end
      prepend memoized_module
    end

    def memoize_class_method(method_name)
      singleton_class.class_eval do
        include Memoist2 unless ancestors.include?(Memoist2)
        memoize method_name
      end
    end

  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
end
