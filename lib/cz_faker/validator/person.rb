module CzFaker
  module Validator
    class Person
      class << self
        def birth_number?(birth_number)
          eleven_checksum(birth_number.split('/').join('')).zero?
        end

        private

        def eleven_checksum(number)
          sum = 0
          number.split('').each_slice(2) do |odd, even|
            sum += even.to_i - odd.to_i
          end
          ((11 - (sum % 11)) % 11)
        end
      end
    end
  end
end
