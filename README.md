memoist2
========

[![Build Status](https://travis-ci.org/matthewrudy/memoist2.png?branch=master)](https://travis-ci.org/matthewrudy/memoist2)

Simple Memoization for Ruby 2.0

### Differences between Memoist & Memoist2

Unlike [Memoist], this is **not** a drop-in replacement for old ActiveSupport::Memoizable. Memoist will still work just fine for that if you're using Ruby 2.0. This project, on the other hand, is just me playing using Module#prepend which makes this stuff very simple.

* Memoist works on all Rubies
* Memoist is quite complicated
* Memoist has the exact same api as ActiveSupport::Memoizable
* Memoist2 only works on Ruby >= 2.0.0
* Memoist2 is deliberately much simpler
* Memoist2 has a slightly different API that could totally change

  [Memoist]: https://github.com/matthewrudy/memoist

Example
-------

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
-------

Licensed under the MIT licence.

See the file LICENCE.
