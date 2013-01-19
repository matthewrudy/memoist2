require File.expand_path('../../lib/memoist2', __FILE__)

class Foo
  extend Memoist2

  def bar
    #puts "bar called"
    #"bar #{Time.now}"
    1
  end
  memoize :bar

  def bar2
    puts "bar2 called"
    "bar2 #{Time.now}"
  end
  memoize :bar2

  def unbar
    #puts "unbar called"
    #"unbar #{Time.now}"
    1
  end
end

require 'benchmark'

TIMES = 100_000_000

Benchmark.bmbm do |x|

  x.report "unmemoized" do
    foo = Foo.new
    TIMES.times do
      foo.unbar
    end
  end

  x.report "memoized" do
    foo = Foo.new
    TIMES.times do
      foo.bar
    end
  end
end
