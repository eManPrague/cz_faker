module CzFaker
  class PhoneNumber < CzFaker::Base
    class << self

      def cell
        CzFaker::Data::CELL_PREFIXES.sample + Number.integer(6)
      end

      def land_line
        CzFaker::Data::LAND_LINE_PREFIXES.sample + Number.integer(6)
      end

      def free_line
        CzFaker::Data::FREE_LINE_PREFIXES.sample + Number.integer(6)
      end

      def international_cell
        [CzFaker::Data::COUNTRY_PREFIX[0], cell].join("")
      end

      def international_land_line
        [CzFaker::Data::COUNTRY_PREFIX[0], land_line].join("")
      end

      def country_prefix
        CzFaker::Data::COUNTRY_PREFIX.sample
      end

      def cell_prefix
        CzFaker::Data::CELL_PREFIXES.sample
      end

      def land_line_prefix
        CzFaker::Data::LAND_LINE_PREFIXES.sample
      end

      def free_prefix
        CzFaker::Data::FREE_LINE_PREFIXES.sample
      end
    end
  end
end
