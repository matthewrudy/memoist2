require 'memoist2'

describe Memoist2 do

  class Foo
    extend Memoist2

    def bar
      count!
    end
    memoize :bar

    def question?
      count!
    end
    memoize :question?

    def bang!
      count!
    end
    memoize :bang!

    private

    def count!
      @count ||= 0
      @count += 1
    end

    class << self
      extend Memoist2

      def bar
        @bar_count ||= 0
        @bar_count += 1
      end
      memoize :bar
    end
  end

  describe "instance methods" do
    subject{ Foo.new }

    it "can be memoized" do
      subject.bar.should == subject.bar
    end
  end

  describe "class methods" do
    subject{ Foo }

    it "can be memoized" do
      subject.bar.should == subject.bar
    end
  end

  describe "punctuated methods" do
    subject{ Foo.new }

    it "can memoize question methods" do
      subject.question?.should == subject.question?
    end

    it "can memoize bang methods" do
      subject.bang!.should == subject.bang!
    end
  end
end