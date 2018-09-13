module CzFaker
  class Number
    class << self
      def integer(length = 6)
        if length.is_a?(Range)
          length = integer_between(length.begin, length.end)
        end
        Array.new(length) { rand(10) }.join
      end

      def integer_between(min, max)
        rand(max - min) + min
      end
    end
  end
end
