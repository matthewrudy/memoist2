require File.expand_path('../../lib/memoist2', __FILE__)

class Foo
  extend Memoist2

  def string
    "string"
  end

  def string_memoized
    "string"
  end
  memoize :string_memoized

  def fixnum
    42
  end

  def fixnum_memoized
    42
  end
  memoize :fixnum_memoized
end

require 'benchmark'

TIMES = 10_000_000

Benchmark.bmbm do |x|

  x.report "string - memoized" do
    foo = Foo.new
    TIMES.times do
      foo.string_memoized
    end
  end

  x.report "string - unmemoized" do
    foo = Foo.new
    TIMES.times do
      foo.string
    end
  end

  x.report "fixnum - memoized" do
    foo = Foo.new
    TIMES.times do
      foo.fixnum_memoized
    end
  end

  x.report "fixnum - unmemoized" do
    foo = Foo.new
    TIMES.times do
      foo.fixnum
    end
  end
end
