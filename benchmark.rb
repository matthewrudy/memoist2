<<-INTRO

Question:
  Is Memoist2 performant?

Answer:

  Raw is a little bit slower
                                         user     system      total        real
    raw method                       2.220000   0.000000   2.220000 (  2.216027)
    memoist2 method                  1.670000   0.000000   1.670000 (  1.670678)
    manual memoized (||=)            1.280000   0.000000   1.280000 (  1.286099)
    manual memoized (defined?)       1.380000   0.000000   1.380000 (  1.372037)

INTRO

require 'benchmark'
require 'memoist2'

TIMES = 10_000_000

class MyClass
  include Memoist2

  def raw
    (2**10)**2 # something mildly difficult
  end

  def memoized
    1
  end
  memoize :memoized

  def variable_cache
    @variable_cache ||= 1
  end

  def defined_cache
    unless defined?(@defined_cache)
      @defined_cache = 1
    end
    @defined_cache
  end
end

INSTANCE = MyClass.new

Benchmark.bm(30) do |x|
  x.report("raw method") do
    TIMES.times do
      INSTANCE.raw
    end
  end

  x.report("memoist2 method") do
    TIMES.times do
      INSTANCE.memoized
    end
  end

  x.report("manual memoized (||=)") do
    TIMES.times do
      INSTANCE.variable_cache
    end
  end

  x.report("manual memoized (defined?)") do
    TIMES.times do
      INSTANCE.defined_cache
    end
  end
end