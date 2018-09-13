module CzFaker
  class Person < CzFaker::Base
    class << self
      def gender
        CzFaker::Data::GENDERS.sample
      end

      def sex
        gender
      end

      def birth_number(date = nil, gender = :male, slash = true)
        if date
          date_part = ::Date.parse(date.to_s).strftime("%y%m%d")
        else
          date_part = ::Date.parse(Date.numbers).strftime("%y%m%d")
          "#{Number.integer(6)}/#{Number.integer(4)}"
        end
        if gender == :female
          date_part[2] = (date_part[2].to_i + 5).to_s
        end
        count = rand(989).to_s.rjust(3, "0")
        while (check = eleven_checksum(date_part + count)) == "10"
          count = rand(989).to_s.rjust(3, "0")
        end
        "#{date_part}#{slash ? '/' : ''}#{count}#{check}"
      end

      def race
        "x"
      end

      def marital_status(gender = :random)
        gender = CzFaker::Data::GENDER_SYMBOLS.sample if gender == :random
        return CzFaker::Data::MARITIAL_STATUSES[:male].sample if gender == :male
        return CzFaker::Data::MARITIAL_STATUSES[:female].sample if gender == :female
      end

      def height
        "180"
      end

      def weight
        "80"
      end

      def education
        CzFaker::Data::EDUCATIONS.sample
      end

      def drivers_license
        Number.integer(10)
      end

      def id_number
        Number.integer(10)
      end

      def religion
        load_person['religions'].sample
      end

      private

      def eleven_checksum(number)
        sum = 0
        number.split('').each_slice(2) do |odd, even|
          sum += even.to_i - odd.to_i
        end
        ((11 - (sum % 11)) % 11).to_s
      end

      def load_person
        @person ||= sample_data('person')
        @person
      end
    end
  end
end
