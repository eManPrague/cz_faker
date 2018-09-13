module CzFaker
  module Validator
    class Company
      class << self
        def ico?(number)
          number = number.rjust(8, "0")
          sum = 0
          (0..6).to_a.each do |index|
            sum += number[index].to_i * (8 - index)
          end
          number.split('').last.to_i == (11 - sum % 11) % 10
        end

        def dic?(number)
          return false unless number.start_with?("CZ")

          number = number[2..-1]
          ico?(number) || CzFaker::Validator::Person.birth_number?(number) ? true : false
        end

      end
    end
  end
end
