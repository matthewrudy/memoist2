require 'memoist2'

describe Memoist2 do

  # used as base class for examples
  class Counter
    def initialize
      @counter = 0
    end
    attr_reader :counter

    def count!
      @counter += 1
    end
  end

  describe "nil values" do
    subject do
      Class.new(Counter) do
        include Memoist2

        def nilly
          count!
          nil
        end
        memoize :nilly
      end.new
    end

    it "returns the expected value" do
      5.times do
        expect(subject.nilly).to be nil
      end
    end

    it "memoizes correctly" do
      expect do
        5.times{ subject.nilly }
      end.to change{ subject.counter }.by(1)
    end
  end

  describe "instance methods" do
    subject do
      Class.new(Counter) do
        include Memoist2

        def foo
          count!
          :bar
        end
        memoize :foo
      end.new
    end

    it "returns the expected value" do
      5.times do
        expect(subject.foo).to be :bar
      end
    end

    it "memoizes correctly" do
      expect do
        5.times{ subject.foo }
      end.to change{ subject.counter }.by(1)
    end

    it "can memoize multiple methods simultaneously" do
      subject = Class.new(Counter) do
        include Memoist2

        def a
          count! && :a
        end

        def b
          count! && :b
        end

        memoize :a, :b
      end.new

      5.times{ subject.a }
      5.times{ subject.b }

      expect(subject.counter).to be 2
    end
  end

  describe "class methods" do
    describe "using metaclass" do
      subject do
        Class.new do
          class << self
            include Memoist2

            def foo
              @counter ||= 0
              @counter += 1
            end
            memoize :foo
          end
        end
      end

      it "works" do
        5.times do
          expect(subject.foo).to be 1
        end
      end
    end

    describe "using memoize_class_method" do
      subject do
        Class.new do
          include Memoist2

          def self.foo
            @counter ||= 0
            @counter += 1
          end
          memoize_class_method :foo
        end
      end

      it "works" do
        5.times do
          expect(subject.foo).to be 1
        end
      end
    end
  end

  describe "punctuated methods" do
    subject do
      Class.new do
        include Memoist2

        def question?
          @question_calls ||= 0
          @question_calls += 1
        end
        memoize :question?

        def bang!
          @bang_calls ||= 0
          @bang_calls += 1
        end
        memoize :bang!

      end.new
    end

    it "can memoize question methods" do
      5.times do
        expect(subject.question?).to be 1
      end
    end

    it "can memoize bang methods" do
      5.times do
        expect(subject.bang!).to be 1
      end
    end
  end
end
