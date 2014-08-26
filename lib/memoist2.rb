module Memoist2

  def self.memoized_ivar_for(symbol)
    "@_memoized_#{symbol.to_s.sub(/\?\Z/, '_query').sub(/!\Z/, '_bang')}".to_sym
  end

  module ClassMethods

    def memoize(*method_names)
      method_names.each do |method_name|
        memoized_ivar = Memoist2.memoized_ivar_for(method_name)
        memoized_module = Module.new do
          module_eval <<-EVAL
            def initialize(*args)
              #{memoized_ivar} = []
              super(*args)
            end

            def #{method_name}
              if !#{memoized_ivar}
                #{memoized_ivar} = [super]
              elsif #{memoized_ivar}.empty?
                #{memoized_ivar} << super
              end
              #{memoized_ivar}[0]
            end

            def self.to_s
              "Memoist2::MemoizedMethod(#{method_name})"
            end
            def self.inspect; to_s; end
          EVAL
        end
        prepend memoized_module
      end
    end

    def memoize_class_method(*method_names)
      singleton_class.class_eval do
        include Memoist2 unless ancestors.include?(Memoist2)
        memoize *method_names
      end
    end
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
end
