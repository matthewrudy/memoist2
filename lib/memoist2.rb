module Memoist2

  def memoize(method_name)
    memoized_module = Module.new do
      module_eval <<-EVAL
        def #{method_name}
          # puts "memoized"
          @memoize_cache ||= super
        end
      EVAL
    end
    prepend memoized_module
  end

end
