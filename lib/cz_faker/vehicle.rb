module CzFaker
  class Vehicle < CzFaker::Base
    PLATE_METHODS = %i[ numberplate_old numberplate_new numberplate_new_custom ].freeze
    class << self

      def vin
        "x"
      end

      def numberplate
        send(PLATE_METHODS.sample.to_sym)
      end

      def numberplate_old(region = nil)
        code = load_plates['old_regions'].sample['code']
        prefix = code.is_a?(Array) ? code.sample : code
        prefix += ('A'..'Z').to_a.sample
        prefix += ('A'..'Z').to_a.sample if prefix.size == 2
        "#{prefix}#{Number.integer(2)}-#{Number.integer(2)}"
      end

      def numberplate_new(region = nil)
        code = load_plates['new_regions'].sample['code']
        prefix = code.is_a?(Array) ? code.sample : code
        "#{Number.integer_between(1, 9)}#{prefix}#{Number.integer(1)}#{Number.integer(4)}"
      end

      def numberplate_new_custom
        "SUPRM4N"
      end

      private

      def load_plates
        @plates ||= sample_data('vehicle')
        @plates
      end
    end
  end
end
