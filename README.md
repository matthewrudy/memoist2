memoist2
========

[![Build Status](https://travis-ci.org/matthewrudy/memoist2.png?branch=master)](https://travis-ci.org/matthewrudy/memoist2)

Simple Memoization for Ruby 2.0

Example
=======

Memoize an instance method

  class Foo
    include Memoist2

    def bar
      sleep 1 && 2**10
    end
    memoize :bar
  end

Memoize a class method

  class Foo
    include Memoist2

    def self.bar
      # something expensive
    end
    memoize_class_method :bar
  end

Licence
=======

Licensed under the MIT licence.

See the file LICENCE.