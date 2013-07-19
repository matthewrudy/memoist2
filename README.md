memoist2
========

Simple Memoization for Ruby 2.0

Example
=======

Memoize an instance method

  class Foo
    extend Memoist2

    def bar
      sleep 1 && 2**10
    end
    memoize :bar
  end

Memoize a class method

  class Foo
    class << self
      extend Memoist2

      def bar
        # something expensive
      end
      memoize :bar
    end
  end

Licence
=======

Licensed under the MIT licence.

See the file LICENCE.