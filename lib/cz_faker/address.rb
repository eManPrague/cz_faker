module CzFaker
  class Address < CzFaker::Base
    class << self

      def street
        load_address['streets'].sample
      end

      def city
        load_address['cities'].sample
      end

      def house_number
        Number.integer(2)
      end

      def street_number
        Number.integer(1)
      end

      def city_part
        load_address['city_parts'].sample
      end

      def region
        load_address['regions'].sample
      end

      def post_code
        load_address['zips'].sample
      end

      def address
        ["#{street} #{house_number}/#{street_number}", city, post_code].join(", ")
      end

      private

      def load_address
        @address ||= sample_data('address')
        @address
      end
    end
  end
end
